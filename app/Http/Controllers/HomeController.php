<?php

namespace App\Http\Controllers;

use App\Category;

class HomeController extends Controller
{
    public function index()
    {
        return $this->showCategory(Category::first());
    }

    public function showCategory(Category $category)
    {
        return view('index', ['categories' => Category::all(), 'selectedCategory' => $category]);
    }
}
