<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String zonename = (String)session.getAttribute("zonename"); 
String circlename = (String)session.getAttribute("circlename"); 

System.out.println("getattribute value printed zonename ::"+zonename);
System.out.println("getattribute value printed circlename ::"+circlename);


%>
<body>
		<%
			if ((zonename != null) && (!zonename.equalsIgnoreCase("")) && (circlename != null) && (!circlename.equalsIgnoreCase(""))) {
		%>
		<h4 style="padding-top: 5px">User(s) List_Zone</h4>
<table>
	<tr>
		<th><label>Search</label></th>
		<th>:</th>
		<th><input type="text" data-ng-model="userName"></input></th>
	</tr>
</table>
<br>
<div class="topdiv_adminpages">
	<table class="displayTable" id="admintable">
		<tr>
			<th class="widecolmaxwidth">Display Name</th>
			<th class="widecolmaxwidth">Username</th>
			<th class="widecolmaxwidth">Role</th>
			<th class="widecolmaxwidth">Chart Type</th>
		</tr>
		<tr data-ng-repeat="user in users | filter:userName" data-ng-click="setUser(user)">
			<td class="widecolmaxwidth colpadding">{{user.displayName}}</td>
			<td class="widecolmaxwidth colpadding">{{user.username}}</td>
			<td class="widecolmaxwidth colpadding">{{user.role}}</td>
			<td class="widecolmaxwidth colpadding">{{user.chartType}}</td>
		</tr>
	</table>
</div>
<hr>
<div class="bottomdiv_adminpages">
	<h4>Create/Edit User</h4>
	<table style="width: 50%" class="admininputtable">
		<tr>
			<td>Display Name</td>
			<td><input data-ng-model="newUser.displayName" type="text"></input>
			</td>
		</tr>
		<tr>
			<td>User Name</td>
			<td><input data-ng-model="newUser.userName" type="text"></input></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input data-ng-model="newUser.password" type="password"></input>
			</td>
		</tr>
		<tr>
			<td>Role</td>
			<td><select data-ng-model="newUser.role">
					<option value="admin">Admin</option>
					<option value="guest">Guest</option>
					<option value="view">View</option>
			</select></td>
		</tr>
		<tr>
			<td>Chart Type</td>
			<td><input data-ng-model="newUser.chartType" type="text"></input>
			</td>
		</tr>
	</table>
	<hr>
	<button class="btn btn-primary" data-ng-click="addUser()">Add/Update User</button>
	<button class="btn btn-primary" data-ng-click="removeUser()">Remove User</button>
</div>
<%}else{ %>
<h4 style="padding-top: 5px">User(s) List_Circle</h4>
<table>
	<tr>
		<th><label>Search</label></th>
		<th>:</th>
		<th><input type="text" data-ng-model="userName"></input></th>
	</tr>
</table>
		<br>
<div class="topdiv_adminpages">
	<table class="displayTable" id="admintable">
		<tr>
			<th class="widecolmaxwidth">Display Name</th>
			<th class="widecolmaxwidth">Username</th>
			<th class="widecolmaxwidth">Role</th>
			<th class="widecolmaxwidth">Chart Type</th>
		</tr>
		<tr data-ng-repeat="user in users | filter:userName" data-ng-click="setUser(user)">
			<td class="widecolmaxwidth colpadding">{{user.displayName}}</td>
			<td class="widecolmaxwidth colpadding">{{user.username}}</td>
			<td class="widecolmaxwidth colpadding">{{user.role}}</td>
			<td class="widecolmaxwidth colpadding">{{user.chartType}}</td>
		</tr>
	</table>
</div>
<hr>
<div class="bottomdiv_adminpages">
	<h4>Create/Edit User</h4>
	<table style="width: 50%" class="admininputtable">
		<tr>
			<td>Display Name</td>
			<td><input data-ng-model="newUser.displayName" type="text"></input>
			</td>
		</tr>
		<tr>
			<td>User Name</td>
			<td><input data-ng-model="newUser.userName" type="text"></input></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input data-ng-model="newUser.password" type="password"></input>
			</td>
		</tr>
		<tr>
			<td>Role</td>
			<td><select data-ng-model="newUser.role">
					<option value="admin">Admin</option>
					<option value="guest">Guest</option>
					<option value="view">View</option>
			</select></td>
		</tr>
		<tr>
			<td>Chart Type</td>
			<td><input data-ng-model="newUser.chartType" type="text"></input>
			</td>
		</tr>
	</table>
	<hr>
	<button class="btn btn-primary" data-ng-click="addUser()">Add/Update User</button>
	<button class="btn btn-primary" data-ng-click="removeUser()">Remove User</button>
</div>
<%} %>
</body>
</html>