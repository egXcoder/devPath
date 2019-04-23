<?php
namespace App\Http\Controllers;
use App\Header;
use App\Content;

trait HeadersAndContentsWrapper{
     private function getLatestOrderOfHeaderOrContentIn($panel_id){
        $header = Header::select('order')
            ->where('panel_id',$panel_id);

        $content = Content::select('order')
            ->where('panel_id',$panel_id);

        return $header->union($content)->orderBy('order','DESC')->first()->order;
    }
}