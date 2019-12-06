<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Record</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<!-- <style type="text/css">
 thead th {
    background-color: #006DCC;
    color: white;
  }
tbody td {
    background-color: #EEEEEE;
 }
 </style> -->
  <style>
  .headercolor{
  background-color:blue;
  color: white;
  text-align: center;
  }
  </style>
</head>
 <!-- &nbsp;&nbsp;&nbsp;&nbsp; -->
<body>
	<div class="container">
	<a href="addnewrr" class="btn btn-info">Ann New</a>
		<br>
		<div class="row" id="div-tabelo">
			<table class="table table-bordered table-striped  table-fixed table-hover">
				<thead class="headercolor">
					<tr>
						<td>ROLL NO.</td>
						<td>NAME</td>
						<td>ADDRESS</td>
						 <th class="text-center">Edit/Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${student}" var="c" varStatus="index">
						<tr>
							<td>${c.roll}</td>
							<td>${c.name}</td>
							<td>${c.address}</td>
							<td class="text-center">
								<a href="editemp/${c.roll}"><span class="glyphicon glyphicon-edit"></span>Edit</a> 
  							 	<a href="deleteemp/${c.roll}" onclick="return confirm('Are you sure?');"><span class="glyphicon glyphicon-trash"></span>Delete1</a>
  							 </td>  
  							 <%-- <td>
						 		<a href="/deleteemp?id=${c.roll}">Edit</a>
                        		<a href="deleteemp/${c.roll}">Delete12</a>
							</td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>


</html>