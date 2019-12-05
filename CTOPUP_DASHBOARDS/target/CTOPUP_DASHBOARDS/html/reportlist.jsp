<%@page import="java.io.File"%>
<%@page import="com.zonel.ZonelInfo"%>
<%@ page import="com.zonel.StringWrapper"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>


<%

String zonesId= (String)session.getAttribute("zoneId");
String circlesId = (String)session.getAttribute("regionId");
String citysId = (String)session.getAttribute("cityId");
System.out.println("main 22222jsp page value printed zonename getSession ::"+zonesId);
System.out.println("main2222 jsp page value printed circlename getSession ::"+circlesId);
System.out.println("main2222 jsp page value printed cityname111 getSession ::"+citysId);



/* String zonename = (String)session.getAttribute("zonename"); 
String circlename = (String)session.getAttribute("circlename");
String cityname = (String)session.getAttribute("citynames"); 

System.out.println(" zonename report list Page getSession ==::"+zonename);
System.out.println(" value printed circlename report list Page getSession == ::"+circlename);
System.out.println(" value printed cityname report list Page getSession == ::"+cityname); */


String userdbName = (String)request.getSession().getAttribute("userdbName");
String userdbPass = (String)request.getSession().getAttribute("passwords");
System.out.println("getattribute value printed userdbName getSession::"+userdbName);
System.out.println("getattribute value printed userdbPass getSession::"+userdbPass);
%>
<body >
<!-- <div class="container-fluid"> -->
<div class="">
<%if(userdbName.equalsIgnoreCase("admin")) {%>
         		<%
					if (userdbName.equalsIgnoreCase("admin") && userdbPass.equalsIgnoreCase("admin")) {
						System.out.println("Role of adminAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
					%>
					<fieldset class="well">
	             		 <legend class="well-legend"></legend>
			             <div class="row">
			             <div class="col-sm-6 centered">
				      	 <label ></label>
				       		 <h2 class="text-primary">Report(s) List:</h2>
			      	 	 </div><p>
			               <div class="col-sm-4 centered" >
				            <label ></label>
				              Search <input type="text" data-ng-model="title" class="form-control form-control-sm form-rounded" placeholder="search report... "/>
			               </div><p>
			      	 	<p>
					       <div class="col-sm-2 centered">
						      <label ></label>
						      <p class="text-primary">Delete Report(s):
						        <button class="form-control form-rounded btn btn-success pull-left" data-ng-click="deleteReports()"><span class="glyphicon glyphicon-trash"></span> Delete 
			        			</button>
					       </div>
					   </div>
			       </fieldset>
	

					<!-- <div class="topdiv_adminpages"> -->
					<div>
						<table class="w3-table w3-striped w3-border displayTable" >
							<tr class="w3-red">
								<th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Delete</th>
								<th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Edit</th>
								<th class="widecolmaxwidth">Report Name</th>
								<th class="widecolmaxwidth">Report Description</th>
								<!-- <th class="widecolmaxwidth">Aurthor</th> -->
								<th class="widecolmaxwidth">Creation Date</th>
								<th class="widecolmaxwidth">Modified Date</th>
							</tr>
							<tr data-ng-repeat="report in reports | filter:title">
								<td style="" data-ng-if="userRole == 'admin' || reportMode == 'personal'"><input style="margin-left:34%;" data-ng-model="report.isDeleted" class="checkbox" type="checkbox"></input></td>
								<td style="text-align: center;" data-ng-if="userRole == 'admin' || reportMode == 'personal'">
									<a ui-sref="openreport({title: report.title,mode: reportMode,type: 'editreport'})">
										<span class="glyphicon glyphicon-edit"></span>
									</a>
								</td>
								<td class="widecolmaxwidth"><a ui-sref="openreport({title: report.title,mode: reportMode,type: 'openreport'})">{{report.title}}</td>
								<td class="widecolmaxwidth">{{report.description}}</td>
								<!-- <td class="widecolmaxwidth">{{report.aurthor}}</td> -->
								<td class="widecolmaxwidth">{{report.creationDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td>
								<td class="widecolmaxwidth">{{report.modifiedDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td>
							</tr>
					 </table>
				 </div>
					<%} %>
				
<!-- 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
		<%}else{ %>
				<%
					if ((zonesId != null) && (!zonesId.equalsIgnoreCase("")) && (circlesId != null) && (!circlesId.equalsIgnoreCase("")) && citysId.equals("")) {
						System.out.println("Circle Wise-report list .......");
				%>
				<div class="w3-container">
				<div class="row">
			         <div class="cpl-md-4">
			              <h3 style="color:green">Report(s) List >>> </h3>
			         </div>
			         <div class="cpl-md-4">
			               <input type="text" data-ng-model="title" class="form-control form-control-sm form-rounded" placeholder="search report... "/>
			         </div>
			         <div class="cpl-md-4">
			             <!--  <button class="form-control form-rounded btn btn-success pull-left" data-ng-click="deleteReports()">Delete Report(s)</button> -->
			         </div>
			     </div> 
				<br>

			<div class="topdiv_adminpages">
				<table class="w3-table w3-striped w3-border displayTable" >
					<tr class="w3-red">
						<!-- <th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Delete</th>
						<th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Edit</th> -->
						<th class="widecolmaxwidth">Report Name</th>
						<th class="widecolmaxwidth">Report Description</th>
						<!-- <th class="widecolmaxwidth">Aurthor</th> -->
						<th class="widecolmaxwidth">Creation Date</th>
						<!-- <th class="widecolmaxwidth">Modified Date</th> -->
					</tr>
					<tr data-ng-repeat="report in reports | filter:title">
						<!-- <td style="" data-ng-if="userRole == 'admin' || reportMode == 'personal'"><input style="margin-left:34%;" data-ng-model="report.isDeleted" class="checkbox" type="checkbox"></input></td>
						<td style="text-align: center;" data-ng-if="userRole == 'admin' || reportMode == 'personal'">
							<a ui-sref="openreport({title: report.title,mode: reportMode,type: 'editreport'})">
								<span class="glyphicon glyphicon-edit"></span>
							</a>
						</td> -->
						<td class="widecolmaxwidth"><a ui-sref="openreport({title: report.title,mode: reportMode,type: 'openreport'})">{{report.title}}</td>
						<td class="widecolmaxwidth">{{report.description}}</td>
						<!-- <td class="widecolmaxwidth">{{report.aurthor}}</td> -->
						<td class="widecolmaxwidth">{{report.creationDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td>
						<!-- <td class="widecolmaxwidth">{{report.modifiedDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td> -->
					</tr>
				</table>
			</div>
			</div>
			<%
				}else if ((zonesId != null) && (!zonesId.equalsIgnoreCase("")) && circlesId.equals("") && citysId.equals("")) {
					System.out.println("Zone Wise -report list......");
			%>
				
				<!-- <div class="container-fluid"> -->
				<fieldset class="well">
	              <legend class="well-legend"></legend>
		             <div class="row">
		             <div class="col-sm-6 centered">
			        <label ></label>
			        <h2 class="text-primary">Report(s) List:</h2>
		      	 </div><p>
		               <div class="col-sm-4 centered" >
			            <label ></label>
			              Search <input type="text" data-ng-model="title" class="form-control form-control-sm form-rounded" placeholder="search report... "/>
		               </div><p>
		             
		      	 	<p>
				       <div class="col-sm-2 centered">
					      <label ></label>
					     <!--  <p class="text-primary">Delete Report(s):
					        <button class="form-control form-rounded btn btn-success pull-left" data-ng-click="deleteReports()"><span class="glyphicon glyphicon-trash"></span> Delete 
		        			</button> -->
				       </div>
				   </div>
			     </fieldset>

				<!-- <div class="topdiv_adminpages"> -->
				<div>
					<table class="w3-table w3-striped w3-border displayTable" >
						<tr class="w3-red">
							<!-- <th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Delete</th>
							<th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Edit</th> -->
							<th class="widecolmaxwidth">Report Name</th>
							<th class="widecolmaxwidth">Report Description</th>
							<!-- <th class="widecolmaxwidth">Aurthor</th> -->
							<th class="widecolmaxwidth">Creation Date</th>
							<!-- <th class="widecolmaxwidth">Modified Date</th> -->
						</tr>
						<tr data-ng-repeat="report in reports | filter:title">
							<!-- <td style="" data-ng-if="userRole == 'admin' || reportMode == 'personal'"><input style="margin-left:34%;" data-ng-model="report.isDeleted" class="checkbox" type="checkbox"></input></td>
							<td style="text-align: center;" data-ng-if="userRole == 'admin' || reportMode == 'personal'">
								<a ui-sref="openreport({title: report.title,mode: reportMode,type: 'editreport'})">
									<span class="glyphicon glyphicon-edit"></span>
								</a>
							</td> -->
							<td class="widecolmaxwidth"><a ui-sref="openreport({title: report.title,mode: reportMode,type: 'openreport'})">{{report.title}}</td>
							<td class="widecolmaxwidth">{{report.description}}</td>
							<!-- <td class="widecolmaxwidth">{{report.aurthor}}</td> -->
							<td class="widecolmaxwidth">{{report.creationDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td>
							<!-- <td class="widecolmaxwidth">{{report.modifiedDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td> -->
						</tr>
					</table>
				</div>
				
				<%
					}else if ((zonesId != null) && (!zonesId.equalsIgnoreCase("")) && (circlesId != null) && (!circlesId.equalsIgnoreCase("")) && (citysId != null) && (!citysId.equalsIgnoreCase(""))) { 
						System.out.println("City Wise-report list.......");
				%>
				
				<div class="w3-container">
				<div class="row">
			         <div class="cpl-md-4">
			              <h3 style="color:green">Report(s) List >>> </h3>
			         </div>
			         <div class="cpl-md-4">
			               <input type="text" data-ng-model="title" class="form-control form-control-sm form-rounded" placeholder="search report... "/>
			         </div>
			     <div class="cpl-md-4">
			              <!-- <button class="form-control form-rounded btn btn-success pull-left" data-ng-click="deleteReports()">Delete Reportpw(s)</button> -->
			         </div>
			        </div> 
				<br>

				<div class="topdiv_adminpages">
					<table class="w3-table w3-striped w3-border displayTable" >
						<tr class="w3-red">
							<!-- <th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Delete</th>
							<th class="widecolmaxwidth" data-ng-if="userRole == 'admin' || reportMode == 'personal'">Edit</th> -->
							<th class="widecolmaxwidth">Report Name</th>
							<th class="widecolmaxwidth">Report Description</th>
							<!-- <th class="widecolmaxwidth">Aurthor</th> -->
							<th class="widecolmaxwidth">Creation Date</th>
							<!-- <th class="widecolmaxwidth">Modified Date</th> -->
						</tr>
						<tr data-ng-repeat="report in reports | filter:title">
							<!-- <td style="" data-ng-if="userRole == 'admin' || reportMode == 'personal'"><input style="margin-left:34%;" data-ng-model="report.isDeleted" class="checkbox" type="checkbox"></input></td>
							<td style="text-align: center;" data-ng-if="userRole == 'admin' || reportMode == 'personal'">
								<a ui-sref="openreport({title: report.title,mode: reportMode,type: 'editreport'})">
									<span class="glyphicon glyphicon-edit"></span>
								</a>
							</td> -->
							<td class="widecolmaxwidth"><a ui-sref="openreport({title: report.title,mode: reportMode,type: 'openreport'})">{{report.title}}</td>
							<td class="widecolmaxwidth">{{report.description}}</td>
							<!-- <td class="widecolmaxwidth">{{report.aurthor}}</td> -->
							<td class="widecolmaxwidth">{{report.creationDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td>
							<!-- <td class="widecolmaxwidth">{{report.modifiedDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td> -->
						</tr>
					</table>
				</div>
				</div>
				
				<%} %>
				<%} %>
				</div>
</body>
</html>