<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Students</title>
    </head>
    <body>
        <table border="1">
            <td><a href="studentinfo.jsp">Student Info</a></td>
            <td><a href="allstudents.jsp">All Students</a></td>            
        </table>
        <br />
        <h3>List of Students</h3>
        <br />
        <table border="1">
        <th> Student Id</th>
         <th> Student Name</th>
         <th> Qualification</th>
         <th> Gender</th>
         <th> Joining Date</th>
            
            <c:forEach items="${requestScope.list}" var="student">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/GetStudent?id=${student.studentId}">${student.studentId}</a></td>
                    <td>${student.studentName}</td>
                    <td>${student.Qualification}</td>
                    <td>${student.gender}</td>
                    <td>${student.joinDate}</td>
                    <a href="DeleteStudent?pid=${student.studentId}">Delete</a>
                </tr>
            </c:forEach>                 
        </table>
    </body>
</html>
