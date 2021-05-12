<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="theme-color" content="#19253c">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <title>{{$selectedCategory->name}} Path</title>
    <link rel="shortcut icon" href="{{$selectedCategory->image_url}}" type="image/x-icon">
</head>

<body>
    <nav class="nav">
        <div class="container-fluid">
            <div class="d-flex justify-content-between">
                <div class="menu-toggle my-auto" onclick="toggleDrawer();">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                @if (Route::currentRouteName()==='admin.index'||Route::currentRouteName()==='admin.show')
                <form id="logout-form" action="{{ route('logout') }}" method="POST">
                    @csrf
                    <button type="submit" class="btn btn-link d-block mx-auto">Logout</button>
                </form>
                @endif
            </div>
        </div>
    </nav>

    <div class="navigation-drawer" onclick="toggleDrawer()"></div>

    <div class="collapsed-menu">
        <div class="header">
            <div class="brand">
                <img src="{{asset('images/brand.png')}}" alt="">
                <p>DevBooster</p>
            </div>
            <div onclick="toggleDrawer()" class="closeButton">
                <a>Close</a>
            </div>
        </div>
        <div class="menu-container">
            <ul class="list-unstyled">
                @foreach ($categories as $category)
                <li>
                    <img class="img-fluid" src="{{$category->image_url}}">

                    @if (Route::currentRouteName()==='admin.index'||Route::currentRouteName()==='admin.show')
                    <a href="{{route('admin.show',['categoryTitle'=>$category->name])}}">{{$category->name}}</a>
                    @endif

                    @if (Route::currentRouteName()==='guest.index'||Route::currentRouteName()==='guest.show')
                    <a href="{{route('guest.show',['categoryTitle'=>$category->name])}}">{{$category->name}}</a>
                    @endif

                </li>
                @endforeach
            </ul>
        </div>
    </div>

    @auth
    <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white rounded-0">
                    <h5 class="modal-title" id="title">Edit Category</h5>
                    <button type="button" class="close text-white" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="edit_form" method="POST">
                        @csrf
                        <input id="category" name="name" type="text" class="form-control">
                        <input id="image" name="image" type="text" class="form-control">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary"
                        onclick="event.preventDefault(); document.getElementById('edit_form').submit();">Save</button>
                </div>
            </div>
        </div>
    </div>
    @endauth

    <main id="app">
        <div class="loader" ref="loadingContainer"></div>
        @if (Route::currentRouteName()==='admin.index'||Route::currentRouteName()==='admin.show')
        <all_panels_in_admin :category="{{$selectedCategory}}"></all_panels_in_admin>
        @endif

        @if (Route::currentRouteName()==='guest.index'||Route::currentRouteName()==='guest.show')
        <all_panels_in_home :category="{{$selectedCategory}}"></all_panels_in_home>
        @endif

    </main>
    <script>
        function base_path(){
            return '{{url("/")}}';
        }
    </script>
    <script src={{asset( 'js/app.js')}}></script>
    <script>
        function toggleDrawer() {
            $('.collapsed-menu').toggleClass('show');
            $('.navigation-drawer').toggleClass('show');
        }

        $('#modal').on('show.bs.modal', function (event) {
            var hyperLink = $(event.relatedTarget); // Button that triggered the modal
            var category_id = hyperLink.data('category_id');
            var category_name = hyperLink.data('category_name');
            var image = hyperLink.data('category_image');
       
            var modal = $(this);
            modal.find('.modal-body input#category').val(category_name);
            modal.find('.modal-body input#image').val(image);
            modal.find('.modal-body #edit_form').attr("action",base_path()+"/admin/categories/edit/"+category_id);
        }); 
       
    </script>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    {{-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-138512204-2"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
    
      gtag('config', 'UA-138512204-2');
    </script> --}}
</body>

</html>