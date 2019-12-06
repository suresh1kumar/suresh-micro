<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>School | System</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <link rel="stylesheet" href="cdn-file/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="cdn-file/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="cdn-file/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="cdn-file/css/AdminLTE.min.css">
  <link rel="stylesheet" href="cdn-file/css/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <div id="mainheader"></div>
  
  <div id="mainsidebar"></div>
 
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Page Header<small>Optional description</small></h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
 <div id="controlsidebar"></div>
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->


<script src="cdn-file/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="cdn-file/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="cdn-file/js/adminlte.min.js"></script>


<script> 
    $(function(){
      $("#mainheader").load("main-header.jsp"); 
    });
 </script>
 
 <script> 
    $(function(){
      $("#controlsidebar").load("control-sidebar.jsp"); 
    });
 </script>
 <script> 
    $(function(){
      $("#mainsidebar").load("main-sidebar.jsp"); 
    });
 </script>

</body>
</html>