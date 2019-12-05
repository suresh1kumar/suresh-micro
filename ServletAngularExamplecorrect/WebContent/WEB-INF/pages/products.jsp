<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.6/require.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.12/xlsx.core.min.js"></script>
 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular-resource/1.7.3/angular-resource.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
 <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.11.0.js"></script>
 <script data-require="ng-table-export@0.1.0" data-semver="0.1.0" src="http://bazalt-cms.com/assets/ng-table-export/0.1.0/ng-table-export.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/alasql/0.4.11/alasql.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.6/require.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.12/xlsx.core.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script type="text/javascript">
 
 
 </script>
 
<script type="text/javascript">
	var app=angular.module("products.controller",[]);
	app.controller("products_controller",
			[
				'$scope',
				'$window',
				'$http',
				function($scope,$window,$http){
					
					$scope.jsonproductList={};
			$scope.productDetails=function(){
				$window.alert("minprice:"+$scope.minPrice+"-maxPrice="+$scope.maxPrice);	
				$http({
					url:"/ServletAngularExample/ProductServices",
					method:"get",
					params:{
						"minPrice":$scope.minPrice,
						"maxPrice":$scope.maxPrice
					}
				}).then(function(result){
					$window.alert("status::"+result.status+"==Result::"+result.data);
					jsonproductList=result.data;
					var p=$scope.jsonproductList=result.data;
				},
				//function myCtrl($scope) {
				   /*  $scope.exportData = function () {
				        alasql('SELECT * INTO XLSX("Report.xlsx",{headers:true}) FROM ?',[$scope.result]);
				    }, */
				    window.saveFile = function saveFile (result){
				    	alert("data csv11 ::");
				    	jsonproductList=result.data;
						//var data1 = result.data;
						//$scope.data1 = result;
						//var data1 = [{a:1,b:10},{a:2,b:20}];
						alert("data csv22 ::");
						//alert("data csv ::"+result);
				    var res = alasql('SELECT INTO XLSX("MyAwesomeData.xlsx",?) FROM ?',[jsonproductList]);
				},
				function(result){
					$window.alert("failure"+result.status);
				});
			}
			}]);
</script>
</head>
<body ng-controller="products_controller">
	<div>
		MinPrice:<input type="text" ng-model="minPrice" /> 
		MaxPrice:<input	type="text" ng-model="maxPrice" />
		<button ng-click="productDetails()">search</button>
	</div>
	<br>
	<br>
	<div class="container">
	<!-- <button ng-click="exportData()">Export</button> -->
	<button onclick="saveFile(result)">Save XLSX file</button>
	 <div id="exportable">
	 <table class="table table-striped table-hover table-bordered">
        <thead>
          <tr>
            	<th>Product Id</th>
				<th>Product Name</th>
				<th>Price</th>
          </tr>
        </thead>
        <tbody>
          <!-- <tr ng-repeat="obj in objects | filter : paginate"> -->
          <tr ng-repeat="project in jsonproductList">
            	<td>{{project.regionid}}</td>
				<td>{{project.r_shortname}}</td>
				<td>{{project.r_fullname}}</td>
          </tr>
        </tbody>
      </table>
      <div data-pagination="" data-num-pages="numOfPages()" data-current-page="curPage" data-max-size="maxSize" data-boundary-links="true">
      </div>
	</div></div>
	<div></div>
</body>
</html>

<!-- 00000000000000000000000000000000000000 -->

<!-- <!DOCTYPE html>
<html ng-app="App">

  <head>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  </head>

  <body>
    <h1>Hello Plunker!</h1>
    
    <div class="container-fluid">
      <div ng-controller="mainCtrl">
        
        <table class="table table-striped table-hover table-bordered">
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
            </tr>
          </thead>
          <tbody>
            <tr ng-repeat="obj in objects | filter : paginate">
              <td>{{obj.id}}</td>
              <td>{{obj.name}}</td>
            </tr>
          </tbody>
        </table>
        <pagination total-items="totalItems" ng-model="currentPage" max-size="5" boundary-links="true"
          items-per-page="numPerPage" class="pagination-sm">
        </pagination>
      </div> 
    </div>
    
    
    <div class="container-fluid">
      <div ng-controller="issuesCtrl">
        
        <table class="table table-striped table-hover table-bordered">
          <thead>
            <tr>
              <th>ID</th>
              <th>Title</th>
            </tr>
          </thead>
          <tbody>
            <tr ng-repeat="obj in objects | filter : paginate">
              <td>{{obj.id}}</td>
              <td>{{obj.title}}</td>
            </tr>
          </tbody>
        </table>
        <pagination total-items="totalItems" ng-model="currentPage" max-size="5" boundary-links="true"
          items-per-page="numPerPage" class="pagination-sm">
        </pagination>
      </div> 
    </div>
    
    
    <script src="http://code.angularjs.org/1.2.16/angular.js"></script>
    <script src="http://code.angularjs.org/1.2.16/angular-resource.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.11.0.js"></script>
    <script src="script.js"></script>
  </body>

</html> -->



<!-- 0000000000000000000000000000000022222222222222222 -->
<!-- <table class="table table-striped table-condensed table-hover">
                <thead>
                    <tr>
                        <th class="id">Id&nbsp;<a ng-click="sort_by('id')"><i class="icon-sort"></i></a></th>
                        <th class="name">Name&nbsp;<a ng-click="sort_by('name')"><i class="icon-sort"></i></a></th>
                        <th class="description">Description&nbsp;<a ng-click="sort_by('description')"><i class="icon-sort"></i></a></th>
                        <th class="field3">Field 3&nbsp;<a ng-click="sort_by('field3')"><i class="icon-sort"></i></a></th>
                        <th class="field4">Field 4&nbsp;<a ng-click="sort_by('field4')"><i class="icon-sort"></i></a></th>
                        <th class="field5">Field 5&nbsp;<a ng-click="sort_by('field5')"><i class="icon-sort"></i></a></th>
                    </tr>
                </thead>
                <tfoot>
                    <td colspan="6">
                        <div class="pagination pull-right">
                            <ul>
                                <li ng-class="{disabled: currentPage == 0}">
                                    <a href ng-click="prevPage()">« Prev</a>
                                </li>
                                <li ng-repeat="n in range(pagedItems.length)"
                                    ng-class="{active: n == currentPage}"
                                ng-click="setPage()">
                                    <a href ng-bind="n + 1">1</a>
                                </li>
                                <li ng-class="{disabled: currentPage == pagedItems.length - 1}">
                                    <a href ng-click="nextPage()">Next »</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tfoot>
                <tbody>
                    <tr ng-repeat="item in pagedItems[currentPage] | orderBy:sortingOrder:reverse">
                        <td>{{item.id}}</td>
                        <td>{{item.name}}</td>
                        <td>{{item.description}}</td>
                        <td>{{item.field3}}</td>
                        <td>{{item.field4}}</td>
                        <td>{{item.field5}}</td>
                    </tr>
                </tbody>
            </table>  -->
            
            
            