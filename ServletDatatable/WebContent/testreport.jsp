<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="Mvochercss.css"></link>
    	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  	 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<style type="text/css">
  .form-rounded {
border-radius: 1rem;
}
.btn-block{
border-radius: 1rem;
}
  #containerFORM {
   padding-right: 20px;
   padding-left: 20px;
   margin-right: auto;
   margin-left: auto;
   max-width: 800px;
   overflow:hidden;
   min-height:0px;
}
select {
  text-align: center;
  text-align-last: center;
}
option {
  text-align: left;
}
.date1 {
    text-align: center;
    }
  </style>
  <style>
	.center{
	    position:absolute;
	    display:block;
	    left:35%;
	    top:35%;
	}
	</style>
	<style type="text/css">
	h3 {color:red;}
	
.jumbotron {
  background: url("https://s3.amazonaws.com/codecademy-content/projects/adoptly/bg.jpg"); 
  background-size: 100%;
  //text-align: center;
  height: auto;
}
/* body{
background: url("https://images1.livehindustan.com/uploadimage/library/2018/02/05/16_9/16_9_1/BSNL_Free_Sunday_Calls_extended_for_3_months_1517831295.jpg");
  background-size: 100%;
  //text-align: center;
  height: auto;
} */
}
	</style>
</head>

<%
String apply = request.getParameter("apply");
String SearchOn = request.getParameter("SearchOn");
String StatusOn = request.getParameter("StatusOn");
String FilterOn = request.getParameter("FilterOn");
String ByType = request.getParameter("ByType");
System.out.println("1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"+ByType);
String DealerType = request.getParameter("DealerType");
String strFromDate = request.getParameter("strFromDate");
String strToDate = request.getParameter("strToDate");
String msisdn = request.getParameter("msisdn");
String RechargeVoucher = request.getParameter("RechargeVoucher");
String TopUp = request.getParameter("TopUp");
String strVName3 = request.getParameter("vendername3");
String strregNam = request.getParameter("strregNam");
String strcityNam = request.getParameter("strcityNam");
String pg = request.getParameter("page");
String pagination = request.getParameter("pagination");
System.out.println(">>>> SalesReport1.jsp >> pagination >>> " + pagination);
String dealerWisePagination = request.getParameter("dealerWisePagination");

String zoneId="1";
String regionId="0";
String cityId="0";
String zoneFname="South Zone";
String regionFname="";
String cityFname="";
%>
<body>
<div class="w3-container w3-teal">
  <h2>Reports>>Sales Report</h2>
</div>
<br>
 <div class = "w3-row w3-border" id="containerFORM">
 <br>
<form name="Distribution" class="w3-container">
<div class="container">
		  <div class="jumbotron">
  <%
		if((!cityId.equals("0")) && (!zoneId.equals("0")) &&(!regionId.equals("0"))){
			%>
			<%System.out.println("zone  id info====================::1,1,1"); %>
			         
			         <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name=regionName>
							  <OPTION value="<%=zoneFname%>"><%=zoneFname%></OPTION>
							</select>
						</div>
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name=regionName>
							  <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
							</select>
						</div>
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList onClick="selectCircle()" onChange="regionCode()" name=cityName>
							  <OPTION value="<%=cityFname%>"><%=cityFname%></OPTION>
							</select>
						</div>
		         </div><br>
			         <%}else if(cityId.equals("0") && (!zoneId.equals("numbers0")) &&(!regionId.equals("0"))){ %>
			    		<%System.out.println("zone  id info====================::1,1,0"); %>
			    			<div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name=regionName>
							  <OPTION value="<%=zoneFname%>"><%=zoneFname%></OPTION>
							</select>
						</div>
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name=regionName>
							  <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
							</select>
						</div>
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList onChange="regionCode()" name=cityName>
							<option value=""> --city-- </option>
							   <option value=""> All </option>
                               <%
          						  
              				   %>
                				  <OPTION value="<%=cityFname%>"selected><%=cityFname%></OPTION>
            				<% %>
            						 <OPTION value="<%=cityFname%>"><%=cityFname%></OPTION>
               				 <% %>
							</select>
						</div>
		         </div>
		    		<br>
			    
					    <%}else if(cityId.equals("0") && (regionId.equals("0")) &&(!zoneId.equals("0"))){ %>
							<%System.out.println("zone  id info====================::1,0,0"); %>
							<div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name=regionName>
							  <OPTION value="<%=zoneFname%>"><%=zoneFname%></OPTION>
							</select>
						</div>
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode2()" name=regionName>
							<option value="">--circle--</option>
							  <option value=""> All </option>
                               <%
          							   
             					    %>
               						   <OPTION value="<%=regionFname%>"selected><%=regionFname%></OPTION>
            					<% %>

           						  <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
             				   <% %>
							</select>
						</div>
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList onChange="cityCode()" name=cityName>
							<option value=""> --city-- </option>
							 <option value=""> All </option>
                               <%
              					   %>
                				  <OPTION value="<%=cityFname%>"selected><%=cityFname%></OPTION>
            				<% %>
            					 <OPTION value="<%=cityFname%>"><%=cityFname%></OPTION>
             				   <% %>
							</select>
						</div>
		         	</div>
					 <%} %>
					   <br>
					   
					   <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
						   <select class="w3-select w3-hover-blue form-rounded" name="RechargeVoucher" id="RechargeVoucher" >
                    			<option value="">recharge voucher</option>
                    			<option value="">All</option>
                    			<%
			                      
			                    %>
			                    <option value="" 
			                    <% 
			                    
			          					%> selected
			                      <%
			              				
			         				%>>
                      				
                    			</option>
			                    <%
			                      
			                      
			                    %>
			                  </select>
							
						</div>
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" name="TopUp" id="TopUp" >
			                    <option value="">Top Up</option>
			                    <option value="">All</option>
			                     <%
			                     
			                    %>
			                    <option value="" 
			                    <%          
			                    
			         				 %> selected <%
			              			
			         			 %>>
                     		 
                   		 </option>
                    	<%
                     	 
                      		
                    	%>
					</select>
				</div>
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList onClick="Dealer3()" onselect="Dealer3()" name="SearchOn">
							  <%
								if (SearchOn != null && !SearchOn.equalsIgnoreCase("") && !SearchOn.equalsIgnoreCase("null")) {
									if (SearchOn.equalsIgnoreCase("SalesSummary")) {
							  %>
							  		<OPTION value="">--search on--</OPTION>
									<OPTION value="SalesSummary" selected>sales summary</OPTION>
									<OPTION value="DealerWiseSalesSummary">dealer wise sales summary</OPTION>
									<OPTION value="DetailedSalesReport">detailed dales report</OPTION>
								<%
								} if (SearchOn.equalsIgnoreCase("DealerWiseSalesSummary")) {
								%>
									<OPTION value="">--search On--</OPTION>
									<OPTION value="SalesSummary" >sales summary</OPTION>
									<OPTION value="DealerWiseSalesSummary" selected>dealer wise sales summary</OPTION>
									<OPTION value="DetailedSalesReport">detailed dales report</OPTION>
								<%
								 }if (SearchOn.equalsIgnoreCase("DetailedSalesReport")) {
										%>
										<OPTION value="">--search On--</OPTION>
										<OPTION value="SalesSummary" selected>sales summary</OPTION>
									<OPTION value="DealerWiseSalesSummary">dealer wise sales summary</OPTION>
									<OPTION value="DetailedSalesReport">detailed dales report</OPTION>
									<%
									 }
							} else {
								%>
								   <OPTION value="">--search On--</OPTION>
								   <OPTION value="SalesSummary">sales summary</OPTION>
									<OPTION value="DealerWiseSalesSummary">dealer wise sales summary</OPTION>
									<OPTION value="DetailedSalesReport">detailed dales report</OPTION>
							<%
								}
							%>
							</select>
						</div>
		         </div><br>
		         
		         <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name="FilterOn">
							   <%
								if (FilterOn != null && !FilterOn.equalsIgnoreCase("") && !FilterOn.equalsIgnoreCase("null")) {
									if (FilterOn.equalsIgnoreCase("NGN")) {
							  %>
							  		<OPTION value="">--filter on--</OPTION>
									<OPTION value="AllDealers" selected>AllDealers</OPTION>
									<OPTION value="ChooseDealer">ChooseDealer</OPTION>
								<%
								} if (FilterOn.equalsIgnoreCase("WIFI-RP")) {
								%>
									<OPTION value="">--filter on--</OPTION>
									<OPTION value="AllDealers">AllDealers</OPTION>
									<OPTION value="ChooseDealer" selected>ChooseDealer</OPTION>
								<%
								 }
							} else {
								%>
								   <OPTION value="">--filter on--</OPTION>
								   <OPTION value="AllDealers">AllDealers</OPTION>
									<OPTION value="ChooseDealer">ChooseDealer</OPTION>
							<%
								}
							%>
							</select>
						</div>
						<div class="w3-container w3-third">
							<input TYPE="text" class="w3-select w3-hover-blue form-rounded" value="<%if(msisdn!=null){%><%=msisdn %><%}%>" name="msisdn" id="msisdn"  />
						</div>
						
						<div class="w3-container w3-third">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList onChange="regionCode()" name="ByType">
							  <%
								if (ByType != null && !ByType.equalsIgnoreCase("") && !ByType.equalsIgnoreCase("null")) {
									if (ByType.equalsIgnoreCase("AllByType")) {
							  %>
							  		<OPTION value="">--by type--</OPTION>
									<OPTION value="AllByType" selected>AllByType</OPTION>
									<OPTION value="GSM">GSM</OPTION>
									<OPTION value="PORTAL">PORTAL</OPTION>
								<%
								} if (ByType.equalsIgnoreCase("GSM")) {
								%>
									<OPTION value="">--by type--</OPTION>
									<OPTION value="AllByType" >AllByType</OPTION>
									<OPTION value="GSM" selected>GSM</OPTION>
									<OPTION value="PORTAL">PORTAL</OPTION>
								<%
								 }if (ByType.equalsIgnoreCase("PORTAL")) {
										%>
										<OPTION value="">--by type--</OPTION>
										<OPTION value="AllByType" selected>AllByType</OPTION>
										<OPTION value="GSM">GSM</OPTION>
										<OPTION value="PORTAL">PORTAL</OPTION>
									<%
									 }
							} else {
								%>
								   	<OPTION value="">--by type--</OPTION>
								   	<OPTION value="AllByType">AllByType</OPTION>
									<OPTION value="GSM">GSM</OPTION>
									<OPTION value="PORTAL">PORTAL</OPTION>
							<%
								}
							%>
							</select>
						</div>
		         </div><br>
		         
		         
		         <div class="w3-container w3-row-padding">
						
						<div class="w3-container w3-half">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name="StatusOn">
							  <%
								if (StatusOn != null && !StatusOn.equalsIgnoreCase("") && !StatusOn.equalsIgnoreCase("null")) {
									if (StatusOn.equalsIgnoreCase("All")) {
							  %>
							  		<OPTION value="">--by status--</OPTION>
									<OPTION value="All"> All</OPTION>
									<OPTION value="Successful">Successful</OPTION>
									<OPTION value="DetailedSalesReport">detailed dales report</OPTION>
								<%
								} if (StatusOn.equalsIgnoreCase("Successful")) {
								%>
									<OPTION value="">--by status--</OPTION>
									<OPTION value="All" >All</OPTION>
									<OPTION value="Successful" selected>Successful</OPTION>
									<OPTION value="Cancelled">Cancelled</OPTION>
								<%
								 }if (StatusOn.equalsIgnoreCase("Cancelled")) {
										%>
										<OPTION value="">--by status--</OPTION>
										<OPTION value="All" selected>All</OPTION>
									<OPTION value="Successful">Successful</OPTION>
									<OPTION value="Cancelled">Cancelled</OPTION>
									<%
									 }
							} else {
								%>
								   <OPTION value="">--by status--</OPTION>
								   <OPTION value="All">All</OPTION>
									<OPTION value="Successful">Successful</OPTION>
									<OPTION value="Cancelled">Cancelled</OPTION>
							<%
								}
							%>
							</select>
						</div>
						<div class="w3-container w3-half">
							<select class="w3-select w3-hover-blue form-rounded" name="DealerType" id="DealerType" onChange="regionCode()">
							  <option value="">category</option>
                          		<option value="All">All</option>
                          		 <%
                          
                            //System.out.println(strVenderName);
                            //venderNo  =Integer.parseInt(st.nextToken());
                        %>
                        <option value="" 
                        <%          
                        
          						%> selected <%
             				 
         				%>>
                          
                        </option>
                        <%
                          
                        %>
							</select>
						</div>
		         </div><br>
		         
		         <div class="w3-container w3-row-padding">
		 			<div class="w3-container w3-half">
						<input id="fromDate" type="text" name="strFromDate"  readonly class=" w3-select w3-hover-blue form-rounded date1" placeholder="Enter From Date"
		            		<%if (strFromDate != null && !strFromDate.equals("")) {
								   if (strFromDate.equalsIgnoreCase(strFromDate)) {%>
									 value="<%=strFromDate%>" <%}
							  } else {%> value=""
										<%}%> readonly/>
					</div>
					<div class="w3-container w3-half">
						<input id="toDate" name="strToDate" type="text" readonly class=" w3-select w3-hover-blue form-rounded date1" placeholder="Enter To Date"
		            			<%if (strToDate != null && !strToDate.equals("")) {
									if (strToDate.equalsIgnoreCase(strToDate)) {%>
										value="<%=strToDate%>" <%}
								} else {%> value=""
										<%}%> readonly/>
					</div>
					
		 		</div>
		 		<br>
			 		<div class="row">
							<div class="col-sm-2 ">
					           </div>
					           <div class="col-sm-4 ">
					               <INPUT TYPE="button" value="Search" class="btn btn-info btn-block" onclick="Search()">
					           </div>
					           
					           <div class="col-sm-4 ">
						         <INPUT TYPE="button" value="Reset" class="btn btn-danger btn-block" onclick="fnReset();"> 
					          </div>
					    </div>
					    </div>
					    </div>
</form>
</div>
</body>
 <script language="javascript" src="datetimepick/datetimepicker.js" type="text/javascript"></Script>
<script>
$( function() {
$( "#fromDate" ).datepicker({
	dateFormat : "mm-dd-yy",
	changeMonth: true,                  
    changeYear: true,
	//maxDate : 0,
onSelect: function(selectedDate) {
	       
            $('#toDate').datepicker('option', 'minDate', selectedDate );
      }
       //for only 7 days data

    });
$( "#toDate" ).datepicker({
   
	dateFormat : "mm-dd-yy",
	changeMonth: true,
    changeYear: true,
	//minDate : 0,
	//maxDate : 0,
    });
} );
</script>
</html>