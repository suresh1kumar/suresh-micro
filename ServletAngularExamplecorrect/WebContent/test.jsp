<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-smart-table/2.1.8/smart-table.min.js"></script>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans" />
 <script src="app.js"></script>
 
 <script type="text/javascript">
 
 TestApp = angular.module('TestApp', ['TestApp.controllers', 'smart-table']);
 angular.module('TestApp.controllers', []).controller('testController',  ['$scope', '$http', function($scope, $http) {
 $scope.loading = false;
 $scope.getData = function() {
 $scope.loading = true;
 $http.get("http://dummy.restapiexample.com/api/v1/employees")
 .then(function(response){
 $scope.employees = response.data;
 $scope.loading = false;
 });
 }
 $scope.getData();
 }]);
 </script>
</head>
<body>
	<div class="container">
		<h1>Listing Example with smart-table and AngularJS</h1>
		<div ng-show="loading">
			<h3>Loading...</h3>
		</div>
		<table st-table="display_records" st-safe-src="employees"
			class="table table-striped">
			<thead>
				<tr>
					<th>Profile</th>
					<th width="100px">Name</th>
					<th st-sort="salary">Salary</th>
					<th>Age</th>
					<th>Action</th>
				</tr>
				<tr>
					<th colspan="5"><input st-search placeholder="global search"
						class="input-sm form-control" type="search" /></th>
				</tr>
			</thead>
			<tbody>
				<tr st-select-row="row" st-select-mode="multiple"
					ng-repeat="row in display_records">
					<td><img class="img-thumbnail img-responsive" alt="image"
						src="" style="width: 50px; height: 50px;" /></td>
					<td>{{row.employee_name}}</td>
					<td>{{row.employee_salary}}</td>
					<td>{{row.employee_age}}</td>
					<td><a type="button" class="btn btn-sm btn-info"> <i
							class="glyphicon glyphicon-eye-open"> </i>
					</a></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" class="text-center">
						<div st-pagination="" st-items-by-page="itemsByPage"></div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>