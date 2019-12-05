<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%--  <jsp:useBean id="reg" scope="request" /> --%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
	 <h2>Change Password</h2>
        <form method="POST" action="ChangePassword">
            <table>
                <tr>
                    <td>Enter Old Password: </td>
                    <td><input type="password" name="oldpwd"/></td>
                </tr>
                <tr>
                    <td>Enter New password :</td>
                    <td><input type="password" name="newpswd"/></td>
                </tr>
                <tr>
                    <td>Enter Conform Password:  </td>
                    <td><input type="password" name="compswd" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="submit" />
                    <td><input type="reset" value="Cancel" />
                    </td>
                </tr>
            </table>
        </form>
        <table>
               <tr>
                <h3><jsp:getProperty name="reg" property="msg" /></h3></br>    
            </tr>
          </table>
</body>
</html>