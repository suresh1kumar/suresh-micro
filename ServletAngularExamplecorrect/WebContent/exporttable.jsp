<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" ng-app="angularjsTable">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href='//fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
     <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   <!--  <script src="http://demo.expertphp.in/js/jquery.js"></script> -->
   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
   <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
    <!-- Angular JS -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> -->
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular.min.js"></script> 
 
</head>
<body style="background: #e1e1e1;">
<!-- <body ng-controller="listitemdata"> -->
	     <div class="panel panel-primary">
       <div class="panel-heading">Searching Sorting and Pagination in Angular js</div>
        <div class="panel-body">
      <div ng-controller="listitemdata">
        <div class="alert alert-success">
          <p>Sort By: {{sortBy}}</p>
          <p>Reverse: {{reverse}}</p>
          <p>Search Text : {{search}}</p>
        </div>
       
          <div class="col-md-12">
          
            <input type="text" ng-model="search" class="form-control" placeholder="Type your search keyword..">
          </div>
        
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th ng-click="sort('regionid')">Id
                <span class="glyphicon sort-icon" ng-show="sortBy=='regionid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              <th ng-click="sort('r_shortname')">Product Name
                <span class="glyphicon sort-icon" ng-show="sortBy=='r_shortname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              <th ng-click="sort('r_fullname')">Product Details
                <span class="glyphicon sort-icon" ng-show="sortBy=='r_fullname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              
            </tr>
          </thead>
          <tbody>
            <tr dir-paginate="product in products|orderBy:sortBy:reverse|filter:search|itemsPerPage:5">
              <!-- <td>{{product.id}}</td>
              <td>{{product.product_name}}</td>
              <td>{{product.product_details}}</td> -->
              
              <td>{{product.regionid}}</td>
				<td>{{product.r_shortname}}</td>
				<td>{{product.r_fullname}}</td>
            </tr>
          </tbody>
        </table> 
        <dir-pagination-controls
          max-size="5"
          direction-links="true"
          boundary-links="true" >
        </dir-pagination-controls>
      </div>
    </div>
    
      </div>
<!-- <script src="lib/dirPagination.js"></script> -->
<script type="text/javascript">
var app=angular.module('angularjsTable',['angularUtils.directives.dirPagination']);


//var app = angular.module('angularjsTable', ['angularUtils.directives.dirPagination']);
app.controller('listitemdata',function($scope, $http){
	alert("tttttttttttttt");
    $scope.products = []; //declare an empty array
    $http.get("/ServletAngularExample/ProductServices").success(function(response){ 
    	
        $scope.products = response;  //ajax request to fetch data into $scope.data
        alert("dddddddddddd");
    });
    
    $scope.sort = function(keyname){
        $scope.sortBy = keyname;   //set the sortBy to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }
});
</script>

</body>
</html>