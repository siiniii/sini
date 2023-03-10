<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Parking Project</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <li class="nav-header">&nbsp;CONTROL&nbsp;</li>
          
					<li class="nav-item"><a
						href="/control/vehicleManage" class="nav-link">&nbsp;&nbsp;
							<i class="far fa-circle nav-icon"></i>
							<p>차량 등록 및 조회</p>
					</a></li>
					<li class="nav-item"><a
						href="/control/controlSystem" class="nav-link">&nbsp;&nbsp;
							<i class="far fa-circle nav-icon"></i>
							<p>관제 시스템</p>
					</a></li>
					<li class="nav-item"><a
						href="/control/controlRecord" class="nav-link">&nbsp;&nbsp;
							<i class="far fa-circle nav-icon"></i>
							<p>관제 출입 기록</p>
					</a></li>
		
		<li class="nav-header">&nbsp;PARKING&nbsp;</li>
          
					<li class="nav-item"><a
						href="/parking/rateCheck" class="nav-link">&nbsp;&nbsp;
							<i class="far fa-circle nav-icon"></i>
							<p>실시간 요금 조회</p>
					</a></li>
					<li class="nav-item"><a
						href="/parking/parkingSystem" class="nav-link">&nbsp;&nbsp;
							<i class="far fa-circle nav-icon"></i>
							<p>주차 관리</p>
					</a></li>
					<li class="nav-item"><a
						href="/parking/parkingRecord" class="nav-link">&nbsp;&nbsp;
							<i class="far fa-circle nav-icon"></i>
							<p>주차 출입 기록</p>
					</a></li>
         
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>