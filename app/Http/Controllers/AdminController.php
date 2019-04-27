<?php

namespace App\Http\Controllers;
use App\Category;
class AdminController extends Controller {
    public function index() {
        $categoryTitle = Category::find(1)->name;
        $categories = Category::all();
        return view('welcome', ['categories' => $categories, 'categoryTitle' => $categoryTitle,'api_token'=>$this->getAdminApiToken()]);
    }

    public function showSpecificCategory($categoryTitle) {
        abort_if(Category::where('name', $categoryTitle)->first() === null, 404);
        $categories = Category::all();
        return view('welcome', ['categories' => $categories, 'categoryTitle' => $categoryTitle,'api_token'=>$this->getAdminApiToken()]);
    }
    public function getAdminApiToken(){
        return \App\User::find(1)->api_token;
    }
}
