<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products List</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<a href="product/getProduct">getAllProduct</a>
	<h3>Products List</h3>
	
	
	<div class="table-responsive" id="hidt">
	<div id="exportable">
		<table datatable="ng"  id="examples" class="table table-striped  table-hover table-sm" cellspacing="0"  width="100%">
			<thead>
			   	<tr class="bg-primary">
					<th>Id</th>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
			  	</tr>
			</thead>							
										
			 <tbody> 
			<c:forEach items="${products}" var="product">
				<tr>
					<td>${product.id }</td>
					<td>${product.name }</td>
					<td>${product.price }</td>
					<td>${product.quantity }</td>
				</tr>
				</c:forEach>			
			 </tbody> 
		</table>
	</div>
</div>


	<%-- <table border="1" cellpadding="2" cellspacing="2">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
		</tr>
		<c:forEach items="${products}" var="product">
       			<td>${product.id }</td>
				<td>${product.name }</td>
				<td>${product.price }</td>
				<td>${product.quantity }</td>

		</c:forEach>
	</table> --%>

</body>
</html>