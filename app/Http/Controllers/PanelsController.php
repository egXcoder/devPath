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
            'name' => 'string|max:50|required',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        Panel::forceCreate([
            'name' => $validator->validated()['name'],
            'category_id' => $category_id,
        ]);
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

    public function destroy($category_name, $panel_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;

        $panel = Panel::where('name', $panel_name)->where('category_id', $category_id)->firstorFail();

        $panel->delete();

        return 'success';
    }
}
