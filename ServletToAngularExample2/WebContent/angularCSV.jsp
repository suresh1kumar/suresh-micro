<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script type="text/javascript">
var app=angular.module("myApp",[]);
app.controller("mycontroller",['$scope','$http',function($scope,$http)])
{
	$http.get('js/data.json').success(function(data){
		$scope.jsondata=data.orders;
	});
	function JSONToCSVConvertor(JSONData,ReportTitle,ShowLabel){
		var arrData=typeof JSONData!='object' ? JSON.parse(
				JSONData) : JSONData;
				var CSV='';
				csv+=ReportTitle + '\r\n\n';
				if(ShowLabel){
					var row="";
					for(var index in arrData[0]){
						row+=index + ',';
					}
					row = row.slice(0,-1);
					CSV += row +'\r\n';
				}
				var uri='data:text/csv;charset=utf-8,' + escape(CSV);
				var link=document.createElement("a");
				link.href=uri;
				link.style="visibility:hidden";
				link.download=fileName + ".csv";
				document.body.appendChild(link);
				link.click();
				document.body.removeChild(link);
	}
	$scope.createcsv=function(){
		JSONToCSVConvertor($scope.jsondata,'ALL_data_Angular_king',true);
	}
	}]
	});
</script>
</head>
<body>
<div ng-controller="mycontroller">
	<div class="controller">
		<div class="row well">
			<div class="col-md-3">
			<h3>Search</h3>
			</div>
			<div class="col-md-6">
			<input type="text" class="form-control" ng-model="search"
					placeholder="Enter Search word"/>
			</div>
			<div><button ng-click="createcsv()" class="btn btn-primary">Export_File</button></div>
			<table id="example" class="table table-striped table-bordered" width="100%"
			cellspacing="0">
			<thead>
				<tr>
					<th>orderID</th>
					<th>orderName</th>
					<th>orderStatus</th>
					<th>orderDate</th>
					<th>orderBy</th>
				</tr>
			</thead>
			</table>
		</div>
	</div>
</div>
</body>
</html>