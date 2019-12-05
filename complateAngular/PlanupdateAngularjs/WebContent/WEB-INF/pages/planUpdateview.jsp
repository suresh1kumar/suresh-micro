<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.util.*" %>
<%@page import="com.mobitec.Mvoucher.*" %>
<%-- <%@ page import="com.mobitec.Mvoucher.AddDealerInfo,com.mobitec.Mvoucher.ScreenList"%> --%>
<%@ page import ="com.mobitec.Mvoucher.*,java.sql.Connection,java.util.*,java.text.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="products.controller">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<title>Plan Update View</title>
<meta charset="utf-8">
		<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.3.1017/styles/kendo.common.min.css">
  <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.3.1017/styles/kendo.rtl.min.css">
  <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.3.1017/styles/kendo.default.min.css">
  <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.3.1017/styles/kendo.mobile.all.min.css">
  
	<title>AngularJS Add,Edit,Update,Delete using Boostrap modal </title>
    <link href='http://www.mostlikers.com/favicon.ico' rel='icon' type='image/x-icon'/>
    <!--Bootstrap CSS --> 
    <link href="datajs/css/bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="datajs/css/custom-style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
        <!-- <script type="text/javascript" src="datajs/js/angularjs/users_dump.angular.js"></script> -->
        
        <!--  <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script> -->
  <!-- <script src="https://kendo.cdn.telerik.com/2018.3.1017/js/angular.min.js"></script> -->
        <script src="https://kendo.cdn.telerik.com/2018.3.1017/js/jszip.min.js"></script>
  <script src="https://kendo.cdn.telerik.com/2018.3.1017/js/kendo.all.min.js"></script>
    
     <!--/Angualrjs --> 
		
		 <style type="text/css">
   
   h2 {
    text-shadow: 2px 2px #FF0000;
}
.modal-body {
    background-image: url('http://myfunnymemes.com/wp-content/uploads/2015/04/Doge-Meme-Lion-In-All-Its-Majestic-Glory.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    height: 400px;
}
.ui-datepicker {
   background: #333;
   border: 1px solid #555;
   color: #EEE;
}
 h1 {
    text-shadow: 2px 2px #FF0000;
}
#heas{
background-color:gray;
color:white;
}

   </style>
   
<script type="text/javascript">
	var app=angular.module("products.controller",['datatables','export.csv','kendo.directives']);///'angularUtils.directives.dirPagination'
	app.controller("products_controller",
			['$scope','$window','$http','$filter',
				function($scope,$window,$http){
				//$scope.type = ["All", "TOPUP","STV-DATA","STV-SMS","STV-SMS","STV-COMBO","STV-ISD","STV-UL VOICE","STV-REDUCE TARIFF","STV-VAS","STV-OTHERS","STV-VOUCHER","OTHERS"];
				$scope.type = ["All", "RECHARGE","STV","TOPUP","FRC","DATA","SPECIAL"];
				//$scope.Operator = ["BSNL", "RECHARGE","STV","TOPUP","FRC","DATA","SPECIAL"];
				$scope.Country = ["IND"];
				$('#ex').hide();
				$scope.productDetails=function(){
				$http({
					url:"/PlanupdateAngularjs/PlanUpdateViewController",
					method:"get",
				}).then(function(result){
					$window.alert("success......");
					$scope.jsonproductList=result.data;
					$('#ex').show();
				},function(result){
					$window.alert("failure :)"+result.status);
				});
				};
		//for model show
			    $scope.addModal = function() {
					$scope.users_form = angular.copy($scope.master);
			        $scope.form_name = 'Add New Plan Information';
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
		// for add record    
			    $scope.UserAddUpdate = function (users_form) {
			        var users_information = users_form;
			        alert("add");
			       // users_form.start_DATE,users_form.end_DATE
			        
			        var sno = users_information.sno;//operator,circle
			        var bsnlid=users_information.operator;
			        var regionName=users_information.circle;
			        var type=users_information.type;
			        var country=users_information.country;
			        var denomination=users_information.denomination;
			        var talkvalue=users_information.talkvalue;
			        var validity=users_information.validity;
			        var description=users_information.description;
			        var fromdates=users_information.start_DATE;
			        var toDates=users_information.end_DATE;
			       
				    alert("pid ::"+sno);
			        alert("bsnlid:"+bsnlid);
			        alert("regionName:"+regionName);
			        alert("fromDate- ::"+fromdates);
			        alert("toDate- ::"+toDates);
			        
			        $http({
			          url: "/PlanupdateAngularjs/PlanUpdateAddUpdateController",
			          method: "GET",
			          //data: users_information,
			          params:{
			        	  	"bsnlid":bsnlid,
							"regionName":regionName,
							"type":type,
							"country":country,
							"denomination":denomination,
							"talkvalue":talkvalue,
							"validity":validity,
							"description":description,
							"sno":sno,
							"fromdates":fromdates,
							"toDates":toDates
						}
			         }).then(function(response) {
			        	 alert("addsssssssssssssss");
			             $scope.productDetails();
			 			$scope.success_msg = response.data;
			         },function (error){
			 			console.log(error);
			 		});
			        $('#form_modal').modal('hide');
			     };
			     
			     $scope.EditModal = function(project) {
			    	 alert("Edit");
			         $scope.form_name = 'Edit Plan Information';
			 		var edit_form = {};
			 		var id=project;
			 		var ids=id.sno;
			 		var region=id.circle;
			 		alert("id :---"+ids +"---region :"+region);
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
					var sno = project.sno;
					$http({
					method: 'GET',
					url: '/PlanupdateAngularjs/PlanUpdateDeleteController',
					data: sno,
					params:{
						"sno":sno
						
					}
				}).then(function(response) {
					$scope.productDetails();
					var index = $scope.users_list.indexOf(user);
					$scope.users_list.splice(index, 1);	
					$('#ex').show();
					$scope.success_msg = response.data;
				},function (error){
					alert("Record are not found");
					console.log(error);
				});
				}
    		  };
    		
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

<%
		String userName="";
		
		String zoneId = "",regionId = "", cityId = "";
		StringTokenizer stInfo;
		String regionids="";
		String recionnames="";
		String regionnid="";
		String strAuthNum = "", zoneName = "", regionName = "", cityName = "";
		String zoneFname = "", zoneSname = "",  regionFname = "", regionSname = "", cityFname = "", citySname = "";
		String info = "", regionInfo = "", cityInfo = "", dealerCode = "";
		String circleId1="",circleNmae1="";
		int circlId;


		//PlanUpdateDao planUpdateDao=new PlanUpdateDao();

			/* userName = (String) session.getAttribute("user_id");
			AddDealerInfo addInfo = new AddDealerInfo();
			
		
			String zoneInfo = addInfo.getZoneInfo(userName);
			String strZoneName = "";
			
			if (zoneInfo != null && !zoneInfo.equalsIgnoreCase("")) {
				stInfo = new StringTokenizer(zoneInfo, "~");
				while (stInfo.hasMoreTokens()) {
					zoneId = stInfo.nextToken(); 
					regionId = stInfo.nextToken();
					cityId = stInfo.nextToken();
					  
				}
				if (regionId.equals("0") && (cityId.equals("0")) && (!zoneId.equals("0"))) {

					info = addInfo.getInfo1(zoneId);
					stInfo = new StringTokenizer(info, "#");
					zoneFname = stInfo.nextToken();
					zoneSname = stInfo.nextToken();
				  //regionInfo = addInfo.getInfo2(zoneId);
					regionInfo = addInfo.getInfo2(zoneId);
					//cityInfo = planUpdateDao.getInfo3(zoneId, regionId);    

				}
				if (cityId.equals("0") && (!zoneId.equals("0")) && (!regionId.equals("0"))) { 
						 
					info = addInfo.getInfo(zoneId, regionId);
					cityInfo = addInfo.getcityInfo(zoneId, regionId);
					stInfo = new StringTokenizer(info, "#");
					zoneFname = stInfo.nextToken();
					zoneSname = stInfo.nextToken();
					regionFname = stInfo.nextToken();
					regionSname = stInfo.nextToken();
					//strregNam = regionFname;  
					stInfo = new StringTokenizer(cityInfo, "#");
				}

				if ((!zoneId.equals("0")) && (!regionId.equals("0")) && (!cityId.equals("0"))) {
						
					info = addInfo.getInfo4(zoneId, regionId, cityId);  
					stInfo = new StringTokenizer(info, "#");
					zoneFname = stInfo.nextToken();
					zoneSname = stInfo.nextToken();
					regionFname = stInfo.nextToken();
					regionSname = stInfo.nextToken();
					cityFname = stInfo.nextToken();
					citySname = stInfo.nextToken();
					//strregNam = regionFname;
					//strcityNam = cityFname;
				}
			 } */
%>
<body ng-controller="products_controller" data-ng-init="productDetails()">

<header class="w3-container w3-teal">
		  <h1>Plan Update >>:</h1>
	</header>
	

         <div class="container">
	<br><br>
         
         <div class="add_panel">
			<a ng-click="addModal();" class="model_form btn btn-primary">
				<i class="glyphicon glyphicon-plus pull-left"></i>Open Form</a>
				<a class="btn btn-success" align="right" id="ex" export export-data="jsonproductList" export-title="'Users'">Download</a>
            <div class="clearfix container"></div><!-- fromDate,toDate -->
		</div>
 <br>
		<div>
	<h1 align="center">From Date : {{joinDate}}       To Date : {{joinDate1}}</h1>
	</div>
		
    <br />
		<div class="col-md-12">
		<!-- <div ng-if="success_msg" class="success_pop alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			 <strong> {{success_msg}} </strong> 
		</div> -->
		<div class="table-responsive">
		<div id="exportable">
			<table datatable="ng"  id="examples" 
				class="table table-striped  table-hover table-sm" cellspacing="0" 
					width="100%">
				<thead>
					<tr class="bg-primary">
						<!-- <tr class="bg-primary"> -->
		                  <th>OPERATOR</th>
		                  <th>CIRCLE</th>
		                  <th>DENOMINATION</th>
		                  <th>TYPE</th>
		                  <th>TALKVALUE</th>
		                  <th>VALIDITY</th>
		                  <th>DESCRIPTION</th>
		                  <th>COUNTRY</th>
		                  <th>START_DATE</th>
		                  <th>END_DATE</th>
		                  <th>SNO</th>
		                  <th>Edit/Update</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="project in jsonproductList">
						<td>{{project.operator}}</td>
						<td>{{project.circle}}</td>
						<td>{{project.denomination}}</td>
						<td>{{project.type}}</td>
						<td>{{project.talkvalue}}</td>
						<td>{{project.validity}}</td>
						<td>{{project.description}}</td>
						<td>{{project.country}}</td>
						<td>{{project.start_DATE }}</td>
						<td>{{project.end_DATE | date:'yyyy-MM-dd'}}</td>
						<td>{{project.sno}}</td>
						<!-- <td>{{user.dob | date: "yyyy-MM-dd"}}</td> -->
						<td>
							<a href="javascript:void(0);" ng-click="EditModal(project);"> 
								<i class="glyphicon glyphicon-edit btn btn-primary"></i>
							</a>
							<a href="javascript:void(0);" ng-click="DeleteModal(project)" class="delete"> 
								<i class="glyphicon glyphicon-trash btn btn-danger" ></i> 
								
							</a>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
		<!--  </div> -->
		<div ng-if="success_msg" class="success_pop alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			 <h1><strong> {{success_msg}} </strong></h1> 
		</div>
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
 
				   <%
					 if (!regionId.equals("0") && (!cityId.equals("0")) && (!zoneId.equals("0"))) {
				   %> 
				   		<div class="w3-container w3-row-padding">
						<input type="hidden" name="hidden_id" ng-model="users_form.sno"  />
						<div class="w3-container w3-third">
						<label for="operator" class="w3-text-blue"> <b>Operator1</b></label>
	                       <select name="operator" id="operator"  ng-model="users_form.operator" class="form-control form-control-sm form-rounded" required> 
                               <option ng-option value="BSNL">BSNL</option>
	                   		</select>
						</div>
						<div class="w3-container w3-third">
						<label for="circle" class="w3-text-blue"><b>Circle1</b></label>
							<select class="w3-select w3-hover-blue form-rounded" ng-model="users_form.circle" id=circle onChange="regionCode()" name=circle required>
							  <%-- <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION> --%>
							  <option ng-option value="1">1</option>
							</select>
						</div>
						
						<div class="w3-container w3-third">
						<label for="type" class="w3-text-blue"><b>Type1</b></label>
						
						<!-- <select class="w3-select w3-hover-blue form-rounded" name="ReportTypes1" ng-model="ReportTypes" ng-options="x for x in ReportType">
							</select> -->
							<select name="type" id="type" ng-model="users_form.type"  class="form-control form-control-sm form-rounded" required>  
				                    <option ng-option value="All">All</option>
				                <option ng-option value="RECHARGE">RECHARGE</option>
				                <option ng-option value="STV">STV</option>
				                <option ng-option value="TOPUP">TOPUP</option>
				                <option ng-option value="FRC">FRC</option>
				                <option ng-option value="DATA">DATA</option>
				                <option ng-option value="SPECIAL">SPECIAL</option>
				                    <!-- <option ng-option value="All">All</option>
				                    <option ng-option value="TOPUP">TOPUP</option>
				                    <option ng-option value="STV-DATA">STV-DATA</option>
				                    <option ng-option value="STV-SMS">STV-SMS</option>
				                    <option ng-option value="STV-COMBO">STV-COMBO</option>
				                    <option ng-option value="STV-ISD">STV-ISD</option>
				                    <option ng-option value="STV-UL VOICE">STV-UL VOICE</option>
				                    <option ng-option value="STV-REDUCE TARIFF">STV-REDUCE TARIFF</option>
				                    <option ng-option value="STV-VAS">STV-VAS</option>
				                    <option ng-option value="STV-OTHERS">STV-OTHERS</option>
				                    <option ng-option value="STV-VOUCHER">STV-VOUCHER</option>
				                    <option ng-option value="OTHERS">OTHERS</option> -->
			               </select>
			               
						</div>
		         </div><br>
				   
					<% 
					} if (cityId.equals("0") && (!zoneId.equals("0")) && (!regionId.equals("0"))) {
					%>	
					 
					 <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
						<label for="bsnlid" class="w3-text-blue"> <b>Operator</b></label>
							<select name="bsnlid" id="bsnlid"  ng-model="users_form.bsnlid" class="form-control form-control-sm form-rounded"> 
                               <option ng-option value="BSNL">BSNL</option>
	                   		</select>
						</div>
						<div class="w3-container w3-third">
						<label for="regionName" class="w3-text-blue"><b>Circle</b></label>
							<select class="w3-select w3-hover-blue form-rounded" ng-model="users_form.regionName" id=regionList2 onChange="regionCode()" name=regionName>
							  <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
							</select>
						</div>
						
						<div class="w3-container w3-third">
						<label for="type" class="w3-text-blue"><b>Type2</b></label>
							<select name="type" id="type" ng-model="users_form.type" ng-options="x for x in type" class="form-control form-control-sm form-rounded" required>  
				                    
			               </select>
						</div>
		         </div><br>
					 
					<%
						}if ((!zoneId.equals("0")) && (regionId.equals("0")) && (cityId.equals("0"))) {
					%> 
					<div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
						<label for="bsnlid" class="w3-text-blue"> <b>Operator</b></label>
							<select name="bsnlid" id="bsnlid"  ng-model="users_form.bsnlid" class="form-control form-control-sm form-rounded"> 
                               <option ng-option value="BSNL">BSNL</option>
	                   		</select>
						</div>
						<div class="w3-container w3-third">
						<label for="regionName" class="w3-text-blue"><b>Circle</b></label>
							<select class="w3-select w3-hover-blue form-rounded" ng-model="users_form.regionName" id=regionList2 onChange="regionCode2()" name=regionName>
							  <option value=""> All </option>
                               <%stInfo=new StringTokenizer(regionInfo,"#");

          						  while(stInfo.hasMoreTokens())
            						 {
           							 regionSname= stInfo.nextToken();
          							  regionFname=stInfo.nextToken();

          							   if(regionFname.equalsIgnoreCase(regionFname)){
          								   System.out.print("-");
             					    %>
               						   <OPTION value="<%=regionFname%>"selected><%=regionFname%></OPTION>
            					<%}else{%>

           						  <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
             				   <%}}%>
							</select>
						</div>

						<div class="w3-container w3-third">
						<label for="type" class="w3-text-blue"><b>Type3</b></label>
							<select name="type" id="type" ng-model="users_form.type" ng-options="x for x in type" class="form-control form-control-sm form-rounded" required>  
				                    
			               </select>
						</div>
		         </div><br>
					
					<%
					}
				   %>
 				
 					
 					
 					<div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
						<label for="country" class="w3-text-blue"> <b>Country</b></label>
							<select name="country" ng-model="users_form.country" id="country" class="form-control form-control-sm form-rounded"> 
                                <option ng-option value="IND">IND</option>
	                   		</select>
	                   		
						</div>
						<div class="w3-container w3-third">
						<label for="denomination" class="w3-text-blue"> <b>Denomination</b></label>
							<input type="text" ng-model="users_form.denomination" class="form-control form-control-sm form-rounded" name="denomination"   placeholder="Input Denomination" />
						</div>
						
						<div class="w3-container w3-third">
						<label for="talkvalue" class="w3-text-blue"> <b>Talkvalue</b></label>
						<input type="text" ng-model="users_form.talkvalue" class="form-control form-control-sm form-rounded" name="talkvalue"  placeholder="Input Talkvalue" />
						</div>
		         </div><br>
		         
		         
		         
		         <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-half">
							<input type="text" ng-model="users_form.validity" class="form-control form-control-sm form-rounded" name="validity"  placeholder="Input Validity" />
						</div>
						<div class="w3-container w3-half">
							<input type="text" ng-model="users_form.description" class="form-control form-control-sm form-rounded" name="description" placeholder="Input Description" />
						</div>
						
		         </div><br>
		         
		         <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-half">
							<input type="text" ng-model="users_form.start_DATE" class="form-control form-control-sm form-rounded" id="fromDate" name="start_DATE"  placeholder="FromDate" required/> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- 	<input id="fromDatepicker" kendo-date-picker
				             ng-model="fromDateString"
				             k-ng-model="fromDateObject"
				             k-max = "maxDate"
				             k-rebind="maxDate"
				             k-formats="'dd-MM-yyyy'" start_DATE,end_DATE
				             k-on-change="fromDateChanged()" required style="width: 90%;"/>-->
						
						
						
						</div>
						<div class="w3-container w3-half">
						 <input type="text" ng-model="users_form.end_DATE" class="form-control form-control-sm form-rounded" id="toDate" name="end_DATE"  placeholder="ToDate" required/> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input id="toDatepicker" kendo-date-picker
					             ng-model="toDateString"
					             k-ng-model="toDateObject"
					             k-min = "minDate"
					             k-rebind = "minDate"
					              k-formats="'dd-MM-yyyy'"
					             k-on-change="toDateChanged()" required style="width: 90%;"/>-->
						
						</div>
						
		         </div><br>
 <!-- k-format="'dd-MM-yyyy'" -->
            
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

 
 <script language="javascript" src="datetimepick/datetimepicker.js" type="text/javascript"></Script>
 
</body>
</html>