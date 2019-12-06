<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
			body{

			background-color:lightblue;
			}
			
			table{
			text-align:center;
			font-size:16pt;
			color:green;
			}
		</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration page</title>
</head>
<body>
<form action="RegisterController" method="post">
<h1 align="center">Welcome to Registration Page</h1><hr/><br/>
 <table align="center">
<tr>
<td>User Name :</td>
<td><input type="text" name="uname" /></td>
</tr>
<tr>
<td>User Email :</td>
<td><input type="text" name="email" /></td>
</tr>
<tr>
<td>User Mobile :</td>
<td><input type="text" name="mobile" /></td>
</tr>
<tr>
<td><input type="submit" value="Register"/></td></tr>
</table>
</form>
</body>
</html>