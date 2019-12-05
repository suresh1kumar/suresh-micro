<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="excelFile.jsp">
<table border=1>
<tr><th>Name</th><th>Address</th><th>Contact No</th><th>Email</th></tr>
<%

Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surajschema","root","root");  
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from employee");
while(rs.next()){
    %>
<tr><td><input type="text" name="name" value="<%=rs.getString("name")%>">
</td><td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
<td><input type="text" name="contact" value="<%=rs.getString("contact")%>"></td>
<td><input type="text" name="email" value="<%=rs.getString("email")%>"></td></tr>
<%
}
%>
</table>
<input type="submit" value="Export To Excel">
</form>


</body>
</html>