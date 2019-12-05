<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products List</title>
 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
 
  
  <link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap.min.css" />" />
    <link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap-theme.min.css" />" />
    <link rel="stylesheet" href="<c:url value="resources/styles/pivotal.css" />" />
    
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>spring-microservices: Country</title>
</head>
<body>
<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<a title="Spring IO" href="http://www.spring.io"> 
							<img src="<c:url value="resources/images/spring-trans-dark.png"/>" height="50"/>
						</a>
					</div>
					<div>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="http://www.pivotal.io">
									<img alt="Pivotal" title="Pivotal" height="20" src="<c:url value="resources/images/pivotal-logo-600.png" />" />
								</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<div style="text-align: right">[ <a href="/">Home</a> ]</div>
		</div>
		
		
		<div class="row">
			
			<h1>Country Web -  Page</h1>

			<div class="table-responsive" id="hidt">
				<div id="exportable">
					<table datatable="ng"  id="examples" class="table table-striped  table-hover table-sm" cellspacing="0"  width="100%">
						<thead>
						   	<tr class="bg-primary">
								<th>ticketId</th>
								<th>passangerName</th>
								<th>bookingDate</th>
								
								<th>sourceStation</th>
								<th>destStation</th>
								<th>email</th>
						  	</tr>
						</thead>							

													
						 <tbody> 
						<c:forEach items="${ticketBookingService}" var="product">
							<tr>
								<td>${product.ticketId }</td>
								<td>${product.passangerName }</td>
								<td>${product.bookingDate }</td>
								
								<td>${product.sourceStation }</td>
								<td>${product.destStation }</td>
								<td>${product.email }</td>
							</tr>
						</c:forEach>			
						 </tbody> 
					</table>
				</div>
			</div>
			
		</div>
		</div>
		

</body>
</html>