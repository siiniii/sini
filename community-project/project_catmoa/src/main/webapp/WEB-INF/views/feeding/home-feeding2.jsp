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
											  <button class="btn btn-outline-primary dropdown-toggle col-12" id="state-button" type="button" data-toggle="dropdown" aria-expanded="false">
											    지역을 선택하세요
											  </button>
											  <div class="dropdown-menu col-12" id="sido">
											  </div>
											</div>
										</div>
										<div class="col-3">
											<!--
											<select class="form-select" aria-label="Default select example" name="state" id="state">
												 <option disabled selected style="display:none" >구 선택</option>
												<option value="1">서초구</option>
												<option value="2">강남구</option>
											</select>
											--> 
											<div class="dropdown">
											  <button class="btn btn-outline-primary dropdown-toggle col-12" id="state-button" type="button" data-toggle="dropdown" aria-expanded="false">
											    구 선택
											  </button>
											  <div class="dropdown-menu col-12" id="state">
											  	<a class='dropdown-item' href='#' data-gu="1">서초구</a>
											  	<a class='dropdown-item' href='#' data-gu="2">강남구</a>
											  </div>
											</div>
										</div>
										<div class="col-3">
											<!--    
											<select class="form-select" name="town" id="town">
												<option disabled selected style="display:none" >동 선택</option>
											</select>
											-->
											  
											<div class="dropdown">
											  <button class="btn btn-outline-primary dropdown-toggle col-12" id="town-button" type="button" data-toggle="dropdown" aria-expanded="false">
											    동 선택
											  </button>
											  <div class="dropdown-menu col-12" id="town">
											    <c:forEach var="local" items="${ locals }">
											    	<a class="dropdown-item" href="#" data-lat="${ local.dongLat }" data-lng="${ local.dongLng }">${ local.dong }</a>
											    	
											   	</c:forEach>
											  </div>
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
		
    
	    //sel1이 서초구일경우
	    var town_1 = [
	    	[${locals.localId}, ${locals.dong}],
	      /*   ["SC02", "방배동"],
	        ["SC03", "반포동"],
	        ["SC04", "양재동"],
	        ["SC05", "내곡동"],
	        ["SC06", "잠원동"] */
	    ];
	    
	    //sel1이 강남구일경우
	    var town_2 = [
	    	["GN01", "신사동"],
	        ["GN02", "역삼동"],                                                                                                                                                                                                                                                                                                              
	        ["GN03", "도곡동"],
	        ["GN04", "개포동"],
	        ["GN05", "삼성동"]
		];
	    
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
	    
	    $("#sido").on("change",function(event) {
	    	
	    }
	    
	    
	    
    
	    //구 선택에 따라 동 선택값 다르게하기
  	   $("#state").on("change",function(event){
	    	var option = $("#state option:selected").val();
	    	var subSelName = '';
	    	if(option == "1") {
	    		$("#town").empty();
	    		// $('#town').append("<option disabled selected>동 선택</option>")
	    		$.each(town_1,function(i,e) {
	    	    	$("#town").append("<option value='" + e[0] + "'>" + e[1] + "</option>");
	    			// $("#town").append("<a class='dropdown-item' href='#'>" + e[1] + "</a>");
	    		});
	        } else if(option == "2"){
	        	subSelName = "town_2";
	        	$('#town').empty();
	        	$("#town").append(subSelName);
	        } else{
	        	$("#town").hide();
	        	return;
	        }
  	    }); 
  	 	$('#city').on('click', 'a', function(event) {
	    	$('#city a').removeClass('active');
	    	$(this).addClass('active');
	    	
	    	
	  	});
  	    
  	    $('#state a').on('click', function(event) {
  	    	var option = $(this).data('gu');
  	    	$('#state a').removeClass('active');
  	    	$(this).addClass('active');
	    	var subSelName = '';
	    	
	    	if(option == "1") {
	    		$("#town").empty();
	    		// $('#town').append("<option disabled selected>동 선택</option>")
	    		$.each(town_1,function(i,e) {
	    	    	//$("#town").append("<option value='" + e[0] + "'>" + e[1] + "</option>");
	    			$("#town").append("<a class='dropdown-item' href='#' data-dong='" + e[0] + "'>" + e[1] + "</a>");
	    		});
	        } else if(option == "2"){
	        	subSelName = "town_2";
	        	$('#town').empty();
	        	$.each(town_2,function(i,e) {
	        		$("#town").append("<a class='dropdown-item' href='#'data-dong='" + e[0] + "'>" + e[1] + "</a>");
	        	});
	        } else{
	        	$("#town").hide();
	        	return;
	        }
  	    });
  	    
  	  	$('#town').on('click', 'a', function(event) {
	    	$('#town a').removeClass('active');
	    	$(this).addClass('active');
  	  	});

		
		$('#map').on('click', 'a.marker', function(event) {
			const localNo = $(this).data('local-no'); // data('local-no') -->  data-local-no="value"
			//alert(localNo);
			
			$('.nearby-contct').load("home-community?localNo=" + localNo);
				
			});
		
 	  	$('#recipeCarousel').carousel({
 	  		  interval: 6000,
 	  		});
 	  	  	
		$('.carousel-item active').each(function(){
  		    var minPerSlide = 5;
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