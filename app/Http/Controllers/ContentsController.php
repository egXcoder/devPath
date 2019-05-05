<?php

namespace App\Http\Controllers;

use App\Content;
use App\Panel;
use Illuminate\Support\Facades\Validator;
use App\CodeLanguage;

class ContentsController extends Controller {
    use HeadersAndContentsWrapper;

    public static function create(Panel $panel) {

        $content_id = Content::create([
            'content' => 'default content Name',
            'order' => static::getLatestOrderOfHeaderOrContentIn($panel->id) + 1,
            'panel_id' => $panel->id,
            'code_language_id' => '1',
        ])->id;
        
        return response()->json(['id' => $content_id]);
    }

    public function edit(Content $content) {

        $validator = Validator::make(request()->all(), [
            'content' => 'string|max:5000',
            'order' => 'numeric|max:255',
            'code_lang' => 'string|max:255',
        ]);

        if ($validator->fails()) {
            return $validator->getMessageBag()->all();
        }

        $content->update([
            'content' => request()->has('content') ? request('content') : $content->content,
            'order' => request()->has('order') ? request('order') : $content->order,
            'code_language_id' => request()->has('code_lang') 
                                ? CodeLanguage::where('name', request('code_lang'))->firstorFail()->id
                                : $content->code_language_id
        ]);

        return 'success';
    }

    public function destroy(Content $content) {
        $content->delete();
        return 'success';
    }
}
