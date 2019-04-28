<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <title>{{$selectedCategory->name}} CheatSheet</title>
    <link rel="shortcut icon" href="{{$selectedCategory->image_url}}" type="image/x-icon">
</head>

<body>
    <nav class="nav">
        <div class="container">
            <div class="row justify-content-between">
                <div class="brand"><img class="img-fluid" width="250px" src="{{asset('images/brand.png')}}" alt=""></div>
                <div class="menu-toggle my-auto" onclick="toggleDrawer();">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
    </nav>

    <div class="navigation-drawer" onclick="toggleDrawer()"></div>

    <div class="collapsed-menu">
        <div onclick="toggleDrawer()" class="closeButton">
            <a>X</a>
        </div>
        <div class="menu-container">
            <ul class="list-unstyled">
                @foreach ($categories as $category)
                <li><img class="img-fluid" width="50px" height="50px" src="{{$selectedCategory->image_url}}"> 
                    
                    @auth
                    <a href="{{route('admin.show',['categoryTitle'=>$category->name])}}">{{$category->name}}</a>
                    <a id="edit" data-toggle="modal" data-target="#exampleModal" data-category_name="{{$category->name}}"><i class="fas fa-edit"></i></a>
                    <a id="delete" href="{{route('categories.delete',['id'=>$category->id])}}">x</a>
                    @endauth

                    @guest
                    <a href="{{route('guest.show',['categoryTitle'=>$category->name])}}">{{$category->name}}</a> 
                    @endguest
                </li>
                @endforeach
            </ul>

            <form id="new-category" action="{{route('categories.create')}}" method="POST">
                @csrf
                <div class="form-group">
                    <input placeholder="New Category" id="category_name" name="name" type="text" class="form-control">
                </div>
            </form>

            <form id="logout-form" action="{{ route('logout') }}" method="POST">
                @csrf
                <button type="submit" class="btn btn-primary d-block mx-auto">Logout</button>
            </form>
        </div>
    </div>

    @auth
     <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white rounded-0">
                    <h5 class="modal-title" id="exampleModalLongTitle">Edit Category</h5>
                    <button type="button" class="close text-white" data-dismiss="modal">
                                  <span>&times;</span>
                                </button>
                </div>
                <div class="modal-body">
                    <form id="edit_form" method="POST">
                        @csrf 
                        {{ method_field('PUT') }}
                        <input id="category" name="name" type="text" class="form-control">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="event.preventDefault(); document.getElementById('edit_form').submit();">Save</button>
                </div>
            </div>
        </div>
    </div>   
    @endauth

    <main id="app">
        @yield('all_panels')
    </main>
    <script src={{asset( 'js/app.js')}}></script>
    <script>
        //TODO:data here goes To cookie
        const shared = {
        category_image:"{{$selectedCategory->image_url}}",    
        category_title: "{{$selectedCategory->name}}",
        siteUrl:document.location.origin
        }

        shared.install = function () {
            Object.defineProperty(Vue.prototype, '$shared', {
                get() { return shared }
            })
        }

        Vue.use(shared);

 
        function toggleDrawer() {
            $('.collapsed-menu').toggleClass('show');
            $('.navigation-drawer').toggleClass('show');
        }

        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var recipient = button.data('category_name');
       
            var modal = $(this);
            modal.find('.modal-body input#category').val(recipient);
            modal.find('.modal-body #edit_form').attr("action","{{route('categories.edit',['id'=>'1'])}}");
        });
        const app = new Vue({
            el: '#app',
        });
    </script>
</body>

</html>