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
 <style type="text/css">
  
  *{
 margin: 0;
 padding: 0;
 font-family: 'Cinzel', serif;
}

.bgimg{
 width: 100%;
 height: 100vh;
 background-image: linear-gradient(27deg, #004E95 50%, #013A6B 50%);
}

.centerdiv{
 width: 350px;
 height: 400px;
 position: absolute;
 top: 50%;
 left: 50%;
 background-color: red;
 transform: translate(-50%, -50%);
 background-image: linear-gradient(27deg, #013A6B 50%, #004E95 50%);
 box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.24);
}

#profilepic{
 width: 120px;
 height: 120px;
 border-radius: 50%;
 position: relative;
 top: -60px;
 left: calc( (350px - 120px) / 2 )
}

h2{
 text-align: center;
 color: white;
 text-transform: uppercase;
 font-size: 2em;
 word-spacing: 10px;
 margin-top: -50px;
 margin-bottom: 50px;
 text-shadow: -2px 2px 1px #0A84C6;
}

.inputbox{
 width: calc(100% - 40px);
 height: 30px;
 display: block;
 margin: auto;
 padding: 0 10px;
 box-sizing: border-box;
}

::placeholder{
 letter-spacing: 2px;
 color: black;
}

button{
 width: calc(100% - 40px);
 height: 30px;
 display: block;
 margin: auto;
 color: white;
 background-color: #0A84C6;
 border: none;
}

.FORGOT-SECTION{
 width: calc(100% - 40px);
 line-height: 30px;
 display: block;
 margin: auto;
 color: white;
 background-color: dodgerblue;
 text-transform: uppercase;
 font-size: 0.8em;
 text-align: right;
 padding-right: 20px;
 box-sizing: border-box;

}
  </style>
	<style>
	.center{
	    position:absolute;
	    display:block;
	    left:35%;
	    top:35%;
	}
	
	
  .form-rounded {
border-radius: 1rem;
}
.btn-block{
border-radius: 1rem;
}
	</style>
	
<script type="text/javascript">
	function selectCircle()
	{      	
      if(document.adjustmentReport.regionName.value == "")
      {
	      alert("Please select the Circle Name before SSA Name");
		  document.adjustmentReport.regionName.focus();
		  return false;
	  }
	  else{
	    return true;
	   }	   
	}
</script>

<script type="text/javascript">
	function regionCode(){
        document.adjustmentReport.action="login.jsp?apply=select";
      	document.adjustmentReport.method = "post";
      	document.adjustmentReport.submit();
      	return true;
	}
	function regionCode2(){
        var regNam=document.adjustmentReport.regionName.value;
      	var cityNam=document.adjustmentReport.cityName.value;
        document.adjustmentReport.action="login.jsp?strcityNam="+cityNam+"&strregNam="+regNam+"";
      	document.adjustmentReport.method = "post";
      	document.adjustmentReport.submit();
      	return true;
	  }
	function cityCode(){      
		var regNam = document.adjustmentReport.regionName.value;
		var cityNam = document.adjustmentReport.cityName.value;		
		document.adjustmentReport.action = "login.jsp?strcityNam=" + cityNam
			+ "&strregNam=" + regNam + "";
		document.adjustmentReport.method = "post";
		document.adjustmentReport.submit();
		return true;
	  }
	</script>
</head>


<%
//String strregNam = StringWrapper.makeNotNull(request.getParameter("regionName"));
//String strcityNam = StringWrapper.makeNotNull(request.getParameter("cityName"));
	String zonesId= (String)session.getAttribute("zoneId");
	String circlesId = (String)session.getAttribute("regionId");
	String citysId = (String)session.getAttribute("cityId");
	
String strZoneNam =request.getParameter("zoneN");
String strregNam = request.getParameter("circleN");
String strcityNam =request.getParameter("cityN");

String user_id = (String)session.getAttribute("userdbName");
System.out.println("********************************************************************************************************");
System.out.println("strZoneNam000000000000000000000 ::"+strZoneNam);
System.out.println("strregNam000000000000000000000 ::"+strregNam);
System.out.println("strcityNam00000000000000000000 ::"+strcityNam);
System.out.println("session by  userid in login page ::"+user_id);
String zoneId = "",regionId="",cityId="",cityInfo="";
String info = "",zoneid="",zoneFname="",regionid="",regionFname="",regionInfo="",cityid="",cityFname="";
StringTokenizer stInfo = null;
//String user_id="srinivas";


ZonelInfo zonelInfo=new ZonelInfo();

	if(user_id !=null && !user_id.equalsIgnoreCase("")){
   
   		String zoneInfo = zonelInfo.getZoneInfo(user_id);
   		stInfo = new StringTokenizer(zoneInfo, "~");
	    zoneId = stInfo.nextToken();
	    regionId = stInfo.nextToken();
	    cityId = stInfo.nextToken();
     
	    System.out.println("zoneId ::"+zoneId);
	    System.out.println("regionId ::"+regionId);
	    System.out.println("cityId ::"+cityId);
    
	    if(regionId.equals("0") && (cityId.equals("0")) &&(!zoneId.equals("0")))
	    {
	       info=zonelInfo.getInfo1(zoneId);
	       stInfo=new StringTokenizer(info,"#");
	       while(stInfo.hasMoreTokens())
	       {
	    	   zoneid = stInfo.nextToken();
	 	      zoneFname = stInfo.nextToken();
	       }
	       regionInfo=zonelInfo.getInfo2(zoneId);
	       cityInfo=zonelInfo.getInfo3(zoneId,strregNam);

	    }
	 if(cityId.equals("0") && (!zoneId.equals("0")) &&(!regionId.equals("0")))
	   {
	     info=zonelInfo.getInfo(zoneId,regionId);
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

	 if((!zoneId.equals("0")) && (!regionId.equals("0")) && (!cityId.equals("0")))
	    {
	       info=zonelInfo.getInfo4(zoneId,regionId,cityId);
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
	<input type="hidden" name="zoneN" value="<%=zoneId%>">
	<input type="hidden" name="circleN" value="<%=regionId%>">
	<input type="hidden" name="cityN" value="<%=cityId%>">
<!-- 000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
	<div class="bgimg">
		<div class="centerdiv">
			<img
				src="https://cdn1.iconfinder.com/data/icons/flat-business-icons/128/user-128.png"
				id="profilepic">
			<h2>user bsnl</h2>
			<form action="doLogin" method="post" name="adjustmentReport">
			
				<%
			if ((!cityId.equals("0")) && (!zoneId.equals("0")) && (!regionId.equals("0"))) {
		%>
			<%
				System.out.println("zone  id info====================::/* 1,1,1 */");
			%>
			
			<div class="w3-container w3-row-padding">
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList1 onChange="" name=zoneName>
							  <OPTION value="<%=zoneFname%>"><%=zoneFname%></OPTION> 
							</select>
						</div>
						<input type="hidden" name="zoneName" value="<%=zoneFname%>">
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode()" name=regionName>
							  <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
							</select>
						</div>
						
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList onClick="selectCircle()" onChange="regionCode()" name=cityName>
							  <OPTION value="<%=cityFname%>"><%=cityFname%></OPTION>
							</select>
						</div>
		         </div>
		         <%
	        		} else if (cityId.equals("0") && (!zoneId.equals("0"))&& (!regionId.equals("0"))) {
	        	%>
		    		<%
		    			System.out.println("zone  id info====================::/* 1,1,0 */");
		    		%>
		    		<div class="w3-container w3-row-padding">
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList1 onChange="" name=zoneName >
							 <OPTION value="<%=zoneFname%>"><%=zoneFname%></OPTION>
							</select>
						</div>
						<input type="hidden" name="zoneName" value="<%=zoneFname%>">
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="" name=regionName>
							   <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
							</select>
						</div>
						
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList onClick="selectCircle()" onChange="cityCode()" name=cityName>
							  <!-- <option value=""> All </option> -->
							  <OPTION value="" >--select city-- </OPTION>
							  <option value="ALL">ALL</option>
							  <%
							  	while (stInfo.hasMoreTokens()) {
							  			cityid = stInfo.nextToken();
							  			cityFname = stInfo.nextToken();
							  			if (cityFname.equalsIgnoreCase(strcityNam)) {
							  %>
                				  <OPTION value="<%=cityFname%>"selected><%=cityFname%></OPTION>
            				<%
            					} else {
            				%>
            						 <OPTION value="<%=cityFname%>"><%=cityFname%></OPTION>
               				 <%
               				 	}
               				 		}
               				 %> 
							</select>
						</div>
		         </div>
		         <%
	        			} else if (cityId.equals("0") && (regionId.equals("0")) && (!zoneId.equals("0"))) {
	        		%>
						<%
							System.out.println("zone  id info====================::/* 1,0,0 */");
						%>
						
					<div class="w3-container w3-row-padding">
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded"  id=regionList1 onChange="" name=zoneName>
							  <option value="<%=zoneFname%>"><%=zoneFname%></option>  
							</select>
						</div><p>
						<input type="hidden" name="zoneName" value="<%=zoneFname%>">
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList2 onChange="regionCode2()" name=regionName>
							  <!-- <OPTION value="" >--select circle-- </OPTION> -->
							  <option value=""> All </option>
                               <%
                               	stInfo = new StringTokenizer(regionInfo, "#");

                               		while (stInfo.hasMoreTokens()) {
                               			regionid = stInfo.nextToken();
                               			regionFname = stInfo.nextToken();

                               			if (regionFname.equalsIgnoreCase(strregNam)) {
                               				System.out.println("Region ----------------------");
                               %>
               						   <OPTION value="<%=regionFname%>"selected><%=regionFname%></OPTION>
            					<%
            						} else {
            					%>
           						  <OPTION value="<%=regionFname%>"><%=regionFname%></OPTION>
             				   <%
             				   	}
             				   		}
             				   %>
							</select>
						</div>
						<p>
						<div class="w3-container w3-row">
							<select class="w3-select w3-hover-blue form-rounded" id=regionList3 onClick="selectCircle()" onChange="cityCode()" name=cityName>
							  <OPTION value="" >--select city-- </OPTION>
							  <option value=""> All </option>
                               <%
                               	stInfo = new StringTokenizer(cityInfo, "#");
                               		while (stInfo.hasMoreTokens()) {
                               			cityid = stInfo.nextToken();
                               			cityFname = stInfo.nextToken();
                               			if (cityFname.equalsIgnoreCase(strcityNam)) {
                               %>
                				  <OPTION value="<%=cityFname%>"selected><%=cityFname%></OPTION>
            				<%
            					} else {
            				%>
            					 <OPTION value="<%=cityFname%>"><%=cityFname%></OPTION>
             				   <%
             				   	}
             				   		}
             				   %>
							</select>
						</div>
		         </div>
		          <%
	        		}
	        	%>
	        		<br>
				
				<tr></tr>
					
					<tr></tr>
					<tr></tr>
					<br>
				<div>
					<button  name="login" type="submit"><span class="glyphicon glyphicon-stats"></span> Stats </button>
				</div>
				<br>
			</form>
		</div>



	</div>
</body>