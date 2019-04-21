<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Panel;
use App\Category;
use App\Header;
use App\Http\Resources\HeaderResource;
use Illuminate\Support\Facades\Validator;

class HeadersController extends Controller
{
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
            'priority'=>'numeric|max:255',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        Header::forceCreate([
            'name' => $validator->validated()['name'],
            'priority' => $validator->validated()['priority'],
            'panel_id' => $panel_id,
        ]);
        return 'success';
    }

    public function edit($category_name, $panel_name,$header_name) {

        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel_id = Panel::where('category_id', $category_id)->where('name', $panel_name)->firstorFail()->id;
        $header = Header::where('name', $header_name)->where('panel_id', $panel_id)->firstorFail();
        
        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:50|required',
            'priority'=>'numeric|max:255',
            ]);
            
            if ($validator->fails()) {
                return $validator->getMessageBag()->all();
            }

       if(request('priority')===null){
           $header->update([
               'name' => $validator->validated()['name'],
           ]);
       }else{
           $header->update([
               'name' => $validator->validated()['name'],
               'priority' => $validator->validated()['priority'],
           ]);
       }

        return 'success';
    }

    public function destroy($category_name,$panel_name, $header_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel_id = Panel::where('category_id', $category_id)->where('name', $panel_name)->firstorFail()->id;
        $header = Header::where('name', $header_name)->where('panel_id', $panel_id)->firstorFail();

        $header->delete();
        
        return 'success';
    }
}
