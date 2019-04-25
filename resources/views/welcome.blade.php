<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="css/app.css"> {{--
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> --}}
    <link rel="stylesheet" href="css/plugins/prism/prism.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <title>Title</title>
</head>

<body>
    <nav class="nav">
        <div class="container">
            <div class="row justify-content-between">
                <div class="brand"><img class="img-fluid" width="250px" src="images/brand.png" alt=""></div>
                <div class="menu-toggle my-auto" onclick="toggleDrawer();">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
    </nav>

    <div class="navigation-drawer" onclick="toggleDrawer()"></div>



    <main id="app" class="py-5">
        <div class="collapsed-menu">
                <div onclick="toggleDrawer()" class="closeButton">
                    <a>X</a>
                </div>
                <div class="menu-container">
                    <categories_list></categories_list>
                </div>
            </div>

        <p v-for="item in categories">54</p>
        <all_panels></all_panels>

    </main>
    <script src="js/app.js"></script>
    <script>
        function toggleDrawer() {
            $('.collapsed-menu').toggleClass('show');
            $('.navigation-drawer').toggleClass('show');
        }

    </script>
</body>

</html>