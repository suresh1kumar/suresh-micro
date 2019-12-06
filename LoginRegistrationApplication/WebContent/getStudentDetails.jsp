<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table frame="box" rules="all" align="center" class="alter_color">
<caption class="cap">Personal Details List<a href="#"><span class="titlespace"><img src="./images/add.png" height="20" width="20"/>Add</span></a></caption>
<colgroup sapn="8" ></colgroup>
   <!-- <table border="1"> -->
   <thead>
      <tr>
         <th>Student Id</th>
         <th>Student Name</th>
         <th>Qulification</th>
         <th>Gender</th>
         <th>Joining Date</th>
      </tr></thead>
      <tbody>
		<c:forEach var ="personal" items="${requestScope.personalDetails}">
		<tr>
			
			<td><c:out value="${personal.studentId}"></c:out></td>
			<td><c:out value="${personal.studentName}"></c:out></td>
			<td><c:out value="${personal.Qualification}"></c:out></td>
			<td><c:out value="${personal.gender}"></c:out></td>
			<td><c:out value="${personal.joinDate}"></c:out></td>
			
			
		<td><a href="updateStudent.jsp?pid=${personal.studentId}&studentName=${personal.studentName}
		&Qualification=${personal.Qualification}&gender=${personal.gender}
		&joinDate=${personal.joinDate}">Edit</a>
		<a href="DeleteStudent?pid=${personal.studentId}">Delete</a>	
		</td>
		</c:forEach>
		</tbody>
   </table>
</body>
</html>