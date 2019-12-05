<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="w3-container w3-teal">
  <h2>Input Form</h2>
</div>
<div class="container">
	<form class="w3-container"><p>
		<!-- <fieldset> -->
					<div class="w3-row-padding">
						<div class="w3-third">
							<select class="w3-select w3-border" name="option">
							  <option value="" disabled selected>Choose your option</option>
							  <option value="1">Option 1</option>
							  <option value="2">Option 2</option>
							  <option value="3">Option 3</option>
							</select>
						</div>
						
						<div class="w3-third">
							<select class="w3-select w3-border" name="option">
							  <option value="" disabled selected>Choose your option</option>
							  <option value="1">Option 1</option>
							  <option value="2">Option 2</option>
							  <option value="3">Option 3</option>
							</select>
						</div>
						<div class="w3-third">
							<select class="w3-select w3-border" name="option">
							  <option value="" disabled selected>Choose your option</option>
							  <option value="1">Option 1</option>
							  <option value="2">Option 2</option>
							  <option value="3">Option 3</option>
							</select>
						</div>
					</div>
				</fieldset>	
				<p>
				<div class="w3-row-padding">
						<div class="w3-third">
							<input class="w3-radio" type="radio" name="gender" value="male" checked>
							<label class="w3-validate">Male</label>
						</div>
						
						<div class="w3-third">
							  <input class="w3-radio" type="radio" name="gender" value="female">
								<label class="w3-validate">Female</label>
						</div>
						<div class="w3-third">
							<input class="w3-radio" type="radio" name="gender" value="" disabled>
							<label class="w3-validate">Don't know (Disabled)</label>
						</div>
				</div>
				
				
				<p>
				<div class="w3-row-padding">
						<div class="w3-third">
							<label class="w3-label w3-text-teal"><b>First Name</b></label>
	  						<input class="w3-input w3-border w3-light-grey" type="text">
						</div>
						
						<div class="w3-third">
							  <label class="w3-label w3-text-teal"><b>Last Name</b></label>
	  							<input class="w3-input w3-border w3-light-grey" type="text">
						</div>
						<div class="w3-third">
							<label class="w3-label w3-text-teal"><b>Last Name</b></label>
	  						<input class="w3-input w3-border w3-light-grey" type="text">
						</div>
				</div>
				
				
				<div class="w3-row-padding">
						<div class="w3-half">
							<label class="w3-label w3-text-teal"><b>First Name</b></label>
	  						<input class="w3-input w3-border w3-light-grey" type="text">
						</div>
						
						<div class="w3-half">
							  <label class="w3-label w3-text-teal"><b>Last Name</b></label>
	  							<input class="w3-input w3-border w3-light-grey" type="text">
						</div>
				</div>
				
				<p>
				<div class="w3-row-padding">
						<div class="w3-half">
							<button class="w3-btn w3-blue-grey">Register</button>
						</div>
						
						<div class="w3-half">
							  <button class="w3-btn w3-blue-grey">Register</button>
						</div>
				</div>
				
				
				
				
	
		
	 
	</form>
</div>
</body>
</html>