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
    use HeadersAndContentsWrapper;

    public function listContentsInPanel(Category $category, $panel_name) {
        $panel = Panel::where('category_id', $category->id)->where('name', $panel_name)->firstorFail();
        $contents = $panel->content;
        return ContentResource::collection($contents);
    }

    public static function create(Category $category, $panel_name) {
        
        $panel_id = Panel::where('category_id', $category->id)->where('name', $panel_name)->firstorFail()->id;
        
        $content_id = Content::create([
            'content' => 'default content Name',
            'order' => static::getLatestOrderOfHeaderOrContentIn($panel_id) + 1,
            'panel_id' => $panel_id,
            'code_language_id' => '1',
        ])->id;
        
        return response()->json(['id' => $content_id]);
    }

    public function edit($content_id) {
        $content = Content::findOrFail($content_id);

        $validator = Validator::make(request()->all(), [
            'content' => 'string|max:5000',
            'order' => 'numeric|max:255',
            'code_lang' => 'string|max:255',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        if (request()->has('code_lang')) {
            $code_language_id = CodeLanguage::where('name', request('code_lang'))->firstorFail()->id;
        }

        $content->update([
            'content' => request()->has('content') ? request('content') : $content->content,
            'order' => request()->has('order') ? request('order') : $content->order,
            'code_language_id' => request()->has('code_lang') ? $code_language_id : $content->code_language_id
        ]);

        return 'success';
    }

    public function destroy($content_id) {
        $content = Content::findOrFail($content_id);

        $content->delete();

        return 'success';
    }
}
