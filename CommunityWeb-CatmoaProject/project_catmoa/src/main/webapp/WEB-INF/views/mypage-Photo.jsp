<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>Winku Social Network Toolkit</title>
    <link rel="icon" href="/project_catmoa/resources/assets/images/fav.png" type="/project_catmoa/resources/assets/images/png" sizes="16x16"> 
    
    <jsp:include page="/WEB-INF/views/module/common-css.jsp" />

</head>
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	
	
		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
		
		<!-- ======= header ======= -->
		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
		<!-- End header -->
	
		<!-- 마이페이지 헤더 적용 -->
			<jsp:include page="/WEB-INF/views/module/mypage-header.jsp" />
		<!-- 마이페이지 헤더 적용 -->
	
	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<div class="col-lg-3">
								<aside class="sidebar static">
								
									<!-- ======= start myfeed ======= -->
										<jsp:include page="/WEB-INF/views/module/mypage-myfeed.jsp" />
									<!-- End myfeed -->
									
									</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta">
									<ul class="photos">

										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-22.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo2.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-33.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo3.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-44.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo4.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-55.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo5.jpg" alt=""></a>
										</li>

										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-66.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo6.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-77.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo7.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-88.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo8.jpg" alt=""></a>
										</li>

										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-99.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo12.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-101.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo10.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-101.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo11.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-22.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo1.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-33.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo9.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-99.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo12.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-66.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo6.jpg" alt=""></a>
										</li>
										<li>
											<a class="strip" href="/project_catmoa/resources/assets/images/resources/photo-66.jpg" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
												<img src="/project_catmoa/resources/assets/images/resources/photo13.jpg" alt=""></a>
										</li>
									</ul>
									<div class="lodmore"><button class="btn-view btn-load-more"></button></div>
								</div><!-- photos -->
							</div><!-- centerl meta -->
							<div class="col-lg-3">
								<aside class="sidebar static">
									<div class="widget">
										<!-- start 내 목록 -->	
											<jsp:include page="/WEB-INF/views/module/mypage-side1.jsp" />
										<!-- end 내 목록 -->	
									</div>
										<!-- 친구 목록 시작 -->
											<jsp:include page="/WEB-INF/views/module/friend-list.jsp" />
										<!-- End 친구 목록 -->
									</aside>
							</div><!-- sidebar -->
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>

		<!-- ======= footder ======= -->
			<jsp:include page="/WEB-INF/views/module/footer.jsp" />
		<!-- End footder -->	
	
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />

</body>	


</html>