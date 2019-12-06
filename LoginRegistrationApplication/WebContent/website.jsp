<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <style>
			body{

			background-color:green;
			}
			
			h1{
			text-align:center;
			font-size:30pt;
			color:red;
			}
		</style> -->
		
<style>
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: red;
   color: white;
   text-align: center;
}
body{
background-color:lightblue;
}

body {margin:0;}
.navbar {
  overflow: hidden;
  background-color: #333;
  position: fixed;
  top: 0;
  width: 100%;
   margin-top: 70px;
}
.navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
 
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Website Page </title>
</head>
<body>
<h1 align="center">Welcome to Website User</h1><hr/><br/>
<h3><a href="">logout</a></h3><hr/><br/>

<div class="navbar">
  <a href="#home">Home</a>
  <a href="addStudentInfo.jsp">New Student</a>
  <a href="#contact">Contact</a>
  <a href="#">Servlet</a>
  <a href="#">Hibernet</a>
  <a href="#">Spring</a>
  <a href="">logout</a>
</div>

<h2 align="center">This is user loged Page</h2>
<div class="footer">
  <p>Footer</p>
</div>
</body>
</html>