<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 

</head>

<form action="AddStudentInfo" method="post">
<body bgcolor="gray">
<h1 align="center">Student Recourds</h1><hr/><br/>
		<div align="center">
			<p>
			Student Name :<input type="text" name="studentName" placeholder="Student Name"/><br/>
			</p>
		
			<p>
			Qualification:<input type="text" name="Qualification" placeholder="Qulification"/><br/>
			</p>
			
			<p>
			Gender:<!-- <input type="text" name="gender" placeholder="Gender"/><br> -->
			<input type = "radio" name = "gender" > Mail
            <input type = "radio" name = "gender" > Femail
			</p>
			
			<p>
			Join Date :<input type="text" name="joinDate" placeholder="Date Attended" id="datepicker"/><br>
			</p>
			<p>
			   <input type="submit" value="Add "/>
			   <input type="reset" value="Reset"/>
		    </p></div>		    		
     </form>
         <script>
           $(document).ready(function() {
           $("#datepicker").datepicker();
           });
        </script>   
</body>
</html>