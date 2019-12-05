<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  
  		<%-- <link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap.min.css" />" />
    	<link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap-theme.min.css" />" />
    	<link rel="stylesheet" href="<c:url value="resources/styles/pivotal.css" />" />
   		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   		
    	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
     	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 		
 		 <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/le-frog/jquery-ui.css" />
 		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> --%>
  		
  		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    	<link href="http://cdn.datatables.net/plug-ins/1.10.7/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    	<link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/le-frog/jquery-ui.css" />
    	
    	<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   	 	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    	<script type="text/javascript" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
    	<script type="text/javascript" src="http://cdn.datatables.net/plug-ins/1.10.7/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
        <script type="text/javascript" src="https://cdn.bootcss.com/angular-datatables/0.6.4/angular-datatables.min.js"></script>
        
  
  		<script src="<c:url value='/static/bookangular/app.js' />"></script>
    	<script src="<c:url value='/static/bookangular/user_service.js' />"></script>
    	<script src="<c:url value='/static/bookangular/user_controller.js' />"></script>
    
		<title>spring-microservices: Country</title>
	<script>
	  $( function() {
	    $( "#bookingDate" ).datepicker();
	   // dateFormat : "dd-mm-yy",
		//changeMonth: true,                  
	  //  changeYear: true,
	  } );
  </script>
	
</head>
<!-- <body ng-controller="products_controller" data-ng-init="productDetails()"> -->
<body ng-app="myApp">
<div class="generic-container" ng-controller="UserController as ctrl">
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
			<!-- <div style="text-align: right">[ <a href="/">Home</a> ]</div> -->
		</div>
		
<!-- 000000000000000000000000000000000000000000000000000000000 start -->		
		<div class="add_panel" id="btnTest">
			<a ng-click="addModal();" class="model_form btn btn-primary">
				<i class="glyphicon glyphicon-plus pull-left"></i>Add User </a>
            <div class="clearfix container"></div>
		</div>
		
		
		<!-- Form modal -->
  <div id="form_modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
       
       
        <div class="modal-header modal-header-info" id="heas">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><i class="icon-paragraph-justify2"></i>
          {{form_name}}</h4>
        </div>
        
        <!-- Form inside modal -->
        <form ng-submit="ctrl.submit()" name="myForm">
        
		 	<input type="hidden" ng-model="ctrl.user.userId" />
          <div class="modal-body with-padding">
					 
					 <div class="w3-container w3-row-padding">
						<div class="w3-container w3-third">
						<label for="operator" class="w3-text-blue"> <b>Booking Date</b></label>
							<input type="text" ng-model="ctrl.user.bookingDate" id="bookingDate" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your booking Date" required ng-minlength="3"/>
						</div>
						<div class="w3-container w3-third">
						<label for="circle" class="w3-text-blue"><b>Description</b></label>
							<input type="text" ng-model="ctrl.user.destStation" id="destStation" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your description" required ng-minlength="3"/>
						</div>
						
						<div class="w3-container w3-third">
						<label for="type" class="w3-text-blue"><b>Email</b></label>
							<input type="text" ng-model="ctrl.user.email" id="email" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your email" required ng-minlength="3"/>
						</div>
		         </div><br>
		         <div class="w3-container w3-row-padding">
						<div class="w3-container w3-half">
							<input type="text" ng-model="ctrl.user.sourceStation" id="sourceStation" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your sourceStation"  ng-minlength="3"/>
						</div>
						<div class="w3-container w3-half">
							<input type="text" ng-model="ctrl.user.userName" id="userName" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your userName"  ng-minlength="3"/>
						</div>
		         </div><br>
		      
            
            </div>
            
            <div class="row">
				<div class="col-sm-2 ">
				</div>
				<div class="col-sm-4 ">
					 <input type="submit"  value="{{!ctrl.user.userId ? 'Add' : 'Update'}}" class="btn btn-info btn-block w3-hover-blue" >
				</div>
				<div class="col-sm-4 ">
					<button type="button" ng-click="ctrl.reset()" class="btn btn-danger btn-block w3-hover-blue" ng-disabled="myForm.$pristine">Reset Form</button>
				</div>
			</div>
			<!-- <div class="modal-footer">
			<input type="hidden" name="hidden_id" value="{{hidden_id}}" />
			  <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
			  <button type="submit" name="form_data" class="btn btn-primary">Submit</button>
			</div> -->
        </form>
      </div>
    </div>
  </div>
		

<!-- 000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
		<div class="row">
			<h1>Country Web -  Page</h1>
			<div class="table-responsive">
				<div id="exportable">
					<table datatable="ng"  id="examples" class="table table-striped  table-hover table-sm" cellspacing="0" width="100%">
						<thead>
							<tr class="bg-primary">
							
					       		<th>BookId</th>
								<th>userName</th>
								<th>bookingDate</th> 
								<th>sourceStation</th>
								<th>destStation</th>
								<th>email</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
						<tr ng-repeat="project in ctrl.users">
							<!-- <tr ng-repeat="project in jsonproductLists"> -->
							<!-- <tr ng-repeat="project in ctrl.users"> -->
								<td>{{project.userId }}</td>
								<td>{{project.userName }}</td>
								 <td>{{project.bookingDate }}</td>
								<td>{{project.sourceStation }}</td>
								<td>{{project.destStation }}</td>
								<td>{{project.email }}</td>
								<td>
                              		<button type="button" ng-click="ctrl.edit(project.userId)" class="btn btn-success custom-width">Edit</button>  
                              		<button type="button" ng-click="ctrl.remove(project.userId)" ng-confirm-click=" Are you SURE you want to Delete?" class="btn btn-danger custom-width">Remove</button>
                              	</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
		</div>
		
		</div>

</body>
</html>


</body>