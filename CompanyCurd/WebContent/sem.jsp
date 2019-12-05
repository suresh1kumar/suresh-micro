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
<div class="container">
<div class="row"> 
<form role="form">
        <div class="form-group">
            <div class="input-group date" id="datetimepicker1">
                <input type="text" class="form-control"/>
                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <input type="text" class="form-control"/>
                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
            </div>
        </div>
        <div class="row">
        <div class="col-md-6 col-sm-6">
              <div class="form-group">
                  <select class="form-control">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                  </select>
              </div>
           </div>
           <div class="col-md-6 col-sm-6">
              <div class="form-group">
                  <select class="form-control">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                  </select>
              </div>
           </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block te" >Prices &amp; Availability</button>
    </form>
</div>
    </div>
</body>
</html>