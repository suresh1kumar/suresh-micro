<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@page import="java.io.File"%>
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
	p {color:blue;}
	
.jumbotron {
  background: url("https://s3.amazonaws.com/codecademy-content/projects/adoptly/bg.jpg");
  background-size: 250%;
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
	
	<!-- 000000000000000000000000000000000000000000000000 -->
	
<div class="container">
  <div class="jumbotron">
   
    	<!-- <div class="center"> -->
		<form action="doLogin" method="post">
			<!-- <div style="width:100%;;padding:50px;background-color: #f1f1f1;border-radius:5px"> -->
				<table cellspacing="pixels">
				
					<tr style="padding:10px">
						<td style="color:black"><span class="glyphicon glyphicon-user"></span><span> User Name </span></td>
						<td><input class="form-control" type="text" name="username"></td>
					
					</tr>
					
					<tr style="padding:10px">
						<td style="color:black"><span class="glyphicon glyphicon-lock"></span><span> Password </span></td>
						<td><input class="form-control" type="password" name="password"></td>
					</tr>
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
					<tr>
						<td style="padding:10px">
						</td>
						<td style="padding:10px">
							<button class="btn btn-primary" name="login" type="submit">Login</button>
							<button class="btn btn-primary" name="reset">Reset</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</form>
		<p>
		
		
		<b>Pyro Networks </b>has established strong standards in providing varied telecom
	    solutions that have been accepted and utilized globally in GSM, GPRS and 
	    coexisting GSM/GPRS networks.We have pioneered in extending our services 
	    extensively in the Systems Integration space.Our vast experience in providing
	    end-to-end solutions to the Telecom Industry has helped us to successfully 
	    map our competency, skills and expertise to the areas of Telecom Infrastructure
	    and has enabled many success stories for us, in the last two years. We have 
	    proven expertise in designing solutions for wireless and wireline service 
	    providers cross the world. Our Telecom service offerings include a wide range
	    of solutions that encompass strategic business and technology consultancy, 
	    systems integration for enterprises, operations, and business and network 
	    support systems.
		
		
		</p>
	</div>
  </div>
      
</div>
	<!-- ))))))))))))))))))))))))))))))))))) -->
	<%-- <div class="center">
		<form action="doLogin" method="post">
			<div style="width:100%;;padding:50px;background-color: #f1f1f1;border-radius:5px">
				<table>
					<tr style="padding:10px">
						<td style="color:black"><span class="glyphicon glyphicon-user"></span><span> User Name </span></td>
						<td><input class="form-control" type="text" name="username"></td>
					
					</tr>
					
					<tr style="padding:10px">
						<td style="color:black"><span class="glyphicon glyphicon-lock"></span><span> Password </span></td>
						<td><input class="form-control" type="password" name="password"></td>
					</tr>
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
					<tr>
						<td style="padding:10px">
						</td>
						<td style="padding:10px">
							<button class="btn btn-primary" name="login" type="submit">Login</button>
							<button class="btn btn-primary" name="reset">Reset</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div> --%>
</body>