<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>Insert title here</title>
</head>
<body>
<table border=1>
        <thead>
            <tr>
                <th>studentId</th>
                <th>studentName</th>
                <th>Qualification</th>
                <th>gender</th>
                <th>joinDate</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${sessionScope.studentDetails}" var="user">
                <tr><form action="EnableDisableUser" method="get">
                    <td ><input name="sid" value="${user.studentId}"  readonly="readonly"/></td>
                    <td><c:out value="${user.studentName}" /></td>
                    <td><c:out value="${user.qualification}" /></td>
                    <td><c:out value="${user.gender}" /></td>
                    <td><c:out value="${user.joinDate}" /></td>
                    <td><button onclick="enableDisable(this)" name="saction" value="${user.action}">${user.action}</button></td>
                 <%--    <td><fmt:formatDate pattern="dd MMM,yyyy" value="${user.registeredon}" /></td>
                    <td><a href="UserController?action=edit&userId=<c:out value="${user.uname}"/>">Update</a></td>
                    <td><a href="UserController?action=delete&userId=<c:out value="${user.uname}"/>">Delete</a></td>
                --%> </form></tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert">Add User</a></p>
</body>
<script type="text/javascript">
function enableDisable(sbtn) {
    if (sbtn.innerHTML == "Enable")
    {
     	sbtn.innerHTML = "Disable";
    //	alert(sbtn.innerHTML);
    }
    else if (sbtn.innerHTML == "Disable")
    {
    	sbtn.innerHTML = "Enable";
    //	alert(sbtn.innerHTML);
    }
}
</script>
</html>