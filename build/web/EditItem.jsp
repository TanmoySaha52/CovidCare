<%-- 
    Document   : EditItem
    Created on : 7 Jul, 2021, 7:52:05 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>

    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


        <title>CovidCare Edit Item</title>



        <style type="text/css">

            @import url('https://fonts.googleapis.com/css?family=Mukta');
            body{
                font-family: 'Mukta', sans-serif;
                height:100vh;
                min-height:550px;
                background-image: url(http://www.planwallpaper.com/static/images/Free-Wallpaper-Nature-Scenes.jpg);
                background-repeat: no-repeat;
                background-size:cover;
                background-position:center;
                position:relative;
                overflow-y: hidden;
            }
            a{
                text-decoration:none;
                color:#444444;
            }
            .login-reg-panel{
                position: relative;
                top: 50%;
                transform: translateY(-50%);
                text-align:center;
                width:70%;
                right:0;left:0;
                margin:auto;
                height:400px;
                background: -webkit-linear-gradient(top, #6699ff, #b3ccff);
            }
            .white-panel{
                background-color: rgba(255,255, 255, 1);
                height:500px;
                position:absolute;
                top:-50px;
                width:50%;
                right:calc(50% - 50px);
                transition:.3s ease-in-out;
                z-index:0;
                box-shadow: 0 0 15px 9px #00000096;
            }
            .login-reg-panel input[type="radio"]{
                position:relative;
                display:none;
            }
            .login-reg-panel{
                color:white;
            }
            .login-reg-panel #label-login, 
            .login-reg-panel #label-register{
                border:1px solid white;
                padding:5px 5px;
                width:150px;
                display:block;
                text-align:center;
                border-radius:10px;
                cursor:pointer;
                font-weight: 600;
                font-size: 18px;
            }
            .login-info-box{
                width:30%;
                padding:0 50px;
                top:20%;
                left:0;
                position:absolute;
                text-align:left;
            }
            .register-info-box{
                width:30%;
                padding:0 50px;
                top:20%;
                right:0;
                position:absolute;
                text-align:left;

            }
            .right-log{right:50px !important;}

            .login-show, 
            .register-show{
                z-index: 1;
                display:none;
                opacity:0;
                transition:0.3s ease-in-out;
                color:#242424;
                text-align:left;
                padding:50px;
            }
            .show-log-panel{
                display:block;
                opacity:0.9;
            }
            .login-show input[type="text"], .login-show input[type="password"]{
                width: 100%;
                display: block;
                margin:20px 0;
                padding: 15px;
                border: 1px solid #b5b5b5;
                outline: none;
            }
            .login-show input[type="button"] {
                max-width: 150px;
                width: 100%;
                background: #444444;
                color: #f9f9f9;
                border: none;
                padding: 10px;
                text-transform: uppercase;
                border-radius: 2px;
                float:right;
                cursor:pointer;
            }
            .login-show a{
                display:inline-block;
                padding:10px 0;
            }

            .register-show input[type="text"], .register-show input[type="password"]{
                width: 100%;
                display: block;
                margin:20px 0;
                padding: 15px;
                border: 1px solid #b5b5b5;
                outline: none;
            }
            .register-show input[type="button"] {
                max-width: 150px;
                width: 100%;
                background: #444444;
                color: #f9f9f9;
                border: none;
                padding: 10px;
                text-transform: uppercase;
                border-radius: 2px;
                float:right;
                cursor:pointer;
            }
            .credit {
                position:absolute;
                bottom:10px;
                left:10px;
                color: #3B3B25;
                margin: 0;
                padding: 0;
                font-family: Arial,sans-serif;
                text-transform: uppercase;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: 1px;
                z-index: 99;
            }
            a{
                text-decoration:none;
                color:#2c7715;
            }

            .btnSubmit{
                font-weight: 600;
                width: 50%;
                color: #282726;
                background-color: #fff;
                border: none;
                border-radius: 1.5rem;
                padding:2%;
            }

            .navbar .navbar-nav .nav-link {
                color: #008080;
                font-size: 1.1em;
                position: relative;
            }
            .navbar .navbar-nav .nav-link:hover {
                color: white;
            }
            .navbar .navbar-nav .nav-link::after {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
                background-color: white;
                color: transparent;
                width: 0%;
                content: '.';
                height: 3px;
            }
            .navbar .navbar-nav .nav-link:hover::after {
                width: 100%;
            }
        </style>

        <script>
            function checkAddFood(form) {
                fname = form.fname.value;
                fprice = form.fprice.value;
                
//                value = document.getElementById('value').value;
//                radio1 = document.getElementById('addRadio');
//                radio2 = document.getElementById('addRadio1');

                var form1 = document.getElementById('addFood');

                if (fprice == '') {
                    alert('Enter a price');
                    return false;
                } else if(isNaN(fprice)){
                    alert('Price should be a number');
                    return false;
                }
                else if (fname == '') {
                    alert('Please enter a name');
                    return false;
                } else if (!isNaN(fname)) {
                    alert('Name should be a String');
                    return false;
                }  else{
                    form1.setAttribute('action', 'AddFood');
                    return true;
                }
            }
            
            function checkAddMedicalSupplies(form){
                mname = form.mname.value;
                mprice = form.mprice.value;
                
//                value = document.getElementById('value').value;
//                radio1 = document.getElementById('addRadio');
//                radio2 = document.getElementById('addRadio1');

                var form1 = document.getElementById('addMed');

                if (mprice == '') {
                    alert('Enter a price');
                    return false;
                } else if(isNaN(mprice)){
                    alert('Price should be a number');
                    return false;
                }
                else if (mname == '') {
                    alert('Please enter a name');
                    return false;
                } else if (!isNaN(mname)) {
                    alert('Name should be a String');
                    return false;
                }  else{
                    form1.setAttribute('action', 'AddMedicalSupplies');
                    return true;
                }
            }
        </script>

    </head>

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #008080" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#">
                 Covidcare
                   
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="AdminHome.jsp" style ="color: white">Home</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="RemoveItem.jsp">Remove</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="Logout">Logout<span class="sr-only">(current)</span></a>
                        </li>
                        <!--  <li class="nav-item">
                           <a class="nav-link js-scroll-trigger" href="#contact"style ="color: white">Contact</a>
                         </li> -->
                    </ul>
                </div>
            </div>
        </nav>

        <div class="login-reg-panel">
            <div class="login-info-box">
                <h2>Want to add Food Item?</h2>
                <p>Click on the button below</p>
                <label id="label-register" for="log-reg-show">Click Here</label>
                <input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
            </div>

            <div class="register-info-box">
                <h2>Want to add Medical Supplies?</h2>
                <p>Click on the button below</p>
                <label id="label-login" for="log-login-show">Click Here</label>
                <input type="radio" name="active-log-panel" id="log-login-show">
            </div>

            <div class="white-panel">
                <div class="login-show">
                    <h2>ADD FOOD ITEM</h2>
                    <form id="addFood" method="POST" onsubmit="return checkAddFood(this)">
                        <input type="text" name="fname" class="form-control" placeholder="Enter Item Name" value="" required=""/>
                         <input type="text" name="flink" class="form-control" placeholder="Enter Item Link" value="" />
                        <input type="text" name="fprice" class="form-control" placeholder="Enter Price" value="" required=""/>

                        <br>   
                        
                        <input type="submit" value="Submit" class="btn btn-dark" style="float:right;padding-right: 20px;padding-left: 20px;background-color: #008080">
                    </form>
                </div>
                <div class="register-show">
                    <h2>ADD MEDICAL SUPPLIES</h2>
                    <!-- remove asset form-->
                    <form id="addMed" method="POST"  onsubmit="return checkAddMedicalSupplies(this)">

                        <input type="text" name="mname" class="form-control" placeholder="Enter Item Name" value="" required=""/>
                         <input type="text" name="mlink" class="form-control" placeholder="Enter Item Link" value="" />
                        <input type="text" name="mprice" class="form-control" placeholder="Enter Price" value="" required=""/>
                         <input type="text" name="mdate" class="form-control" placeholder="Enter Expiration Date" value="" required=""/>
                        <br>
                       
                        <input type="submit" value="Submit" class="btn btn-dark" style="float:right;padding-right: 20px;padding-left: 20px;background-color: #008080">

                    </form>

                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.login-info-box').fadeOut();
                $('.login-show').addClass('show-log-panel');
            });


            $('.login-reg-panel input[type="radio"]').on('change', function () {
                if ($('#log-login-show').is(':checked')) {
                    $('.register-info-box').fadeOut();
                    $('.login-info-box').fadeIn();

                    $('.white-panel').addClass('right-log');
                    $('.register-show').addClass('show-log-panel');
                    $('.login-show').removeClass('show-log-panel');

                } else if ($('#log-reg-show').is(':checked')) {
                    $('.register-info-box').fadeIn();
                    $('.login-info-box').fadeOut();

                    $('.white-panel').removeClass('right-log');

                    $('.login-show').addClass('show-log-panel');
                    $('.register-show').removeClass('show-log-panel');
                }
            });
        </script>



        <!-- Footer -->
        <footer class="py-3  fixed-bottom" style="background-color: #008080">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team@CovidCare</p>
            </div>
            <!-- /.container -->
        </footer>



    </body>



</html>

