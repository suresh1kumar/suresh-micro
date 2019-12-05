<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="com.company.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
	  	<meta name="viewport" content="width=device-width, initial-scale=1">
	  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- dataTable - start -->
		<link href='https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css' rel='stylesheet'>
	  	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		
		<!-- dataTable - end
		Export Buttons - start -->
		<link href='https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css' rel='stylesheet'>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
 
</head>
<body>
<%@ include file="header.jsp" %> 
 <p><br></p>
 <div class="container">
 <div class="row">
 <div class="cpl-md-4">
 <h3>PLAN UPDATE RECORDS</h3>
 </div>
 <div class="cpl-md-4">
 <form action="" method="get">
   <input type="text" class="form-control" name="q" placeholder="search here..."/>
 </form>
 </div>
 <div class="col-md-4">
 <a href="planUpdateAdd.jsp" class="btn btn-primary">Add New Data</a>
 </div>
 </div>
 <p><br></p>
 <table class="table table bordered table striped table hover">
   <thead>
        <tr>
        <!-- <td>SNO</td> -->
		<td>OPERATOR</td>
		<td>CIRCLE</td>
		<td>DENOMINATION</td>
		<td>TYPE</td>
		<td>TALKVALUE</td>
		<td>VALIDITY</td>
		<td>DESCRIPTION</td>
		<td>COUNTRY</td>
		<td>START_DATE</td>
		<td>END_DATE</td>
		<th class="text-center">Edit/UpdateRecord</th>
		   <!-- <td>Edit/Update</td>
            <th>ID</th>-->
        </tr>
   </thead>
   <tbody>
     <%
    // DBConnection dbConnection=new DBConnection();
    // String host = "jdbc:mysql://localhost:3306/surajschema"; 
 	 //String username = "root"; 
 	 //String password = "root";
     Connection con=null;
     Statement st=null;
     ResultSet rs=null;
    // Class.forName("com.mysql.jdbc.Driver"); 
    // con=DriverManager.getConnection(host,"root","root");
     con=DBConnection.createConnection();
     //con = DriverManager.getConnection(host, username, password);
     st=con.createStatement();
     String query=request.getParameter("q");
     System.out.println("Searching By Column Vlaue::"+query);
     String data;
     if(query!=null){
    	 data="select * from companyrecord where OPERATOR like '%"+query+"%' or CIRCLE like '%"+query+"%' or DENOMINATION like '%"+query+"%' or TYPE like '%"+query+"%'  or TALKVALUE like '%"+query+"%'  or VALIDITY like '%"+query+"%'  or DESCRIPTION like '%"+query+"%'  or COUNTRY like '%"+query+"%'  or START_DATE like '%"+query+"%'  or END_DATE like '%"+query+"%'";
     }else{
    	 data="select * from companyrecord order by SNO desc";//order by id desc"; //order by id desc;
     }
     //String data="select * from curd";//select * from companyrecord
     rs=st.executeQuery(data);
     while(rs.next()){
     %>
     <tr>
     <%-- <td><%=rs.getString("SNO") %></td> --%>
     <td><%=rs.getString("OPERATOR") %></td>
     <td><%=rs.getString("CIRCLE") %></td>
     <td><%=rs.getString("DENOMINATION") %></td>
     <td><%=rs.getString("TYPE") %></td>
     <td><%=rs.getString("TALKVALUE") %></td>
     <td><%=rs.getString("VALIDITY") %></td>
     <td><%=rs.getString("DESCRIPTION") %></td>
     <td><%=rs.getString("COUNTRY") %></td>
     <td><%=rs.getString("START_DATE") %></td>
     <td><%=rs.getString("END_DATE") %></td>
     <td class="text-center">
     <a href='planUpdateUpdate.jsp?u=<%=rs.getString("SNO") %>' class="btn btn-warning">Edit</a>
     <a href='planUpdateDelete.jsp?d=<%=rs.getString("SNO") %>' class="btn btn-danger" onclick="return confirm('Are you sure?');">Delete</a>
     </td>
     </tr>
     <%
     }
     System.out.println("************************<<View Plan UpDate>>************************");
     %>
     
   </tbody>

</table>
</div>
 <%@ include file="footer.jsp" %> 
</body>
</html>