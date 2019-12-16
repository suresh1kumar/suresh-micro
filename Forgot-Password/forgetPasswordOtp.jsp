<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>OTP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="images/favicon.png" type="images/favicon.png" sizes="16x16">

<!-- <link rel="stylesheet" type="text/css" href="css/style.css">
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
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> -->
    <script src="datajs/js/bootstrap/bootstrap.min.js"></script>
    <!--/JQuery DataTables --> 
    
    <!--Angualrjs --> 
   <!--  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
        <script type="text/javascript" src="datajs/js/angularjs/angular.min.js"></script>
        
        
        
       
   <script type="text/javascript">
		var app=angular.module("products.controller",[]);
		app.controller("products_controller",//cpassword.npassword
			['$scope','$window','$http',
				function($scope,$window,$http){
				$scope.loading = false;
				$('#mess').hide();
				    $scope.sendOTP = function () {
				    	$scope.loading = true;	
				    	alert("Send OTP to Mobile Number.");
				    	var getusermobile = "<%=session.getAttribute("usermobile")%>";   
		        	  	var dbuserdbmobile = "<%=session.getAttribute("userdbmobile")%>";
						var userid=$scope.userid;
						var usermobile=$scope.usermobile;
						alert("userid ::"+userid);
						alert("usermobile ::"+usermobile);
				        $http({
				          url:".././ForgetPasswordAction",
				          method: "GET",
				          params:{
								"userid":userid,
								"usermobile":usermobile
							}
				         }).then(function(response) {
				        	// if(getusermobile == dbuserdbmobile){
alert("todayyyyyyyyyyyyyyyyyyyyyyyyy");
				        	 if(userid!=null && usermobile!=null ){
				        		 $scope.success_msg = "We have sent reset OTP Link to your Mobile";
				        		 $scope.color_msg="alert-success";
				        		 $scope.succes="Success!";
				        		 $('#mess').show();
					        	 $window.location.href = '../Mvoucher/conformOtp.jsp';
					 			$scope.loading = false;
				        	 }else{
				        		 $scope.success_msg = "This Mobile doesn't exist!!";
				        		 $scope.color_msg="alert-warning";
				        		 $scope.succes="Warning!";
				        		 $('#mess').show();
					        	 $window.location.href = '../Mvoucher/forgetPasswordOtp.jsp';
					 			$scope.loading = false;
				        	 }
				         },function (error){
				        	 $scope.success_msg = "Server Error Please Try Again!!!";
				        	 $scope.color_msg="alert-danger";
				        	 $scope.succes="Failure!";
				        	 $('#mess').show();
				 			console.log(error);
				 			$scope.loading = false;
				 		});
				     };
				}]);
</script>
	
</head>

<%
String message = (String)session.getAttribute("message");
System.out.println("message session :"+message);
session.removeAttribute(message);
%>
<body ng-controller="products_controller"  style="background: #fff !important;">
<header style="background: #171c66 !important;">
	<div class="container-fluid">
	<div class="row">
    <div><center><h3 class="title" style="color:#ffae00;">FORGOT PASSWORD</h3></center></div><br>
		<div class="col-md-6 logo">
			<!-- <img src="images/BSNL_BSNL.png" class="img-responsive"> -->
		</div>
	</div>
</div>
</header>
<div align="center">
<!--<p><%=message %></p>-->
 
 </div>

<div class="container">
<div class="alert {{color_msg}} alert-dismissible"  id="mess">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>{{succes}}</strong>{{success_msg}}
  </div>
</div>	
		<!-- <div class="alert alert-success alert-dismissible" id="mess">
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Success!</strong> {{success_msg}}
	  </div> -->
	  
	  <!-- <div class="w3-panel {{color_msg}} w3-display-container"  id="mess">
		  <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">&times;</span>
		  <h3>Success!</h3>
		  <p>{{success_msg}}</p>
	</div> -->
  
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
					<!-- <center>
			          <div class="col-lg-12">
			               <p>We sent to a sms with OTP information</p>
			          </div>
	             </center> -->
          		<center>
          			<div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="text" class="form-control" id="" name="userid" ng-model="userid"  placeholder="Please Enter User ID" required/>
  					<span ng-show="log.userid.$error.pattern">Please Enter a valid Bsnl mobile number!</span>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  
  			  <div class="row">
  			     <center>
  				<div class="col-lg-12">
  				
  				

  				     <input type="text" class="form-control" id="" name="usermobile" ng-model="usermobile" ng-pattern="/^[7-9][0-9]{9}$/" placeholder="Please Enter Mobile Number" required/>
  					<span ng-show="log.usermobile.$error.pattern">Please enter valid number!</span>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  <div class="row">
  					<center><input type="submit" ng-disabled="log.$pristine|| log.$invalid" class="btn btn-primary" value="Send OTP" ng-click="sendOTP()" /></center>
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

