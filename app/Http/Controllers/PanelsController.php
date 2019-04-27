<?php

namespace App\Http\Controllers;

use App\Panel;
use Illuminate\Http\Request;
use App\Category;
use App\Http\Resources\PanelResource;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\HeadersAndContentsResource;

class PanelsController extends Controller {

    public function listPanelsInCategory($category_name) {
        //create panel with name or set default panel name
        //create default one header and one content attached with this panel
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panels = Panel::where('category_id', $category_id)->get();
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

        $created_panel = Panel::create([
            'name' => request()->has('name') ? request('name') : 'default Panel Name',
            'category_id' => $category_id,
        ]);

        HeadersController::create($category_name, $created_panel->name, $created_panel->id);
        ContentsController::create($category_name, $created_panel->name, $created_panel->id);
        return 'success';
    }

    public function edit($panel_id) {
        
        //edit panel with must be given name
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

    public function destroy($id) {
        $panel = Panel::findOrFail($id);

        $panel->delete();

        return 'success';
    }
}
