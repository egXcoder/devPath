<?php

namespace App\Http\Controllers;

use App\Category;

class HomeController extends Controller {
    public function index() {
        $categoryTitle = Category::find(1)->name;
        $categories = Category::all();
        return view('welcome', ['categories' => $categories, 'categoryTitle' => $categoryTitle]);
    }
    
    public function showSpecificCategory($categoryTitle) {
        abort_if(Category::where('name', $categoryTitle)->first()===null,404);
        $categories = Category::all();
        return view('welcome', ['categories' => $categories, 'categoryTitle' => $categoryTitle]);
    }
}