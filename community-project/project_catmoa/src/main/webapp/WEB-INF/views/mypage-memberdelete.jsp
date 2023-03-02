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
<title>CATMOA</title>
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

										<!-- 비번/프로필 변경-->
										<div class="widget">
											<h4 class="widget-title">변경 목록</h4>
											<ul class="naves">
												<li><i class="ti-clipboard"></i> <a
													href="/project_catmoa/mypage-memberdelete" title="">탈퇴하기</a></li>
											</ul>
										</div>
										<!-- 비번/프로필 변경-->

									</aside>
								</div>
								<div class="col-lg-6">
									<h1 style="text-align: center">회원탈퇴</h1>
									<div class="central-meta">
										<div class="rounded-top text-white d-flex flex-row"
											style="height: 450px;">
											<div>
												<h1>
													<strong style="color: gray">탈퇴 안내</strong>
												</h1>
												<br> 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.

												<p>
													<strong>사용하고 계신 아이디(${ loginuser.userId })는 탈퇴할 경우
														재사용 및 복구가 불가능 합니다.</strong>
												</p>

												<p>
													<span style="color: red">탈퇴한 아이디는 본인과 타인 모두 재사용 및
														복구가 불가</span> 하오니 신중하게 선택하시기 바랍니다.
												</p>
												<br>
												<p>
													<strong>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</strong>
												</p>
												<p>회원정보 및 쪽지, 게시판, 댓글 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는
													복구되지 않습니다.</p>

												<br>

												<p>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>

												<input type="checkbox" id="delete-checkbox"><strong
													style="color: green">안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong> <br>
												<div>
													<div class="buttons">
														<button type="button" id="mypage-deletebutton" class="btn btn-primary">탈퇴하기</button>
													</div>
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

	<script type="text/javascript">
		$('#mypage-deletebutton').on('click', function(event) {
			var isCheck = $('#delete-checkbox').is(":checked");

			if (!isCheck) {
				alert("동의 체크 해주세요");
				return false;
				
			} else {
				const ok = confirm("회원 탈퇴하시겠습니까?");
				if (!ok) return;
				
				location.href="memberdelete";
				
			}
		});
		
				
	</script>
</body>
</html>