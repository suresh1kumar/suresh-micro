<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mobitec.Mvoucher.ForgetPasswordDaoImpl" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Conform || OTP</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<link rel="icon" href="images/favicon.png" type="images/favicon.png" sizes="16x16">

<link rel="stylesheet" type="text/css" href="datajs/css/style.css">
<link href="datajs/css/bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/custom-style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/le-frog/jquery-ui.css" />
    <!--/Bootstrap CSS --> 
    
    <!--JQuery DataTables--> 
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> -->
    <script src="datajs/js/bootstrap/bootstrap.min.js"></script>
    <!--/JQuery DataTables --> 
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!--Angualrjs --> 
   <!--  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
        <script type="text/javascript" src="datajs/js/angularjs/angular.min.js"></script>
       <%
       
       HttpSession session=request.getSession();  
       ForgetPasswordDaoImpl curr=new ForgetPasswordDaoImpl();
       //String s=curr.getCurrentTimess();
      // int curretime=curr.getCurrentTime();
       %>
  
  
	
</head>

<%
String message = (String)session.getAttribute("message");
System.out.println("message session :"+message);
session.removeAttribute(message);
String cotp=request.getParameter("conformOtp");
//String message =(String)session.getAttribute("message");

%>
<body   style="background: #fff !important;">
<header style="background: #171c66 !important;">
	<div class="container-fluid">
	<div class="row">
    <div><center><h3 class="title" style="color:#ffae00;">OTP VERIFICATION CTOPUP</h3></center></div><br>
		<div class="col-md-6 logo">
			<!-- <img src="images/BSNL_BSNL.png" class="img-responsive"> -->
		</div>
	</div>
</div>
</header>
<div class="alert alert-warning alert-dismissible fade show">
    
    <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<!-- <div class="container">
	<div class="alert {{color_msg}} alert-dismissible"  id="mess">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    <strong>{{succes}}</strong>{{success_msg}}
  </div>
 </div> -->

 <div align="center">
 <p><%=message %></p>
 </div>
 

<section>
	<div class="container-fluid">
  			<div class="login-box">
          		<div>
          			<center><h3 class="title" style="color:#171c66;">OTP Verification</h3></center>
          		</div><br>
          		
          		<form name="log" action=".././ForgetPasswordAction" method="get" >
          			
					<!-- <center>
			          <div class="col-lg-12">
			               <p>Conform OTP Verification </p>
			          </div>
	             </center> -->
          		<center>
  			  
  			  <div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="password" class="form-control" name="conformOtp" id="conformOtp" placeholder="Please Enter OTP" required/>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  <div class="row">
  					<center><input type="submit"  class="btn btn-primary" value="Verify OTP"  /></center>
  				</div><br>
          		
          		</center>
          		</form>
          	
	          <div class="row">
	            <center><img src="datajs/images/BSNL_BSNL.png" class="img-responsive"></center>
	          </div>


  		</div>
	</div>
</section>
<footer>
</footer>


</body>
</html>


<%-- <%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mobitec.Mvoucher.ForgetPasswordDaoImpl" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Conform || OTP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="images/favicon.png" type="images/favicon.png" sizes="16x16">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> -->

<link rel="stylesheet" type="text/css" href="datajs/css/style.css">
<link href="datajs/css/bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/custom-style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/le-frog/jquery-ui.css" />
    <!--/Bootstrap CSS --> 
    
    <!--JQuery DataTables--> 
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> -->
    <script src="datajs/js/bootstrap/bootstrap.min.js"></script>
    <!--/JQuery DataTables --> 
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!--Angualrjs --> 
   <!--  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
        <script type="text/javascript" src="datajs/js/angularjs/angular.min.js"></script>
       <%
       
       HttpSession session=request.getSession();  
       ForgetPasswordDaoImpl curr=new ForgetPasswordDaoImpl();
       //String s=curr.getCurrentTimess();
      // int curretime=curr.getCurrentTime();
       %>
   <script type="text/javascript">
		var app=angular.module("products.controller",[]);
	
		app.controller("products_controller",//cpassword.npassword
			['$scope','$window','$http',
				function($scope,$window,$http){
				$scope.loading = false;
				$('#mess').hide();
				    $scope.verifyOTP = function () {
				    	$scope.loading = true;	
		        	  	var SessionOtp = "<%=session.getAttribute("otp")%>";
		        	  	var oldTimeDb = "<%=session.getAttribute("oldTimeDb")%>";
		        	  	var conformOtp=$scope.conformOtp;
			        	alert("conformOtp :"+conformOtp);
			        	alert("SessionOtp :"+SessionOtp);
				        $http({
				        	url:".././ForgetPasswordAction",
				          	method: "GET",
				          	params:{
								"conformOtp":conformOtp
							}
				         }).then(function(response) {
						        	<%
						        	int curretime=curr.getCurrentTime();
						        	System.out.println("curretime jsp ::"+curretime);
						        	%>
						        	var curretimesession1 = "<%=curretime%>";
						        	var curretimesession2 = "<%=curr.getCurrentTime()%>";
						        	alert("curretimesession2 :"+curretimesession2);
						        	alert("oldTimeDb :"+oldTimeDb);
						        	alert("curretimesession1 :"+curretimesession1);
					        		 if(oldTimeDb >= curretimesession1 ){
							        	 if(conformOtp==SessionOtp){
							        		 $scope.success_msg = "Your OTP Verification Successfully ...";
							        		 $scope.color_msg="alert-success";
							        		 $scope.succes="Success!";
							        		 $('#mess').show();
							        		 $window.location.href = '../Mvoucher/forgetPassword.jsp';
								 			 $scope.loading = false;
							        	 }else{
							        		 $scope.success_msg = "Wrong your OTP .";
							        		 $scope.color_msg="alert-warning";
							        		 $scope.succes="Warning!";
							        		 $('#mess').show();
							        		 $window.location.href = '../Mvoucher/conformOtp.jsp';
									 		 $scope.loading = false;
							        	 }
					        	 	}else{
						        		 $scope.success_msg = "expired time out otp!!.";
						        		 $scope.color_msg="alert-danger";
							        	 $scope.succes="Failure!";
						        		 $('#mess').show();
						        		 $window.location.href = '../Mvoucher/forgetPasswordOtp.jsp';
								 		 $scope.loading = false; 
					        	 } 
				        	 
				         },function (error){
				        	 	$window.location.href = '../Mvoucher/conformOtp.jsp';
					 			$scope.success_msg = "server error!! .";
					 			 $scope.color_msg="alert-danger";
					        	 $scope.succes="Failure!";
				 				console.log(error);
				 				$scope.loading = false;
				 				$('#mess').show();
				 		});
				     };
				}]);
</script>     
  
	
</head>

<%

//String strUserId =(String)session.getAttribute("user_id");
//String strPassWord =(String)session.getAttribute("password");  
//System.out.println("Login id send otp :"+strUserId);
%>
<body ng-controller="products_controller"  style="background: #fff !important;">
<header style="background: #171c66 !important;">
	<div class="container-fluid">
	<div class="row">
    <div><center><h3 class="title" style="color:#ffae00;">OTP VERIFICATION CTOPUP</h3></center></div><br>
		<div class="col-md-6 logo">
			<!-- <img src="images/BSNL_BSNL.png" class="img-responsive"> -->
		</div>
	</div>
</div>
</header>

<div class="container">
	<div class="alert {{color_msg}} alert-dismissible"  id="mess">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    <strong>{{succes}}</strong>{{success_msg}}
  </div>
 </div>
<section>
	<div class="container-fluid">
  			<div class="login-box">
          		<div>
          			<center><h3 class="title" style="color:#171c66;">OTP Verification</h3></center>
          		</div><br>
          		
          		<form name="log" novalidate="novalidate" >
          			<div align="center">
						<div ng-show="loading" class="loading"><img src="http://www.nasa.gov/multimedia/videogallery/ajax-loader.gif">LOADING...</div>
					</div>
					<center>
			          <div class="col-lg-12">
			               <p>Conform OTP Verification </p>
			          </div>
	             </center>
          		<center>
  			  
  			  <div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="password" class="form-control" name="conformOtp" id="conformOtp" ng-model="conformOtp" placeholder="Please Enter OTP" required/>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  <div class="row">
  					<center><input type="submit" ng-disabled="log.$pristine|| log.$invalid" class="btn btn-primary" value="Verify OTP" ng-click="verifyOTP()" /></center>
  				</div><br>
          		
          		</center>
          		</form>
          	
	          <div class="row">
	            <center><img src="datajs/images/BSNL_BSNL.png" class="img-responsive"></center>
	          </div>


  		</div>
	</div>
</section>
<footer>
</footer>


</body>
</html> --%>