<?php

namespace App\Http\Controllers;

use App\Category;

class AdminController extends Controller {
    public function index() {
        $selectedCategory = Category::findOrFail(1);
        $categories = Category::all();
        return view('admin', ['categories' => $categories, 'selectedCategory' => $selectedCategory, 'api_token' => $this->getAdminApiToken()]);
    }

    public function showSpecificCategory($categoryTitle) {
        $selectedCategory = Category::where('name', $categoryTitle)->firstOrFail();
        $categories = Category::all();
        return view('admin', ['categories' => $categories, 'selectedCategory' => $selectedCategory, 'api_token' => $this->getAdminApiToken()]);
    }

    public function getAdminApiToken() {
        return \App\User::find(1)->api_token;
    }

    public function createCategory() {
        request()->validate([
            'name'=>'required|max:255|string'
        ]);
        Category::create([
            'name'=>request('name'),
        ]);
        return redirect()->back();

    }
    public function deleteCategory($category_id){
        $category = Category::findOrFail($category_id);
        $category->delete();
        return redirect()->back();
    }
    public function editCategory($category_id){
        $category = Category::findOrFail($category_id);
        request()->validate([
            'name'=>'required|max:255|string'
        ]);
        $category->update([
            'name'=>request('name'),
        ]);
        return redirect()->back();
    }
}
