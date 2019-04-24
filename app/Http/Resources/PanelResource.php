<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PanelResource extends JsonResource {
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request) {
        $panel = $this->resource;
        $sortHeadersAndContents =$panel->getHeadersAndContentsFrom($this->id);
        return [
            'id' => $this->id,
            'name' => $this->name,
            'headersAndContents' => HeadersAndContentsResource::collection($sortHeadersAndContents),
        ];
    }
}
