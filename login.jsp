<%@include file="authentication.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%
String loginuser=request.getParameter("user");
//System.out.println("loginuser in popup:"+loginuser);
String popupurl="popup.jsp?user="+loginuser;
//System.out.println("popupurl:"+popupurl);
String userName=(String)session.getAttribute("user_id");
//session.setMaxInactiveInterval(20);
String result="This is Not Possible..this may create a problem to you...";
%>
<HEAD>
<TITLE> MVoucher </TITLE>
<%
if(loginuser !=null && !loginuser.equalsIgnoreCase("") && loginuser.equalsIgnoreCase(userName)){
%>
<frameset rows="20%,75%" border="0">
      <frame src="Top.jsp"  noresize="noresize" width="100%" height="1%" name="top" scrolling="no">
      <frameset cols="20%,91%" border="0">
          <frame src="popup.jsp" noresize="noresize" name="left" scrolling="no">
         <frame src="screen.jsp" noresize="noresize" name="right" scrolling="yes">
      </frameset>
</frameset>
<%}else if(loginuser !=null && !loginuser.equalsIgnoreCase("")){
	
response.sendRedirect("index.jsp?");
} else{
response.sendRedirect("index.jsp?");
}%>

</HEAD>
<BODY>
</BODY>
</HTML>
