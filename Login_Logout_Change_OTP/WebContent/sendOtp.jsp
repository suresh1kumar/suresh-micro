<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OTP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="images/favicon.png" type="images/favicon.png" sizes="16x16">

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        
   <script type="text/javascript">
		var app=angular.module("products.controller",[]);
		app.controller("products_controller",//cpassword.npassword
			['$scope','$window','$http',
				function($scope,$window,$http){
				$scope.loading = false;
				$scope.isDisplay = true;
				
				    $scope.sendOTP = function () {
				    	$scope.loading = true;	
				    	alert("Send OTP..");
						var username=$scope.username;
						alert("username ::"+username);
				        $http({
				          url: "/Login_Logout_Change_OTP/ChangePassword",
				          method: "GET",
				          params:{
								"sendOtp":username
							}
				         }).then(function(response) {
				        	 if(username!=null){
					        	 alert("OTP Send success...");
					        	 $scope.success_msg = "We have sent reset OTP link to your email";
					        	 $scope.isDisplay = false;
					        	 $window.location.href = '/Login_Logout_Change_OTP/conformOtp.jsp';
					 			$scope.loading = false;
				        	 }else{
				        		 alert("OTP Send failed...");
				        		 $scope.success_msg = "This email doesn't exist";
				        		 $scope.isDisplay = false;
					        	 $window.location.href = '/Login_Logout_Change_OTP/sendOtp.jsp';
					 			$scope.loading = false;
				        	 }
				         },function (error){
				 			console.log(error);
				 			$scope.loading = false;
				 		});
				     };
				}]);
</script>
	
</head>

<%
session.setAttribute("getname", session.getAttribute("getname"));
session.setAttribute("getpassword", session.getAttribute("getpassword"));

%>
<body ng-controller="products_controller"  style="background: #fff !important;">
<header style="background: #171c66 !important;">
	<div class="container-fluid">
	<div class="row">
    <div><center><h3 class="title" style="color:#ffae00;">FIBER TO THE HOME</h3></center></div><br>
		<div class="col-md-6 logo">
			<!-- <img src="images/BSNL_BSNL.png" class="img-responsive"> -->
		</div>
	</div>
</div>
</header>
<div ng-if="success_msg" class="success_pop alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			 <strong> {{success_msg}} </strong> 
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
			               <p>We sent to a sms with OTP information</p>
			          </div>
	             </center>
          		<center>
          			<div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="text" class="form-control" id="passwordid" name="Password"  value="<%=session.getAttribute("getname") %>" readonly="readonly"/>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  
  			  <div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="text" class="form-control" id="" ng-model="username" placeholder="Please Enter username" required/>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  <div class="row">
  					<center><input type="submit" ng-disabled="log.$pristine|| log.$invalid" class="btn btn-primary" value="Send OTP" ng-click="sendOTP()" /></center>
  				</div><br>
          		
          		</center>
          		</form>
          	
	          <div class="row">
	            <center><img src="images/BSNL_BSNL.png" class="img-responsive"></center>
	          </div>


  		</div>
	</div>
</section>
<footer>
</footer>
      
</body>
</html>