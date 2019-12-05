<%@ page import="java.sql.*" %>
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
</head>
<%
//String user_id="srinivas";


/* String zoneId = "",regionId="",cityId="",cityInfo="";
String info = "",zoneid="",zoneFname="",regionid="",regionFname="",regionInfo="",cityid="",cityFname="";
StringTokenizer stInfo = null;

System.out.println("session by  userid in login page ::"+user_id);
ZonelInfo zonelInfo=new ZonelInfo();

	if(user_id !=null && !user_id.equalsIgnoreCase("")){
   
   		String zoneInfo = zonelInfo.getZoneInfo(user_id);
   		stInfo = new StringTokenizer(zoneInfo, "~");
	    zoneId = stInfo.nextToken();
	    regionId = stInfo.nextToken();
	    cityId = stInfo.nextToken();
     
	    System.out.println("zoneId pppppppppppppppppppyyyyyyyyyyyy::"+zoneId);
	    System.out.println("regionId pppppppppppppppppppyyyyyyyyyyy::"+regionId);
	    System.out.println("cityId ppppppppppppppppppp mmmmmmmmmm::"+cityId);
	}
	HttpSession s=request.getSession();
			s.setAttribute("zoneId",zoneId);
			s.setAttribute("regionId",regionId);
			s.setAttribute("cityId",cityId);
	String z= (String)session.getAttribute("zoneId");
	String cr = (String)session.getAttribute("regionId");
	String ct = (String)session.getAttribute("cityId"); */
	
	
%>


<body>
				
				
	<div class="bgimg">
		<div class="centerdiv">
			<img
				src="https://cdn1.iconfinder.com/data/icons/flat-business-icons/128/user-128.png" id="profilepic">
			<h2>user login</h2>
				
			<form method="post" action="doLogin1">
				<div>
					<input type="text" name="name" class="inputbox"
						placeholder="Username">
				</div>
				<br>
				<div>
					<input type="Password" name="password" class="inputbox"
						placeholder="Password">
				</div>
				
				
				<tr></tr>
					<%
					String errmsg = (String)request.getSession().getAttribute("errmsg");
					if(errmsg == null || errmsg.isEmpty()){
						%><tr></tr><%
					}else{
						%><tr><%=errmsg%></tr><%
					}
					%>
					<tr></tr>
					<tr></tr>
				<br>
				
				<div>
					<button type="submit">LOGIN</button>
				</div>
			</form>
			<br>
			<div class="FORGOT-SECTION">
			<div>
				<h4>Forget Password?</h4>
			</div>
		</div>
	</div>
	<!-- 0000000000000000000000000000000000000000000 /CTOPUP_DASHBOARDS/src/main/webapp/JSP/login.jsp -->
	
	
	<!-- <form method="post" action="doLogin1">
		<center>
			<h2 style="color: green">....................</h2>
		</center>
		<table border="1" align="center">
			<tr>
				<td>Enter Your Name :</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Enter Your Password :</td>
				<td><input type="password" name="password" /></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="submit" value="submit" /></td>
		</table>
	</form> -->
</body>
</html>