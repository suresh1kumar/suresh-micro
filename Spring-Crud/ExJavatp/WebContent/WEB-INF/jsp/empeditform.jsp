<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update || Employee</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel = "stylesheet" href = "https://www.w3schools.com/lib/w3.css">

<style type="text/css">
#size1{
    width:50%;
    height:50%;
    position:absolute;
    background:#ffffff; 
    top:10%;
    left:25%;
    
     margin-right: 25%;
}
</style>
</head>
<body>
<div class="w3-container w3-teal">
  <h2>Edit Employee</h2>
</div>
	
	<div class="w3-container" id="size1">
	<form:form method="POST" action="/ExJavatp/editsave" class = "w3-container w3-card-8">
	
	
	
	 <div class="w3-row-padding">
	  <div class="w3-row">
 		 <label>Name</label>
    		<form:input path="ID"  class="w3-input w3-border"/>
 		 </div>
 		 
 		 <div class="w3-row">
 		 <label>Name</label>
    		<form:input path="NAME"  class="w3-input w3-border"/>
 		 </div>
  		 <div class="w3-row">
  		 <label>Emp Age</label>
    		<form:input path="AGE" class="w3-input w3-border"/>
 		 </div>
  		 <div class="w3-row">
  		 <label>Department</label>
    		<form:input path="DEPT" class="w3-input w3-border"/>
  		</div>
  		 <div class = "w3-group">
            <!-- <input type="submit" class="btn btn-success" value="Edit Save" /> -->
            <button type="submit" class="btn btn-success" value="Edit Save">Edit Save</button>
           <!--  <button type="button" class="btn btn-success">Success</button> -->
         </div>
	</div> 
        <%--  <div class = "w3-group">
            <label class = "w3-label">User ID</label>
            <form:hidden  path="ID" />
         </div> --%>
         
        <%--  <div class = "w3-group">
            <label class = "w3-label">NAME</label>
            <form:input path="NAME"  />
         </div>
         <div class = "w3-group">
           <label class = "w3-label">EMP AGE</label>
            <form:input path="AGE" />
            
         </div>
         
         <div class = "w3-group">
             <label class = "w3-label">DEPARTMENT</label>
            <form:input path="DEPT" />
         </div>
         
         <div class = "w3-group">
            <input type="submit" value="Edit Save" />
         </div> --%>
         
    </form:form>  
	</div>
	<hr>
<!-- ------------------------------------------- -->
       <%-- <form:form method="POST" action="/ExJavatp/editsave">    
        <table >    
        <tr>  
        <td></td>    
         <td><form:hidden  path="ID" /></td>  
         </tr>   
         <tr>    
          <td>Name : </td>   
          <td><form:input path="NAME"  /></td>  
         </tr>    
         <tr>    
          <td>Age :</td>    
          <td><form:input path="AGE" /></td>  
         </tr>   
         <tr>    
          <td>Department :</td>    
          <td><form:input path="DEPT" /></td>  
         </tr>   
           
         <tr>    
          <td> </td>    
          <td><input type="submit" value="Edit Save" /></td>    
         </tr>    
        </table>    
       </form:form>     --%>
</body>
</html>