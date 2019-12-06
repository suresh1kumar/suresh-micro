<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- <script type="text/javascript">
	        function doAjaxPost() {
	        // get the form values
	        var name = $('#name').val();
	        var address = $('#address').val();
	 
	        $.ajax({
	        type: "POST",
	        url: "/CrudSpringExample/saveContact",
	        data: "name=" + name + "&address=" + address,
	        success: function(response){
	        // we have the response
	        $('#info').html(response);
	        $('#name').val('');
	        $('#address').val('');
	        },
	        error: function(e){
	        alert('Error: ' + e);
	        }
	        });
	        }
	 </script> -->
</head>
<body>
	<h1>Edit Employee</h1>
	<form:form method="POST" action="/CrudSpringExample/saveContact" modelAttribute="studentBean" >
		<table>
			 <tr>
				<td></td>
				<td><form:hidden path="roll" /></td>
			</tr> 
			<%-- <tr>
				<td>ROll :</td>
				<td><form:input path="roll" /></td>
			</tr> --%>
			<tr>
				<td>Name :</td>
				<td><form:input path="name"  /></td>
			</tr>
			<tr>
				<td>ADDRESS :</td>
				<td><form:input path="address" /></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="Edit Save" onclick="doAjaxPost()"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>