<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> -->




		<!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
        <script src="angular-datatables/dist/angular-datatables.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular-datatables/0.6.2/angular-datatables.min.js"></script>
 	   
 	   <script src="https://raw.githubusercontent.com/michaelbromley/angularUtils/master/src/directives/pagination/dirPagination.js"></script>
 	   <script type="text/javascript" src="pages/dirPagination.js"></script>
 	   
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
         -->
         
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/bootstrap.min.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script type="text/javascript" src="resources/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/angular.min.js"></script>
    <script type="text/javascript" src="resources/dirPagination.js"></script>
    <script type="text/javascript" src="my-files/app.js"></script>

<script type="text/javascript">
	var app=angular.module("products.controller",['angularUtils.directives.dirPagination']);
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

	<div class="container">
	<br><br>
	
	<form class="w3-container">
		<label class="w3-text-blue"><b>MinPrice</b></label>
		<input class="w3-input w3-border" type="text" ng-model="minPrice"/>
		 
		<label class="w3-text-blue"><b>MaxPrice</b></label>
		<input class="w3-input w3-border" type="text" ng-model="maxPrice"/><p><br>
		
		<button ng-click="productDetails()"  class="w3-btn w3-blue">search</button>
	</form>
	 <br><hr>
	
	 
            <div ng-show="jsonproductList">
            <button onClick="exportTableToExcel('tblData')" class="btn btn-success">Export</button>
            <table class="table table-responsive table-hover table-borderd" id="tblData">
                <thead>
                    <tr>
                        <th>productId</th>
                        <th>productName</th>
                        <th>price</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- <tr ng-repeat="project in jsonproductList" ng-click="productDetails(project)"> -->
                    <tr dir-paginate="project in jsonproductList |itemsPerPage:2" pagination-id="jsonproductList" >
                        <td>{{project.productId}}</td>
						<td>{{project.productName}}</td>
						<td>{{project.price}}</td>
                      </tr>
                </tbody>
            </table>
            <dir-pagination-controls pagination-id="jsonproductList" direction-links="true" boundary-links="true"></dir-pagination-controls> 
		  </div>
		</div>
	</body>
	<script type="text/javascript">
function exportTableToExcel(tableID, filename = 'angularjssuresh'){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}
</script>
</html>