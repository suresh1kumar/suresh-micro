<%-- <%@ page language="java" import="java.util.*" %> --%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="loginangular">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login || FTTH</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="images/favicon.png" type="images/favicon.png" sizes="16x16">

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<%
//String un=session.getAttribute("name").toString();
//String pp=session.getAttribute("pass").toString();
//System.out.println("username session login page :"+un);
//System.out.println("password session login page :"+pp);
/* String username=request.getParameter("MobileNumber");
String passw=request.getParameter("Password");
System.out.println("username get :"+username);
System.out.println("password get :"+passw);
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;

			String userdbName;
			String userdbPsw;
			
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@172.22.0.199:1521:ctopup";
			String user = "mvoucher";
			String dbpsw = "mvoucher";
			String sql = "select * from mvoucher.login where mobile='"+username+"' and password='"+passw+"'";
			System.out.println("query DB login page jsp"+sql);
			//System.out.println("Password DB login page jsp");
			try {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, user, dbpsw);
				ps = con.prepareStatement(sql);
				
				rs = ps.executeQuery();
				
				if (rs.next()) {
						userdbName = rs.getString("mobile");
						userdbPsw = rs.getString("password");
						System.out.println("userdbName ::"+userdbName);
						System.out.println("userdbPsw ::"+userdbPsw);
					}
					
				rs.close();
				ps.close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 */

%>

<script type="text/javascript">
	var app=angular.module("loginangular",[]);
	app.controller("loginangular",
			['$scope','$window','$http',
				function($scope,$window,$http){
				$scope.loading = false;
				
			$scope.loginDetails=function(){
				$scope.loading = true;	
				$window.alert("login:");
				
				//alert("user name---- :"+uservalue); 
				//alert("user password---- :"+passvalue); 
				
				 var MobileNumber=$scope.MobileNumber;
				 var Password=$scope.Password;
				$http({
					url:"/Login_Logout_Change_OTP/LoginAction",
					method:"post",
					params:{
						"MobileNumber":$scope.MobileNumber,
						"Password":$scope.Password
					}
				}).then(function(result){
					//$window.location.href = '/ServletLogin/login.jsp';
					alert("----------------------11");
					if((MobileNumber==MobileNumber) && (Password==Password) ){
						alert("----------------------22");
						$window.location.href = '/Login_Logout_Change_OTP/home.jsp';
						$scope.loading = false;
					}else{
						$window.alert("Invalied Mobile & Password!!!");
						$window.location.href = '/Login_Logout_Change_OTP/login.jsp';
					}
				},function(result){
					$window.alert("failure"+result.status);
					$window.location.href = '/Login_Logout_Change_OTP/login.jsp';
				});
			}
			
			}]);
</script>

  <script type="text/javascript">
  /* function numbersa(input){
	  var regex = /[^0-9]/g;
	  input.value=input.value.replace(regex, "");
  } */
  
  
  /* function myFunction() {
	  var x = document.getElementById("passwordid");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	} */
 
  </script>
</head>
<%


session.setAttribute("name", session.getAttribute("name"));
session.setAttribute("pass", session.getAttribute("pass"));

session.setAttribute("getname", session.getAttribute("getname"));
session.setAttribute("getpassword", session.getAttribute("getpassword"));

//session.getAttribute("otp");
session.setAttribute("otp", session.getAttribute("otp"));
System.out.println("getting login page set session value ::"+session.getAttribute("otp"));
//System.out.println("getting login page set session value ::"+session.getAttribute("otp").hashCode());
%>
<body ng-controller="loginangular" onsubmit="return validateForm()">
		<header>
	<div class="container-fluid">
	<div class="row">
    <div><h3 class="title"><center>FIBER TO THE HOME</h3></center></div><br>
		<div class="col-md-6 logo">
			<!-- <img src="images/BSNL_BSNL.png" class="img-responsive"> -->

		</div>
	</div>
</div>
</header>
<section>
	<div class="container-fluid">
  			<div class="login-box">
          <div><h3 class="title" style="color:#ffae00;"><center>LOGIN</h3></center></div><br>
          <!-- <form  method="post" action="LoginServlet" onsubmit="return submitForm()"> -->
          <%
          
          %>
          
          <form name="log" novalidate="novalidate" >
          <div align="center">
		<div ng-show="loading" class="loading"><img src="http://www.nasa.gov/multimedia/videogallery/ajax-loader.gif">LOADING...</div>
		</div>
          
          <center>
         <!--  <form action="LoginServlet" method="post"> -->
  				<div class="row">
  				<center>
  				
  				<div class="col-lg-12">
  					 
  					<input type="text" required class="form-control" name="mobile" ng-model="MobileNumber" placeholder="Mobile Number">

  					
  				</div>
  				</center>
  				</div>
		        
  				<br>
  				<div class="row">
  				<center>
  				<div class="col-lg-12">
  					    <input type="password" class="form-control" id="passwordid" name="Password" ng-model="Password"
  					    	placeholder="Password" required/>
  				</div>
  				</center>
  				</div><br>
  				
  				<div class="row">
  					<center><input type="submit"  class="btn btn-primary" value="submit" ng-click="loginDetails()" /></center>
  				</div><br>
  				</center>
  				</form>
  				
          <div class="row">
            <center><a href="#" class="pwd">Forgot Password?</a></center>
          </div><br>
          <div class="row">
            <center><img src="images/BSNL_BSNL.png" class="img-responsive"></center>
          </div>


  		</div>
	</div>
</section>
<footer>
</footer>
</div>	
<!-- <form method="post" action="/LoginServlet"> -->
<!-- <form>
		<center>
			<h2 style="color: green">JSP Login Example</h2>
		</center>
		<table border="1" align="center">
			<tr>
				<td>Enter Your Name :</td>
				<td><input type="text" name="name" ng-model="name" /></td>
			</tr>
			<tr>
				<td>Enter Your Password :</td>
				<td><input type="password" name="password" ng-model="password" /></td>
			</tr>
			
		
			<tr>
				<td></td>
				<td><input type="submit" value="submit" /></td>
			</tr>
		</table>
	</form> -->
</body>
</html>