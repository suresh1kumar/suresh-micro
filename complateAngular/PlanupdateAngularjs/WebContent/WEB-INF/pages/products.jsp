<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- 
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> 
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="resources/bootstrap.min.css" />
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	    <script type="text/javascript" src="resources/jquery-1.11.2.min.js"></script>
	    <script type="text/javascript" src="resources/bootstrap.min.js"></script>
	    <script type="text/javascript" src="resources/angular.min.js"></script>
	    <script type="text/javascript" src="resources/dirPagination.js"></script>
	    <script type="text/javascript" src="my-files/app.js"></script> 
	    <script src="https://raw.github.com/eligrey/FileSaver.js/master/FileSaver.js"></script> 
    -->
    
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
	var app=angular.module("products.controller",['datatables','export.csv']);///'angularUtils.directives.dirPagination'
	app.controller("products_controller",
			['$scope','$window','$http',
				function($scope,$window,$http){
				$scope.productDetails=function(){
				$http({
					url:"/CheckServer/ProductServices",
					method:"get",
				}).then(function(result){
					$window.alert("success......");
					$scope.jsonproductList=result.data;
				},function(result){
					$window.alert("failure"+result.status);
				});
				}
		//for model show
			    $scope.addModal = function() {
					$scope.users_form = angular.copy($scope.master);
			        $scope.form_name = 'Add New User Information';
			        $('#form_modal').modal('show');
			    };
			    
		// for add record    
			    $scope.UserAddUpdate = function (users_form) {
			        var users_information = users_form;
			        alert("add");
			       var pname = users_information.productName;
			       var price = users_information.price;
			       var productid = users_information.productId;
			       alert("pid ::"+productid);
			        
			        $http({
			          method: 'GET',
			          url: '/CheckServer/ProductServiceAdd',
			          data: users_information,
			          params:{
			        	  	"productid":productid,
							"pname":pname,
							"price":price
						}
			         }).then(function(response) {
			        	 alert("add");
			             $scope.productDetails();
			 			$scope.success_msg = response.data;
			         },function (error){
			 			console.log(error);
			 		});
			        $('#form_modal').modal('hide');
			     };
			     
			     $scope.EditModal = function(project) {
			    	 alert("Edit");
			         $scope.form_name = 'Edit User Information';
			 		var edit_form = {};
			 		var id=project;
			 		var ids=id.productId;
			 		angular.copy(project, edit_form);
			 		$scope.users_form = edit_form;
			 		alert("idddd ::"+ids);
			         $('#form_modal').modal('show');
			     };
			// end add record
			
			// for delete record
			
			$scope.DeleteModal = function(project) {
				var r = confirm("Are you sure want to delete ?");
				if (r == true) {
					var users_record_id = project.productId;
					$http({
					method: 'GET',
					url: '/CheckServer/ProductServiceDelete',
					data: users_record_id,
					params:{
						"users_record_id":users_record_id
						
					}
				}).then(function(response) {
					$scope.productDetails();
					var index = $scope.users_list.indexOf(user);
					$scope.users_list.splice(index, 1);	
					
					$scope.success_msg = response.data;
				},function (error){
					alert("Record are not found");
					console.log(error);
				});
			}
    };
    // end delete record
				/* $scope.delete_data = function(id) {
			        if (confirm("Are you sure you want to delete?")) {
			            $http.post("/CheckServer/ProductServiceDelete", {
			                    'productId': productId
			                })
			                .success(function(data) {
			                    alert(data);
			                    $scope.show_data();
			                });
			        } else {
			            return false;
			        }
			    } */
			   
			
			}]);
</script>

</head>
<body ng-controller="products_controller" data-ng-init="productDetails()">

		<div class="col-md-12">
		<h3 class="text-center">AngularJS Add,Edit,Update,Delete using Boostrap modal with DataTable in Servlet</h3>
		<!-- <div>
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			Google ads Code
			<ins class="adsbygoogle"
				 style="display:block"
				 data-ad-client="ca-pub-9665679251236729"
				 data-ad-slot="9239985429"
				 data-ad-format="auto"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
		</div> -->
		
		</div>
		
    <br />
		<div class="col-md-12">
		<div class="add_panel">
			<a ng-click="addModal();" class="model_form btn btn-primary">
				<i class="glyphicon glyphicon-plus"></i> Add User</a>
				<a class="btn btn-success" export export-data="jsonproductList" export-title="'Users'">Download</a>
				
            <div class="clearfix container"></div>
		</div>
		<div class="container">
      
		
		<div class="table-responsive">
		<div id="exportable">
			<table datatable="ng"  id="examples" 
				class="table table-striped  table-hover table-sm" cellspacing="0" 
					width="100%">
				<thead>
					<tr class="bg-primary">
					       	<th>PRODUCT ID</th>
                        			<th>PRODUCT NAME</th>
                        			<th>PRICE</th>
						<th>ACTION</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="project in jsonproductList">
						<td>{{project.productId}}</td>
						<td>{{project.productName}}</td>
						<td>{{project.price}}</td>
						<!-- <td>{{user.dob | date: "yyyy-MM-dd"}}</td> -->
						<td>
							<a href="javascript:void(0);" ng-click="EditModal(project);"> 
								<i class="glyphicon glyphicon-pencil"></i>
							</a>
							<a href="javascript:void(0);" ng-click="DeleteModal(project)" class="delete"> 
								<i class="glyphicon glyphicon-remove"></i> 
							</a>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
		 </div>
		<div ng-if="success_msg" class="success_pop alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			 <strong> {{success_msg}} </strong> 
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
        <form  method="post" ng-submit="UserAddUpdate(users_form);" id="cat_form">
          <div class="modal-body with-padding">
            <div class="form-group">
              <div class="row">
                <div class="col-sm-12">
                  <label>Product Name :</label>
                   <input type="text" name="pname" ng-model="users_form.productName" 
						id="pname" required="required" class="form-control">
                </div>
              </div>
            </div>            
            <div class="form-group">
              <div class="row">
                <div class="col-sm-12">
                  <label>Product Price :</label>
                   <input type="text" name="price" ng-model="users_form.price" 
						id="price" required="required"  class="form-control">
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
			  <button type="submit" name="form_data" class="btn btn-primary">Submit</button>
			</div>
        </form>
      </div>
    </div>
  </div>
<!-- /form modal --> 
<!-- 000000000000000000000000000000000000000000 -->


	<!-- <div class="container">
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
                    <tr ng-repeat="project in jsonproductList" ng-click="productDetails(project)">
                    <tr dir-paginate="project in jsonproductList |itemsPerPage:2" pagination-id="jsonproductList" >
                    <tr ng-repeat="project in jsonproductList ">
                        <td>{{project.productId}}</td>
						<td>{{project.productName}}</td>
						<td>{{project.price}}</td>
						
						<td>
                        <button class="btn btn-success btn-xs" ng-click="update_data(project.productId, project.productName, project.price)">
                            <span class="glyphicon glyphicon-edit"></span> Edit
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-danger btn-xs" ng-click="delete_data(project.productId)">
                            <span class="glyphicon glyphicon-trash"></span> Delete
                        </button>
                    </td>
                      </tr>
                </tbody>
            </table>
            <dir-pagination-controls pagination-id="jsonproductList" direction-links="true" boundary-links="true"></dir-pagination-controls> 
		  </div>
		</div> -->
	</body>
	
</html>
