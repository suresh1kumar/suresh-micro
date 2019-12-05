<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-ng-app="LWR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query2Report</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="CSS/lwr.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<style type="text/css">
	/*
	    DEMO STYLE
	*/
@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

.navbar {
    padding: 15px 10px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
    perspective: 1500px;
}


#sidebar {
    min-width: 250px;
    max-width: 250px;
    background: #7386D5;
    color: #fff;
    transition: all 0.6s cubic-bezier(0.945, 0.020, 0.270, 0.665);
    transform-origin: bottom left;
}

#sidebar.active {
    margin-left: -250px;
    transform: rotateY(100deg);
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}


a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article, a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}



/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
    width: 100%;
    padding: 20px;
    min-height: 100vh;
    transition: all 0.3s;
}

#sidebarCollapse {
    width: 40px;
    height: 40px;
    background: #f5f5f5;
    cursor: pointer;
}

#sidebarCollapse span {
    width: 80%;
    height: 2px;
    margin: 0 auto;
    display: block;
    background: #555;
    transition: all 0.8s cubic-bezier(0.810, -0.330, 0.345, 1.375);
    transition-delay: 0.2s;
}

#sidebarCollapse span:first-of-type {
    transform: rotate(45deg) translate(2px, 2px);
}
#sidebarCollapse span:nth-of-type(2) {
    opacity: 0;
}
#sidebarCollapse span:last-of-type {
    transform: rotate(-45deg) translate(1px, -1px);
}


#sidebarCollapse.active span {
    transform: none;
    opacity: 1;
    margin: 5px auto;
}


/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
        transform: rotateY(90deg);
    }
    #sidebar.active {
        margin-left: 0;
        transform: none;
    }
    #sidebarCollapse span:first-of-type,
    #sidebarCollapse span:nth-of-type(2),
    #sidebarCollapse span:last-of-type {
        transform: none;
        opacity: 1;
        margin: 5px auto;
    }
    #sidebarCollapse.active span {
        margin: 0 auto;
    }
    #sidebarCollapse.active span:first-of-type {
        transform: rotate(45deg) translate(2px, 2px);
    }
    #sidebarCollapse.active span:nth-of-type(2) {
        opacity: 0;
    }
    #sidebarCollapse.active span:last-of-type {
        transform: rotate(-45deg) translate(1px, -1px);
    }

}
</style>

      
	<style type="text/css">
	#content{
	background-color:lightblue;
	}
	</style>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.css">
	<script type="text/javascript" src="JS/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>
    <script src="https://cdn.rawgit.com/angular/bower-material/master/angular-material.min.js"></script>    
	<script type="text/javascript" src="JS/angular-route.js"></script>
	<script type="text/javascript" src="JS/angular-cookies.js"></script>
	<script type="text/javascript" src="JS/angular-ui-router.js"></script>
	<script type="text/javascript" src="JS/app.js"></script>
	<script type="text/javascript" src="JS/jquery.min.js"></script>
	<script type="text/javascript" src="JS/jquery.cookie.js"></script>
	<!-- <script type="text/javascript" src="JS/lwr.js"></script> -->
	<script type="text/javascript" src="JS/ui-bootstrap-tpls.min.js"></script>
	<script type="text/javascript" src="JS/html2canvas.min.js"></script>
	<script type="text/javascript" src="JS/angular-sanitize.js"></script>
	<script type="text/javascript" src="JS/jspdf.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart','annotatedtimeline','charteditor']});
      google.charts.load('visualization', '1.0', {'packages':['table']});
	</script>
	
	<style >
	div.imag {
	border-radius: 50%;
	  content:url(http://bsnltunes.bsnlumw.com/rbtweb/live/images/bsnl_logo.png);
		}
		​
</style>
<style >
.sss{border-radius: 50%;}
</style>
	
</head>
				
				
<%

String zonesId= (String)session.getAttribute("zoneId");
String circlesId = (String)session.getAttribute("regionId");
String citysId = (String)session.getAttribute("cityId");
System.out.println("main 22222jsp page value printed zonename getSession ::"+zonesId);
System.out.println("main2222 jsp page value printed circlename getSession ::"+circlesId);
System.out.println("main2222 jsp page value printed cityname111 getSession ::"+citysId);

String zonename = (String)session.getAttribute("zonename"); 
String circlename = (String)session.getAttribute("circlename"); 
String cityname = (String)session.getAttribute("citynames"); 
String userdbName = (String)request.getSession().getAttribute("userdbName");
String userdbPass = (String)request.getSession().getAttribute("passwords");

System.out.println("getattribute value printed userdbName getSession ::"+userdbName);
System.out.println("getattribute value printed userdbPass getSession ::"+userdbPass);
System.out.println("main jsp page value printed zonename getSession ::"+zonename);
System.out.println("main jsp page value printed circlename getSession ::"+circlename);
System.out.println("main jsp page value printed cityname111 getSession ::"+cityname);

%>
<body data-ng-controller="ApplicationController">

<!-- 0000000000000000000000000000000000000000000000000 -->

		<%if(userdbName.equalsIgnoreCase("admin")){ %>
				<%
					if (userdbName.equalsIgnoreCase("admin") && userdbPass.equalsIgnoreCase("admin") ) {
						System.out.println("Role of adminAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
				%>
						<script type="text/javascript" src="JS/lwradmin.js"></script>
					<div class="wrapper">
       				<!--  Sidebar Holder -->
        			<nav id="sidebar">
            			<div class="sidebar-header imag" id="im">
                			<!-- <h3>CTOPUP BOARD</h3> -->
           		   		</div>

            		<ul class="nav nav-pills nav-stacked  list-unstyled components">
                		<p>CTOPUP REPORT</p>
							<li  data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="openreport({title: '',mode: '',type: 'newreport'})"><span class="glyphicon glyphicon-file"></span> New Report</a></li>
						  	<li><a class="sidebar" ui-sref="list({mode: 'public'})"><span class="glyphicon glyphicon-stats"></span> Admin Reports</a></li>
						  	<li><a class="sidebar" ui-sref="list({mode: 'public'})"><span class="glyphicon glyphicon-stats"></span> Zone Reports</a></li>
							<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span> Circle Reports</a></li>
							<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span> City Reports</a></li>
					</ul>
        		</nav>
		
       		<!--  Page Content Holder -->
        		<div id="content">
           		 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
                		<div class="container-fluid">

		                    <button type="button" id="sidebarCollapse" class="navbar-btn">
		                        <span></span>
		                        <span></span>
		                        <span></span>
		                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="usermgmt" href="#usermgmt"><span class="glyphicon glyphicon-user"></span> Users</a></li>
						  	<li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="connmgmt" href="#connmgmt">Data Sources</a></li>
						  	<li class="dropdown">
					        <a class="dropdown-toggle topbar" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-question-sign"></span> Help
					        <span class="caret"></span></a>
					    <ul class="dropdown-menu">
							  <li><a class="topbar" ui-sref="getstarted" href="#getstarted">Getting Started</a></li>
							  <li><a class="topbar" ui-sref="example" href="#example">Sample Reports</a></li>
					    </ul>
					      </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                        <li class="btn btn-info"><%=session.getAttribute("userdbName")%></li>
					      	<li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
                    </div>
                </div>
             </nav>
	            <div ui-view ng-init="list({mode: 'public'})" >
		    	</div><br><br><br>
				  <div class="footer d-flex justify-content-center">
		                <p class="text-white">copyright &copy; BSNL Dash Board @ 2018 <a href="www.bsnl.com">bsnl.com</a></p>
		            </div>	
					<%} %>
<!-- 0000000000000000000000000000000000000000000000000 userdbName,userdbPass-->
		<%}else{ %>
				<%
					if ((zonesId != null) && (!zonesId.equalsIgnoreCase("")) && (circlesId != null) && (!circlesId.equalsIgnoreCase("")) && citysId.equals("") ) {
						System.out.println("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC-report list");
				%>
				<script type="text/javascript" src="JS/lwrcircle.js"></script>
				 <div class="wrapper">
       			 <!--  Sidebar Holder -->
        			<nav id="sidebar">
            			<div class="sidebar-header imag" id="im">
                			<!-- <h3>CTOPUP BOARD</h3> -->
           		   		</div>

            		<ul class="nav nav-pills nav-stacked  list-unstyled components">
                		<p>CTOPUP REPORT</p>
						<!-- <li  data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="openreport({title: '',mode: '',type: 'newreport'})"><span class="glyphicon glyphicon-file"></span> New Report</a></li> -->
						<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span> Circle Reports</a></li>
						<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span> City Reports</a></li>
					</ul>
        		</nav>
		
       		   <!--  Page Content Holder -->
        		<div id="content">
           		 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
                		<div class="container-fluid">

		                    <button type="button" id="sidebarCollapse" class="navbar-btn">
		                        <span></span>
		                        <span></span>
		                        <span></span>
		                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
						    <li class="dropdown">
					        <a class="dropdown-toggle topbar" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-question-sign"></span> Help
					        <span class="caret"></span></a>
					     		<ul class="dropdown-menu">
									  <li><a class="topbar" ui-sref="getstarted" href="#getstarted">Getting Started</a></li>
									  <li><a class="topbar" ui-sref="example" href="#example">Sample Reports</a></li>
							     </ul>
					      	  </li>
                         </ul>
                         <ul class="nav navbar-nav navbar-right">
                         <li class="btn btn-info"><%=session.getAttribute("userdbName")%></li>
					        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						 </ul>
                    </div>
                </div>
              </nav>
               <div ui-view ng-init="list({mode: 'public'})" >
			    </div>
			    <br><br><br><br>
			     <div class="footer d-flex justify-content-center">
	                <p class="text-white">copyright &copy; BSNL Dash Board @ 2018 <a href="www.bsnl.com">bsnl.com</a></p>
	             </div>
				
				
				
				 <%}  else if ((zonesId != null) && (!zonesId.equalsIgnoreCase("")) && circlesId.equals("") && citysId.equals("")) {
				System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz-report list");
				%> 
					<script type="text/javascript" src="JS/lwrzone.js"></script>
					<div class="wrapper">
       				<!--  Sidebar Holder -->
        			<nav id="sidebar">
            			<div class="sidebar-header imag" id="im">
                			<!-- <h3>CTOPUP BOARD</h3> -->
           		   		</div>

            		<ul class="nav nav-pills nav-stacked  list-unstyled components">
                		<p>CTOPUP REPORT</p>
							<li  data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="openreport({title: '',mode: '',type: 'newreport'})"><span class="glyphicon glyphicon-file"></span> New Report</a></li>
						  	<li><a class="sidebar" ui-sref="list({mode: 'public'})"><span class="glyphicon glyphicon-stats"></span> Zone Reports</a></li>
							<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span> Circle Reports</a></li>
							<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span> City Reports</a></li>
					</ul>
        		</nav>
		
       		<!--  Page Content Holder -->
        		<div id="content">
           		 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
                		<div class="container-fluid">

		                    <button type="button" id="sidebarCollapse" class="navbar-btn">
		                        <span></span>
		                        <span></span>
		                        <span></span>
		                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                           <!--  <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="usermgmt" href="#usermgmt"><span class="glyphicon glyphicon-user"></span> Users</a></li>
						  	<li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="connmgmt" href="#connmgmt">Data Sources</a></li> -->
						  	<li class="dropdown">
					        <a class="dropdown-toggle topbar" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-question-sign"></span> Help
					        <span class="caret"></span></a>
					    <ul class="dropdown-menu">
							  <li><a class="topbar" ui-sref="getstarted" href="#getstarted">Getting Started</a></li>
							  <li><a class="topbar" ui-sref="example" href="#example">Sample Reports</a></li>
					    </ul>
					      </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                        <li class="btn btn-info"><%=session.getAttribute("userdbName")%></li>
					      	<li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
                    </div>
                </div>
             </nav>
	            <div ui-view ng-init="list({mode: 'public'})" >
		    	</div><br><br><br>
				  <div class="footer d-flex justify-content-center">
		                <p class="text-white">copyright &copy; BSNL Dash Board @ 2018 <a href="www.bsnl.com">bsnl.com</a></p>
		            </div>	
				
				 
				 
				<%
					}else if ((zonesId != null) && (!zonesId.equalsIgnoreCase("")) && (circlesId != null) && (!circlesId.equalsIgnoreCase("")) && (citysId != null) && (!citysId.equalsIgnoreCase("")) ) { 
						System.out.println("cccccccccccccccccccccccccccccccccccccccccc-report list");
				%>
				<script type="text/javascript" src="JS/lwrcity.js"></script>
				<div class="wrapper">
       			<!--  Sidebar Holder -->
        			<nav id="sidebar">
            			<div class="sidebar-header imag" id="im">
                			<!-- <h3>CTOPUP BOARD</h3> -->
           		   		</div>

            		<ul class="nav nav-pills nav-stacked  list-unstyled components">
                		<p>CTOPUP REPORT</p>
						<!-- <li  data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="openreport({title: '',mode: '',type: 'newreport'})"><span class="glyphicon glyphicon-file"></span> New Report</a></li> -->
						<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span>City Reports</a></li>
					</ul>
        		</nav>
		
       			<!--  Page Content Holder -->
        		<div id="content">
           		 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
                		<div class="container-fluid">

		                    <button type="button" id="sidebarCollapse" class="navbar-btn">
		                        <span></span>
		                        <span></span>
		                        <span></span>
		                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
						  <li class="dropdown">
					         <a class="dropdown-toggle topbar" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-question-sign"></span> Help
					         <span class="caret"></span></a>
						        <ul class="dropdown-menu">
								  <li><a class="topbar" ui-sref="getstarted" href="#getstarted">Getting Started</a></li>
								  <li><a class="topbar" ui-sref="example" href="#example">Sample Reports</a></li>
						        </ul>
					       </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
					      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
                    </div>
                </div>
              </nav>
	            <div ui-view ng-init="list({mode: 'public'})" >
	    		</div><br><br><br>
			  	<div class="footer d-flex justify-content-center">
	                <p class="text-white">copyright &copy; BSNL Dash Board @ 2018 <a href="www.bsnl.com">bsnl.com</a></p>
	            </div>	
				<%}} %>
<!-- 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->


	

 <!-- jQuery CDN - Slim version (=without AJAX) -->
   <script type="text/javascript" src="JS/jquery.min.js"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
</body>
</html>














































<!-- 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000     tommorow i will doing -->
<!-- 




    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>HTML Div Layout</title>
        <style type="text/css">
            body{
                font: 12px verdana, sans-serif; 
                margin: 0px;
            }
            .header{
                padding: 10px 0;
                background-color: #679BB7; 
            }
            .header h1{
                font-size: 18px; 
                margin: 10px;
            }
            .container{
                width: 100%;
                background-color: #f0f0f0; 
            }
            .sidebar{
                float: left; 
                width: 20%; 
                min-height: 170px;
                background-color: #bbd2df;
            }
            .sidebar .nav{
                padding: 10px;
            }
            .nav ul{
                list-style: none; 
                padding: 0px; 
                margin: 0px;
            }
            .nav ul li{
                margin-bottom: 5px; 
            }
            .nav ul li a{
                color: #3d677e;
            }
            .nav ul li a:hover{
                text-decoration: none;
            }
            .content{
                float: left;
                width: 80%;
                min-height: 170px;
            }
            .content .section{
                padding: 10px;
            }
            .content h2{
                font-size: 16px; 
                margin: 0px;
            }
            .clearfix{
                clear: both;
            }
            .footer{
                background-color: #679BB7; 
                padding: 10px 0;
            }
            .footer p{
                text-align: center; 
                margin: 5px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="header">
                <h1>Tutorial Republic</h1>
            </div>
            <div class="wrapper">
                <div class="sidebar">
                    <div class="nav">
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content">
                    <div class="section">
                        <h2>Welcome to our site</h2>
                        <p>Here you will learn to create websites...</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="footer">
                <p>copyright &copy; tutorialrepublic.com</p>
            </div>
        </div>
    </body>
    </html>
<!--000000000000000000000000000000000000000-->
<%-- <body data-ng-controller="ApplicationController">


				<%
					if ((zonename != null) && (!zonename.equalsIgnoreCase("")) && (circlename != null) && (!circlename.equalsIgnoreCase("")) && cityname.equals("")) {
						System.out.println("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC-report list");
				%>
				
    <!-- 0000000000000000000000000000000000000 -->
	 <nav style="margin-bottom: 0px;border-radius:0px;" class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
					<img style="float:left;position:relative" src="images/q2r.png" alt=""></img>
					<a style="color:#f1f1f1;margin-left:10px" class="navbar-brand" href="#">
						</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav" style="display:inline-block">
				  <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="usermgmt" href="#usermgmt"><span class="glyphicon glyphicon-user"></span> Users</a></li>
				  <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="connmgmt" href="#connmgmt">Data Sources</a></li>
				  <li class="dropdown">
			        <a class="dropdown-toggle topbar" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-question-sign"></span> Help
			        <span class="caret"></span></a>
			        <ul class="dropdown-menu">
					  <li><a class="topbar" ui-sref="getstarted" href="#getstarted">Getting Started</a></li>
					  <li><a class="topbar" ui-sref="example" href="#example">Sample Reports</a></li>
			        </ul>
			      </li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
			      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
		    </div>
		</div>
	</nav>
	<div style="height:90vh">
		<div style="border: 1px solid #f1f1f1;background-color:#f1f1f1;padding-top:10px;width:10%;height:100%;float: left;">
			<ul class="nav nav-pills nav-stacked">
				<li  data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="openreport({title: '',mode: '',type: 'newreport'})"><span class="glyphicon glyphicon-file"></span> New Report</a></li>
				
				<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span> Circle Reports</a></li>
			</ul>
		</div>
		<div ui-view ng-init="list({mode: 'public'})" style="overflow:auto;padding:10px;width:90%;height:100%;float: left;">
		</div>
	</div> 
				
				
				
				<%}else if ((zonename != null) && (!zonename.equalsIgnoreCase("")) && circlename.equals("") && cityname.equals("")) {
				System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz-report list");
				%>
				<nav style="margin-bottom: 0px;border-radius:0px;" class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
					<img style="float:left;position:relative" src="images/q2r.png" alt=""></img>
					<a style="color:#f1f1f1;margin-left:10px" class="navbar-brand" href="#">
					</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav" style="display:inline-block">
				  <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="usermgmt" href="#usermgmt"><span class="glyphicon glyphicon-user"></span> Users</a></li>
				  <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="connmgmt" href="#connmgmt">Data Sources</a></li>
				  <li class="dropdown">
			        <a class="dropdown-toggle topbar" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-question-sign"></span> Help
			        <span class="caret"></span></a>
			        <ul class="dropdown-menu">
					  <li><a class="topbar" ui-sref="getstarted" href="#getstarted">Getting Started</a></li>
					  <li><a class="topbar" ui-sref="example" href="#example">Sample Reports</a></li>
			        </ul>
			      </li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
			      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
		    </div>
		</div>
	</nav>
	<div style="height:90vh">
		<div style="border: 1px solid #f1f1f1;background-color:#f1f1f1;padding-top:10px;width:10%;height:100%;float: left;">
			<ul class="nav nav-pills nav-stacked">
				<li  data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="openreport({title: '',mode: '',type: 'newreport'})"><span class="glyphicon glyphicon-file"></span> New Report</a></li>
				<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span>Zone Reports</a></li>
			</ul>
		</div>
		<div ui-view ng-init="list({mode: 'public'})" style="overflow:auto;padding:10px;width:90%;height:100%;float: left;">
		</div>
	</div>
				
				
				
				
				<%}else if ((zonename != null) && (!zonename.equalsIgnoreCase("")) && (circlename != null) && (!circlename.equalsIgnoreCase("")) && (cityname != null) && (!cityname.equalsIgnoreCase(""))) { 
				
				System.out.println("cccccccccccccccccccccccccccccccccccccccccc-report list");
				%>
				
				<nav style="margin-bottom: 0px;border-radius:0px;" class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
					<img style="float:left;position:relative" src="images/q2r.png" alt=""></img>
					<a style="color:#f1f1f1;margin-left:10px" class="navbar-brand" href="#">
						</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav" style="display:inline-block">
				  <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="usermgmt" href="#usermgmt"><span class="glyphicon glyphicon-user"></span> Users</a></li>
				  <li data-ng-if="userRole == 'admin'"><a class="topbar" ui-sref="connmgmt" href="#connmgmt">Data Sources</a></li>
				  <li class="dropdown">
			        <a class="dropdown-toggle topbar" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-question-sign"></span> Help
			        <span class="caret"></span></a>
			        <ul class="dropdown-menu">
					  <li><a class="topbar" ui-sref="getstarted" href="#getstarted">Getting Started</a></li>
					  <li><a class="topbar" ui-sref="example" href="#example">Sample Reports</a></li>
			        </ul>
			      </li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
			      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
		    </div>
		</div>
	</nav>
	<div style="height:90vh">
		<div style="border: 1px solid #f1f1f1;background-color:#f1f1f1;padding-top:10px;width:10%;height:100%;float: left;">
			<ul class="nav nav-pills nav-stacked">
				<li  data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="openreport({title: '',mode: '',type: 'newreport'})"><span class="glyphicon glyphicon-file"></span> New Report</a></li>
				<li data-ng-if="userRole == 'admin' || userRole == 'view'"><a class="sidebar" ui-sref="list({mode: 'personal'})"><span class="glyphicon glyphicon-user"></span>City Reports</a></li>
			</ul>
		</div>
		<div ui-view ng-init="list({mode: 'public'})" style="overflow:auto;padding:10px;width:90%;height:100%;float: left;">
		</div>
	</div>
				
				
				<%} %> --%>




 <!-- jQuery CDN - Slim version (=without AJAX) -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
   <!-- <script type="text/javascript" src="JS/jquery.min.js"></script>
    Popper.JS
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    Bootstrap JS
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
</body>
</html> -->

 