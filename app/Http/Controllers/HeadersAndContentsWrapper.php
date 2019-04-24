<?php
namespace App\Http\Controllers;
use App\Header;
use App\Content;

trait HeadersAndContentsWrapper{
     public static function getLatestOrderOfHeaderOrContentIn($panel_id){
        $header = Header::select('order')
            ->where('panel_id',$panel_id);

        $content = Content::select('order')
            ->where('panel_id',$panel_id);

        $highestOrder = $header->union($content)->orderBy('order','DESC')->first();
        return ($highestOrder===null)?0:$highestOrder->order;
    }
    
}