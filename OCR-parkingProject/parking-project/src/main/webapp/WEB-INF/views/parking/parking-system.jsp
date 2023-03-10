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
            <h1 class="m-0">Parking System</h1>
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
              <h3 class="card-title">실시간 화면</h3>
            </div>
            <div class="card-body">
                 <video id="video" style="width:770px; height:500px;" autoplay></video>
	             <div class="text-right">
					<a id="lnkStart" href="#!" class="btn btn-success">
	                    촬영 시작
	                </a>
	                <a id="lnkStop" href="#!" class="btn btn-danger">
	                    촬영 중지
	                </a>
	                <a id="lnkTakePicture" href="#!" class="btn btn-success">
	                    스캔
	                </a>
	           	</div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">차량 확인</h3>
            </div>
            <div class="card-body" style="align-self: center;">
	            <canvas id="picture-display" style="width:680px; height:500px;"></canvas>
	            <div class="text-right">
					<a id="inputPic" href="#!" class="btn btn-primary">
	                    등록
	                </a>
	                <a id="resetPic" href="#!" class="btn btn-danger">
	                    초기화
	                </a>
	                <form id="picForm" action="picToOcrParking" method="post" enctype="multipart/form-data">
                        <input type="file" id="picture" name="file" style="display:none">
                    </form>
	           	</div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
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

<jsp:include page="/WEB-INF/views/include/common-js.jsp" />
<!-- daterangepicker -->
<script type="text/javascript">

$(function() {
	
	//촬영 및 스캔
	
	let isRunning = true;
	const video = $('#video')[0];
    // const vendorUrl = window.URL || window.webkitURL;

    const stop = () => {
        var stream = video.srcObject;
        var tracks = stream.getTracks();
        for (var i = 0; i < tracks.length; i++) {
            var track = tracks[i];
            track.stop();
        }
        video.srcObject = null;
    }
    var start = function () {
        if (navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true })
            		 .then(function (stream) {
                    	video.srcObject = stream;
                     })
                     .catch(function (error) {
                        // alret("Something went wrong!"); --------------------------> 오타 고쳐줌 인정??
                        alert("Something went wrong!");
                     });
        }
    }
    
    $('#lnkStart').on('click', function(event) {
    	if (isRunning) {
    		return;
    	}
    	start();
    	isRunning = true;
    });
    $('#lnkStop').on('click', function(event) {
    	if (isRunning) {
    		stop();
    		isRunning = false;
    	}
    });

    $('#lnkTakePicture').on('click', function(event) {

        if (isRunning) {
        	const canvas = $('#picture-display')[0];
        	const context = canvas.getContext('2d');

            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            canvas.toBlob( (blob) => {
                const file = new File([blob], "carNumber.png"); 
                const dt = new DataTransfer();
                dt.items.add(file)
                $('#picture')[0].files = dt.files;
            });
        }

    });
    
    $('#resetPic').on('click', function(event) {
    	$('#picture').val("");
    	const canvas = $('#picture-display')[0];
    	const context = canvas.getContext('2d');
    	context.clearRect(0, 0, canvas.width, canvas.height);
    });
    
    start();
    
    //파일 처리
    
    $('#inputPic').on('click', function(event) {
        if ($('#picture')[0].files.length > 0) {
            $('#picForm').submit();
        }
    });
});

</script>

</body>
</html>
