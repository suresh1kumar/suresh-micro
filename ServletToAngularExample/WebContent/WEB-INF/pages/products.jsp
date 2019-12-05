<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script type="text/javascript">
	var app=angular.module("products.controller",[]);
	app.controller("products_controller",
			['$scope','$window','$http',
				function($scope,$window,$http){
			$scope.productDetails=function(){
				$window.alert("minprice:"+$scope.minPrice+"-maxPrice="+$scope.maxPrice);	
				$http({
					url:"/ServletToAngularExample/ProductServices",
					method:"get",
					params:{
						"minPrice":$scope.minPrice,
						"maxPrice":$scope.maxPrice
					}
				}).then(function(result){
					$window.alert("status::"+result.status+"==Result::"+result.data);
					$scope.jsonproductList=result.data;
				},function(result){
					$window.alert("failure"+result.status);
				});
			}
			}]);
</script>
</head>
<body ng-controller="products_controller">
	<div>
		MinPrice:<input type="text" ng-model="minPrice"/>
		MaxPrice:<input type="text" ng-model="maxPrice"/>
		<button ng-click="productDetails()">search</button>
	</div><br><br><center>
	<table border="1">
		<tr><th>productId</th><th>productname</th><th>price</th></tr>
	<tr ng-repeat="project in jsonproductList">
		<td>{{project.productId}}</td>
		<td>{{project.productName}}</td>
		<td>{{project.price}}</td>
	</tr>
	</table>
	</center>
	<div>
	
	
	</div>
</body>
</html>