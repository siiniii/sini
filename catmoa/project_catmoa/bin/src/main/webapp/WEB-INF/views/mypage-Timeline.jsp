<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Winku Social Network Toolkit</title>
<link rel="icon" href="project_catmoa/resources/assets/images/fav.png"
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
										<div class="widget">
											<h4 class="widget-title">Socials</h4>
											<ul class="socials">
												<li class="facebook"><a title=""
													href="https://facebook.com"><i class="fa fa-facebook"></i>
														<span>facebook</span></a></li>
												<li class="twitter"><a title=""
													href="https://twitter.com"><i class="fa fa-twitter"></i>
														<span>twitter</span></a></li>
												<li class="google"><a title=""
													href="http://www.google.com"><i class="fa fa-google"></i>
														<span>google</span></a></li>
											</ul>
										</div>
										<!-- ======= myfeed======= -->
										<jsp:include page="/WEB-INF/views/module/mypage-myfeed.jsp" />
										<!-- End myfeed -->
									</aside>
								</div>
								<!-- sidebar -->

								<div class="col-lg-6">
									<div class="loadMore"></div>
									<!-- add post new box -->

									<div class="central-meta item">
										<div class="user-post">
											<div class="friend-info">
											<div class="nav-item" style="font-weight:bold; font-size:20px">내가 찜한 목록</div>
												<figure>
													<img
														src="/project_catmoa/resources/assets/images/resources/${ board.userId }"
														alt="">
												</figure>
												
												<!--  들어갈 내용 -->
												
												<%-- <table>
													<c:forEach var="userjjim" items="${ userjjims }">
														<tr>
															<td scope="col">${ userjjim.boardNo }</td>
															<td scope="col">${ userjjim.userId }</td>
															<td scope="col">${ userjjim.boardTitle }</td>
															<td scope="col">${ userjjim.boardContent }</td>
															<td scope="col"><img
																src="/project_catmoa/resources/assets/images/resources/${ userjjim.savedFileName }"></td>
														</tr>
													</c:forEach>
												</table> --%>
												
												<table class="table">
												<thead>
													<tr class="table-primary">
														<th scope="col">No</th>
														<th scope="col">사용자</th>
														<th scope="col">제목</th>
														<th scope="col">내용</th>
														<th scope="col"></th>
													</tr>
												</thead>
													<c:forEach var="userjjim" items="${ userjjims }">
														
														<tbody>
															<tr>
																<td scope="col">${ userjjim.boardNo }</td>
																<td scope="col">${ userjjim.userId }</td>
																<td scope="col">${ userjjim.boardTitle }</td>
																<td scope="col">${ userjjim.boardContent }</td>
																<td scope="col">
																	<c:if test="${ not empty userjjim.savedFileName }">
																		<img style="width:200px" src="/project_catmoa/resources/assets/images/resources/${ userjjim.savedFileName }">
																	</c:if>
																</td>
															</tr>
														</tbody>
														</c:forEach>
												</table>
												<!--  들어갈 내용 (끝) -->

											</div>
										</div>
									</div>
								</div>
								<!-- centerl meta -->

								<div class="col-lg-3">
									<aside class="sidebar static">
										<div class="widget">
											<!-- 오른쪽 사이드 -->
											<!-- start 내 목록 -->
											<jsp:include page="/WEB-INF/views/module/mypage-side1.jsp" />
											<!-- end 내 목록 -->
										</div>
										<!-- 친구목록 시작 -->
										<jsp:include page="/WEB-INF/views/module/friend-list.jsp" />
										<!-- 친구목록 끝 -->
									</aside>
								</div>
								<!-- sidebar -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- ======= footder ======= -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp" />
	<!-- End footder -->

	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />

</body>

</html>