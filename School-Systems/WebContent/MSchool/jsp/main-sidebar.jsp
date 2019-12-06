<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="cdn-file/img/suraj.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Suresh Kumar</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        
        <li class="active">
           <a href="#">
        	   <i class="fa fa-link"></i>
        		<span>Link</span>
        	</a>
        </li>
        
        <li>
          <a href="#">
        	 <i class="fa fa-link"></i>
        		<span>Another Link</span>
        	</a>
        </li>
        
        <li class="treeview">
          <a href="#">
          	<i class="fa fa-link"></i> 
          	  <span>Multilevel11</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">Link in level 2</a></li>
            <li><a href="#">Link in level 2</a></li>
			<li><a href="test.html">Link in level 2</a></li>
          </ul>
        </li>
        <li>
          <a href="#">
        	 <i class="fa fa-link"></i>
        		<span>Suresh1 Link</span>
        	</a>
        </li>
        <li>
          <a href="#">
        	 <i class="fa fa-link"></i>
        		<span>Suresh2 Link</span>
        	</a>
        </li>
        <li>
          <a href="#">
        	 <i class="fa fa-link"></i>
        		<span>Suresh3 Link</span>
        	</a>
        </li>
        <li>
          <a href="Management/MainJsp/changePassword.jsp">
        	 <i class="fa fa-link"></i>
        		<span>Change Password</span>
        	</a>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>


</body>
</html>