<?php

namespace App\Http\Controllers;

use App\Category;
use App\Panel;
use App\Http\Resources\PanelResource;
class CategoriesController extends Controller {
    public function index() {
        return Category::all();
    }

    public function listPanelsInCategory(Category $category) {
        $panels = Panel::where('category_id', $category->id)->orderBy('order')->get();
        return PanelResource::collection($panels);
    }
}
