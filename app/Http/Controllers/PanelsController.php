<?php

namespace App\Http\Controllers;

use App\Panel;
use Illuminate\Http\Request;
use App\Category;
use App\Http\Resources\CategoryResource;
use DB;
use Illuminate\Support\Facades\Validator;

class PanelsController extends Controller
{
    public function listPanelsInCategory($category_name)
    {
        $category = Category::with(['panels'=>function ($builder) {
            $builder->orderBy('order');
        }])->where('name', $category_name)->firstOrFail();
        return CategoryResource::make($category);
    }

    public function create(Category $category)
    {
        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:50',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        $lastOrder = Panel::where('category_id', $category->id)->orderBy('order', 'DESC')->first();

        $created_panel = Panel::create([
            'name' => request()->has('name') ? request('name') : 'default Panel Name',
            'category_id' => $category->id,
            'order' => ($lastOrder === null) ? 0 : $lastOrder->order + 1,
        ]);

        HeadersController::create($created_panel);
        ContentsController::create($created_panel);

        return 'success';
    }


    public function edit(Panel $panel)
    {
        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:50|required',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        $panel->update([
            'name' => request('name'),
        ]);
        return 'success';
    }

    public function destroy(Panel $panel)
    {
        $category_id = $panel->category_id;
        $panel->delete();
        $this->syncOrder($category_id);
        return 'success';
    }

    public function duplicate(Panel $panel)
    {
        DB::transaction(function () use ($panel) {
            $newPanel = $panel->replicate()->fill([
                'order'=>$panel->order+1
            ]);
                
            $newPanel->save();

            foreach ($panel->headers as $header) {
                $header->replicate()->fill([
                    'panel_id'=> $newPanel->id,
                ])->save();
            }

            foreach ($panel->contents as $content) {
                $content->replicate()->fill([
                    'panel_id'=> $newPanel->id,
                ])->save();
            }
        });

        return 'success';
    }

    public function editOrder(Category $category)
    {
        $this->syncOrder($category->id);

        $panels = Panel::where('category_id', $category->id)->orderBy('order')->get();

        $validator = Validator::make(request()->all(), [
            'oldIndex' => 'numeric|max:255',
            'newIndex' => 'numeric|max:255',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        $oldIndex = request('oldIndex');
        $newIndex = request('newIndex');
        $draggedPanel = $panels->where('order', '=', $oldIndex)->first();

        //moving downward
        // (newIndex>oldIndex)
        // from oldIndex(not including) to newIndex(including) order -1
        if ($newIndex > $oldIndex) {
            $panels->each(function ($panel) use ($oldIndex, $newIndex) {
                if ($panel->order > $oldIndex && $panel->order <= $newIndex) {
                    $panel->decrement('order');
                }
            });
        }

        //moving upward
        // (newIndex<oldIndex)
        // From newIndex(including) to oldIndex(not including) order +1
        if ($newIndex < $oldIndex) {
            $panels->each(function ($panel) use ($oldIndex, $newIndex) {
                if ($panel->order >= $newIndex && $panel->order < $oldIndex) {
                    $panel->increment('order');
                }
            });
        }

        //update order of dragged element
        $draggedPanel->update(['order' => $newIndex]);

        return 'success';
    }

    public function syncOrder($category_id)
    {
        $panels = Panel::where('category_id', $category_id)->orderBy('order')->get();
        if (!$panels->isEmpty()) {
            $i = 0;
            $panels->each(function ($panel) use (&$i) {
                $panel->update(['order' => $i++]);
            });
        }
    }
}
