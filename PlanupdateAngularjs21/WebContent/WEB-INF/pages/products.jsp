<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <!-- <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/bootstrap.min.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script type="text/javascript" src="resources/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/angular.min.js"></script>
    <script type="text/javascript" src="resources/dirPagination.js"></script>
    <script type="text/javascript" src="my-files/app.js"></script> -->
    
    <title>AngularJS Add,Edit,Update,Delete using Boostrap modal </title>
    <link href='http://www.mostlikers.com/favicon.ico' rel='icon' type='image/x-icon'/>
    <!--Bootstrap CSS --> 
    <link href="datajs/css/bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/custom-style.css" rel="stylesheet">
    <!--/Bootstrap CSS --> 
    
    <!--JQuery DataTables--> 
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="datajs/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="datajs/js/dataTables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="datajs/js/dataTables/dataTables.bootstrap.min.js"></script>
    <!--/JQuery DataTables --> 
    
    <!--Angualrjs --> 
        <script type="text/javascript" src="datajs/js/angularjs/angular.min.js"></script>
        <script type="text/javascript" src="datajs/js/angularjs/angular-export.js"></script>
        <script type="text/javascript" src="datajs/js/angularjs/angular-datatables.min.js"></script>
        <!-- <script type="text/javascript" src="datajs/js/angularjs/users_dump.angular.js"></script> -->
    
     <!--/Angualrjs --> 

<script type="text/javascript">
	var app=angular.module("products.controller",['datatables','export.csv']);
	app.controller("products_controller",
			['$scope','$window','$http',
				function($scope,$window,$http){
				//export-headers="['productId_SS', 'productName', 'price_SS']"
					$scope.ReportType = "['productId_SS', 'productName', 'price_SS']";
				$scope.addModal = function() {
					$scope.users_form = angular.copy($scope.master);
			        $scope.form_name = 'Report Form Page';
			        $('#form_modal').modal('show');
			    };
			
			$scope.productDetails=function(){
		        alert("retrive data funcion block");
				$window.alert("minprice:"+$scope.minPrice+"-maxPrice="+$scope.maxPrice);	
				$http({
					url:"/PlanupdateAngularjs2/ProductServices",
					method:"get",
					params:{
						"minPrice":$scope.minPrice,
						"maxPrice":$scope.maxPrice
					}
				}).then(function(result){
					$window.alert("status::"+result.status);
					$scope.jsonproductList=result.data;
				},function(result){
					$window.alert("failure"+result.status);
				});
				$('#form_modal').modal('hide');
			}
			
			}]);
</script>
</head>
<body ng-controller="products_controller"  >

	<div class="container">
	<br><br>
	<!-- csv-header="['Employee Id', 'Employee Name', 'Department', 'Designation', 'City', 'Contact Number']" -->
	
	
	<div class="add_panel">
			<a ng-click="addModal();" class="model_form btn btn-primary">
				<i class="glyphicon glyphicon-plus"></i>Open Form</a>
				<a class="btn btn-success" export export-data="jsonproductList" export-title="'Users'" 
				export-headers="['productId_SS', 'productName', 'price_SS']">Download</a>
				
            <div class="clearfix container"></div>
		</div>
	 <br><hr>
	<%
	//String s={{minPrice}};
	%>
	 <h1>You entered: {{minPrice}}</h1>
       <div class="table-responsive">
		<div id="exportable">
           <table datatable="ng"  id="examples" 
				class="table table-striped  table-hover table-sm" cellspacing="0" width="100%">
                <thead>
                    <tr class="bg-primary">
                        <th>productId_SS</th>
                        <th>productName_SS</th>
                        <th>price_SS</th>
                    </tr>
                </thead>
                <tbody>
                        <tr ng-repeat="project in jsonproductList " > 
                        <td>{{project.productId}}</td>
						<td>{{project.productName}}</td>
						<td>{{project.price}}</td>
                      </tr>
                </tbody>
            </table>
            </div>
            </div>
		  </div>
		
		
		
		<!-- Form modal -->
  <div id="form_modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><i class="icon-paragraph-justify2"></i>
          {{form_name}}</h4>
        </div>
        <!-- Form inside modal -->
        <form  method="post"  id="cat_form">
          <div class="modal-body with-padding">
            <div class="form-group">
              <div class="row">
                <div class="col-sm-12">
                  <label>Product Name :</label>
                   <input type="text" name="mipname" ng-model="minPrice" 
						id="mipname" required="required" class="form-control">
                </div>
              </div>
            </div>            
            <div class="form-group">
              <div class="row">
                <div class="col-sm-12">
                  <label>Product Price :</label>
                   <input type="text" name="mxprice" ng-model="maxPrice" 
						id="mxprice" required="required"  class="form-control">
                </div>
              </div>
            </div>
			<%-- <div class="form-group">
              <div class="row">
                <div class="col-sm-12">
                  <label>Position :</label>
                   <input type="text" name="position" ng-model="users_form.position" 
						id="position" required="required"  class="form-control">
                </div>
              </div>
            </div>
              <div class="row">
                <div class="col-sm-12">
                  <label>Birthday :</label>
                   <input type="date" placeholder="yyyy-MM-dd" id="dob" 
							max="<?php echo date('Y-m-d'); ?>" ng-model="users_form.dob" 
					class="form-control" required="required"  name="dob">
                </div>
              </div> --%>
            </div>
			<div class="modal-footer">
			<input type="hidden" name="hidden_id" value="{{hidden_id}}" />
			  <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
			  <button type="submit" name="form_data" ng-click="productDetails()" class="btn btn-primary">Submit</button>
			</div>
        </form>
      </div>
    </div>
  </div>
<!-- /form modal --> 
	</body>
	</html>