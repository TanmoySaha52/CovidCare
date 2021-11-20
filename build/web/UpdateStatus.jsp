<%-- 
    Document   : UpdateStatus
    Created on : 7 Jul, 2021, 11:50:16 PM
    Author     : hp
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


        <title>Update Status</title>



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
        
<!--        <script>
            function checkTrackForm(form){
                department = form.department.value;
                radio1 = document.getElementById('customRadio1');
                radio2 = document.getElementById('customRadio2');
                form = document.getElementById('trackForm');
                
                if(department=='default-department'){
                    alert('Please select a department');
                    return false;
                } else if( !radio1.checked && !radio2.checked ){
                    alert('Please select a category');
                    return false;
                } else {
                    form.setAttribute('action', 'Track');
                }
            }
        </script>-->

    </head>

    <%
        String orderId = request.getParameter("orderId");
    %>



    <body onload="myFunc()">

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #008080" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#">
                   CovidCare
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="AdminHome.jsp" style ="color: white">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="Logout" style ="color: white">Logout</a>
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
                <h2>Want to track by Department?</h2>
                <p>Click on the button below</p>
                <label id="label-register" for="log-reg-show">Click Here</label>
                <input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
            </div>

            <div class="register-info-box">
                <br>
                <br>
                <h4>Update order status of your Customers</h4>                
            </div>

            <div class="white-panel">
                <div class="login-show">
                    <h2>Update Order Status</h2>
                    <br><br>
                    <form method="post" id="trackForm" action="UpdateStatus">
                         <input type="text" name="orderId" class="form-control" placeholder="Enter Item Name" value="<%=orderId%>" readonly="readonly"/>
                        <select class="form-control form-control-lg" name="status">
                            <option class="hidden" selected="" disabled="" value="default-department">Please select status</option>
<!--                            <option value="Order Placed">Order Placed</option>-->
                            <option value="Out For Delivery">Out For Delivery</option>
                            <option value="Delivered">Delivered</option>
<!--                            <option value="IT">IT</option>
                            <option value="Sales">Sales</option>-->
                        </select>
                        
<!--                        <div class="custom-control custom-radio custom-control-inline">
                            <input name="category" type="radio" class="custom-control-input" id="customRadio1" name="example" value="personalasset">
                            <label class="custom-control-label"  for="customRadio1">Personal Asset</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input name="category" type="radio" class="custom-control-input" id="customRadio2" name="example" value="departmentalasset">
                            <label class="custom-control-label" for="customRadio2">Departmental Asset</label>
                        </div>-->
                        <br><br>                            
                        <input type="submit" value="Update" class="btn btn-dark" style="float:right;padding-right: 20px;padding-left: 20px;background-color: #008080">
                    </form>                    
                </div>
                <div class="register-show">
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

