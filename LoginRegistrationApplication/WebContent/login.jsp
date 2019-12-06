<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN PAGE </title>
<style>
			body{

			background-color:lightblue;
			}
			h1{

			background-color:red;
			}
			
			table{
			text-align:center;
			font-size:16pt;
			color:green;
			}
		</style>
		
<body>
<form action="LoginController">
<h1 align="center">Welcome to login Page</h1><hr/><br/>
 <table align="center">
<tr>
<td>User Email :</td>
<td><input type="text" name="email" /></td>
</tr>
<tr>
<td>User Mobile :</td>
<td><input type="text" name="mobile" /></td>
</tr><tr>
<td><input type="submit" value="login"/></td></tr>
<a href="register.jsp">Registration Here</a>
</table>
</form>
</body>
</html>