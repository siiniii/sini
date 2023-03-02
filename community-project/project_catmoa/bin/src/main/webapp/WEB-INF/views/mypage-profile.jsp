<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.project_catmoa.dto.IntroDto"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Winku Social Network Toolkit</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

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

										<!-- start 내 목록 -->
										<jsp:include page="/WEB-INF/views/module/mypage-myfeed.jsp" />
										<!-- end 내 목록 -->

									</aside>
								</div>

								<div class="col-lg-6">
									<div class="central-meta">
										<h1 style="text-align: center">내 프로필 변경</h1>
										<section class="vh-200">
											<div class="container py-5 h-100">
												<div
													class="row d-flex justify-content-center align-items-center h-100">
													<div class="col col-md-9 col-lg-7 col-xl-5">
														<div class="card" style="border-radius: 20px;">
															<div class="card-body p-2">
																<div class="d-flex text-black">
																	<div class="flex-shrink-0">
																	
																		<c:choose>
																			<c:when test="${ not empty loginuser.memberImg }">
																				<img
																					src="/project_catmoa/resources/images/${ loginuser.memberImg }"
																					alt="" style="width: 300px">
																			</c:when>
																			<c:otherwise>
																				<img
																					src="/project_catmoa/resources/assets/images/kakaoImg.jpg"
																					alt="" style="width: 300px">
																			</c:otherwise>
																		</c:choose>
																		
																		<!-- 기본파일형식 숨겨놓기 -->
																		<form method="post" id="profile-picture-update-form"
																			action="profile" enctype="multipart/form-data">

																			<input name="memberImg" id="profile-picture"
																				type="file" accept="image/*" style="display: none" />

																			<!-- trigger 사용 -->
																			<button type="button"
																				class="btn btn-outline-dark select-profile-picture"
																				data-mdb-ripple-color="dark"
																				style="z-index: 1; margin-top: 20px; text-align: center">
																				내 프로필사진 선택</button>
																			<!-- 기본 프로필 바 -->
																			<div id="profile-picture-name"
																				class="alert alert-primary mt-2" role="alert">프로필
																				사진을 선택하세요</div>

																			<img id='new-profile-picture' src="" alt=""
																				class="img-fluid"
																				style="width: 500px; border-radius: 10px; display: none"><br>

																			<button type="submit"
																				class="btn btn-outline-dark update-profile-picture"
																				id="update-profile-picture"
																				data-mdb-ripple-color="dark"
																				style="z-index: 1; text-align: center">내
																				프로필사진 변경</button>
																		</form>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</section>
										<br /> <br /> <br /> <br />
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

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.

		// $('.select-profile-picture').click(function() {
		$('.select-profile-picture').on('click', function(event) {
			$('#profile-picture').trigger('click');
		});

		$('#profile-picture').on('change', function(event) {
			var fileName = $(this).val();
			if (fileName != null && fileName.length > 0) {
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1); // aaa\bbb\ccc\ddd.png -> ddd.png				
				$('#profile-picture-name').text(fileName);

				const imageFiles = event.target.files;
				const imageFilesLength = imageFiles.length;
				if (imageFilesLength > 0) {
					const imageSrc = URL.createObjectURL(imageFiles[0]);
					const newProfilePicture = $("#new-profile-picture");
					newProfilePicture.attr('src', imageSrc); // element.src = imageSrc
					newProfilePicture.show();
				}
			}
		});

		$('#profile-picture-update-form').on('submit', function() {

			var fileName = $('#profile-picture').val();
			if (fileName != null && fileName.length == 0) {
				alert('변경될 사진을 선택해주세요');
				return false;
			} else {
				return true;
			}
		});
	</script>

</body>

</html>