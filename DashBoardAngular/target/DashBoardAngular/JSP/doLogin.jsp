<%@page import="com.report.login.LoginDAO"%>
<jsp:useBean id="loginBean" class="com.report.login.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String result=LoginDAO.loginCheck(loginBean);
 
if(result.equals("true")){
	 //session.setAttribute("email",loginBean.getEmail());
    session.setAttribute("username",loginBean.getLOGIN_ID());
    response.sendRedirect("home.jsp");
}
 
if(result.equals("false")){
    response.sendRedirect("login.jsp?status=false");
}
 
if(result.equals("error")){
    response.sendRedirect("login.jsp?status=error");
}
 
%>
</body>
</html>