<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Winku Social Network Toolkit</title>
<link rel="icon" href="/project_catmoa/resources/assets/images/fav.png"
	type="image/png" sizes="16x16">

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
								</div>
								<!-- sidebar -->
								<div class="col-lg-6">
									<div class="central-meta">
										<div class="frnds">
											<ul class="nav nav-tabs">
												<li class="nav-item" style="font-weight:bold; font-size:20px">내 즐겨찾기 목록</li>
											</ul>
												<br/><br/>
											<table class="table">
												<thead>
													<tr class="table-primary">
														<th scope="col">프로필</th>
														<th scope="col">닉네임</th>
													</tr>
												</thead>

												<tbody>
												<c:if test="${ not empty friendBookmark }">
													
														<c:forEach var="friendBookmark2" items="${ friendBookmark }">
														
																<tr>
																
																<td  scope="col">
																	<c:choose>
																		<c:when test="${ empty friendBookmark2.memberImg }">
																			<img src="/project_catmoa/resources/assets/images/kakaoImg.jpg" alt="" style="width:50px">
																		</c:when>
																		<c:otherwise>
																			<img src="/project_catmoa/resources/assets/images/${ friend.memberImg }" alt="" style="width:50px">
																		</c:otherwise>
																	</c:choose>
																	</td>
																	<td scope="col">${ friendBookmark2.nic }</td>
																</tr>
														</c:forEach>
													</c:if>	
												
											</table>
											
											<!-- Tab panes -->
											<!-- <div class="tab-content">
												<div class="tab-pane active fade show " id="frends"> -->

													<!-- <ul class="nearby-contct">
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img src="/project_catmoa/resources/assets/images/resources/friend-avatar9.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4><a href="time-line.html" title=""></a></h4>
														<span>ftv model</span>
														<a href="#" title="" class="add-butn more-action" data-ripple="">즐겨찾기 해제</a>
													</div>
												</div>
											</li>
											</ul>	 -->

												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- centerl meta -->
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
								</div>
								<!-- sidebar -->
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

</body>


</html>