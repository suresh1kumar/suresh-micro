<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Change || Password</title>
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
    
    <!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> -->
    <script src="datajs/js/bootstrap/bootstrap.min.js"></script>
    <!--/JQuery DataTables --> 
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!--Angualrjs --> 
   <!--  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
        <script type="text/javascript" src="datajs/js/angularjs/angular.min.js"></script>
        
   <script type="text/javascript">
		var app=angular.module("products.controller",[]);
	
		app.controller("products_controller",//cpassword.npassword
			['$scope','$window','$http',
				function($scope,$window,$http){
				$('#mess').hide();
				$scope.loading = false;
				    $scope.changePassword = function () {
				    	$scope.loading = true;	
				    	//oldpassword,newpassword,conformpassword
				        alert("change pass:>");
						var newpassword=$scope.newpassword;
						var conformpassword=$scope.conformpassword;
						
						
						//alert("session DB Password :"+value);
						alert("newpassword ::"+newpassword);
						alert("conformpassword ::"+conformpassword);
						$http({
					          url:".././ForgetPasswordController",
					          method: "GET",
					          params:{
									"newpassword":newpassword,
									"conformpassword":conformpassword
								}
						 }).then(function(response) {
				        	 if(newpassword==conformpassword){
				        		 alert("Change Password success");
				        		 $scope.color_msg="alert-success";
				        		 $scope.succes="Success!";
				        		 $('#mess').show();
				        		 $window.location.href = '../Mvoucher/index.jsp';
						 			$scope.success_msg = "Password Changed Successfully!!! ";
						 			$scope.loading = false;
				        	 }else{
				        		 $('#mess').show();
				        		 $scope.success_msg = "Password Dosent match!! .";
				        		 $scope.color_msg="alert-warning";
				        		 $scope.succes="Warning!";
				        		 $('#mess').show();
				        		 $window.location.href = '../Mvoucher/forgetPassword.jsp';
						 		 $scope.loading = false;
				        	 }
				         },function (error){
				        	 $('#mess').show();
				        	 	$window.location.href = '../Mvoucher/forgetPassword.jsp';
					 			$scope.success_msg = "server error.";
				 				console.log(error);
				 				$scope.loading = false;
				 		});
				     };
				         /* }).then(function(response) {
				        	 alert("00000000000000000000000000000000000000000");
				        	 if(oldpassword==value){
				        		 alert("Change Password success");
				        		// $window.location.href = '.././home.jsp';
				        		 $window.location.href = '../Mvoucher/index.jsp';
					 			$scope.success_msg = "Successfully OTP .";
					 			$scope.loading = false;
				        	 }else{
				        		 alert("Wrong your new & Old password");
				        		 $window.location.href = '../Mvoucher/changePassword.jsp';
						 			$scope.success_msg = "Wrong your new & Old password .";
						 			$scope.loading = false;
				        	 }
				         },function (error){
				        	 $window.location.href = '../Mvoucher/changePassword1.jsp';
					 			$scope.success_msg = "Roneg your OTP .";
					 			$scope.loading = false;
				 			console.log(error);
				 		});
				     }; */
			}]);
</script>
	
</head>

<%
//session.setAttribute("getname", session.getAttribute("getname"));   
//session.setAttribute("getpassword", session.getAttribute("getpassword"));
String message = (String)session.getAttribute("message");
String strUserId =(String)session.getAttribute("user_id");
String strPassWord =(String)session.getAttribute("password");  
//System.out.println("message session :"+message);
session.removeAttribute(message);

//System.out.println("Login id send otp :"+strUserId);
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
<!-- <div ng-if="success_msg" class="success_pop alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			 <strong> {{success_msg}} </strong> 
		</div> -->
		
<%-- <div align="center">
	<p><%=message %></p>
</div> --%>
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
          			<center><h3 class="title" style="color:#171c66;">Password Verification</h3></center>
          		</div><br>
          		
          		<form name="log" novalidate="novalidate" >
          			<div align="center">
						<div ng-show="loading" class="loading"><img src="http://www.nasa.gov/multimedia/videogallery/ajax-loader.gif">LOADING...</div>
					</div>
					<center>
			          <div class="col-lg-12">
			               <p>Change Password </p>
			          </div>
	             </center>
          		<center>
          			<div class="row">
  <center>
  	<div class="col-lg-12">
  	<input type="password" ng-model="newpassword" name="newpassword" class="form-control" placeholder="Please Enter Newpassword"
		required ng-pattern="/^(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/">
 <div ng-messages="log.newpassword.$error">
<span ng-show="log.newpassword.$error.pattern">Password should be at least 8 characters
        long and should contain one number,one character and one special character</span>
<!-- <div style="color: green" ng-show="log.newpassword.$valid">Yas</div> -->
</div>
</div>
  </center>
</div><br>

<div class="row">
  <center>
  	<div class="col-lg-12">
  	<input type="password" ng-model="conformpassword" name="conformpassword" class="form-control" placeholder="Please Enter conformpassword"
		required ng-pattern="/^(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/">
 <div ng-messages="log.conformpassword.$error">
<span ng-show="log.conformpassword.$error.pattern">Password should be at least 8 characters
        long and should contain one number,one character and one special character</span>
<!-- <div style="color: green" ng-show="log.conformpassword.$valid">Yas</div> -->
</div></div>
<div  ng-show="newpassword != conformpassword"><hr>Password not matched</div>
</center>
</div><br>
  			  
  			  <!-- <div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="password" class="form-control" id="newpassword" ng-model="newpassword" placeholder="Please Enter Newpassword" required/>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  <div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="password" class="form-control" id="conformpassword" ng-model="conformpassword" placeholder="Please Enter conformpassword" required/>
  				</div>
  				<div  ng-show="newpassword != conformpassword"><hr>Password not matched</div>
  			     </center>
  			  </div><br> -->
  			  
  			  <div class="row">
  					<center><input type="submit" ng-disabled="log.$pristine|| log.$invalid" class="btn btn-primary" value="Change Password" ng-click="changePassword()" /></center>
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