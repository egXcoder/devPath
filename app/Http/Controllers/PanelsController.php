<?php

namespace App\Http\Controllers;

use App\Panel;
use Illuminate\Http\Request;
use App\Category;
use App\Http\Resources\PanelResource;
use Illuminate\Support\Facades\Validator;

class PanelsController extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $panels = Panel::all();
        return PanelResource::collection($panels);
    }

    public function listPanelsInCategory($category_name) {
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

        $panel_name = request()->has('name') ? request('name') : 'default Panel Name';
        
        $created_panel_id = Panel::create([
            'name' => $panel_name,
            'category_id' => $category_id,
        ])->id;
        HeadersController::create($category_name,$panel_name,$created_panel_id);
        ContentsController::create($category_name,$panel_name,$created_panel_id);
        return 'success';
    }

    public function edit($category_name, $panel_name) {
        // Put Request with name:'new Name for Panel'
        $category_id = Category::where('name', $category_name)->firstorFail()->id;

        $panel = Panel::where('name', $panel_name)->where('category_id', $category_id)->firstorFail();

        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:50|required',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        $panel->update([
            'name' => $validator->validated()['name'],
        ]);
        return 'success';
    }

    public function destroy($id) {

        $panel = Panel::findOrFail($id);

        $panel->delete();

        return 'success';
    }
}
