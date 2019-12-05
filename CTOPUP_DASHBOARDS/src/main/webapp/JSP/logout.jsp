<%@page import="com.lwr.software.reporter.DashboardConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Query2Report</title>
	<link rel="stylesheet" type="text/css" href="CSS/lwr.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
	.center{
	    position:absolute;
	    display:block;
	    left:35%;
	    top:35%;
	}
	</style>
	<style type="text/css">
	h3 {color:red;}
	
.jumbotron {
  background: url("https://s3.amazonaws.com/codecademy-content/projects/adoptly/bg.jpg");
  background-size: 100%;
  //text-align: center;
  height: auto;
}
	</style>
</head>
<body class="lwr_main_body">
<nav style="margin-bottom: 0px;border-radius:0px" class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<img style="float:left;position:relative" src="images/q2r.png" alt=""></img>
			<a style="color:#f1f1f1;margin-left:10px" class="navbar-brand" href="#">
			</a>
		</div>
	</div>
</nav>
<%
	request.getSession().removeAttribute(DashboardConstants.SECURITY_CONTEXT);
	request.getSession().removeAttribute("errmsg");
	Cookie username = new Cookie("username", null);
    username.setMaxAge(0);
    response.addCookie(username);
%>

<div class="container">
  <div class="jumbotron">
   <h3 align="center">You are successfully logged out!!</h3>  
     <p class="lead">
    <a class="btn btn-primary btn-lg" href="homelogin.jsp" role="button"> To Login!!</a>
  </p>
  </div>
  <p>This is some text.</p>      
  <p>This is another text.</p>      
</div>


<!-- <h1>You are successfully logged out!!</h1>
<h2>Click <a href="login">Here</a> to login!!</h2>
<h2>Click <a href="login.jsp">Here</a> to login!!</h2> -->
</body>
</html>