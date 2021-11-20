<%@page import="ca.bean.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ca.utilities.ConnectionProviderToDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ==" crossorigin="anonymous" />
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <title>CovidCare  Food Menu</title>
         <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>
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
            .page-link{
                background-color:white;
                color:#008080;
            }
            .page-link:hover{
                background-color:#008080;
                color:white;
            }
        </style>
        <style type="text/css">

            @import url('https://fonts.googleapis.com/css?family=Mukta');
            body{
                font-family: 'Mukta', sans-serif;} 
        </style>
    </head>
     
    <body class="bg-light" onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="" style="background: -webkit-linear-gradient(bottom, #6699ff, #b3ccff);">
        <%
            User user = (User) request.getSession().getAttribute("user");%>
            
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
                            <a class="nav-link" href="MyOrders.jsp"><i class="fa fa-shopping-cart" style="font-size:20px"></i></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Logout"><i class="fa fa-power-off" style="font-size:20px"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
   
        <div class="container-fluid" style="padding-top: 70px;">
            <div class="row">
                <div class="col-md-10 col-11 mx-auto">
                    <div class="row mt-5 gx-3">
                        <!-- left side div -->
                        <div class="col-md-12 col-lg-8 col-11 mx-auto main_cart mb-lg-0 mb-5 shadow">


                            <%                InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
                                System.out.println(inputFile);

                                Connection con = null;

                                con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

                                PreparedStatement ps1 = con.prepareStatement("SELECT foodId, foodName, price, status, imgLink FROM foodmenu WHERE status='Available'");
                                ResultSet rs = ps1.executeQuery();

                                while (rs.next()) {
                            %>



                            <div class="card p-4">
                                <!-- <h2 class="py-4 font-weight-bold">Cart (2 items)</h2> -->
                                <div class="row">
                                    <!-- cart images div -->
                                    <div class="col-md-5 col-11 mx-auto bg-light d-flex justify-content-center align-items-center shadow product_img">
                                        <img src="<%= rs.getString("imgLink")%>" class="img-fluid" alt="cart img">
                                    </div>
                                    <!-- cart product details -->
                                    <div class="col-md-7 col-11 mx-auto px-4 mt-2">
                                        <div class="row">
                                            <!-- product name  -->
                                            <div class="col-6 card-title">
                                                <h2 class="mb-4 product_name"><%= rs.getString("foodName")%></h2>
                                                <p class="mb-2"></p>
                                                <p class="mb-2" id="p<%= rs.getInt("foodId")%>"><%= rs.getDouble("price")%></p>
                                                <!--<p class="mb-3">SIZE: M</p>-->
                                            </div>
                                            <!-- quantity inc dec -->
                                            <div class="col-6">
                                                <ul class="pagination justify-content-end set_quantity">
                                                    <li class="page-item">
                                                        <button class="page-link " onclick="decreaseNumber('<%= rs.getInt("foodId")%>', '<%= rs.getString("foodName")%>', 'p<%= rs.getInt("foodId")%>')" >
                                                            <i class="fas fa-minus"></i> </button>
                                                    </li>
                                                    <li class="page-item"><input type="text" name="" class="page-link" value="0" id="<%= rs.getInt("foodId")%>" >
                                                    </li>
                                                    <li class="page-item">
                                                        <button class="page-link" onclick="increaseNumber('<%= rs.getInt("foodId")%>', '<%= rs.getString("foodName")%>', 'p<%= rs.getInt("foodId")%>')"><i class="fas fa-plus"></i></button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- //remover move and price -->
                                        <div class="row">
                                            <div class="col-8 d-flex justify-content-between remove_wish">
<!--                                                <p><i class="fas fa-trash-alt"></i> REMOVE ITEM</p>
                                                <p><i class="fas fa-heart"></i>MOVE TO WISH LIST </p>-->
                                            </div>
                                            <div class="col-4 d-flex justify-content-end price_money">
                                                <h4>Rs. <span id="<%= rs.getString("foodName")%>">0.00 </span></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <%}

                                //System.out.println("</table>");  
                                //System.out.println("</html></body>");  
                                con.close();
                            %>


                        </div>


                        <!-- right side div -->
                        <div class="col-md-12 col-lg-4 col-11 mx-auto mt-lg-0 mt-md-5">
                            
                            <div class="right_side p-3 shadow bg-white">
                                <h2 class="product_name mb-5">The Total Amount Of</h2>
                                <div class="price_indiv d-flex justify-content-between">
                                    <p>Product amount</p>
                                    <p>Rs. <span id="product_total_amt">0.00</span></p>
                                </div>
                                <div class="price_indiv d-flex justify-content-between">
                                    <p>Shipping Charge</p>
                                    <p>Rs. <span id="shipping_charge">50.0</span></p>
                                </div>
                                <hr />
                                <form method="Post" action="Checkout">
                                <div class="total-amt d-flex justify-content-between font-weight-bold">
                                    <p>The total amount of (including VAT)</p>
                                    <p>Rs.<span id="total_cart_amt" name="TotalAmt" value="">0.00</span></p>
                                    <input type="hidden" name="Total" id="Total" />
                                    <input type="hidden" name="Type" value="Food" />
                                    <input type="hidden" name="CP" id="CP" />
                                </div>
                          
                                    <button id="checkout" type="submit" class="btn text-uppercase" style="background-color:#008080;color:white;" disabled="true">Checkout</button>
                                </form>
                            </div>
                           
                            <!-- discount code part -->
                            <div class="discount_code mt-3 shadow">
                                <div class="card">
                                    <div class="card-body">
                                        <a class="d-flex justify-content-between" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                            Use Credit points
                                            <span><i class="fas fa-chevron-down pt-1"></i></span>
                                        </a>
                                        <div class="collapse" id="collapseExample">
                                            <div class="mt-3">
                                                <input type="text" name="" id="credit_points1" class="form-control font-weight-bold" value="${user.getCreditPoints()}" placeholder="" readonly="readonly"/>
                                                <small id="error_tr" class="text-dark mt-3"></small>
                                            </div>
                                            <button id="cpbtn" class="btn btn-primary btn-sm mt-3" onclick="credit_points()" style="background-color:#008080;color:white">Apply</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="discount_code mt-3 shadow">
                                <div class="card">
                                    <div class="card-body">
                                        <a class="d-flex justify-content-between" data-toggle="collapse" href="#collapse" aria-expanded="false" aria-controls="collapseExample">
                                            Add a discount code (optional)
                                            <span><i class="fas fa-chevron-down pt-1"></i></span>
                                        </a>
                                        <div class="collapse" id="collapse">
                                            <div class="mt-3">
                                                <input type="text" name="" id="discount_code1" class="form-control font-weight-bold" placeholder="Enter the discount code">
                                                <small id="error_trw" class="text-dark mt-3">code is covid15</small>
                                            </div>
                                            <button id="disbtn" class="btn btn-primary btn-sm mt-3" onclick="discount_code()" style="background-color:#008080;color:white">Apply</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- discount code ends -->
<!--                            <div class="mt-3 shadow p-3 bg-white">
                                <div class="pt-4">
                                    <h5 class="mb-4">Expected delivery date</h5>
                                    <p>July 27th 2020 - July 29th 2020</p>
                                </div>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <!-- Popper.js first, then Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>

        <script type="text/javascript">

                                                var product_total_amt = document.getElementById('product_total_amt');
                                                var shipping_charge = document.getElementById('shipping_charge');
                                                var total_cart_amt = document.getElementById('total_cart_amt');
                                                var discountCode = document.getElementById('discount_code1');
                                                const decreaseNumber = (incdec, itemprice, iprice) => {
                                                    var itemval = document.getElementById(incdec);
                                                    var itemprice = document.getElementById(itemprice);
                                                    var price = document.getElementById(iprice);
//                                                    console.log(price.value);

                                                    if (itemval.value <= 0) {
                                                        itemval.value = 0;
                                                        
                                                        alert('Negative quantity not allowed');
                                                    } else {
                                                        itemval.value = parseInt(itemval.value) - 1;
                                                        itemval.style.background = '#fff';
                                                        itemval.style.color = '#000';
                                                        itemprice.innerHTML = parseInt(itemprice.innerHTML) - parseInt(price.innerHTML);
                                                        product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) - parseInt(price.innerHTML);
                                                        total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);
                                                        Total.value=total_cart_amt.innerHTML;
                                                        CP.value = credit_points1.value;
                                                    }
                                                }
                                                const increaseNumber = (incdec, itemprice, iprice) => {
                                                    var itemval = document.getElementById(incdec);
                                                    var itemprice = document.getElementById(itemprice);
                                                    var price = document.getElementById(iprice);
                                                    console.log(parseInt(price.innerHTML));
                                                    if (itemval.value >= 5) {
                                                        itemval.value = 5;
                                                        alert('max 5 allowed');
                                                        itemval.style.background = 'red';
                                                        itemval.style.color = '#fff';
                                                    } else {
                                                        itemval.value = parseInt(itemval.value) + 1;
                                                        itemprice.innerHTML = parseInt(itemprice.innerHTML) + parseInt(price.innerHTML);
                                                        product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(price.innerHTML);
                                                        total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);
                                                        Total.value = total_cart_amt.innerHTML;
                                                        CP.value = credit_points1.value;
                                                        
                                                    }
                                                    document.getElementById('checkout').disabled = false;
                                                }

                                                const  discount_code = () => {
                                                    let totalamtcurr = parseInt(total_cart_amt.innerHTML);
                                                    let error_trw = document.getElementById('error_trw');
                                                    if (discountCode.value === 'covid15') {
                                                        document.getElementById('disbtn').disabled = true;
                                                        let newtotalamt = totalamtcurr - 15;
                                                        total_cart_amt.innerHTML = newtotalamt;
                                                        Total.value = total_cart_amt.innerHTML;
                                                        error_trw.innerHTML = "Hurray! code is valid";
                                                    } else {
                                                        error_trw.innerHTML = "Try Again! Valid code is covid15";
                                                    }
                                                }
                                                const  credit_points = () => {
                                                    let totalamtcurr = parseInt(total_cart_amt.innerHTML);
                                                    let creditpoints = parseInt(credit_points1.value);
                                                    let error_tr = document.getElementById('error_tr');
                                                    if (creditpoints >= 50 && totalamtcurr > 50) {
                                                        document.getElementById('cpbtn').disabled = true;
                                                        let newtotalamt = totalamtcurr - 50;
                                                        let newcreditpoint = creditpoints - 50;
                                                        total_cart_amt.innerHTML = newtotalamt;
                                                        credit_points1.value = newcreditpoint;
                                                        Total.value = total_cart_amt.innerHTML;
                                                        CP.value = credit_points1.value;
                                                        error_tr.innerHTML = "Hurray! credit points used";
                                                    } else {
                                                        error_tr.innerHTML = "Insufficient credit points";
                                                    }
                                                }
        </script>
        
    </body>
</html>