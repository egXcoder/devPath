<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Panel;
use App\Category;
use App\Header;
use App\Content;
use App\Http\Resources\HeaderResource;
use Illuminate\Support\Facades\Validator;

class HeadersController extends Controller
{
    use HeadersAndContentsWrapper;
    
    public function listHeadersInPanel($category_name,$panel_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel = Panel::where('category_id',$category_id)->where('name', $panel_name)->firstorFail();
        $headers = $panel->header;
        return HeaderResource::collection($headers);
    }

    public function create($category_name,$panel_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel_id = Panel::where('category_id', $category_id)->where('name', $panel_name)->firstorFail()->id;

        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:50|required',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        Header::create([
            'name' => request('name'),
            'order' => $this->getLatestOrderOfHeaderOrContentIn($panel_id)+1,
            'panel_id' => $panel_id,
        ]);
        return 'success';
    }

    public function edit($header_id) {

        $header = Header::findOrFail($header_id);

        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:255',
            'order' => 'numeric|max:255',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        $header->update([
            'name' => request()->has('name') ? request('name') : $header->name,
            'order' => request()->has('order') ? request('order') : $header->order,
        ]);

        return 'success';
    }

    public function destroy($header_id) {
        $header = Header::findOrFail($header_id);

        $header->delete();
        
        return 'success';
    }

}
