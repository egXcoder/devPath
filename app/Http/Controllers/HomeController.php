<?php

namespace App\Http\Controllers;

use App\Category;

class HomeController extends Controller
{
    public function index()
    {
        $selectedCategory = Category::findOrFail(1);
        $categories = Category::all();
        return view('index', ['categories' => $categories, 'selectedCategory' => $selectedCategory]);
    }

    public function showSpecificCategory(Category $category)
    {
        return view('index', ['categories' => Category::all(), 'selectedCategory' => $category]);
    }
}
