<%@ page import="java.sql.*" %>
<%@page import="java.io.File"%>

<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="loginangular">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login || Page</title>
<!-- <link rel="stylesheet" type="text/css" href="style.css"> -->
  <link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  
 <style type="text/css">
  *{
 margin: 0;
 padding: 0;
 font-family: 'Cinzel', serif;
}

.bgimg{
 width: 100%;
 height: 100vh;
 background-image: linear-gradient(27deg, #004E95 50%, #013A6B 50%);
}

.centerdiv{
 width: 350px;
 height: 400px;
 position: absolute;
 top: 50%;
 left: 50%;
 background-color: red;
 transform: translate(-50%, -50%);
 background-image: linear-gradient(27deg, #013A6B 50%, #004E95 50%);
 box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.24);
}

#profilepic{
 width: 120px;
 height: 120px;
 border-radius: 50%;
 position: relative;
 top: -60px;
 left: calc( (350px - 120px) / 2 )
}

h2{
 text-align: center;
 color: white;
 text-transform: uppercase;
 font-size: 2em;
 word-spacing: 10px;
 margin-top: -50px;
 margin-bottom: 50px;
 text-shadow: -2px 2px 1px #0A84C6;
}

.inputbox{
 width: calc(100% - 40px);
 height: 30px;
 display: block;
 margin: auto;
 padding: 0 10px;
 box-sizing: border-box;
}

::placeholder{
 letter-spacing: 2px;
 color: black;
}

button{
 width: calc(100% - 40px);
 height: 30px;
 display: block;
 margin: auto;
 color: white;
 background-color: #0A84C6;
 border: none;
}

.FORGOT-SECTION{
 width: calc(100% - 40px);
 line-height: 30px;
 display: block;
 margin: auto;
 color: white;
 background-color: dodgerblue;
 text-transform: uppercase;
 font-size: 0.8em;
 text-align: right;
 padding-right: 20px;
 box-sizing: border-box;

}
  </style>
  
  <script type="text/javascript">
	var app=angular.module("loginangular",[]);
	app.controller("loginangular",
			['$scope','$window','$http',
				function($scope,$window,$http){
				$scope.loading = false;
				
			$scope.loginDetails=function(){
				$scope.loading = true;	
				$window.alert("login:");
				var mobileNumber=$scope.mobileNumber; //mobileNumber,Password
				 var password=$scope.password;
				 $window.alert("mobileNumber:"+mobileNumber);
				 $window.alert("password:"+password);
				
				$http({
					url:"/School-Systems/LoginAction",
					//url:"../../LoginAction",
					method:"post",
					params:{
						"mobileNumber":$scope.mobileNumber,
						"password":$scope.password
					}
				}).then(function(result){
							
					//if((mobileNumber!=null) && (password=!null) ){
						alert("-----------ssuu-----------22");
						$window.location.href = '/School-Systems/MSchool/jsp/home.jsp';
						$scope.loading = false;
					//}else{
						//$window.alert("Invalied Mobile & Password!!!");
						//$window.location.href = '/School-System/Management/home.jsp';
					//}
				},function(result){
					$window.alert("failure ::"+result.status);
					window.location.href = '/School-Systems/MSchool/jsp/homelogin.jsp';
					$scope.loading = false;
				});
			}
			
			}]);
</script>
</head>
<%
	
%>

<body ng-controller="loginangular" onsubmit="return validateForm()"  style="background: #fff !important;">
<header style="background: #171c66 !important;">
	<div class="container-fluid">
	<div class="row"><br>
    <div><center><h3 class="title" style="color:#ffae00;">FIBER TO THE HOME</h3></center></div><br>
		<div class="col-md-6 logo">
			<!-- <img src="images/BSNL_BSNL.png" class="img-responsive"> -->
		</div>
	</div>
</div>
</header>
			<br>	
				
	<div class="bgimg"><br>
		<div class="centerdiv">
			<img
				src="https://cdn1.iconfinder.com/data/icons/flat-business-icons/128/user-128.png" id="profilepic">
			<h2>user login</h2>
				
			<form name="log" novalidate="novalidate"  >
				<div>
					<input type="text" name="name" class="inputbox" ng-model="mobileNumber"
						placeholder="Username">
				</div>
				<br>
				<div>
					<input type="Password" name="password" class="inputbox" ng-model="password"
						placeholder="Password">
				</div>
				
				
				<tr></tr>
					<%
					String errmsg = (String)request.getSession().getAttribute("errmsg");
					if(errmsg == null || errmsg.isEmpty()){
						%><tr></tr><%
					}else{
						%><tr><%=errmsg%></tr><%
					}
					%>
					<tr></tr>
					<tr></tr>
				<br>
				
				<div>
					<button type="submit"  ng-click="loginDetails()">LOGIN</button>
				</div>
			</form>
			<br>
			<div class="FORGOT-SECTION">
			<div>
				<h4>Forget Password?</h4>
			</div>
		</div>
	</div>
	
</body>
</html>