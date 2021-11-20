<%-- 
    Document   : MyOrders
    Created on : 5 Jul, 2021, 7:53:27 PM
    Author     : hp
--%>

<%@page import="ca.bean.User"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ca.utilities.ConnectionProviderToDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Orders</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- font awesome -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

   <!-- custom css -->
   <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>
<script>
            function myFunction() {
                // Declare variables
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("sailorTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>
   <style>
    body{
        position: relative;
    }
    .carousel-item {
  height: auto;
  width: 100%;
  min-height: 300px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
 
}
.carousel-caption {
  bottom: 270px;
}

.carousel-caption h5 {
  font-size: 45px;
  
  letter-spacing: 2px;
  margin-top: 25px;
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






/* ignore the code below */


/*.link-area
{
  position:fixed;
  bottom:20px;
  left:20px;  
  padding:15px;
  border-radius:40px;
  background:tomato;
}
.link-area a
{
  text-decoration:none;
  color:#fff;
  font-size:25px;
}

    
    section{
  padding:2rem 9%;
}

.heading{
  text-align: center;
  font-size: 3.5rem;
  padding:1rem;
  color:#666;
}

.heading span{
  color:var(--red);
}


.btn{
  display: inline-block;
  padding:1px 1px;
  width: 30px;
  height: 30px;
  border:.1rem solid var(--red);
  color: var(--red);
  cursor: pointer;
  font-size: 1.5rem;
  border-radius: 6px;
  position: relative;
  overflow: hidden;
  z-index: 0;
 
 
}

.btn::before{
  content: '';
  position: absolute;
  top:0; right: 0;
  width:0%;
  height:100%;
  background:var(--red);
  transition: .3s linear;
  z-index: -1;
}

.btn:hover::before{
  width:100%;
  left: 0;
}

.btn:hover{
  color:#fff;
}

a.btn {
 
  font-weight: bold;
  display: block;
  text-align: center;
  font-size: 1rem;



}

.input {
  margin-top:auto;
  border-radius: 6px;
  text-align: center;
  border:.1rem solid var(--red);
 color: var(--red);
 font-weight: bold;

}

.box-container1
{
  margin-top: 5px;
  justify-content: center;
   display: flex;
  flex-wrap: wrap;
  gap:2px;
}




.menu .box-container{
  display: flex;
  flex-wrap: wrap;
  gap:2rem;
}

.menu .box-container .box{
  padding:2rem;
  background:#fff;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
  border:.1rem solid rgba(0,0,0,.3);
  border-radius: .5rem;
  text-align: center;
  flex:1 1 20rem;
  position: relative;
}

.menu .box-container .box img{
  height:25rem;
  object-fit: cover;
  width:100%;
  border-radius: .5rem;
}

.menu .box-container .box .price{
  position: absolute;
  top:3rem; left:3rem;
  background:var(--red);
  color:#fff;
  font-size: 1rem;
  padding:.3rem 1rem;
  border-radius: .5rem;
}

.menu .box-container .box h5{
  color:#333;
  font-size: 2.5rem;
  padding-top: 1rem;
}

.menu .box-container .box .stars i{
  color:gold;
  font-size: 1rem;
  padding:.2rem .1rem;
}
 @import url('https://fonts.googleapis.com/css?family=Roboto');
    body{
      font-family: 'Roboto' , sans-serif;
    }
    *{
      margin: 0;
      padding: 0;
    }
    i{
      max-height: 10px; 
    }
    input: focus,
    button: focus,
    .form-control: focus{
      outline: none;
      box-shadow: none;
    }
    .form-control: disabled, .from-control[readonly]{
      background-color: #fff;
    }
    .table tr
    .table tr td{
      vertical-align: middle;
    }
    .button-container .form-control{
      max-width: 80px;
      text-align: center;
      display: inline-block;
      margin: 0px 5px;
    }
    .cart-qty-plus,
    .cart-qty-minus{
      width: 38px;
      height: 38px;
      background-color: #fff;
      border: 1px solid #ced4da;
      border-radius: .25rem;
    }
    .cart-qty-plus: hover,
    .cart-qty-minus:hover {
    background-color: #5161ce
    color: #fff;
    }*/
    </style>
    <style type="text/css">

            @import url('https://fonts.googleapis.com/css?family=Mukta');
            body{
                font-family: 'Mukta', sans-serif;} 
        </style>
  </head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
<%
            User user = (User) request.getSession().getAttribute("user");
            
        %>
<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #008080">
  <div class="container">
    <a class="navbar-brand" href="#">CovidCare</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
   
   
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="UserHome.jsp"><i class="fa fa-home" style="font-size:20px"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Logout"><i class="fa fa-power-off" style="font-size:20px"></i></a>
        </li>
        
<!--        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>-->
      </ul>
    </div>
  </div>
</nav>
<div class="table-responsive" id="sailorTableArea">
    <br><br><br>
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Order Id.."/>
            <br>
            <table  class="table table-striped table-bordered" width="100%">
                <thead>

                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Order Type</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Date</th>
                        <th scope="col">Status</th>
                       <th scope="col">Cancel Order</th>
                        
                       
                       
                    </tr>
                </thead>

                <tbody id="sailorTable">
                    <%                InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
                        System.out.println(inputFile);
                        
                        Connection con = null;

                        con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

                        PreparedStatement ps1 = con.prepareStatement("SELECT orderId, orderType, totalPrice, orderDate, status FROM covid_assistant.order WHERE userId=? AND (status='Order Placed' OR status='Out For Delivery') order by orderId desc");
                         ps1.setInt(1, user.getUserId());
                        ResultSet rs = ps1.executeQuery();

                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("orderId")%></td>
                        <td><%= rs.getString("orderType")%></td>
                        <td><%= rs.getString("totalPrice")%></td>
                        <td><%= rs.getString("orderDate")%></td>
                        <td><%= rs.getString("status")%></td>
                        <td><button type="button" class="btn btn-danger" onclick="window.location.href = 'Cancel?orderId=<%= rs.getInt("orderId")%>'">Cancel</button>
                  </tr>
                   
                    <%}

                        //System.out.println("</table>");  
                        //System.out.println("</html></body>");  
                        con.close();
                    %>
<%                inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
                        System.out.println(inputFile);
                        
                        con = null;

                        con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

                        PreparedStatement ps2 = con.prepareStatement("SELECT orderId, orderType, totalPrice, orderDate, status FROM covid_assistant.order WHERE userId=? AND (status='Cancelled' OR status='Delivered') order by orderId desc");
                         ps2.setInt(1, user.getUserId());
                        ResultSet rs2 = ps2.executeQuery();

                        while (rs2.next()) {
                    %>
                    <tr>
                        <td><%= rs2.getString("orderId")%></td>
                        <td><%= rs2.getString("orderType")%></td>
                        <td><%= rs2.getString("totalPrice")%></td>
                        <td><%= rs2.getString("orderDate")%></td>
                        <td><%= rs2.getString("status")%></td>
                        <td>
                  </tr>
                    <%}

                        //System.out.println("</table>");  
                        //System.out.println("</html></body>");  
                        con.close();
                    %>

                  
                </tbody>
            </table>
        </div>
        
<!-- javascripts -->
      <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
