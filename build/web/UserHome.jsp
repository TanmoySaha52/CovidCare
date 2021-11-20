<%-- 
    Document   : UserHome
    Created on : 25 Jun, 2021, 9:28:53 PM
    Author     : hp
--%>

<%@page import="ca.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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

        <title>My Home</title>

        <!-- css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   
   <!-- font awesome -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
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

/*.heading{
	
	margin-top: 100px;
	width: 100vw;

}

h1{
	color:black;
	position: relative;
	font-weight: bold;
	text-align: center;
	font-size: 2rem;
	font-family: poppins;
	width: 100%;
}*/
/* h1::before{
	content: "Welcome";
	width: 100%;
	color:#cc6600;
	position: absolute;
	text-align: center;
	top:0;
	left:0;
	border-right: 0.2rem solid #ffad33;
	animation: animate 7s linear infinite;
	-webkit-animation : animate 7s linear  ;
	overflow: hidden;
}
@keyframes animate{

	0%

	{
		width: 0%;
	}
	
	50%{
		width: 100%;
	}
	100%{
		width: 200%;
	}
}*/


.main{

	width: 100%;
	height: 100vh;
	padding: 50px;
	position: relative;
	padding-top: 1%;
        
}


.main:before{
	content: "";
	position: absolute;
	top: 5%;
	bottom: 0%;
	left:0;
	right:0;
	z-index: -1;
	
}

.card{
	transition: 0.4s ease;
}
.card-header{
	font-size: 1.4rem;
	font-weight: bold;
	background-color: #fff;
	padding: 25px 9!important; 
}
.card-body{
   /* height:400px;
    width:300px;*/
    background-color: #008080;
}

.card-footer{
	background-color: #fff;
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
 text-decoration: none;
 box-shadow: oo 20px 0 rgba(0,0,0,0.3);
}

.card:hover{
	transform: translateY(-20px);
	box-shadow: oo 20px 0 rgba(0,0,0,0.3);
}

.card:hover .card-header{
	color: #008080;
}

.covid{
	/*text-align: center;*/
	/*width: 90%;*/
	height: 250px;
	/*justify-content: center;*/
	border-radius: 25px;
	background-color: #e0ebeb;
	padding-left: 55px;
	margin-bottom: 50px;
	/*z-index: 1;*/
	box-shadow: 0px 10px 6px -8px rgba(0,0,0,0.75);
}

h2{
	padding-top: 20px;
	padding-bottom: 30px;
	text-transform: uppercase;
}

.Act{
  width: 80%;
  padding:8%;
  margin-bottom: 20px;
  text-align: center;
  border-radius: 6px;
  color:#fff;
  background-color: #41a7ff;
}

.tot{
	width: 80%;
  padding:8%;
  margin-bottom: 20px;
  border-radius: 6px;
  text-align: center;
   color:#fff;
  background-color: #d83f3f
}
.die{
	text-align: center;
width: 80%;
  padding:8%;
  margin-bottom: 20px;
  border-radius: 6px;
  color:#fff;
  background-color: #ff0053;
}
.rec{
	text-align: center;
	width: 80%;
  padding:8%;
  margin-bottom: 20px;
  border-radius: 6px;
  color:#fff;
  background-color: #32b336;   
}

.card i{
	font-size: 2rem;
}
.card span{
	font-size: 1rem;
}
        </style>
        <style type="text/css">

            @import url('https://fonts.googleapis.com/css?family=Mukta');
            body{
                font-family: 'Mukta', sans-serif;} 
        </style>

    </head>

    <body id="page-top" style="background: -webkit-linear-gradient(bottom, #6699ff, #b3ccff);" >
          
          

        <%
            User user = (User) request.getSession().getAttribute("user");
        %>

        <!-- Navigation -->
     <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #008080">
  <div class="container">
    <a class="navbar-brand" href="#">CovidCare</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
   
   
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
<!--        <li class="nav-item active">
          <a class="nav-link" href="">Home</a>
        </li>-->
        <li class="nav-item">
          <a class="nav-link" href="MyOrders.jsp"><i class="fa fa-shopping-cart" style="font-size:20px"></i></a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="Logout"><i class="fa fa-power-off" style="font-size:20px"></i></a>
        </li>
      </ul>
    </div>
  </div>
</nav>

        
<!--        <div class="heading">
            <h1 class="text-center text">Welcome <c:out value="${user.getUserName()}"></c:out></h1>

	</div>-->
<br><br><br>

<section class>
			<div class="container covid">
					<h2 class="text-center font-weight-bold" style="margin-top: 10px">COVID-19 CASES IN   <span id="country"></span>   <img style="height: 30px; width: 20px" src="" id="flag"></h2>
					<div class="row">

						<div class="col-lg-3 col-12">
						<div class="card Act">
							<i class="fas fa-tachometer-alt"></i>
							<h5>Active Cases</h5>
							<span id="active"></span>
						</div>
					    </div>

                        <div class="col-lg-3 col-12">
						<div class="card tot">
							<i class="fa fa-th-list"></i>
							<h5>Total Cases</h5>
							<span id="cases"></span>
						</div>
					    </div>


					    <div class="col-lg-3 col-12">
						<div class="card die">
							<i class="fa fa-times"></i>
							<h5>Total Death</h5>
							<span id="death"></span>
						</div>
						</div>

						<div class="col-lg-3 col-12">
						<div class="card rec">
							<i class="fa fa-check-square"></i>
							<h5>Recovered Cases</h5>
							<span id="recovered"></span>
						</div>
					    </div>
 				</div>
              	</div>
	</section>
	<section class="main" >
		<div class="container">
			<div class="row">
				
				<div class="col-lg-4 offset-lg-2 col-12">
					<div class="card text-center">
						<div class="card-header">Stay Healthy</div>
						<div class="card-body"> <img src="https://source.unsplash.com/300x350/?restaurent,salad" alt="Image" style=""></div>
						<div class="card-footer"><a href="FoodMenu.jsp">Food Menu</a></div>
					</div>
				</div>

				<div class="col-lg-4 col-12 card-second">
					<div class="card text-center">
						<div class="card-header">Stay Strong</div>
						<div class="card-body">
							 <img src="https://source.unsplash.com/300x350/?pharmacy" alt="Image">
						</div>
						<div class="card-footer"><a href="MedicalSupplies.jsp"> Medicine</a></div>
					</div>
				</div>

<!--				<div class="col-lg-4 col-12">
					<div class="card text-center">
						<div class="card-header">Stay Safe</div>
						<div class="card-body"> <img src="https://source.unsplash.com/300x350/?ambulance" alt="Image" style=""></div>
						<div class="card-footer"><a href="#">Ambulance</a></div>
					</div>
				</div>-->


				</div>
	</section>

	



  <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script type="text/javascript">
	fetch('https://corona.lmao.ninja/v2/countries/India')
	.then((response)=>{
		return response.json();
	})
	.then((data)=>{
		document.getElementById("flag").src=data.countryInfo.flag;
		document.getElementById("country").innerHTML=data.country;
		document.getElementById("active").innerHTML=data.active;
		document.getElementById("cases").innerHTML=data.cases;
		document.getElementById("death").innerHTML=data.deaths;
		document.getElementById("recovered").innerHTML=data.recovered;
		
	})
</script>
<footer class="py-3" style="background-color:#008080">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team@CovidCare</p>
            </div>
            <!-- /.container -->
        </footer>



    </body>

</html>
