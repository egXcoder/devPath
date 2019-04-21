<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Content;
use App\Category;
use App\Panel;
use App\Http\Resources\ContentResource;
use Illuminate\Support\Facades\Validator;
use App\CodeLanguage;

class ContentsController extends Controller {
    public function listContentsInPanel($category_name, $panel_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel = Panel::where('category_id', $category_id)->where('name', $panel_name)->firstorFail();
        $contents = $panel->content;
        return ContentResource::collection($contents);
    }

    public function create($category_name, $panel_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel_id = Panel::where('category_id', $category_id)->where('name', $panel_name)->firstorFail()->id;

        $validator = Validator::make(request()->all(), [
            'content' => 'required|string|max:50',
            'priority' => 'required|numeric|max:255',
            'code_lang' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        $code_language_id = CodeLanguage::where('name',$validator->validated()['code_lang'])->firstorFail()->id;

        Content::forceCreate([
            'content' => $validator->validated()['content'],
            'priority' => $validator->validated()['priority'],
            'panel_id' => $panel_id,
            'code_language_id'=> $code_language_id,
        ]);
        return 'success';
    }

    public function edit($category_name, $panel_name, $content_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel_id = Panel::where('category_id', $category_id)->where('name', $panel_name)->firstorFail()->id;
        $content = Content::where('name', $content_name)->where('panel_id', $panel_id)->firstorFail();

        $validator = Validator::make(request()->all(), [
            'name' => 'string|max:50|required',
            'priority' => 'numeric|max:255',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        if (request('priority') === null) {
            $content->update([
                'name' => $validator->validated()['name'],
            ]);
        } else {
            $content->update([
                'name' => $validator->validated()['name'],
                'priority' => $validator->validated()['priority'],
            ]);
        }

        return 'success';
    }

    public function destroy($category_name, $panel_name, $content_name) {
        $category_id = Category::where('name', $category_name)->firstorFail()->id;
        $panel_id = Panel::where('category_id', $category_id)->where('name', $panel_name)->firstorFail()->id;
        $content = Content::where('name', $content_name)->where('panel_id', $panel_id)->firstorFail();

        $content->delete();

        return 'success';
    }
}
