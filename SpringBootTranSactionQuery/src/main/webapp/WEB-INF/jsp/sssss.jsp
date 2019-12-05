<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<title>Plan || Update</title>
<meta charset="utf-8">
  
    <link href='http://www.mostlikers.com/favicon.ico' rel='icon' type='image/x-icon'/>
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/le-frog/jquery-ui.css" />
    
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    


  
<script type="text/javascript">
	var app=angular.module("products.controller",[]);
	
	app.controller("products_controller",
			['$scope','$window','$http','$filter',function($scope,$window,$http){				
				
			$scope.productDetails=function(){
				$http({
					url:"../../PlanUpdateViewController",
					method:"get", 
				}).then(function(result){
					$scope.jsonproductList=result.data;
				},function(result){
					$window.alert("failure :)"+result.status);
				});
				};

			//for model show
			    $scope.addModal = function() {
				$scope.users_form = angular.copy($scope.master);
			        $scope.form_name = 'Add New Plan Information!!';
			        $('#form_modal').modal('show');
			    };
			    
			  
	          
		// for add record    
			    $scope.UserAddUpdate = function (users_form) {
			        var users_information = users_form;
			        alert("add");
			        var sno = users_information.sno;
			        $http({
			          url: "../../PlanUpdateAddUpdateController",
			          method: "GET",
			          params:{
			        		"bsnlid":bsnlid,
							"regionName":regionName,
							"type":type,
							"sno":sno
						}
			         }).then(function(response) {
			        	if(sno!=null && sno!="undefined"){
			        	     $scope.success_msg = "Record Updated Successfully!!!!";
			        	     $scope.productDetails();
			        	}else{
			        	     $scope.success_msg = "Record Added Successfully!!!!";
			        	     $scope.productDetails();
			        	}
			         },function (error){
			 				console.log(error);
			 		});
			          $('#form_modal').modal('hide');
			      };
			     
			     $scope.EditModal = function(project) {
			    	 alert("Edit");
			         $scope.form_name = 'Edit Plan Information!!';
			 		var edit_form = {};
			 		var id=project;
			 		var ids=id.sno;
			 		angular.copy(project, edit_form);
			 		$scope.users_form = edit_form;
			         $('#form_modal').modal('show');
			     };
			// end add record
			
			}]);
</script>
	
</head>


<body ng-controller="products_controller" data-ng-init="productDetails()" onload=display_ct();>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand pull-left" href="#"><b>Plan Update >>></b></a>
    
    </div>
    <ul class="nav navbar-nav pull-right" >
      <li ></li> 
    </ul>
  </div>
</nav>

	
	<br><br>
         
         <div class="add_panel">
		<a ng-click="addModal();" class="model_form btn btn-primary">
			<i class="glyphicon glyphicon-plus pull-left"></i>Add Plan </a>
			<b class="w3-text-blue pull-right">Date :<span id='ct' class="w3-text-red "></span></b>
				
            <div class="clearfix container">
		</div>
 		<br>
		
		
    		<br/>
		<div class="col-md-12">
		    <div ng-if="success_msg" class="success_pop alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			 <strong> {{success_msg}} </strong> 
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
        <form  method="post" ng-submit="UserAddUpdate(users_form);" id="cat_form">
          <div class="modal-body with-padding">
 <!-- 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
 
				  
 		<div class="w3-container w3-row-padding">
		  <div class="w3-container w3-third">
		    <label for="country" class="w3-text-blue"> <b>Country</b></label>
			<select name="country" ng-model="users_form.country" id="country" class="form-control form-control-sm form-rounded"> 
                             <option ng-option value="IND">IND</option>
	                 </select>
		   </div>
		   <div class="w3-container w3-third">
			<label for="denomination" class="w3-text-blue"> <b>Denomination</b></label>
			 <input type="text" ng-model="users_form.denomination" class="form-control" placeholder="Input Denomination"/>
		   </div>
						
		   <div class="w3-container w3-third">
			<label for="talkvalue" class="w3-text-blue"> <b>Talkvalue</b></label>
			   <input type="text" ng-model="users_form.talkvalue" class="form-control" placeholder="Input Talkvalue"/>
		   </div>
		  </div><br>
		         
		   <div class="w3-container w3-row-padding">
			<div class="w3-container w3-half">
			     <input type="text" ng-model="users_form.validity" class="form-control" placeholder="Input Validity"/>
			</div>
			<div class="w3-container w3-half">
			     <input type="text" ng-model="users_form.description" class="form-control"placeholder="Input Description"/>
			</div>
		    </div><br>
            
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
 
</body>
</html>