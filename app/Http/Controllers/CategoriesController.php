<?php

namespace App\Http\Controllers;

use App\Category;
use App\Http\Resources\CategoryResource;

class CategoriesController extends Controller
{
    public function listCategories()
    {
        return CategoryResource::collection(Category::all());
    }
}
