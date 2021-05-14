<?php

namespace App\Http\Controllers;

use App\Category;

class HomeController extends Controller
{
    public function index()
    {
        return view('index', ['categories' => Category::all()]);
    }

    public function showCategory(Category $category)
    {
        return view('category', ['categories' => Category::all(), 'selectedCategory' => $category]);
    }
}
