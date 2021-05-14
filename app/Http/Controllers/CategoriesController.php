<?php

namespace App\Http\Controllers;

use App\Category;

class CategoriesController extends Controller
{
    public function listCategories()
    {
        return response()->json(['data'=>Category::all()]);
    }
}
