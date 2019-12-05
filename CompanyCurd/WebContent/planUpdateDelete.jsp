<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("d");
int no=Integer.parseInt(id);
String host = "jdbc:mysql://localhost:3306/surajschema"; 
String username = "root"; 
String password = "root";
Connection con=null;
Statement st=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
//con=DriverManager.getConnection(host,"root","root");
con = DriverManager.getConnection(host, username, password);
st=con.createStatement();
st.executeUpdate("delete from companyrecord where SNO='"+no+"'");
System.out.println("************************<<Plan UpDate Deleted successfully>>************************");
System.out.println("Deleted ........id ::"+no);
response.sendRedirect("planUpdateview.jsp");
%>
</body>
</html>