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
        return view('index', ['categories' => Category::all(), 'selectedCategory' => $category, 'api_token' => $this->getAdminApiToken()]);
    }

    public function getAdminApiToken()
    {
        return \App\User::find(1)->api_token;
    }
}
