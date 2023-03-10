<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
    	 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <h1 class="m-0">Rate Check</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
        
     <section class="content">
      <div class="row">
      
      	<div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">요금 설정</h3>
            </div>
            <div class="card-body">
            <form>
            <c:forEach var="rates" items="${ rate }" varStatus="status" >
              <div class="form-group">
                <label>거주자 차량</label>
                <input type="text" id="rateOfresident" class="form-control" readonly="readonly" value="1시간 당 &nbsp; ${ rates.residentRate } 원">
              </div>
              <div class="form-group">
                <label>상가방문차량</label>
                <input type="text" id="rateOfcustomer" class="form-control" readonly="readonly" value="1시간 당 &nbsp; ${ rates.customerRate } 원">
              </div>
              <div class="form-group">
                <label>일반방문차량</label>
                <input type="text" id="rateOfvisitor" class="form-control" readonly="readonly" value="1시간 당 &nbsp; ${ rates.visitorRate } 원">
              </div>
              </c:forEach>
            </form>
            <button class="btn btn-primary float-right" id="rateSet">설정</button>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      	
      	<!-- 차량 번호 검색 -->
        <div class="col-md-6">
          <div class="card card-success">
            <div class="card-header">
              <h3 class="card-title">요금 조회</h3>
            </div>
            <div class="card-body">
            <form id="search-form" name="search-form" method="GET" role="search">
              <div class="form-group">
                <label>차량 번호</label>
                <input type="text" name="search" class="form-control">
              </div>
             </form>
             <button class="btn btn-secondary float-right" id="initialization">초기화</button>
             <button class="btn btn-success float-right" id="searchCarNumber">조회</button>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        
      </div>
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">차량 목록</h3>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 2%">
                          #
                      </th>
                      <th style="width: 10%">
                          차량 번호
                      </th>
                       <th style="width: 15%">
                          차량 등록정보
                      </th>
                      <th style="width: 20%">
                          입장 시간
                      </th>
                      <th style="width: 20%">
                          퇴장 시간
                      </th>
                      <th style="width: 11%">
                          머문 시간
                      </th>
                      <th style="width: 10%">
                          요금
                      </th>
                      <th style="width: 12%">
                      </th>
                  </tr>
              </thead>
              <tbody id="car-list">
              <c:forEach var="vehicle" items="${ vehicles }" varStatus="status" >
              	<c:forEach var="rates" items="${ rate }" varStatus="rateStatus" >
              	 <fmt:formatNumber var="totalMinutes" value="${ (vehicle.exitTime.getTime() - vehicle.enterTime.getTime()) / (1000 * 60) }" minFractionDigits="0" maxFractionDigits="0"></fmt:formatNumber>
                  <tr>
                  	  <td style="display:none">${ vehicle.indexNo }</td>
                      <td>${ status.count }</td>
                      <td id="rate-check-carno">${ vehicle.carNo }</td>
                      <td>${ vehicle.parkingType }</td>
                      <td>${ vehicle.enterTime }</td>
                      <td>${ vehicle.exitTime != null ? vehicle.exitTime : '(NULL)' }</td>
                      <td>&nbsp;&nbsp;${ vehicle.exitTime != null ? totalMinutes : 0 }분</td>
                      <td>${ (vehicle.exitTime != null ? totalMinutes : 0) * (vehicle.parkingType == "일반방문차량"? rates.visitorRate : vehicle.parkingType == "상가방문차량" ? rates.customerRate : rates.residentRate) }</td>
                      
                      <td class="project-actions">
					  	 <a class="btn btn-primary btn-sm register-btn" data-index_no="${ vehicle.indexNo }" href="#">등록</a>
					  	 <c:choose>
						  	 <c:when test="${ vehicle.exitTime != null }">
		                     	 <a class="btn btn-primary btn-sm payment-btn" data-index_num="${ vehicle.indexNo }" href="#">
		                             <i class="fas fa-check"></i>정산
		                         </a>
	                         </c:when>
	                         <c:otherwise>
	                         	<a class="btn btn-primary btn-sm payment-btn" data-index_num="${ vehicle.indexNo }" href="#" style= "pointer-events: none; background-color: gray; border-color: gray">
		                             <i class="fas fa-check"></i>정산
		                         </a>
	                         </c:otherwise>
                         </c:choose>
                      </td>
                  </tr>
                  </c:forEach>
              </c:forEach>
              </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
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

<!-- 요금 설정 Modal -->
	<div class="modal fade" id="rate_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="recomment-modal-Label" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h2 class="modal-title fs-5" id="rate-modal-Label">요금 설정</h2>
	      </div>
	      <div class="modal-body">
	        <!-- write comment area -->
			<form id="rateSet-form">
				<label>방문 타입</label>
				<select name="type" id="type-select">
					<option value="visitor">일반방문</option>
					<option value="customer">상가방문</option>
   	 				<option value="resident">거주자</option>
				</select>
				<div id="rateValue">
					<label>요금</label>
					<input name='rate' type='text'>&nbsp;원
				</div>
			</form>
			<!-- end of write comment area -->
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary set_button">완료</button>
	        <button type="button" class="btn btn-secondary cancel_button" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- 주차 차량 등록 Modal-->
	<div class="modal fade" id="reg_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="recomment-modal-Label" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h2 class="modal-title fs-5" id="rate-modal-Label">상가 방문 차량 등록</h2>
	      </div>
	      <div class="modal-body">
	        <!-- write comment area -->
	        <form id="regSet-form">
	        	<input type="hidden" name="indexNo">
				<label>등록 정보</label>
				<select name="parkingType">
					<option value="상가방문차량">상가방문차량</option>
					<option value="일반방문차량">일반방문차량</option>
   	 				<option value="거주자">거주자</option>
				</select>
			</form>
			<!-- end of write comment area -->
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary regSet_button">완료</button>
	        <button type="button" class="btn btn-secondary regCancel_button" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>

<!-- 정산 modal -->
<div class="modal fade" id="pay_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="recomment-modal-Label" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h2 class="modal-title fs-5" id="payment-modal-Label">정산</h2>
	      </div>
	      <div class="modal-body">
	        <!-- write comment area -->
	        <form id="payment-form" action="delete-payCar" method="post">
	        	<input type="hidden" name="indexNo">
	        	<span>정산 하시겠습니까?</span>
	        	<%-- <c:forEach var="vehicle" items="${ vehicles }" varStatus="status" >
					<c:choose>
						<c:when test="${ vehicle.exitTime != null }">
							<span>정산 하시겠습니까?</span>
						</c:when>
						<c:otherwise> 아직 퇴장하지 않은 차량입니다.</c:otherwise>
					</c:choose>
				</c:forEach> --%>
			</form>
			<!-- end of write comment area -->
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary payOk_button">확인</button>
	        <button type="button" class="btn btn-secondary payCancel_button" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<jsp:include page="/WEB-INF/views/include/common-js.jsp" />
<!-- daterangepicker -->

<script type="text/javascript">
	$(function() {
		
		// 요금 설정
		
		// let rateType = $('#rateSet-form select[name=type]').val();
		let rateValue = null;
		let rate = null;
		
		$('#rateSet').on('click', function() {
			$('#rate_modal').modal('show');
		});
		
		$('.set_button').on('click', function() {
			
			const rateType = $('#type-select').val();
			// const formData = $('#rateSet-form').serialize();
			const rate = $('input[name=rate]').val();			
			
			$.ajax({
				"method" : "GET",
				"url" : "setting-rate",
				// "data" : formData,
				"data" : 'rateType=' + rateType + '&rate=' + rate,
				"success" : function(data, status, xhr) {
					if(rateType =="visitor") {
						
						$('#rateOfvisitor').val("1시간 당 " + rate + " 원");
						
					} else if (rateType =="customer") {
						
						$('#rateOfcustomer').val("1시간 당 " + rate + " 원");
						
					} else {
						
						$('#rateOfresident').val("1시간 당 " + rate + " 원");
					}
					$('#rate_modal').modal('hide');
					$('#car-list').load('load-cars');
				},
				"error" : function(xhr, status, err) {
					alert("fail to setting-rate");
				}
			})
			
		});
		
		$('.cancel_button').on('click', function() {
			
			$('#rate_modal').modal('hide');
			
		});
		
		// 등록 설정
	
		$('#car-list').on('click', '.register-btn', function() {
			 
/* 			const tr = $(this).parent().parent();			 
			const indexNo = tr.find("td:eq(0)"); */
			const indexNo = $(this).data('index_no');
			 
			$.ajax({
				"url": "get-indexNo",
				"method": "POST",				
				"data": {"indexNo": indexNo},
				"success": function(data, status, xhr){
					console.log(data);
					// $('#regSet-form select[name=regValid]').val(data.parkingType);
					$('#regSet-form select[name=parkingType] option[value=' + data.parkingType +']').attr("selected", true);
					$('#regSet-form input[name=indexNo]').val(data.indexNo);
					$('#reg_modal').modal('show');
				},
				"error": function(xhr, status, err) {
					alert("fail to load parking-type");
				}
			})
			 
		});
		
		$('.regSet_button').on('click', function() {
			/* const regValid = $('select[name=regValid]').val();
			const indexNo = $('#regSet-form input[name=indexNo]').val(data.indexNo); */
			const formData = $('#regSet-form').serialize();
			
			$.ajax({
				"method": "POST",
				"url": "update-parking-type",
				// "data": {"indexNo":indexNo, "parkingType":regValid},
				"data": formData,
				"success": function(data, status, xhr){
					console.log(data);
					alert('수정완료');
					$('#reg_modal').modal('hide');
					$('#car-list').load("load-cars");
				},
				"error": function(xhr, status, err) {
					alert("fail to modified parking-type");
				}
			 })
		});
		
		$('.regCancel_button').on('click', function() {
			
			$('#reg_modal').modal('hide');
			
		});
		
		$('#searchCarNumber').on('click', function(event) {
			event.preventDefault();
			
			const carNo = $('#search-form input[name=search]').val();
			
			$('#car-list').load('load-cars?carNo=' + carNo);
			// $('#car-list').load('load-cars'); // 전체 조회
			console.log(carNo);
			
		});
		
		$('#initialization').on('click', function(event) {
			$('#search-form input[name=search]').val("");
			$('#car-list').load('load-cars');
		});
		
		$('#car-list').on('click', '.payment-btn', function() {
			const indexNo = $(this).data('index_num');
			$('#payment-form input[name=indexNo]').val(indexNo);
			$('#pay_modal').modal('show');
		});
		
		$('.payOk_button').on('click', function() {
		
			// $('#payment-form input[name=indexNo]').val(indexNo);
			$('#payment-form').submit();
			
			// $('#payment-form input[name=indexNo]').val('');
			// $('#pay_modal').modal('hide');
			
		});
		
		$('.payCancel_button').on('click', function() {
			
			$('#pay_modal').modal('hide');
			
		});
		
	});
</script>

</body>
</html>
