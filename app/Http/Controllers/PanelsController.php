<?php

namespace App\Http\Controllers;

use App\Panel;
use Illuminate\Http\Request;
use App\Category;
use App\Http\Resources\PanelResource;
use Illuminate\Support\Facades\Validator;

class PanelsController extends Controller {
    public function listPanelsInCategory($category_name) {
        //create panel with name or set default panel name
        //create default one header and one content attached with this panel
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panels = Panel::where('category_id', $category_id)->orderBy('order')->get();
        return PanelResource::collection($panels);
    }

    public function create($category_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:50',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }
        $lastOrder = Panel::where('category_id', $category_id)->orderBy('order', 'DESC')->first();
        $created_panel = Panel::create([
            'name' => request()->has('name') ? request('name') : 'default Panel Name',
            'category_id' => $category_id,
            'order' => ($lastOrder === null) ? 0 : $lastOrder->order + 1,
        ]);

        HeadersController::create($category_name, $created_panel->name, $created_panel->id);
        ContentsController::create($category_name, $created_panel->name, $created_panel->id);
        return 'success';
    }

    public function edit($panel_id) {
        //edit panel with must be a given name
        $panel = Panel::findOrFail($panel_id);

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

    public function editOrder($category_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $this->syncOrder($category_id);

        $panels = Panel::where('category_id', $category_id)->orderBy('order')->get();

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
            $panels->each(function ($panel) use ($oldIndex,$newIndex) {
                if ($panel->order > $oldIndex && $panel->order <= $newIndex) {
                    $panel->update(['order' => $panel->order - 1]);
                }
            });
        }

        //moving upward
        // (newIndex<oldIndex)
        // From newIndex(including) to oldIndex(not including) order +1
        if ($newIndex < $oldIndex) {
            $panels->each(function ($panel) use ($oldIndex,$newIndex) {
                if ($panel->order >= $newIndex && $panel->order < $oldIndex) {
                    $panel->update(['order' => $panel->order + 1]);
                }
            });
        }

        //update order of dragged element
        $draggedPanel->update(['order' => $newIndex]);

        return 'success';
    }

    public function destroy($id) {
        $panel = Panel::findOrFail($id);
        $category_id = $panel->category_id;
        $panel->delete();
        $this->syncOrder($category_id);
        return 'success';
    }

    public function syncOrder($category_id) {
        $panels = Panel::where('category_id', $category_id)->orderBy('order')->get();
        if (!$panels->isEmpty()) {
            $i = 0;
            $panels->each(function ($panel) use (&$i) {
                $panel->update(['order' => $i++]);
            });
        }
    }
}
