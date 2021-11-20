<%@page import="ca.bean.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="utf-8" />
        <title>Credit Card Payment Form Template | PrepBootstrap</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
        <!--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->

        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- jQuery library
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->

        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            })
        </script>
        
        <style>
            body {
                background: #f5f5f5
            }

            .rounded {
                border-radius: 1rem
            }

            .nav-pills .nav-link {
                color: #555
            }

            .nav-pills .nav-link.active {
                color: white
            }

            input[type="radio"] {
                margin-right: 5px
            }

            .bold {
                font-weight: bold
            }
        </style>
    </head>
    <body >
        <%
            User user = (User) request.getSession().getAttribute("user");
            String total = (String) request.getAttribute("total");
            String type = (String) request.getAttribute("type");
            String cp = (String) request.getAttribute("cp");
        System.out.println(total);%>
        
         <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #008080">
            <div class="container">
                <a class="navbar-brand" href="#" style="color:white">CovidCare</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>



                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="UserHome.jsp"><i class="fa fa-home" style="font-size:20px;color:white"></i></a>
                        </li>
<!--                        <li class="nav-item">
                            <a class="nav-link" href="MyOrders.jsp"><i class="fa fa-shopping-cart" style="font-size:20px;color:white"></i></a>
                        </li>-->

                        <li class="nav-item">
                            <a class="nav-link" href="Logout"><i class="fa fa-power-off" style="font-size:20px;color:white"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container py-5" style="padding-top: 70px;">
            <!-- For demo purpose -->
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center" >
                    <h1 class="display-6">Make your Payment</h1>
                </div>
            </div> <!-- End -->
            
            <div class="row" >
                <div class="col-lg-6 mx-auto">
                    <div class="card " style="background: -webkit-linear-gradient(bottom, #6699ff, #b3ccff);">
                        <form method="post" action="ConfirmOrder">
                        <div class="card-header">

                            <div id="adress">
                                <!--Address Section-->

                                <div class="form-group"> 
                                    <label for="address">
                                        <h6> Enter Your Address* </h6>
                                    </label> 
                                    <input type="text" name="address" placeholder="Enter Address" required class="form-control "> 
                                    <label for="pinCode">
                                        <h6> Total Amount </h6>
                                    </label> 
                                    <input type="text" name="totalPrice" required class="form-control"  placeholder="Amount" value="<%=total%>" readonly="readonly"/>
                                    
                                    <input type="hidden" name="type" required class="form-control"  placeholder="Amount" value="<%=type%>" readonly="readonly"/> 
                                    <input type="hidden" name="userId" value="${user.getUserId()}" />
                                <input type="hidden" name="cp" value="<%=cp%>" /></div>
                                <!--<p> <button type="button" class="btn btn-primary "><i class="fas fa-mobile-alt mr-2"></i> Proceed</button> </p>-->
                                <p class="text-muted"> Note: After filling up the address, choose your convenient payment method. </p>



                            </div> <!-- End -->
                            <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                                <!-- Credit card form tabs -->
                                <ul role="tablist" class="nav bg-light rounded nav-fill mb-3">
                                    <li class="nav-item" style="background-color:#b3ccff;"> <a data-toggle="pill" href="#credit-card" class="nav-link active" style="color:#008080" > <i class="fas fa-credit-card mr-2"></i> Credit/Debit Card </a> </li>
<!--                                    
-->                                </ul><!--
                            </div> <!-- End -->
                            <!-- Credit card form content -->

                            <div class="tab-content">

                                <!-- credit card info-->
                                <div id="credit-card" class="tab-pane fade show pt-3">
                                    <form role="form" onsubmit="event.preventDefault()">
                                        <div class="form-group"> <label for="username">
                                                <h6>Card Owner</h6>
                                            </label> <input type="text" name="username" placeholder="Card Owner Name" required class="form-control "> </div>
                                        <div class="form-group"> <label for="cardNumber">
                                                <h6>Card number</h6>
                                            </label>
                                            <div class="input-group"> <input type="text" name="cardNumber" placeholder="Valid card number" class="form-control " required>
                                                <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="form-group"> <label><span class="hidden-xs">
                                                            <h6>Expiration Date</h6>
                                                        </span></label>
                                                    <div class="input-group"> <input type="number" placeholder="MM" name="" class="form-control" required> <input type="number" placeholder="YY" name="" class="form-control" required> </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CVV code on the back of your card">
                                                        <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                                    </label> <input type="text" required class="form-control"> </div>
                                            </div>
                                        </div>
                                        <div class="card-footer"> <button type="Submit" class="subscribe btn btn-primary btn-block shadow-sm" style="background-color: #008080"> Confirm Payment </button>
                                    </form>    
                                </div>
                                <p></p><p class="text-muted"> Note: After clicking on the button, you will be directed to a the bank gateway for payment. After completing the payment process, you will be redirected back to the website to view details of your order. </p>
                            </div> <!-- End -->
                            
                        </div>
                    </div>
                        
                </div>
                        </form>   
            </div>
        </div>
            

    </body>
   
</html>