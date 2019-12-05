<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@page import="java.io.File"%>
<%@page import="com.zonel.ZonelInfo"%>
<%@ page import="com.zonel.StringWrapper"%>
<%@ page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Query2Report</title>
	<link rel="stylesheet" type="text/css" href="CSS/lwr.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<title>Login || Page</title>
<link rel="stylesheet" type="text/css" href="style.css">
  <link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">

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
	</style>
</head>


<%

	String zonesId= (String)session.getAttribute("zoneId");
	String circlesId = (String)session.getAttribute("regionId");
	String citysId = (String)session.getAttribute("cityId");
	
	System.out.println("ZoneNam session ::"+zonesId);
	System.out.println("regNam session ::"+circlesId);
	System.out.println("cityNam session ::"+citysId);
	

String strregNam = request.getParameter("circleN");
String strcityNam =request.getParameter("cityName");

String user_id = (String)session.getAttribute("userdbName");
System.out.println("********************************************************************************************************");

System.out.println("session by  userid in login page ::"+user_id);
String zoneId = "",regionId="",cityId="",cityInfo="";
String info = "",zoneid="",zoneFname="",regionid="",regionFname="",regionInfo="",cityid="",cityFname="";
StringTokenizer stInfo = null;
//String user_id="srinivas";
String circlesIdTest="";

ZonelInfo zonelInfo=new ZonelInfo();

	if(user_id !=null && !user_id.equalsIgnoreCase("")){
   
   		String zoneInfo = zonelInfo.getZoneInfo(user_id);
   		stInfo = new StringTokenizer(zoneInfo, "~");
	    zoneId = stInfo.nextToken();
	    regionId = stInfo.nextToken();
	    cityId = stInfo.nextToken();
     
	    HttpSession s=request.getSession();
		s.setAttribute("zoneId",zoneId);
		s.setAttribute("regionId",regionId);
		s.setAttribute("cityId",cityId);
		
	    if(circlesId.equals("0") && (citysId.equals("0")) &&(!zonesId.equals("0")))
	    {
	       info=zonelInfo.getInfo1(zonesId);
	       stInfo=new StringTokenizer(info,"#");
	       while(stInfo.hasMoreTokens())
	       {
	    	   zoneid = stInfo.nextToken();
	 	      zoneFname = stInfo.nextToken();
	       }
	       //regionInfo=zonelInfo.getInfo2(zoneId);
	        //circlesIdTest="1";
	       cityInfo=zonelInfo.getInfo3(zonesId,circlesId);

	    }
	 if(citysId.equals("0") && (!zonesId.equals("0")) &&(!circlesId.equals("0")))
	   {
	     info=zonelInfo.getInfo(zonesId,circlesIdTest);
	     //cityInfo=zonelInfo.getcityInfo(zoneId,regionId);
	     stInfo=new StringTokenizer(info,"#");
	      while(stInfo.hasMoreTokens())
	      {
	       zoneid=stInfo.nextToken();
	       zoneFname=stInfo.nextToken();
	       regionid=stInfo.nextToken();
	       regionFname=stInfo.nextToken();
	        }

	       stInfo=new StringTokenizer(cityInfo,"#");
	       strregNam=regionFname;
	       
	   }

	 if((!zonesId.equals("0")) && (!circlesId.equals("0")) && (!citysId.equals("0")))
	    {
	       info=zonelInfo.getInfo4(zonesId,circlesId,citysId);
	       stInfo=new StringTokenizer(info,"#");
	       while(stInfo.hasMoreTokens())
	      {
	       zoneid=stInfo.nextToken();
	       zoneFname=stInfo.nextToken();
	       regionid=stInfo.nextToken();
	       regionFname=stInfo.nextToken();
	       cityid= stInfo.nextToken();
	       cityFname=stInfo.nextToken();

	        strregNam=regionFname;
	        strcityNam=cityFname;
	       }
	    }
	}
%>
<%String userdbName = (String)request.getSession().getAttribute("userdbName");
System.out.println("getattribute value printed userdbName::"+userdbName);
%>
<div>
<p style="color:green" align="center" style="background-color : yellow;"><b >Welcome  ::---------, <%=session.getAttribute("userdbName")%></b>

<%
String q = (String)session.getAttribute("userdbName"); 
System.out.println("getattribute value printed ::"+q);
%>
</p></div>

<body>
	
<!-- 000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
		<%
		if(!citysId.equals("0") && (!zonesId.equals("0")) &&(!circlesId.equals("0")))
		   {
		%>
			<div class="container">
			  <div class="jumbotron">
			  <form action="doLogin" method="post" name="adjustmentReport">
			  
			   <h3 align="center">Welcome BSNL You are able to see Dash Board Before Select city !!
			   
			   </h3>  
					<div class="w3-container w3-row-padding">
						
						<input type="hidden" name="zoneName" value="<%=zoneFname%>">
						
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList3 name=cityName>
							  <OPTION value="" >--select city-- </OPTION>
							  <option value=""> All </option>
                               <%
                               	stInfo = new StringTokenizer(cityInfo, "#");
                               		while (stInfo.hasMoreTokens()) {
                               			cityid = stInfo.nextToken();
                               			cityFname = stInfo.nextToken();
                               			if (cityFname.equalsIgnoreCase(strcityNam)) {
                               %>
                				  <OPTION value="<%=citysId%>"selected><%=cityFname%></OPTION>
            				 <%
            					} else {
            				 %>
            					 <OPTION value="<%=citysId%>"><%=cityFname%></OPTION>
             				   <%
             				   	}
             				   		}
             				   %>
							</select>
						</div>
		         </div>
		          
	        		<br>
					<br>
					 <p class="lead">
					 	<button type="submit" name="login" class="btn btn-primary ">GO</button>
				  	</p>
				<br>
			</form>
			
			</div>
		</div>
		<% 
		} else if (cityId.equals("0") && (!zoneId.equals("0"))&& (!regionId.equals("0"))) {
		
		%>
			<div class="container">
			  <div class="jumbotron">
			  	<form action="doLogin" method="post" name="adjustmentReport">
			  		 <h3 align="center">Welcome BSNL CircleLevel You are able to see Dash Board!!
			   
			   
			   		</h3>  
	        		<br>
					<br>
					 <p class="lead">
					 	<button type="submit" name="login" class="btn btn-primary ">GO</button>
				  	</p>
				<br>
			</form>
			
			</div>
		</div>
		<%} else if (cityId.equals("0") && (regionId.equals("0")) && (!zoneId.equals("0"))) { %>
			<div class="container">
			  <div class="jumbotron">
			  	<form action="doLogin" method="post" name="adjustmentReport">
			  		 <h3 align="center">Welcome BSNL ZoneLavel You are able to see Dash Board!!
			   
			   
			   		</h3>  
	        		<br>
					<br>
					 <p class="lead">
					 	<button type="submit" name="login" class="btn btn-primary ">GO</button>
				  	</p>
				<br>
			</form>
			
			</div>
		</div>
		
		
		<%} %>
</body>