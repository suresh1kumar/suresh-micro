<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GetPersonalDetails | Resume Builder</title>

<style>
	.alter_color{
		width:100%; 
		border-collapse:collapse; 
	}
	.alter_color td{ 
		padding:7px;
		border:#A7AFB0 1px solid;
	}
	.alter_color tr{
		background:#4CAECB;
		
	}
	tr{
		width:100%;
		text-align:center;
	}
	
	.alter_color tr:nth-child(odd){ 
		background-color: #D6E7F1;
	}
	
	.alter_color tr:nth-child(even){
	
		background-color: #F0F4FC;
		}
	.cap{
		font-size:20px;
		font-family:arial;
	}
	.space{
		margin-left:15px;
	}
	.titlespace{
		float:right;
	}
	.cap{
		background-color:#35ACD0;
		padding:20px; 
		border:#A7AFB0;
		color:#eee;
	}
</style>
</head>
<body>
<table frame="box" rules="all" align="center" class="alter_color">
<caption class="cap">Personal Details List<a href="add.jsp"><span class="titlespace"><img src="./images/add.png" height="20" width="20"/>Add</span></a></caption>
<colgroup sapn="8" ></colgroup>
		<thead>
		<tr style="background-color:#4EAECC;color:#eee;">
		<td>SID</td>
		<td>First Name</td>
		<td>Mobile</td>
		<td>Email</td>
		<td>D.O.B.</td>
		<td>Edit/Update</td>
		<%
		System.out.println("================================jsp");
		%>
		
		</tr>
		</thead>
		<tbody>
		<c:forEach  items="${sessionScope.studentlist}" var="student">
		<tr>
			 <%-- <td ><input name="sid" value="${student.sid}" readonly="readonly"/></td> --%>
			 <td><c:out value="${student.sid}"></c:out></td>
			<td><c:out value="${student.name}"></c:out></td>
			<td><c:out value="${student.mobile}"></c:out></td>
			<td><c:out value="${student.email}"></c:out></td>
			 <td><c:out value="${student.sdate}"></c:out></td> 
			
			
		<td><a href="edit.jsp?sid=${student.sid}&name=${student.name}
		&mobile=${student.mobile}&email=${student.email}
		&dat=${student.sdate}">Edit</a>
		<a href="DeleteStudentAction?sid=${student.sid}">Delete</a>	
		</td>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>