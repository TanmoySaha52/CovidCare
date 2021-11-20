<%-- 
    Document   : HomeLogin
    Created on : 23 Jun, 2021, 9:42:55 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CovidCare Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- Custom styles for this template -->
        <link href="css/scrolling-nav.css" rel="stylesheet">
        <style>
            #logreg-forms{
                width:412px;
                margin-top:2px;
                background-color:#f3f3f3;
                box-shadow: 0 1px 3px rgb(0, 138, 230), 0 1px 2px rgb(0, 230, 0);
                transition: all 0.3s cubic-bezier(.25,.8,.25,1);
            }
            #logreg-forms form {
                width: 100%;
                max-width: 410px;
                padding: 10px;
                margin: auto;
            }
            #logreg-forms .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 14px;
            }
            #logreg-forms .form-control:focus { z-index: 2; }
            #logreg-forms .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }
            #logreg-forms .form-signin input[type="password"] {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

            #logreg-forms .social-login{
                width:390px;
                margin:0 auto;
                margin-bottom: 14px;
            }
            #logreg-forms .social-btn{
                font-weight: 100;
                color:white;
                width:190px;
                font-size: 0.9rem;
            }

            #logreg-forms a{
                display: block;
                padding-top:10px;
                color:lightseagreen;
            }

            #logreg-form .lines{
                width:200px;
                border:1px solid red;
            }
            #logreg-forms button[type="submit"]{ margin-top:10px; }

            #logreg-forms .facebook-btn{  background-color:#3C589C; }

            #logreg-forms .google-btn{ background-color: #DF4B3B; }

            #logreg-forms .form-reset, #logreg-forms .form-signup{ display: none; }

            #logreg-forms .form-signup .social-btn{ width:210px; }

            #logreg-forms .form-signup input { margin-bottom: 2px;}

            .form-signup .social-login{
                width:210px !important;
                margin: 0 auto;
            }
            @media screen and (max-width:500px){
                #logreg-forms{
                    width:300px;
                }

                #logreg-forms  .social-login{
                    width:200px;
                    margin:0 auto;
                    margin-bottom: 10px;
                }
                #logreg-forms  .social-btn{
                    font-size: 1.3rem;
                    font-weight: 100;
                    color:white;
                    width:200px;
                    height: 56px;

                }
                #logreg-forms .social-btn:nth-child(1){
                    margin-bottom: 5px;
                }
                #logreg-forms .social-btn span{
                    display: none;
                }
                #logreg-forms  .facebook-btn:after{
                    content:'Facebook';
                }

                #logreg-forms  .google-btn:after{
                    content:'Google+';
                }

            }
            /* Add a gray background color and some padding to the footer */
            footer {
                background-color: #f2f2f2;
                padding: 25px;
            }

            .carousel-inner img {
                width: 100%; /* Set width to 100% */
                min-height: 200px;
            }

            /* Hide the carousel text when the screen is less than 600 pixels wide */
            @media (max-width: 600px) {
                .carousel-caption {
                    display: none; 
                }
            }
            .navbtn {

            }
            .navbtn:after {    
                background: none repeat scroll 0 0 transparent;
                bottom: 0;
                content: "";
                display: block;
                height: 5px;
                left: 50%;
                position: absolute;
                background: white;
                transition: width 0.3s ease 0s, left 0.3s ease 0s;
                width: 0;

            }
            .navbtn:hover:after { 
                width: 100%; 
                left: 0; 
            }
            @media screen and (max-height: 300px) {
                ul {
                    margin-top: 40px;
                }
            }
        </style>
        <style type="text/css">

            @import url('https://fonts.googleapis.com/css?family=Mukta');
            body{
                font-family: 'Mukta', sans-serif;} 
        </style>
        <script>
            function validate(form)
            {
                name = form.name.value;
                phone = form.phone.value;
                password = form.password.value;
                //value = document.getElementById('value').value;

                var form1 = document.getElementById('RegForm');

                if (name == '') {
                    alert('Enter a name');
                    return false;
                } else if (!isNaN(name)) {
                    alert('Name should be a String');
                    return false;
                } else if (phone == '') {
                    alert('Please enter a phone number');
                    return false;
                } else if (isNaN(phone)) {
                    alert('phone number should be a number');
                    return false;
                } else if (phone.length != 10) {
                    alert('phone number should be of 10 digits');
                    return false;
                } else if (!isNaN(name)) {
                    alert('Name should be a string');
                    return false;
                } else if (password.length < 6) {
                    alert('Password Should be of atleast 6 characters');
                    return false;
                }/* else if(value==''){
                 alert('Please enter a value');
                 return false;
                 } else if(isNaN(value)){
                 alert('Value should be a number');
                 return false;
                 } else if(!radio1.checked && !radio2.checked){
                 alert('Please select a asset categroy');
                 return false;
                 }*/ else {
                    form1.setAttribute('action', 'Register');
                    return true;
                }
            }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {

                var input = document.getElementById('user-name');
                input.addEventListener('keydown', function (e) {
                    var input = e.target;
                    var val = input.value;
                    var end = input.selectionEnd;
                    if (e.keyCode == 32 && (val[end - 1] == " " || val[end] == " ")) {
                        e.preventDefault();
                        return false;
                    }
                });
            });
        </script>
        
    </head>
    <body>

        <nav class="navbar navbar-inverse" style="background-color: #008080">
            <div class="container-fluid" >
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#" style="color:white" >CovidCare</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="AdminLogin.jsp" class="navbtn" style="color:white;margin-left: 825px">Admin</a></li>
                        <li><a href="#about" class="navbtn js-scroll-trigger" style="color:white">About</a></li>
                        <!-- <li><a href="#">Projects</a></li> -->
                        <li><a href="#contact" class="navbtn js-scroll-trigger" style="color:white">Contact</a></li>
                    </ul>
                    <!--  <ul class="nav navbar-nav navbar-right">
                       <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                     </ul> -->
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="https://source.unsplash.com/800x400/?healthcare,medicines" alt="Image">
                                <div class="carousel-caption">
                                    <h3>Medical Facilities</h3>
                                    <p></p>
                                </div>      
                            </div>

                            <div class="item">
                                <img src="https://source.unsplash.com/800x400/?restaurent,food" alt="Image">
                                <div class="carousel-caption">
                                    <h3>Food Delivery</h3>
                                    <p></p>
                                </div>      
                            </div>
                            <div class="item">
                                <img src="https://source.unsplash.com/800x400/?emergency,hospital" alt="Image">
                                <div class="carousel-caption">
                                    <h3>Quick Service</h3>
                                    <p></p>
                                </div>      
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">

                    <!--  <br><br> -->

                    <div id="logreg-forms">
                        <form class="form-signin" method="post" action="Login">
                            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
                            <!--  <div class="social-login">
                                 <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign in with Facebook</span> </button>
                                 <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign in with Google+</span> </button>
                             </div>
                             <p style="text-align:center"> OR  </p> -->
                            <input type="tel" id="phone" name="phone" class="form-control" placeholder="Phone Number" required="" autofocus="">
                            <br>
                            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                            <br>
                            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                            <!-- <a href="#" id="forgot_pswd">Forgot password?</a> -->
                            <br>
                            <p style="text-align: center">Don't have an account!</p> 
                            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button>
                        </form>

                        <!-- <form action="/reset/password/" class="form-reset">
                            <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" autofocus="">
                            <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                            <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
                        </form> -->

                        <form id="RegForm" method="post" action="Register" onsubmit="return validate(this)" class="form-signup">
                            <!-- <div class="social-login">
                                <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign up with Facebook</span> </button>
                            </div>
                            <div class="social-login">
                                <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign up with Google+</span> </button>
                            </div> -->

                            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign Up</h1>

                            <input type="text" id="user-name" name="name" class="form-control" placeholder="Full name" required="" autofocus="">
                            <input type="tel" id="user-email" name="phone" class="form-control" placeholder="Phone Number" required autofocus="">
                            <input type="text" id="user-pass" name="address" class="form-control" placeholder="Address" required autofocus="">
                            <input type="password" id="user-repeatpass" name="password" class="form-control" placeholder="Password" required autofocus="">

                            <input class="btn btn-primary btn-block" type="submit" value="Sign Up">
                            <!--<button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up </button>-->
                            <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
                        </form>
                        <br>

                    </div>
                    <p style="text-align:center">
                        <a href="http://bit.ly/2RjWFMfunction toggleResetPswd(e){
                           e.preventDefault();
                           $('#logreg-forms .form-signin').toggle() // display:block or none
                           $('#logreg-forms .form-reset').toggle() // display:block or none
                           }

                           function toggleSignUp(e){
                           e.preventDefault();
                           $('#logreg-forms .form-signin').toggle(); // display:block or none
                           $('#logreg-forms .form-signup').toggle(); // display:block or none
                           }

                           $(()=>{
                           // Login Register Form
                           $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                           $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                           $('#logreg-forms #btn-signup').click(toggleSignUp);
                           $('#logreg-forms #cancel_signup').click(toggleSignUp);
                           })g" target="_blank" style="color:black"></a>
                    </p>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                    <script src="/script.js"></script>
                    <script type="text/javascript">
                            function toggleResetPswd(e) {
                                e.preventDefault();
                                $('#logreg-forms .form-signin').toggle() // display:block or none
                                $('#logreg-forms .form-reset').toggle() // display:block or none
                            }

                            function toggleSignUp(e) {
                                e.preventDefault();
                                $('#logreg-forms .form-signin').toggle(); // display:block or none
                                $('#logreg-forms .form-signup').toggle(); // display:block or none
                            }

                            $(() => {
                                // Login Register Form
                                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                                $('#logreg-forms #btn-signup').click(toggleSignUp);
                                $('#logreg-forms #cancel_signup').click(toggleSignUp);
                            })

                    </script>




                </div>
            </div>
            <hr>
        </div>
        <section id="about">
            <div class="container text-center">    
                <h3 style="color: #008080">What We Do</h3>
                <br>
                <div class="row">
                    <div class="col-sm-3">
                        <img src="https://source.unsplash.com/1600x400/?healthcare,medicine" class="img-responsive" style="width:100%" alt="Image">

                        <h4>We bring medical supplies at your  door step </h4> 
                    </div>
                    <div class="col-sm-3"> 
                        <img src="https://source.unsplash.com/1600x400/?Healthcare,hospital" class="img-responsive" style="width:100%" alt="Image">
                        <h4>Avail all types of medicines just for you</h4>     
                    </div>
                    <div class="col-sm-3">
                        <img src="https://source.unsplash.com/1600x400/?cuisine,food" class="img-responsive" style="width:100%" alt="Image">
                        <h4>Homemade food delivered to you </h4>     
                    </div>
                    <div class="col-sm-3">
                        <img src="https://source.unsplash.com/1600x400/?cuisine,restaurant" class="img-responsive" style="width:100%" alt="Image">
                        <h4>Perfect solution for family in these difficult times</h4>     
                    </div>  
                </div>

            </div>
            <br><br><br><br><br>
            <div class="container text-center">    
                <h3 style="color: #008080">Our Partners</h3>
                <br>
                <div class="row">
                    <div class="col-sm-3">
                        <img src="http://assets.stickpng.com/thumbs/5847f880cef1014c0b5e48ac.png" class="img-responsive" style="width:80%;height:150px" alt="Image">

                    </div>
                    <div class="col-sm-3"> 
                        <img src="https://www.healthism.co/wp-content/uploads/2021/04/Apollo-Clinics-91.jpe" class="img-responsive" style="width:80%;height:150px" alt="Image">

                    </div>
                    <div class="col-sm-3">
                        <img src="https://s3-ap-southeast-1.amazonaws.com/static-pp/pp-web-app-assets/logo-carriers/square-logo-carries/blueda.png" class="img-responsive" style="width:80%;height:150px" alt="Image">

                    </div>
                    <div class="col-sm-3">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Patanjali_Logo.svg/1200px-Patanjali_Logo.svg.png" class="img-responsive" style="width:80%;height:150px" alt="Image">

                    </div>  
                </div>

            </div>
        </section>
        <section id="contact">
            <div class="container text-center">    
                <h3 style="color: #008080">Our Team</h3>
                <br>
                <div class="row">
                    <div class="col-sm-2">
                        <img src="Pictures/Esa.jpeg" class="img-responsive" style="width:100%" alt="Image">
                        <p>Esa Chatterjee</p>
                    </div>
                    <div class="col-sm-2"> 
                        <img src="Pictures/Sayantan.jpeg" class="img-responsive" style="width:100%" alt="Image">
                        <p>Sayantan Banerjee</p>    
                    </div>
                    <div class="col-sm-2"> 
                        <img src="Pictures/Tanmoy.jpeg" class="img-responsive" style="width:100%" alt="Image">
                        <p>Tanmoy Saha</p>
                    </div>
                    <div class="col-sm-2"> 
                        <img src="Pictures/Tanisha.jpeg" class="img-responsive" style="width:100%" alt="Image">
                        <p>Tanisha Kumar</p>
                    </div> 
                    <div class="col-sm-2"> 
                        <img src="Pictures/Arpan.jpeg" class="img-responsive" style="width:100%" alt="Image">
                        <p>Arpan Saha</p>
                    </div> 
                    <div class="col-sm-2"> 
                        <img src="Pictures/Sonali.jpg" class="img-responsive" style="width:100%" alt="Image">
                        <p>Sonali Santra</p>
                    </div>     

                </div>
            </div>
        </section>
        <br>



        <footer class="py-3" style="background-color:#008080;color: white">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team@CovidCare</p>
            </div>
            <!-- /.container -->
        </footer>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/scrolling-nav.js"></script>
    </body>

</html>


