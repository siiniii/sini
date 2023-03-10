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
            <h1 class="m-0">HOME</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
        
     <!-- 본문 삽입 공간 -->   
     
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
