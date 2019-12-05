<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change || Password</title>
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
				    $scope.changePassword = function () {
				    	$scope.loading = true;	
				    	//oldpassword,newpassword,conformpassword
				        alert("change pass:>");
						var oldpassword=$scope.oldpassword;
						var newpassword=$scope.newpassword;
						var conformpassword=$scope.conformpassword;
						var value = "<%=session.getAttribute("pass")%>";
						alert("DB Old Password :"+value);
						alert("oldpassword :"+oldpassword);
						alert("newpassword ::"+newpassword);
						alert("conformpassword ::"+conformpassword);
				        $http({
				          url: "/Login_Logout_Change_OTP/ChangePassword",
				          method: "GET",
				          params:{
				        	  	"oldpassword":oldpassword,
								"newpassword":newpassword,
								"conformpassword":conformpassword
							}
				         }).then(function(response) {
				        	 if(oldpassword==value){
				        		 alert("Change Password success");
				        		 $window.location.href = '/Login_Logout_Change_OTP/home.jsp';
					 			$scope.success_msg = "Successfully OTP .";
					 			$scope.loading = false;
				        	 }else{
				        		 alert("Wrong your new & Old password");
				        		 $window.location.href = '/Login_Logout_Change_OTP/changePassword.jsp';
						 			$scope.success_msg = "Wrong your new & Old password .";
						 			$scope.loading = false;
				        	 }
				         },function (error){
				        	 $window.location.href = '/Login_Logout_Change_OTP/changePassword.jsp';
					 			$scope.success_msg = "Roneg your OTP .";
					 			$scope.loading = false;
				 			console.log(error);
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
  				     <input type="text" class="form-control" id="passwordid" name="Password"  value="<%=session.getAttribute("getname") %>" readonly="readonly"/>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  
  			  <div class="row">
  			     <center>
  				<div class="col-lg-12">
  				     <input type="password" class="form-control" id="oldpassword" ng-model="oldpassword" placeholder="Please Enter oldpassword" required/>
  				</div>
  			     </center>
  			  </div><br>
  			  
  			  <div class="row">
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
  			  </div><br>
  			  
  			  <div class="row">
  					<center><input type="submit" ng-disabled="log.$pristine|| log.$invalid" class="btn btn-primary" value="Change Password" ng-click="changePassword()" /></center>
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


<!-- 000000000000000000000000000000000000000 -->
<%-- <body ng-controller="products_controller" >
  <div class="add_panel">
			<a ng-click="addModal();" class="model_form btn btn-primary">
				<i class="glyphicon glyphicon-plus pull-left"></i>Open Form</a>
            <div class="clearfix container"></div><!-- fromDate,toDate -->
		</div>
<!-- Form modal -->
  <div id="form_modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
       
       
        <div class="modal-header modal-header-info" id="heas">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><i class="icon-paragraph-justify2"></i>
          {{form_name}}</h4>
        </div>
        
        <!-- Form inside modal -->
        <form  method="post" ng-submit="UserAddUpdate(users_form);" id="cat_form">
          <div class="modal-body with-padding">
 <!-- 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
 				<section>
	<div class="container-fluid">
  			<div class="login-box">
          <div><h3 class="title" style="color:#ffae00;"><center>Change Password</h3></center></div><br>
          
          <div align="center">
		<div ng-show="loading" class="loading"><img src="http://www.nasa.gov/multimedia/videogallery/ajax-loader.gif">LOADING...</div>
		</div>
          
          	<center>
  				<div class="row">
	  				<center>
	  				<div class="col-lg-12">
	  					<input type="text" required class="form-control" value="<%=session.getAttribute("getname") %>" name="username"  >
	  				</div>
	  				</center>
  				</div>
  				<br>
  				<div class="row">
  				<center>
  				<div class="col-lg-12">
  					 <input type="text" class="form-control" id="oldpassword" name="oldpassword" ng-model="users_form.oldpassword"   
  					    	placeholder="input old password" required/>
  				</div>
  				</center>
  				</div>
  				
  				<div class="row">
  				<center>
  				<div class="col-lg-12">
  					 <input type="text" class="form-control" id="newpassword" name="conformOtp" ng-model="users_form.newpassword"   
  					    	placeholder="input new password" required/>
  				</div>
  				</center>
  				</div>
  				
  				<div class="row">
  				<center>
  				<div class="col-lg-12">
  					 <input type="text" class="form-control" id="conformpassword" name="conformOtp" ng-model="users_form.conformpassword"   
  					    	placeholder="input conform password" required/>
  				</div>
  				</center>
  				</div>
  				<br>
  		</div>
	</div>
</section>
 					
            </div>
            
			<div class="modal-footer">
			<input type="hidden" name="hidden_id" value="{{hidden_id}}" />
			  <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
			  <button type="submit" name="form_data" class="btn btn-primary">Change Password</button>
			</div>
        </form>
      </div>
    </div>
  </div> --%>
      
</body>
</html>