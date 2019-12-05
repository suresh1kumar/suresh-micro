<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.company.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
	  	<meta name="viewport" content="width=device-width, initial-scale=1">
	  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- dataTable - start -->
		<link href='https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css' rel='stylesheet'>
	  	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		
		<!-- dataTable - end
		Export Buttons - start -->
		<link href='https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css' rel='stylesheet'>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
 
</head>
<body>
	<%@ include file="header.jsp" %>
 <p><br></p> 
 <div class="container">
 <h2 style="margin-bottom: 20px">New Plan Add>></h2>
  <form action="" method="POST">
  <!-- ============= -->
  		<fieldset class="well">
	    			<legend class="well-legend"></legend>
					<div class="row">
						<div class="col-sm-6">
							<label>Operator:</label>
                               <select name="bsnlid" id="bsnlid" class="form-control" >   <!-- style="width: 158px;" -->
                               <option>BSNL</option>
	                        </select> 
						</div>
						<div class="col-sm-6">
						<label>Circle:</label>
                           <select id="region" name="region" class="form-control" required>  
			                   <!-- <option value="-1" >- State -</option>-->
			                   <option>1</option>
	                      </select>
						</div>
					</div>
				</fieldset>
					
				
				<fieldset class="well">
	    			<legend class="well-legend"></legend>
					<div class="row">
						<div class="col-sm-6">
							 <label>TYPE:</label>
               <select name="type" id="type" class="form-control">  <!--  style="width: 158px;" -->
				                <option>All</option>
				                <option>RECHARGE</option>
				                <option>STV</option>
				                <option>TOPUP</option>
				                <option>FRC</option>
				                <option>DATA</option>
				                <option>SPECIAL</option>
			               </select>
						</div>
						<div class="col-sm-6">
						<label>Country:</label>
              <select name="country" id="country" class="form-control">  <!-- style="width: 158px;" -->
                  <option>IND</option>
	          </select>
						</div>
					</div>
				</fieldset>	
  
  
             <fieldset class="well">
	    			<legend class="well-legend"></legend>
					<div class="row">
						<div class="col-sm-6">
							<label>Denomination:</label>
                            <!--  <input type="text" class="form-control" name="nm" placeholder="your name"  required/> -->
                            <input type="text" class="form-control" name="denomination" placeholder="Input Denomination[Number<8]" required/>
						</div>
						
						<div class="col-sm-6">
						<label>Talkvalue:</label>
                         <input type="text" class="form-control" name="talkvalue" placeholder="Input Denomination[Number<8]" required/>
						</div>
					</div>
				</fieldset>	
				
				
				
				 <fieldset class="well">
	    			<legend class="well-legend"></legend>
					<div class="row">
						<div class="col-sm-6">
							<label>Validity:</label>
                            <input type="text" class="form-control" name="validity" placeholder="Input Denomination[Number<8]" required/>
                          </div>
						
						<div class="col-sm-6">
						<label>Description:</label>
                            <input type="text" class="form-control" name="description" placeholder="Input Denomination[Number<8]" required/>
                          </div>
					</div>
				</fieldset>	
				
				<fieldset class="well">
	    			<legend class="well-legend"></legend>
					<div class="row">
						<div class="col-sm-6">
							 <label>From Date:</label>
                             <input type="text" class="form-control" id="fromDate" name="fromDate"  placeholder="FromDate" required/>
                         </div>
						
						<div class="col-sm-6">
						<label>To Date:</label>
                           <input type="text" class="form-control" id="toDate" name="toDate"  placeholder="ToDate" required/>
                          </div>
					</div>
				</fieldset>	
				<br>
				
				<div class="row">
					<div class="col-sm-6 ">
						<!-- <button type="button" class="btn btn-info btn-block" onclick="submitForm()">Submit</button> -->
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
					<div class="col-sm-6 ">
						<a href="planUpdateview.jsp" class="btn btn-default">Back</a>
					</div>
				</div>
				
  <!-- -=============== -->
  			<%-- <div class="form-group row">
  			<!-- <div class="form-group row"> -->
         <label>BSNL:</label>
               <select name="bsnlid" id="bsnlid" class="form-control" >   <!-- style="width: 158px;" -->
         <option>BSNL</option>
	    </select>
         </div>
         
         <div class="form-group">
         <label>Circle:</label>
               <select id="region" name="region" class="form-control" required>  
			 <!-- <option value="-1" >- State -</option>-->
			 <option>1</option>
	     </select>
         </div>
         
		<div class="form-group">
           <label>Denomination:</label>
              <!--  <input type="text" class="form-control" name="nm" placeholder="your name"  required/> -->
               <input type="text" class="form-control" name="denomination" placeholder="Input Denomination[Number<8]" required/>
         </div>
         
         <div class="form-group">
         <label>TYPE:</label>
               <select name="type" id="type" class="form-control">  <!--  style="width: 158px;" -->
				                <option>All</option>
				                <option>RECHARGE</option>
				                <option>STV</option>
				                <option>TOPUP</option>
				                <option>FRC</option>
				                <option>DATA</option>
				                <option>SPECIAL</option>
			               </select>
         </div>
         <div class="form-group">
         <label>Talkvalue:</label>
               <input type="text" class="form-control" name="talkvalue" placeholder="Input Denomination[Number<8]" required/>
         </div>
         
         <div class="form-group">
         <label>Validity:</label>
               <input type="text" class="form-control" name="validity" placeholder="Input Denomination[Number<8]" required/>
         </div>
         
         <div class="form-group">
         <label>Description:</label>
               <input type="text" class="form-control" name="description" placeholder="Input Denomination[Number<8]" required/>
         </div>
         
         <div class="form-group">
         <label>Country:</label>
              <select name="country" id="country" class="form-control">  <!-- style="width: 158px;" -->
                  <option>IND</option>
	          </select>
         </div>
         
         <div class="form-group">
         <label>From Date:</label>
               <input type="text" class="form-control" id="fromDate" name="fromDate"  placeholder="FromDate" required/>
         </div>
         
         <div class="form-group">
            <label>To Date:</label>
               <input type="text" class="form-control" id="toDate" name="toDate"  placeholder="ToDate" required/>
         </div>
         <button type="submit" class="btn btn-primary">Submit</button>
	      <a href="planUpdateview.jsp" class="btn btn-default">Back</a> --%>
  
  </form>
</div>
<%@ include file="footer.jsp" %>


<script type="text/javascript">
			$(function() {
				$("#fromDate").datepicker(
				{
					//dateFormat : "dd-mm-yy",
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
</body>
</html>

<% 
String bsnlid=request.getParameter("bsnlid");
String region=request.getParameter("region");
String denomination=request.getParameter("denomination");
String type=request.getParameter("type");
String talkvalue=request.getParameter("talkvalue");
String validity=request.getParameter("validity");
String description=request.getParameter("description");
String country=request.getParameter("country");
String fromDate=request.getParameter("fromDate");
String toDate=request.getParameter("toDate");
System.out.println("***********************************Getting value in paranetter New Record Added Page>>***********************************");
System.out.println("    OPERATOR CIRCLE  DENOMINATION   TYPE   TALKVALUE   VALIDITY  DESCRIPTION  COUNTRY  START_DATE  END_DATE");
System.out.println("============================================================================================================================================");
System.out.println("\t"+bsnlid+"\t"+region+"\t"+denomination+"\t"+type+"\t"+talkvalue+"\t"+validity+"\t"+description+"\t"+country+"\t"+fromDate+"\t"+toDate);

/* String host = "jdbc:mysql://localhost:3306/surajschema"; 
 String username = "root"; 
 String password = "root"; */
Connection con=null;
PreparedStatement ps=null;
//Class.forName("com.mysql.jdbc.Driver"); 

if(bsnlid!=null && denomination!=null && type!=null && talkvalue!=null 
    && validity!=null && description!=null && country!=null && fromDate!=null && toDate!=null){
	con=DBConnection.createConnection();
	//con = DriverManager.getConnection(host, username, password);
	String data="insert into companyrecord(OPERATOR,CIRCLE,DENOMINATION,TYPE,TALKVALUE,VALIDITY,DESCRIPTION,COUNTRY,START_DATE,END_DATE) values(?,?,?,?,?,?,?,?,?,?)";
    ps=con.prepareStatement(data);
    ps.setString(1,bsnlid);
    ps.setString(2,region);
    ps.setString(3,denomination);
    ps.setString(4,type);
    ps.setString(5,talkvalue);
    ps.setString(6,validity);
    ps.setString(7,description);
    ps.setString(8,country);
    ps.setString(9,fromDate);
    ps.setString(10,toDate);
    ps.executeUpdate();
    System.out.println("************************<<New Plan Record Added>>************************");
 response.sendRedirect("planUpdateview.jsp");
 }

%>