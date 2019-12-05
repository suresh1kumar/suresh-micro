<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>view || page</title>
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
  .headercolor{
  background-color:blue;
  color: white;
  text-align: center;
  }
 </style>
</head>
<body>
	<h1>Employees List</h1>  
<div class="container">
		 <div class="row" id="div-tabelo">
			<table class="table table-bordered table-striped  table-fixed table-hover">
				<thead class="headercolor">
					<tr>
					   <th>Id</th>
						<th>Name</th>
						<th>Salary</th>
						<th>Designation</th>
						<th>Edit</th><th>Delete</th>
					</tr> 
				</thead>
				<tbody> 
				   <c:forEach var="emp" items="${list}">   
					   <tr>  
					   <td>${emp.ID}</td>  
					   <td>${emp.NAME}</td>  
					   <td>${emp.AGE}</td>  
					   <td>${emp.DEPT}</td>  
					   <td><a href="editemp/${emp.ID}"><span class="glyphicon glyphicon-edit"></span>Edit</a></td>  
					   <td><a href="deleteemp/${emp.ID}" onclick="return confirm('Are you sure?');"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>  
					   </tr>  
				   </c:forEach>  
			   </tbody>
			 </table>  
   		</div>
   </div>
   <br/>  
   <a href="empform" class="btn btn-success">Add New Employee</a>  
</body>
</html>