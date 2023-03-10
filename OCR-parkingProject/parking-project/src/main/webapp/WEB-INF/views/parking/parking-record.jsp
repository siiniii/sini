<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
    	 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <h1 class="m-0">Parking Record</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
        
     <div class="card">
        <div class="card-header">
          <h3 class="card-title">주차 출입 기록</h3>
        </div>
        
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 2%">
                          #
                      </th>
                      <th style="width: 20%">
                          차량 번호
                      </th>
                      <th style="width: 20%">
                          주차 정보
                      </th>
                      <th style="width: 29%">
                          출입
                      </th>
                      <th style="width: 29%">
                          출차
                      </th>
                  </tr>
              </thead>
              <tbody>
              	<c:if test="${ pageNo > 1 }"><c:set var="sum" value="${ (pageNo-1)*10 }"></c:set></c:if>
              	<c:forEach var="record" items="${ records }">
              	<c:set var="sum" value="${ sum + 1 }"></c:set>
                  <tr>
                      <td>
                      	${ sum }
                      </td>
                      <td>
                      	${ record.carNo }
                      </td>
                      <td>
                      	${ record.parkingType }
                      </td>
                      <td>
                      	<fmt:formatDate value="${ record.enterTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                      </td>
                      <td>
                      	<c:choose>
                      	<c:when test="${ not empty record.exitTime }">
                        	<fmt:formatDate value="${ record.exitTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:when>
                        <c:otherwise>
                        	출차 전
                        </c:otherwise>
                        </c:choose>
                      	
                      </td>
                  </tr>
                </c:forEach>
              </tbody>
          </table>
          ${ pager }
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card --> 
     
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
</script>

</body>
</html>
