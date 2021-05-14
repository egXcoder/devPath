@extends('layouts.app')

@section('main')
<div id="app">
    <sidebar></sidebar>
    <div class="loader" ref="loadingContainer"></div>
    <main class="main">
        @if (Route::currentRouteName()==='admin.index'||Route::currentRouteName()==='admin.show')
        <all_panels_in_admin :category="{{$selectedCategory}}"></all_panels_in_admin>
        @endif

        @if (Route::currentRouteName()==='guest.index'||Route::currentRouteName()==='guest.show')
        <all_panels_in_home :category="{{$selectedCategory}}"></all_panels_in_home>
        @endif
    </main>

</div>
@endsection