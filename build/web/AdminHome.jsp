<%-- 
    Document   : AdminHome
    Created on : 7 Jul, 2021, 6:42:06 PM
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

        <!--    <body >-->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>CovidCare Admin Home</title>

        <!-- css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <style>

            body {
                background: #c1d7d7;
                font-family: 'Roboto', sans-serif;
            }


            .navbar-light .navbar-brand {
                color: #fff;
                font-size: 25px;

                font-weight: bold;
                letter-spacing: 2px;
            }

            .navbar-light .navbar-nav .active > .nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show > .nav-link {
                color: #fff;
            }

            .navbar-light .navbar-nav .nav-link {
                color: #fff;
            }

            .navbar-toggler {
                background: #fff;
            }

            .navbar-nav {
                text-align: center;
            }

            .nav-link {
                padding: .2rem 1rem;
            }

            .nav-link.active,.nav-link:focus{
                color: #fff;
            }

            .navbar-toggler {
                padding: 1px 5px;
                font-size: 18px;
                line-height: 0.3;
            }

            .navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
                color: #fff;
            }

            .main{

                width: 100%;
                height: 100vh;
                padding: 50px;
                position: relative;
                padding-top: 8%;

            }

            .main:before{
                content: "";
                position: absolute;
                top: 5%;
                bottom: 0%;
                left:0;
                right:0;
                z-index: -1;
                /*background: linear-gradient(160deg, #0080ff 55% , #fff 0%);*/
            }

            .card{
                transition: 0.4s ease;

            }
            /*.card-header{
                font-size: 1.4rem;
                font-weight: bold;
                background-color: #fff;
                padding: 25px 9!important; 
            }*/
            .card-body{
                /* height:400px;
                 width:300px;*/
                background-color: #008080;
            }

            .card-footer{
                background-color: white;
                padding: 30px 0px;
            }

            .card-footer a{
                border : 2px solid #008080;
                border-radius: 100px;
                margin: 0 5px;
                padding: 10px 25px;
                outline: none;
                color: #008080;
                font-size: 1rem;
                font-weight:400 ;
                line-height: 1.4;
                text-align: center;


            }

            .card:hover .card-footer a{
                color: #fff;
                background-color: #008080;
                border : 2px solid #008080;
                text-decoration: none;
                box-shadow: oo 20px 0 rgba(0,0,0,0.3);
            }

            .card:hover{
                transform: translateY(-20px);
                box-shadow: oo 20px 0 rgba(0,0,0,0.3);
            }

        </style>
        <style type="text/css">

            @import url('https://fonts.googleapis.com/css?family=Mukta');
            body{
                font-family: 'Mukta', sans-serif;} 
        </style>

    </head>

    <body id="page-top" style="background: -webkit-linear-gradient(bottom, #6699ff, #b3ccff);"> 

        <% String adminName = (String) session.getAttribute("adminName"); %>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #008080">
            <div class="container">
                <a class="navbar-brand" href="#">CovidCare</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>



                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">

                        <!--   <li class="nav-item">
-->                            <a class="nav-link" href="#"><h5> Welcome <%=adminName%></h5></a><!--
                          </li> -->

                        <li class="nav-item">
                            <a class="nav-link" href="Logout"><i class="fa fa-power-off" style="font-size:20px"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <h3><%=adminName%></h3>
        <br><br>
        <section class="main" >
            <div class="container">
                <div class="row">

                    <div class="col-lg-5 offset-lg-1 col-12">
                        <div class="card text-center">
                            <!--  <div class="card-header">Stay Healthy</div> -->
                            <div class="card-body"> <img src="https://source.unsplash.com/400x350/?restaurent,salad,pharmacy" alt="Image" style=""></div>
                            <div class="card-footer"><a href="EditItem.jsp">Edit Item</a></div>
                        </div>
                    </div>

                    <div class="col-lg-5 col-12">
                        <div class="card text-center">
                            <!--   <div class="card-header">Stay Strong</div> -->
                            <div class="card-body">
                                <img src="https://source.unsplash.com/400x350/?computer" alt="Image">
                            </div>
                            <div class="card-footer"><a href="OrderStatus.jsp">Edit Status</a></div>
                        </div>
                    </div>



                </div>
        </section>


        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <footer class="py-3" style="background-color:#008080;color: white">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team@CovidCare</p>
            </div>
            <!-- /.container -->
        </footer>

    </body>

</html>

