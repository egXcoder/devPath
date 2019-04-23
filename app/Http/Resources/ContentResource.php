<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ContentResource extends JsonResource {
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request) {
        return [
            'id'=>$this->id,
            'content' => $this->content,
            'type' => 'panel_content',
            'order' => $this->order,
            'code_language' => $this->codeLanguage->name,
        ];
    }
}
