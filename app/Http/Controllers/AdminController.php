<?php

namespace App\Http\Controllers;

use App\Category;

class AdminController extends Controller
{
    public function index()
    {
        return $this->showCategory(Category::first());
    }

    public function showCategory(Category $category)
    {
        return view('category', ['categories' => Category::all(), 'selectedCategory' => $category]);
    }
}
