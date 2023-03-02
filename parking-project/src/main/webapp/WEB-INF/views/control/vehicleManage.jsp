<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
    	 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Parking Project</title>
  
	<jsp:include page="/WEB-INF/views/include/common-css.jsp" />
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/resources/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>
  
  <jsp:include page="/WEB-INF/views/include/navbar.jsp" />	

  <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

  <div class="content-wrapper">
    

     <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
    <!-- Content Header (Page header) -->
        <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Vehicle Manage</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
        
     <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card card-success">
            <div class="card-header">
              <h3 class="card-title">차량 등록</h3>
            </div>
            <div class="card-body">
            <form:form id="registerform" action="register" method="post" modelAttribute="RegistrationDto">
              <div class="form-group">
                <label>차량 번호</label>
                <input type="text" id="regCarNo" name="regCarNo" class="form-control">		                    
              </div>
              <div class="form-group">
                <label>등록 정보</label>
                <input type="text" id="regInfo" name="regInfo" class="form-control">
              </div>
             
             <button id="reset" type="button" class="btn btn-secondary float-right">초기화</button>
             <button id="register" type="submit" class="btn btn-success float-right">등록</button>
             </form:form>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">차량 조회</h3>
            </div>
            <div class="card-body">
            
             <form id="search-form" name=search-form method="GET" role="search">
		    
              <div class="form-group">
                <label>차량 번호</label>
                <input type="text" name="regCarNo"class="form-control">
              </div>
              <div class="form-group">
                <label>등록 정보</label>
                <input type="text" name="regInfo" class="form-control">
              </div>
	            <div>
		            <button class="btn btn-secondary float-right">초기화</button>
		            <button class="btn btn-primary float-right" id="searchAll">조회</button>
	            </div>
            </form>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <div class="row">
      <div class="card col-12">
        <div class="card-header">
          <h3 class="card-title">차량 목록</h3>
        </div>
        <div class="card-body p-0">
          <form id="delete-form" action="deleteVehicle" method="post">
              <input type="hidden" name="indexNo">
          </form>
          <table class="table table-striped projects" id="list-table">
              <thead>
                  <tr>
                  	  <th style="display:none"></th>
                      <th style="width: 1%">
                          #
                      </th>
                      <th style="width: 20%">
                          차량 번호
                      </th>
                      <th style="width: 30%">
                          등록 정보
                      </th>
                      <th style="width: 29%">
                          등록 날짜
                      </th>
                      <th style="width: 20%">
                      </th>
                  </tr>
              </thead>
              
              <tbody id="car-list-area">
             
              </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
   	  </div>
    </section>   
     
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <!-- footer -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  <!-- /.footer -->
  
  <!-- Control Sidebar -->
  <jsp:include page="/WEB-INF/views/include/control-sidebar.jsp" />
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<jsp:include page="/WEB-INF/views/include/common-js.jsp" />
<!-- daterangepicker -->
<script type="text/javascript">


$(function() {
	
	// 차량목록 조회 
	$('#car-list-area').load('loadCarList');
	
	$("#searchAll").on('click', function(event) {
		event.preventDefault();
		
		const formData = $('#search-form').serialize();
		$('#car-list-area').load('loadCarList?' + formData);
		
	});
	
	// 등록차량 삭제 
	/* $('#delete').on('click', function(event) {
		const ok = confirm("등록된 ${ vehicle.regCarNo }차량을 삭제할까요?");
		if (!ok) return;
		
		//location.href = 'delete?boardNo=${board.boardNo}&pageNo=${pageNo}';
		location.href = '${vehicle.regCarNo}/delete';
	}); */

	$('#car-list-area').on('click', '.delete-btn', function(event) {
		
		const tr = $(this).parent().parent();
		
		const indexNo = tr.find("td:eq(0)").text();
		
		console.log(indexNo);
		
		$('#delete-form input[name=indexNo]').val(indexNo);
		
		$('#delete-form').submit();
		
		
	});
});
	




</script>

</body>
</html>
