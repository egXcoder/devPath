<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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

    <div class="collapsed-menu">
        <div onclick="toggleDrawer()" class="closeButton">
            <a>X</a>
        </div>
        <div class="menu-container">
            <ul class="list-unstyled">
                <li><a href="http://">HTML</a></li>
                <li><a href="http://">CSS</a></li>
                <li><a href="http://">Bootstrap 4</a></li>
                <li><a href="http://">JQUERY</a></li>
                <li><a href="http://">GIT</a></li>
            </ul>
        </div>
    </div>

    <main id="app" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-12 head">
                    <h1><img width="70px" src="images/cheatsheet.png" /> JQuery CheatSheet</h1>
                </div>
                <panel></panel>
                <panel></panel>
                <panel></panel>
                <panel></panel>
            </div>
        </div>

    </main>
    <script src="js/app.js"></script>
    <script src="css/plugins/prism/prism.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        // $(document).ready(function(){
        //    $('pre code').click(function(){
        //     toast();
        //    });
        
        // });
        
        // function showHeaderEditor(element){
        //     pTag = $(element).siblings("p");
        //     pTag.replaceWith('<input type="text" onkeypress="if(event.keyCode==\'13\')submitHeaderEdit(this);" value="' + pTag.text() + '">');
        // }

        // function submitHeaderEdit(element){
        //     inputTag = $(element);
        //     inputTag.replaceWith('<p>' + inputTag.val() + '</p>');
                    
        // }

        // function showContentEditor(element){
        //     preTag = $(element).siblings("pre");
        //     $(element).replaceWith('<a id="save" onclick="submitContentEdit(this);">Save</a>');
        //     preTag.replaceWith('<textarea class="form-control" rows="12" name="" id="" >'+preTag.text()+'</textarea>');
        // }

        // function submitContentEdit(element){
        //     textareaTag = $(element).siblings("textarea");
        //     content = textareaTag.val();
        //     $(element).replaceWith('<a id="edit" onclick="showContentEditor(this);">Edit</a>');
        //     textareaTag.replaceWith('<pre><code class="language-js">'+content+'</code></pre>');
        // }

        function toggleDrawer() {
            $('.collapsed-menu').toggleClass('show');
            $('.navigation-drawer').toggleClass('show');
        }

        function toast(){
            toastr.success('Code is Copied');
        }
    </script>
</body>

</html>