<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Servlet pagination using data tables</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
	  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- dataTable - start -->
		<link href='https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css' rel='stylesheet'>
	  	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		
		<!-- dataTable - end -->
		<!-- Export Buttons - start -->
		<link href='https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css' rel='stylesheet'>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>


<script type="text/javascript">

$(document).ready(function() {
     
    $("#example").dataTable( {
        "bProcessing": false,
        "bServerSide": false,
        "sort": "position",
        "sAjaxSource": "PaginationServlet",
        "aoColumns": [
            { "mData": "name" },
            { "mData": "email" },
            { "mData": "mobile" },
            { "mData": "address" },
            { "mData": "fromDate" },
            { "mData": "tdDate" },
            { "mData": "salary" ,
            	mRender:function(data,type,row){
	            	   return '&#8377;'+data}	
            },
            
	        ]  ,
	        
	        "bDestroy": true,
            dom: 'Bfrtip',
	        buttons: [
	        	 'copy', 'csv', 'excel', 'pdf', 'print'
	        ]  
    } );

} );

</script>
<script type="text/javascript">
			$(function() {
				$("#fromDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					maxDate : -1,
					changeMonth: true,
					changeYear: true,
					onClose : function(selectedDate) {
						$("#toDate").datepicker("option", "minDate", selectedDate);
					}
				});
				$("#toDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					minDate : 0,
					maxDate : -1,
					changeMonth: true,
					changeYear: true,
					onClose : function(selectedDate) {
						$("#fromDate").datepicker("option", "maxDate", selectedDate);
					}
				});
			});
		</script>
</head>
<body>
<!-- <form action=""> -->
<div class="container " >
<h2 style="margin-bottom: 20px">Student Demo Report</h2>
               <fieldset class="well">
	    			<legend class="well-legend">Student Name</legend>
					<div class="row">
						<div class="col-sm-12">
							<input type="text" id="name"  name="name" class="from-control readonly" placeholder=" enter name"  > 
						</div>
						
					</div>
				</fieldset>	
           <fieldset class="well">
	    			<legend class="well-legend">Transaction Period</legend>
					<div class="row">
						<div class="col-sm-6">
							<input type="text" id="fromDate"  name="fromDate" class="from-control readonly" placeholder="From Date" required > 
						</div>
						<div class="col-sm-6">
						<input type="text" id="toDate"  name="toDate" class="from-control readonly" placeholder="To Date" required > 
						</div>
					</div>
				</fieldset>	
				<div class="row">
					<div class="col-sm-6 ">
						<button type="button" class="btn btn-info btn-block" onclick="submitForm()">Submit</button>
					</div>
					<div class="col-sm-6 ">
						<button type="reset" class="btn btn-warning btn-block">Reset</button>
					</div>
				</div>
<!-- ============================================================== -->
	 <br><br>
				<div id=detailedTableDiv style="padding-top: 15px; display: none;">
					<!-- <table id="detailedTable" class="display" cellspacing="0" width="100%" style="  "> -->
					<table id="detailedTable" class="display" style="width:100%">
						<thead>
					    	<tr>
					            <th>OPERATOR</th>
                                <th>CIRCLE</th>
                                <th>DENOMI</th>
                                <th>TYPE</th>
                                <th>TALKVALUE</th>
                                <th>VALIDITY</th>
                                <th>DESCRIPTION</th>
                                <th>COUNTRY</th>
                                <th>From_Date</th>
                                <th>To_Date</th>
					    	</tr>
						</thead>
					</table>
				</div>	  
		</div>
		<script type="text/javascript">
		/* SNO,OPERATOR,CIRCLE,DENOMINATION,TYPE,TALKVALUE,VALIDITY,DESCRIPTION,COUNTRY ,START_DATE,END_DATE */
	        function showDetailedTable(data) {
	        	/* $('#summaryTableDiv').hide(); */
				$('#detailedTableDiv').show();
	            var table = $('#detailedTable').DataTable({
	                "bAutoWidth" : false,
	                "aaData" : data,
	                "columns" : [ 
	                	 {
	                    "data" : "OPERATOR"
	                }, {
	                    "data" : "CIRCLE"
	                }, {
	                    "data" : "DENOMINATION"
	                }, {
	                    "data" : "TYPE"
	                }, {
	                    "data" : "TALKVALUE"
	                } , {
	                    "data" : "VALIDITY"
	                }, {
	                    "data" : "DESCRIPTION"
	                },{
	                    "data" : "COUNTRY"
	                },{
	                    "data" : "START_DATE"
	                },{
	                    "data" : "END_DATE"
	                } 
	                ], 
	                "bDestroy": true,
	                dom: 'Bfrtip',
			        buttons: [
			             'csv', 'excel', 'print'
			        ]/* ,
			        lengthMenu: [
			            [ 10, 25, 50, -1 ],
			            [ '10 rows', '25 rows', '50 rows', 'Show all' ]
			        ],
			        buttons: [
			            'pageLength'
			        ] */
	            })
	        }

			function submitForm() {
				var isValid = true;//document.forms['frcReport'].checkValidity();
				
				var name = $('#name').val();
				var fromDate = $('#fromDate').val();
				var toDate = $('#toDate').val();
				if(fromDate == ""){
					isValid = false;
					$("#fromDate").focus();
					return false;
				}
				if(toDate == ""){
					isValid = false;
					$("#toDate").focus();
					return false;
				}
				/* if(region == null){
					isValid = false;
					$("#region").focus();
					return false;
				} */
				/*if(city == ""){
					isValid = false;
					$("#city").focus();
					return false;
				}*/
				console.log(name +"~"+fromDate+"~"+toDate);
				alert(name +"~"+fromDate+"~"+toDate);
				console.log("isValid :: "+ isValid);
				alert("isvalied111 ::"+isValid);
				if(isValid){
					$.ajax({
						url : 'PaginationServlet',
						type : 'POST',
						data : {
							"name" 	: name,
							"dateFrom"	: fromDate,
							"dateTo"	: toDate
						},
						success : function(response){
							//var resp = JSON.parse(response);
							//console.log("Summary ::"+response.name);
							alert("success block")
							showDetailedTable(response.records);
						},
						error : function(response){
							//var resp = JSON.parse(response);
							alert("There was some error" + response);
							console.log(response);
						}
					});
				}
				else
					return false;
			}
		</script>
</body>
</html>