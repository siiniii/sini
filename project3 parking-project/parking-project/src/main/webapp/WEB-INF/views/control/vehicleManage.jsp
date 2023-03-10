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
          <form id="modify-form" action="modifyVehicle" method="post">
              <input type="hidden" name="indexNo">
          </form>
          <form id="inout-form" action="inout" method="post">
              <input type="hidden" name="carNo">
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
<!--bootstrap working-->
	<script src="/resources/styles/js/bootstrap.min.js"></script>
	<!-- //bootstrap working-->
<script type="text/javascript">


$(function() {
	
	
	// 차량목록 조회 
	$('#car-list-area').load('loadCarList');
	
	$("#searchAll").on('click', function(event) {
		event.preventDefault();
		
		const formData = $('#search-form').serialize();
		$('#car-list-area').load('loadCarList?' + formData);
		
	});
	

	// 삭제 
	$('#car-list-area').on('click', '.delete-btn', function(event) {
		
		const ok = confirm("등록된 ${ vehicle.regCarNo }차량을 삭제할까요?");
		if (!ok) return;
		
		const tr = $(this).parent().parent();
		
		const indexNo = tr.find("td:eq(0)").text();

		$('#delete-form input[name=indexNo]').val(indexNo);
		
		$('#delete-form').submit();
		
		
	});
	

});
	
</script>

<!-- Modal -->
<div class="modal fade" id="carModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"  style="color: #000;">${vehicle.regCarNo} 차량정보 수정</h1>
        <button type="button" class="btn-close btn-close-modify" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
  
       <div class="modal-body" style="text-align:center">
					<form id="modify" action="modifyCar" method="post" class="insert-menu-form" enctype="multipart/form-data">
						<div class="input-grids">
							<input type="hidden" name="indexNo" id="indexNo">
							<input type="hidden" name="regCarNo" id="regCarNo">
							<input type="text" name="regCarNo2" disabled>
						</div>
						<br>
						<div class="form-input">
							<textarea name="regInfo" id="regInfo" class="form-control" placeholder="등록정보" required="required"></textarea>
						</div>
						<br>
						<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="color:white">취소</button>
						<button type="submit" class="btn btn-style btn-info submit" id="btn_modify">수정하기</button>
					</form>
      </div>
      
    </div>
  </div>
</div>

<script type="text/javascript">

$(function() {
	console.log($.ajax);
	// 메뉴 수정 버튼 (버튼 클릭시 해당 데이터 모달창으로 가져오기)
	$('#car-list-area').on('click', '.modify-btn', function(event) {
		// 버튼의 부모객체 = td, td의 부모객체 = tr
		const tr = $(this).parent().parent();
		const indexNo = tr.find("td:eq(0)").text();
		
		// ajax로 데이터 조회 -> 조회된 데이터를 modal 입력요소에 저장
		$.ajax({
			"method":"POST",
			"url":"/control/modifyVehicle",
			"data": {indexNo: indexNo},
			"success":function(data, xhr, status ){
				$('#modify input[name=indexNo]').val(data.indexNo);
				$('#modify input[name=regCarNo]').val(data.regCarNo);
				$('#modify input[name=regCarNo2]').val(data.regCarNo);
				$('#modify textarea[name=regInfo]').val(data.regInfo);
				
			},
			"error":function(xhr, status, err){
				alert("오류")
			}
		});
		
		// modal 표시
		$('#carModal').modal('show');
		});
	$('.btn-close-modify').on('click', function(event) {
		$('#carModal').modal('hide');
	});
	});		
</script>

<!-- Modal -->

<div class="modal fade" id="inoutModal" tabindex="-1" aria-labelledby="inoutModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
      
        <h3 class="modal-title fs-5" id="inoutModalLabel"  style="color: #000;">출입기록</h3>
        <button type="button" class="btn-close btn-close-inout" data-bs-dismiss="modal" aria-label="Close"></button>
        
      </div>
  
       <div class="modal-body" style="text-align:center">
       <table class="table table-striped projects" id="list-table">
              <thead>
                  <tr>
                  	  <th style="display:none"></th>
                      
                      <th style="width: 20%">
                          차량 번호
                      </th>
                      <th style="width: 30%">
                          입차 시간  
                      </th>
                      <th style="width: 30%">
                          출차 시간
                      </th>
                      <th style="width: 20%">
                      </th>
                  </tr>
              </thead>
         </table>
       	<table id="inoutTable" border="1">
       		<thead></thead>
       		<tbody>
       			<tr>
                      
                      
                  </tr>
       		</tbody>
       	</table>
      </div>
      
    </div>
  </div>
</div>

<script type="text/javascript">

$(function() {
	console.log($.ajax);
	// 메뉴 수정 버튼 (버튼 클릭시 해당 데이터 모달창으로 가져오기)
	$('#car-list-area').on('click', '.inout-btn', function(event) {
		
		$('#inoutTable tbody').empty();
		
		// 버튼의 부모객체 = td, td의 부모객체 = tr
		const tr = $(this).parent().parent();
		const carNo = tr.find("td:eq(2)").text();
		
		// ajax로 데이터 조회 -> 조회된 데이터를 modal 입력요소에 저장
		$.ajax({
			"method":"POST",
			"url":"/control/inout",
			"data": {"carNo": carNo},
			"success":function(data, xhr, status ){
				const tbody = $('#inoutTable tbody');
				data.forEach(function(row, idx) {
					const tr = $("<tr></tr>");	
					
					tr.append("<td>" + row.carNo + "</td>");
					tr.append("<td>" + row.enterTime + "</td>");
					tr.append("<td>" + row.exitTime + "</td>");
					tbody.append(tr);
					
				});
				// modal 표시
				$('#inoutModal').modal('show');
				
			},
			"error":function(xhr, status, err){
				alert("오류")
			}
		});
		
		});
	
	$('.btn-close-inout').on('click', function(event) {
		$('#inoutModal').modal('hide');
	});
	});		

</script>


</body>
</html>

















