<?php

namespace App\Http\Controllers;

use App\Panel;
use App\Header;
use Illuminate\Support\Facades\Validator;

class HeadersController extends Controller {
    use HeadersAndContentsWrapper;

    public static function create(Panel $panel) {

        $header_id = Header::create([
            'name' => 'default header Name',
            'order' => static::getLatestOrderOfHeaderOrContentIn($panel->id) + 1,
            'panel_id' => $panel->id,
        ])->id;

        return response()->json(['id' => $header_id]);
    }

    public function edit(Header $header) {

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

    public function destroy(Header $header) {
        $header->delete();
        return 'success';
    }
}
