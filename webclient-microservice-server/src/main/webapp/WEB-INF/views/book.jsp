<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products List</title>
 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
 
  
  <link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap.min.css" />" />
    <link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap-theme.min.css" />" />
    <link rel="stylesheet" href="<c:url value="resources/styles/pivotal.css" />" />
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  
  		<script src="<c:url value='/static/bookangular/app.js' />"></script>
      <script src="<c:url value='/static/bookangular/user_service.js' />"></script>
      <script src="<c:url value='/static/bookangular/user_controller.js' />"></script>
      
      
  
    
	<title>spring-microservices: Country</title>
	
	<!-- <script type="text/javascript">
		var app=angular.module("products.controller",[]);
		app.controller("products_controller",['$scope','$window','$http',
				function($scope,$window,$http){
				
				$scope.productDetails=function(){
					$window.alert("books:");	
					$http({
						url:"/getAllBooks",
						method:"get",
						/* params:{
							"minPrice":$scope.minPrice,
							"maxPrice":$scope.maxPrice
						} */
					}).then(function(result){
						$window.alert("Book status::"+result.data);
						//$window.alert("status::"+result.data.destStation);//email
						$scope.jsonproductLists=result.data;
						//$scope.jsonproductList=result.data;
						alert("check...");
						//$window.alert("jsonproductList::"+jsonproductList.email);
					},function(result){
						$window.alert("failure"+result.status);
					});
				}
			}]);
</script> -->
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
			<div style="text-align: right">[ <a href="/">Home</a> ]</div>
		</div>
		{jsonproductList}
	<div class = "w3-row w3-card-4  "  id="containerFORM">
		<form ng-submit="ctrl.submit()" name="myForm">
		
			<div class="w3-container w3-row-padding">
				<div class="w3-container w3-third">
					<label class = "w3-label w3-text-blue">BookTitle</label>
						<input type="text" ng-model="ctrl.user.bookTitle" id="bookTitle" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your bookTitle" required ng-minlength="3"/>
					</div>
				<div class="w3-container w3-third">
					<label class = "w3-label w3-text-blue">AuthorName</label>
					<input type="text" ng-model="ctrl.user.authorName" id="authorName" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your authorName" required ng-minlength="3"/>
				</div>
							
			<div class="w3-container w3-third">
				<label class = "w3-label w3-text-blue">BookDescription</label>
					<input type="text" ng-model="ctrl.user.bookDescription" id="bookDescription" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your bookDescription" required ng-minlength="3"/>
				</div>
			</div>
		
		
			
			<div class="w3-container w3-row-padding">
				<div class="w3-container w3-third">
					<label class = "w3-label w3-text-blue">BookPrice</label>
						<input type="text" ng-model="ctrl.user.bookPrice" id="bookPrice" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your bookPrice"  ng-minlength="3"/>
					</div>
				<div class="w3-container w3-third">
					<label class = "w3-label w3-text-blue">isbn</label>
					<input type="text" ng-model="ctrl.user.isbn" id="isbn" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your isbn"  ng-minlength="3"/>
				</div>
							
			<div class="w3-container w3-third">
				<label class = "w3-label w3-text-blue">createDate</label>
					<input type="text" ng-model="ctrl.user.createDate" id="createDate" class="form-control form-control-sm form-rounded w3-hover-blue"
													 placeholder="Enter your createDate"  ng-minlength="3"/>
				</div>
			</div>
			
			
			
			
			<br>
			<div class="row">
				<div class="col-sm-2 ">
				</div>
				<div class="col-sm-4 ">
					<!-- <INPUT TYPE="button" align="left" value="OK" class="btn btn-info btn-block w3-hover-blue" onclick="Search()"> -->
					 <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-info btn-block w3-hover-blue" >
				</div>
							           
				<div class="col-sm-4 ">
				<button type="button" ng-click="ctrl.reset()" class="btn btn-danger btn-block w3-hover-blue" ng-disabled="myForm.$pristine">Reset Form</button>
					<!-- <INPUT TYPE="button" align="left" value="Reset" class="btn btn-danger btn-block w3-hover-blue" onclick="resetall()"> -->
				</div>
			</div>
		</form>
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
								<th>BookTitle</th>
								<th>AuthorName</th> 
								<th>BookDescription</th>
								<th>BookPrice</th>
								<th>Isbn</th>
								<th>CreateDate</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
						<tr ng-repeat="project in ctrl.users">
							<!-- <tr ng-repeat="project in jsonproductLists"> -->
							<!-- <tr ng-repeat="project in ctrl.users"> -->
								<td>{{project.id }}</td>
								<td>{{project.bookTitle }}</td>
								 <td>{{project.authorName }}</td>
								<td>{{project.bookDescription }}</td>
								<td>{{project.bookPrice }}</td>
								<td>{{project.isbn }}</td>
								<td>{{project.createDate }}</td>
								<td>
                              		<button type="button" ng-click="ctrl.edit(project.id)" class="btn btn-success custom-width">Edit</button>  
                              		<button type="button" ng-click="ctrl.remove(project.id)" class="btn btn-danger custom-width">Remove</button>
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





<!-- <body ng-app="myApp" class="ng-cloak" >
      <div class="generic-container" ng-controller="UserController as ctrl">
      <div class="container">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">User Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.user.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.username" id="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                        
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.address" id="address" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Email</label>
                              <div class="col-md-7">
                                  <input type="email" ng-model="ctrl.user.email" id="email" class="email form-control input-sm" placeholder="Enter your Email" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
 					<div class="container">
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <input type="submit"  value="ADD UPDATE " class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div></div>
                      
                  </form>
              </div>
          </div>
          </div>
          
          
          
          
          <div class="panel panel-default">
                Default panel contents
              <div class="panel-heading"><span class="lead">List of Users </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>Name</th>
                              <th>Address</th>
                              <th>Email</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.users">
                              <td><span ng-bind="u.id"></span></td>
                              <td><span ng-bind="u.username"></span></td>
                              <td><span ng-bind="u.address"></span></td>
                              <td><span ng-bind="u.email"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  
                              <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div> -->
      <%-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
     <!--  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script> -->
      <script src="<c:url value='/static/js/app.js' />"></script>
                                  
      <script src="<c:url value='/static/js/service/user_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/user_controller.js' />"></script> --%>
</body>