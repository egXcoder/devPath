<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class HeadersAndContentsResource extends JsonResource {
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request) {
        
        if ($this->resource instanceof \App\Header) {
            return [
                'type' => 'panel_header',
                'name' => $this->name,
                'order' => $this->order,
            ];
        }

        if ($this->resource instanceof \App\Content) {
            return [
                'type' => 'panel_content',
                'name' => $this->content,
                'order' => $this->order,
                'code_lang' => $this->codeLanguage->name,
            ];
        }
    }
}
