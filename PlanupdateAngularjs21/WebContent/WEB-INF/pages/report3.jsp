<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="productsm">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link href='http://www.mostlikers.com/favicon.ico' rel='icon' type='image/x-icon'/>
    <!--Bootstrap CSS --> 
    <link href="datajs/css/bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/custom-style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
    
    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/le-frog/jquery-ui.css" />
    <!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
    <!--/Bootstrap CSS --> 
    
    <!--JQuery DataTables--> 
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="datajs/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="datajs/js/dataTables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="datajs/js/dataTables/dataTables.bootstrap.min.js"></script>
    <!--/JQuery DataTables --> 
    
    <!--Angualrjs --> 
        <script type="text/javascript" src="datajs/js/angularjs/angular.min.js"></script>
        <script type="text/javascript" src="datajs/js/angularjs/angular-export.js"></script>
        <script type="text/javascript" src="datajs/js/angularjs/angular-datatables.min.js"></script>
    
    
    <style type="text/css">
    
    h1 {
    text-shadow: 2px 2px #FF0000;
}
    
    </style>
<script type="text/javascript">
	var app=angular.module("productsm",['datatables','export.csv']);
	app.controller("productscontroller",
			['$scope','$window','$http',
				function($scope,$window,$http){
				
				$('#ds').hide();
				$('#ds2').hide();
				$('#ex').hide();
				
				$scope.addModal = function() {
					$scope.users_form = angular.copy($scope.master);
			        $scope.form_name = 'Report Form Page';
			        $('#form_modal').modal('show');
			    };
			
			  //------------------for date picker end---------------------- 
		          $(function() {
					$("#fromDate").datepicker(
					{
						//dateFormat : "dd-mm-yy",
						dateFormat : "yy-mm-dd",
						maxDate : -1,
						//changeMonth: true,
						//changeYear: true,
						onClose : function(selectedDate) {
							$("#toDate").datepicker("option", "minDate", selectedDate);
						}
					});
					$("#toDate").datepicker(
					{
						dateFormat : "yy-mm-dd",
						minDate : 0,
						maxDate : -1,
						//changeMonth: true,
						//changeYear: true,
						onClose : function(selectedDate) {
							$("#fromDate").datepicker("option", "maxDate", selectedDate);
						}
					});
				});
			$scope.productDetails=function(){
		        alert("retrive data funcion block");
				$window.alert("joinDate:"+$scope.joinDate+"-joinDate1="+$scope.joinDate1);
				var ucode=$scope.uaction;
				$http({
					url:"/PlanupdateAngularjs2/PlanUpdateViewController",
					method:"get",
					params:{     //qualification,gender,uaction,joinDate
						"qualification":$scope.qualification,
						"gender":$scope.gender,
						"uaction":$scope.uaction,
						"joinDate":$scope.joinDate,
						"joinDate1":$scope.joinDate1
					}
				}).then(function(result){
					$window.alert("status::"+result.status);
					if(ucode="Disable"){
						alert("Disable block");
					$('#ds').show();
					$('#ex').show();
					$scope.jsonproductList=result.data;
					}else{
						alert("Enable block");
						$scope.jsonproductList1=result.data;
						$('#ds2').show();
						$('#ex').show();
					}
				},function(result){
					$window.alert("failure"+result.status);
				});
				$('#form_modal').modal('hide');
			}
			
			 $(function() {
		            var colors = ["#0099cc","#c0c0c0","#587b2e","#990000","#000000","#1C8200","#987baa","#981890","#AA8971","#1987FC","#99081E"];
		             
		            setInterval(function() { 
		                var bodybgarrayno = Math.floor(Math.random() * colors.length);
		                var selectedcolor = colors[bodybgarrayno];
		                $("body").css("background",selectedcolor);
		            }, 3000);
		        })
			
			}]);
</script>
</head>
<body ng-controller="productscontroller"  >
 <header class="w3-container w3-teal">
		  <h1>Franchise add balance:</h1>
	</header>

		<div class="container">
	<br><br>
	
	
	<div class="add_panel">
			<a ng-click="addModal();" class="model_form btn btn-primary">
				<i class="glyphicon glyphicon-plus"></i>Open Form</a>
				<a class="btn btn-success" align="right" id="ex" export export-data="jsonproductList" export-title="'Users'">Download</a>
				
            <div class="clearfix container"></div>
		</div>
	 <br>
	
	<div>
	<h1 align="center">From Date : {{joinDate}}       To Date : {{joinDate1}}</h1>
	</div>
	 
       <div class="table-responsive" id="ds">
		<div id="exportable">
           <table datatable="ng"  id="examples" 
				class="table table-striped  table-hover table-sm" cellspacing="0" width="100%">
                <thead>
                    <tr class="bg-primary">
                        <th>Student Id1</th>
                        <th>Student Name1</th>
                        <th>Qualification1</th>
                        <th>Gender1</th>
                        <th>Join Date1</th>
                        <th>Action1</th>
                    </tr>
                </thead>
                <tbody>
                        <tr ng-repeat="project in jsonproductList " > 
                        			<td>{{project.studentId}}</td>
						<td>{{project.studentName}}</td>
						<td>{{project.qualification}}</td>
						<td>{{project.gender}}</td>
						<td>{{project.joinDate}}</td>
						<td>{{project.uaction}}</td>
                      </tr>
                </tbody>
            </table>
            </div>
            </div>
            
            <div class="table-responsive" id="ds2">
		<div id="exportable">
           <table datatable="ng"  id="examples" 
				class="table table-striped  table-hover table-sm" cellspacing="0" width="100%">
                <thead>
                    <tr class="bg-primary">
                        <th>Student Id</th>
                        <th>Student Name</th>
                        <th>Qualification</th>
                        <th>Gender</th>
                        <th>Join Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                        <tr ng-repeat="project in jsonproductList1 " > 
                        <td>{{project.studentId}}</td>
						<td>{{project.studentName}}</td>
						<td>{{project.qualification}}</td>
						<td>{{project.gender}}</td>
						<td>{{project.joinDate}}</td>
						<td>{{project.uaction}}</td>
                      </tr>
                </tbody>
            </table>
            </div>
            </div>
		  </div>
		
		
		
		<!-- Form modal -->
  <div id="form_modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><i class="icon-paragraph-justify2"></i>
          {{form_name}}</h4>
        </div>
        <!-- Form inside modal -->
        <form  method="post"  id="cat_form">
          <div class="modal-body with-padding">
          
          	
          	
          	<div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
						<label for="qualification" class="w3-text-blue"> <b>Qualification</b></label>
							<select name="qualification" id="qualification"  ng-model="qualification" class="form-control form-control-sm form-rounded"> 
                               <option ng-option value="BCA">BCA</option>
                               <option ng-option value="MCA">MCA</option>
	                   		</select>
						</div>
						<div class="w3-container w3-third">
						<label for="gender" class="w3-text-blue"><b>Gender</b></label>
							<select name="gender" id="gender"  ng-model="gender" class="form-control form-control-sm form-rounded"> 
                               <option ng-option value="Mail">Mail</option>
                               <option ng-option value="Femail">Femail</option>
	                   		</select>
						</div>
						
						<div class="w3-container w3-third">
						<label for="uaction" class="w3-text-blue"><b>Uaction</b></label>
							<select name="uaction" id="uaction"  ng-model="uaction" class="form-control form-control-sm form-rounded"> 
                               <option ng-option value="Disable">Disable</option>
                               <option ng-option value="Enable">Enable</option>
	                   		</select>
						</div>
		         </div><br>
		         
		         <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-half">
							<input type="text" ng-model="joinDate" class="form-control form-control-sm form-rounded" id="fromDate" name="start_DATE"  placeholder="FromDate" required/> 
						</div>
						
						<div class="w3-container w3-half">
						 <input type="text" ng-model="joinDate1" class="form-control form-control-sm form-rounded" id="toDate" name="end_DATE"  placeholder="ToDate" required/> 
						</div>
		         </div><br>
          <!-- 0000000000000000000000000000000000000 -->
            <!-- <div class="form-group">
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
            </div> -->
			
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
