<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<style>
.md-dialog-content {
	width: 600px;
	height:100px;
	resize: horizontal;
}

.md-prompt-input-container{
	width: 100%;
	display: block !important;
	resize: horizontal;
}

div.reportdiv{
	padding-left:50px;
	padding-right:50px;
	border: 1px solid #333;
	overflow:auto;
}
div.headerdiv{
	padding:5px;
	background-color:#333;
	color:white;
}
a.headermenu{
	float:right;
	padding-right:10px !important;
}
div.reportdiv,div.elemdiv,div.coldiv{
	height:100%;
}
div.titlediv{
	font-weight:bold;
}

div.descrdiv{
	padding:5px;
}
div.titlediv,div.inputdiv{
	padding: 0px 5px 5px 5px;
}

div{
	box-sizing: border-box;
}
</style>

</head>
<body>
<!-- <div class="container-fluid"> -->
<div id="reportdiv" class="reportdiv" data-ng-repeat="report in reports">
	<div id="openmenudiv" style="float: right;padding:5px" class="dropdown" data-ng-if="reportOpenType == 'openreport'">
		<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
			Export <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<li><a data-ng-click="export('PDF')">PDF</a></li>
			<li><a data-ng-click="export('CSV')">CSV</a></li>
		</ul>
	</div>
	
	<div id="editmenudiv" style="float: right; position: relative" class="dropdown" data-ng-if="reportOpenType == 'editreport'">
		<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
			Save Report <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<li data-ng-if="userRole == 'admin'"><a data-ng-click="save('public')"><span class="glyphicon glyphicon-stats"></span> Admin Folder</a></li>
			<li data-ng-if="userRole == 'admin'"><a data-ng-click="save('public')"><span class="glyphicon glyphicon-stats"></span> Zone Folder</a></li>
			<li><a data-ng-click="save('personal')"><span class="glyphicon glyphicon-user"></span> Circle Folder</a></li>
		</ul>
	</div>
	
	<div class="input-group" data-ng-if="reportOpenType == 'editreport'">
		<h1 class="titleheading">{{report.title}}
			<a style="display:inline" data-ng-click="editTitle($event)"><img src="images/edit_small.png"></img></a>
		</h1>
	</div>
	
	<div class="input-group" data-ng-if="reportOpenType == 'editreport'">
		<p style="font-size:16px">{{report.description}}
			<a style="display:inline" class="md-primary md-raised" data-ng-click="editDescr($event)"><img src="images/edit_small.png"></img></a>
		</p>
	</div>
	
	<div class="titlediv" data-ng-if="reportOpenType == 'openreport'">
		<h1>{{report.title}}</h1>
	</div>
	
	<div class="descrdiv" data-ng-if="reportOpenType == 'openreport'">
		<p>{{report.description}}</p>
	</div>

	<div id="elemdiv" class="elemdiv">
		<div class="row" data-ng-repeat="rows in report.rows" style="margin:0px;margin-bottom:10px;" id="row_{{$index}}">
			<div class="innerrow" style="min-height:350px;max-height:600px">
				<div class="col-md-{{formatNumber(12/rows.elements.length)}} coldiv" style="padding:5px;" dropzone="copy" data-ng-repeat="element in rows.elements" id="{{element.title}}">
					<div class="headerdiv container-fluid" style="height:10%">
						<div style="float:left">
							{{element.title}}
						</div>
						<div class="dropdown" style="display:inline;float:right;" data-ng-if="reportOpenType == 'openreport'">
							<img class="headermenu dropdown-toggle" src="images/setting_small.png" data-toggle="dropdown"></img>
							<ul class="dropdown-menu">
								<li><a data-ng-click="loadElement(report.title,element.title,'pie')">Pie</a></li>
								<li><a data-ng-click="loadElement(report.title,element.title,'line')">Line</a></li>
								<li><a data-ng-click="loadElement(report.title,element.title,'table')">Table</a></li>
								<li><a data-ng-click="loadElement(report.title,element.title,'bar')">Bar</a></li>
								<li><a data-ng-click="loadElement(report.title,element.title,'barstack')">Bar Stacked</a></li>
								<li><a data-ng-click="loadElement(report.title,element.title,'column')">Column</a></li>
								<li><a data-ng-click="loadElement(report.title,element.title,'columnstack')">Column Stacked</a></li>
							</ul>
						</div>
						<div style="float:right !important;padding:0px;" data-ng-if="reportOpenType == 'openreport'">
							<a class="headermenu" data-ng-click="loadElement(report.title,element.title,element.chartType)"><img src="images/refresh_small.png"></img></a>
						</div>
						<div style="float:right !important;padding:0px;%" data-ng-if="reportOpenType == 'editreport'">
							<a class="headermenu" data-ng-click="editElement(element)"><img src="images/edit_small.png"></img></a>
						</div>									<!-- ="editElement -->
						<div style="float:right !important;padding:0px;" data-ng-if="reportOpenType == 'editreport'">
							<a class="headermenu" data-ng-click="deleteColumn($parent.$parent.$index,$parent.$index)"><img src="images/sign-delete.png"></img></a>
						</div>										
					</div>
					<div style="height:90%">
						<div data-ng-init="loadElement(report.title,element.title,element.chartType)" id="{{element.title}}_cell" style="height:100%">
						</div>
					</div>
				</div>
			</div>
			<div style="float:right" data-ng-if="reportOpenType == 'editreport'">
				<button style="background:#337ab7;color:#fff;padding:5px" data-ng-click="addColumn($index)">Add Column</button>
			</div>
		</div>
		<div style="float:right" data-ng-if="reportOpenType == 'editreport'">
			<button style="background:#337ab7;color:#fff;padding:5px 15px 5px 15px" data-ng-click="addRow()">Add Row</button>
		</div>
	</div>	
</div>
</div>
</body>
</html>