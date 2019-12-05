<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">

</style>
</head>
<body>
<div class="w3-container w3-teal">
  <h2>Input Form</h2>
</div>
<div class="container">

		<form class="w3-container w3-container-small">
			
			
			<p><!-- <fieldset> -->
					<div class="w3-row-padding">
						<div class="w3-third">
							<select class="w3-select w3-hover-blue" name="option">
							  <option value="" disabled selected>Choose your option</option>
							  <option value="1">Option 1</option>
							  <option value="2">Option 2</option>
							  <option value="3">Option 3</option>
							</select>
						</div>
						
						<div class="w3-third">
							<select class="w3-select w3-hover-blue" name="option">
							  <option value="" disabled selected>Choose your option</option>
							  <option value="1">Option 1</option>
							  <option value="2">Option 2</option>
							  <option value="3">Option 3</option>
							</select>
						</div>
						<div class="w3-third">
							<select class="w3-select w3-hover-blue" name="option">
							  <option value="" disabled selected>Choose your option</option>
							  <option value="1">Option 1</option>
							  <option value="2">Option 2</option>
							  <option value="3">Option 3</option>
							</select>
						</div>
					</div>
				</fieldset>	
				
				<p><!-- <fieldset> -->
					<div class="w3-row-padding">
						<div class="w3-third">
							<input class="w3-input w3-hover-blue" type="text" placeholder="Enter first name" required>
						</div>
						
						<div class="w3-third">
							<input class="w3-input w3-hover-blue" type="text" placeholder="Enter first name" required>
						</div>
						<div class="w3-third">
							<input class="w3-input w3-hover-blue" type="email" placeholder="Enter first name" required>
						</div>
					</div>
				</fieldset>	
				
				<p><!-- <fieldset> -->
					<div class="w3-row-padding">
						<div class="w3-third">
							<input class="w3-radio" type="radio" name="gender" value="male" checked>
							<label class="w3-validate">Male</label>
						</div>
						
						<div class="w3-third">
							<input class="w3-radio" type="radio" name="gender" value="male" checked>
							<label class="w3-validate">Female</label>
						</div>
						<div class="w3-third">
							<input class="w3-radio" type="radio" name="gender" value="male" checked>
							<label class="w3-validate">Male/Female</label>
						</div>
					</div>
				</fieldset>	
				
				<p><!-- <fieldset> -->
					<div class="w3-row-padding">
						<div class="w3-half">
							<input class="w3-input w3-hover-blue" type="text" placeholder="Enter from Date" required>
						</div>
						
						<div class="w3-half">
							<input class="w3-input w3-hover-blue" type="text" w3-hover-blue" placeholder="Enter To Date" required>
						</div>
					</div>
				</fieldset>	
				
				<p>
				<div class="w3-row-padding">
						<div class="w3-half">
							<button class="w3-btn w3-blue-grey">Search</button>
						</div>
						
						<div class="w3-half">
							  <button class="w3-btn w3-blue-grey">Reset</button>
						</div>
				</div>
				
				


</form>
</div>
</body>
</html>