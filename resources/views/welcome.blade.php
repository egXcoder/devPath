<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> {{--
    <link rel="stylesheet" href="css/plugins/prism/prism.css"> --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <title>Title</title>
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
                <li><i class="fas fa-code text-white mr-2"></i><a href="{{route('show',['categoryTitle'=>$category->name])}}">{{$category->name}}</a></li>
                @endforeach
            </ul>
            <form id="logout-form" action="{{ route('logout') }}" method="POST">
                @csrf
                <button type="submit" class="btn btn-primary d-block mx-auto mt-5">Logout</button>
            </form>
        </div>
    </div>

    <main id="app">

        <all_panels v-bind:passed_category_title="category_title"></all_panels>

    </main>
    <script src={{asset( 'js/app.js')}}></script>
    <script>

        const shared = {
        category_title: "{{$categoryTitle}}",
        api_token:"{{$api_token}}",
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
        const app = new Vue({
            el: '#app',
            // data: {
            //     category_title: "{{$categoryTitle}}",
            //     api_token:"{{$api_token}}"
            // }
            // created(){
            //     shared.category_title = this.category_title;
            //     shared.api_token = this.category_title;
            //     shared.siteUrl:document.location.origin
            // }
        });
    </script>
</body>

</html>