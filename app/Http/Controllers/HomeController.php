<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
class HomeController extends Controller
{
    public function index() {
        $selectedCategory = Category::findOrFail(1);
        $categories = Category::all();
        return view('home', ['categories' => $categories, 'selectedCategory' => $selectedCategory]);
    }

    public function showSpecificCategory($categoryTitle) {
        $selectedCategory= Category::where('name', $categoryTitle)->firstOrFail();
        $categories = Category::all();
        return view('home', ['categories' => $categories, 'selectedCategory' => $selectedCategory]);
    }
}
