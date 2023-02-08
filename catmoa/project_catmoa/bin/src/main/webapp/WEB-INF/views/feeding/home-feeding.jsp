 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>CatMoa Home</title>
	
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
	<link rel="stylesheet" href="/project_catmoa/resources/assets/css/home.css">
	<link rel="stylesheet" href="/project_catmoa/resources/assets/css/map.css">

	<!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    
</head>

<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	
	<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
	
	<!-- ======= header ======= -->
	<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
	<!-- End header -->	
		
	<jsp:include page="/WEB-INF/views/module/page-header.jsp">
		<jsp:param value="급식게시판" name="title"/>
	</jsp:include>
		
	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<jsp:include page="/WEB-INF/views/module/left-sidebar.jsp" />
							
							<div class="col-lg-6">
								<div class="central-meta">
									<div class="sub-title" style="padding:15px">
										<h4>[  고양이 급식구역 지도  ]</h4>
										<span>지도를 움직여 우리동네 급식소를 찾아보세요!</span>	
									</div>
									
									<div class="select-location">
									<!-- 시/구/동 선택하기 -->
										<div class="col-3">
											<div class="dropdown">
											  <button class="btn btn-outline-primary dropdown-toggle col-12" type="button" data-toggle="dropdown" data-sido="${ sido }" aria-expanded="false">
											    지역을 선택하세요
											  </button>
											  <div class="dropdown-menu col-12" id="sido"></div>
											</div>
										</div>
										<div class="col-3">											
											<div class="dropdown">
											  <button class="btn btn-outline-primary dropdown-toggle col-12" type="button" data-toggle="dropdown" data-gugun="" aria-expanded="false">
											    구 선택
											  </button>
											  <div class="dropdown-menu col-12" id="gugun"></div>
											</div>
										</div>
										<div class="col-3">
											<div class="dropdown">
											  <button class="btn btn-outline-primary dropdown-toggle col-12" type="button" data-toggle="dropdown" data-dong="" aria-expanded="false">
											    동 선택
											  </button>
											  <div class="dropdown-menu col-12" id="dong"></div>
											</div>
										</div>
										
										<button onclick="panTo()" id="move-map">
											<i class="ti-search"></i>
											
										</button>
									</div>
									<div class="nearby-pepl">
										<jsp:include page="/WEB-INF/views/feeding/home-catmap.jsp" />
									</div><!-- near by map -->									
									<ul class="nearby-contct">
									</ul>

								</div><!-- photos -->
							</div>
							
							<jsp:include page="/WEB-INF/views/module/right-sidebar.jsp" />
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>
	
	<!-- ======= header ======= -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp" />
	<!-- End header -->	
	<!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
</div>

<jsp:include page="/WEB-INF/views/module/common-js.jsp" />

<script type="text/javascript">  
 	$(function() {
		/* $('.nearby-contct').css({"display":"none"});
		 
		$("#map").on('click','.map-info>a',function(event){  
			event.preventDefault();
			$('.nearby-contct').css({"display":"block"}); 
		});
		
		$(".chosen-single>span").css({"color":"#8C8C9D"}); */
		

	    $.ajax({
	    	"url": "load-sido-list",
	    	"method": "get",
	    	"dataType": "json",
	    	"success": function(data, status, xhr) {
	    		$.each(data, function(idx, v) {
	    			const a = "<a class='dropdown-item' href='#' data-sido='" + v + "'>" + v +"</a>";
	    			$('#sido').append(a);
	    		});
	    	},
	    	"error": function(xhr, status, err) {
	    		alert('fail');
	    	}
	    });
	    
	    
  	 	$('#sido').on('click', 'a', function(event) {
	    	$('#sido a').removeClass('active');
	    	$(this).addClass('active');
	    	
	    	const sido = $(this).data('sido'); // 사용자가 선택한 시도명
	    	// ajax 요청
	    	$('#gugun').empty();
	    	$.ajax({
		    	"url": "load-gugun-list",
		    	"method": "get",
		    	"data": "sido=" + sido,
		    	"dataType": "json",
		    	"success": function(data, status, xhr) {
		    		$.each(data, function(idx, v) {
		    			const a = "<a class='dropdown-item' href='#' data-gugun='" + v + "'>" + v +"</a>";
		    			$('#gugun').append(a);
		    		});
		    	},
		    	"error": function(xhr, status, err) {
		    		alert('fail');
		    	}
		    });
	    	
	  	});
  	    
  	  	$('#gugun').on('click', 'a', function(event) {
	    	$('#gugun a').removeClass('active');
	    	$(this).addClass('active');
	    	
	    	const gugun = $(this).data('gugun'); // 사용자가 선택한 구군명
	    	
	    	// ajax 요청
	    	$('#dong').empty();
	    	$.ajax({
		    	"url": "load-dong-list",
		    	"method": "get",
		    	"data": "gugun=" + gugun,
		    	"dataType": "json",
		    	"success": function(data, status, xhr) {
		    		$.each(data, function(idx, local) {
		    			const a = "<a class='dropdown-item' href='#' data-dong='" + local.dong + "' data-lat='" + local.dongLat + "' data-lng='" + local.dongLng + "'>" + local.dong + "</a>";
		    			$('#dong').append(a);
		    		});
		    	},
		    	"error": function(xhr, status, err) {
		    		alert('fail');
		    	}
		    });
	    	
  	  	});
  	  	
  	  $('#dong').on('click', 'a', function(event) {
    	$('#dong a').removeClass('active');
    	$(this).addClass('active');
  	  });
  	  	
  	  	///////////////////////////////////////////

		
		$('#map').on('click', 'a.marker', function(event) {
			const localNo = $(this).data('local-no'); // data('local-no') -->  data-local-no="value"
			//alert(localNo);
			
			$('.nearby-contct').load("home-community?localNo=" + localNo);
				
			});
		
 	  	$('#recipeCarousel').carousel({
 	  		  interval: 6000,
 	  		});
 	  	  	
		$('.carousel-item active').each(function(){
			// var minPerSlide = 7;
  		    var minPerSlide = 4;
  		    var next = $(this).next();
  		    if (!next.length) {
  		    next = $(this).siblings(':first');
  		    }
  		    next.children(':first-child').clone().appendTo($(this));
  		    
  	     for (var i=0;i<minPerSlide;i++) {
  		        next=next.next();
  		        if (!next.length) {
  		        	next = $(this).siblings(':first');
  		      	}
  		        
  		        next.children(':first-child').clone().appendTo($(this));
  		      } 
  		}); 
  		
		});

  
		

  		
  	
</script> 
 
</body>	
</html>