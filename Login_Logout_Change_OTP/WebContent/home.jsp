<%-- <%@ page language="java" import="java.util.*" %> --%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="login">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home || FTTH</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="images/favicon.png" type="images/favicon.png" sizes="16x16">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<style type="text/css">
label#toop {
  
  padding-top: -10px;
}
</style>
  		<!-- <a href="logout.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a> -->
</head>
<body style="background: #fff !important;">
<header style="background: #171c66 !important;">
	<div class="container-fluid">
	<div class="row">
    <div><h3 class="title" style="color:#ffae00;"><center>FIBER TO THE HOME 
    
    <h6 class="w3-text-blue pull-right">
    	<a href="logout.jsp" class="btn btn-info btn-sm ">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
    </h6>
    
    <h6 class="w3-text-blue pull-right">
    	<a href="sendOtp.jsp" class="btn btn-info btn-sm ">
          <span class="glyphicon glyphicon-log-out"></span> Change Password
        </a>
    </h6>
    </h3></center>
    <!-- <label  class="w3-text-blue pull-right" id="toop"><b><a href="logout.jsp">Logout</a> </b></label><br> -->
    </div><br>
		<div class="col-md-6 logo">
			<!-- <img src="images/BSNL_BSNL.png" class="img-responsive"> -->
			<%-- <p>Welcome, <%=session.getAttribute("name")%></p> --%>

			<!-- <p><a href="logout.jsp">Logout</a> -->
		</div>
	</div>
</div>
</header>
<section>
	<div class="container-fluid">
  		<div class="login-box" style="width: 50%;">
        <div class="row">
          <p class="user">Hi Suresh<br><span>&#8377; 1000</span></p></p>
        </div>

        <div class="row">
       
        <div class="col-sm-4" >
         <a href="billpay.jsp"> <img class="img" src="images/Bill-Payments-Blue.png"><br>
               <p class="titl">Bill Pay</p><a/>
               
        <!-- <a href="" class="btn btn-info btn-sm ">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a> -->
        </div>


          <div class="col-sm-4" >
            <a href="receipt.jsp"><img class="img" src="images/Stock Movements.png"><br>
               <p class="titl">Stock</p><a/>
        </div>

          <div class="col-sm-4" >
          <img class="img" src="images/Self Help.png"><br>
               <p class="titl">Self Help</p>
        </div>

          <div class="col-sm-4" >
          <img class="img" src="images/Retailer Stock Check.png"><br>
               <p class="titl">Retailer Stock Check</p>
        </div>

          <div class="col-sm-4" >
          <a href="movestock.jsp"> <img class="img" src="images/History.png"><br>
               <p class="titl">History</p><a/>
               
          <!-- <img class="img" src="images/History.png"><br>
               <p class="titl">History</p> -->
        </div>

          <div class="col-sm-4" >
          <img class="img" src="images/Self Help.png"><br>
               <p class="titl">Change Plan</p>
        </div>
   <!--      <div class="col-sm-4" >.col-sm-4</div>
        <div class="col-sm-4">.col-sm-4</div>
        <div class="col-sm-4">.col-sm-4</div>
        <div class="col-sm-4">.col-sm-4</div> -->
        
      </div>

         <!-- <div class="row"> 
          <center><a href=""><div class="col-lg-4 col-sm-4  box">
               <img class="img" src="images/Bill-Payments-Blue.png"><br>
               <p class="titl">Bill Pay</p>
          </div></a></center>

          <center><a href=""><div class="col-lg-4 col-sm-4  box">
               <img class="img" src="images/Stock Movements.png"><br>
               <p class="titl">Stock Movement</p>
          </div></a></center>

          <center><a href=""><div class="col-lg-4 col-sm-4  box">
               <img class="img" src="images/Self Help.png"><br>
               <p class="titl">Self Help</p>
          </div></a></center>

          <center><a href=""><div class="col-lg-4  col-sm-4 box">
               <img class="img" src="images/Retailer Stock Check.png"><br>
               <p class="titl">Retailer Stock Check</p>
          </div></a></center>

          

          <center><a href=""><div class="col-lg-4 box">
               <img class="img" src="images/History.png"><br>
               <p class="titl">History</p>
          </div></a></center>

          <center><a href=""><div class="col-lg-4 box">
               <img class="img" src="images/Self Help.png"><br>
               <p class="titl">Change Plan</p>
          </div></a></center>
  		</div> -->
	</div>
	</div>
</section>
<footer>
</footer>

-------------

























<header style="background: #171c66 !important;">
	<div class="container-fluid">
	<div class="row">
    <div><h3 class="title" style="color:#ffae00;"><center>FIBER TO THE HOME 
    
    <h6 class="w3-text-blue pull-right">
    	<a href="logout.jsp" class="btn btn-info btn-sm ">
          <span class="glyphicon glyphicon-log-out"></span> Login
        </a>
    </h6>
    
    <h6 class="w3-text-blue pull-right">
    	<a href="sendOtp.jsp" class="btn btn-info btn-sm ">
          <span class="glyphicon glyphicon-log-out"></span> Sign Up
        </a>
    </h6>
    </h3></center>
    
    </div><br>
		<div class="col-md-6 logo">
			
		</div>
	</div>
</div>
</header>

</body>
</html>