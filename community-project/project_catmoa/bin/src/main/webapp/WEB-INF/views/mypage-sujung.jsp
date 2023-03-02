<%@page import="com.project_catmoa.dto.IntroDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
										<div class="editing-info">
											<h5 id="membership-sujung" class="f-title"><i class="ti-lock"></i>내 정보 수정</h5>
											<form method="post" action="Mypagelogin">
												<div class="form-group">	
												  <input type="text" id="input_id" name="userId" required="required" placeholder="아이디를 입력해주세요" />
													<i class="mtrl-select"></i>
												</div>
												<div class="form-group">	
												  <input type="password" id="input_passwd" name="passwd" required="required" placeholder="비밀번호를 입력해주세요"/>
												  <i class="mtrl-select"></i>
												</div>
												<div class="submit-btns" style="text-align:center">
													<a href="/project_catmoa/mypagelogin">
													<button type="submit" value="확인" class="mtr-btn" id="conf-btn" style="width:100%">
														<span>확인</span></button></a>
												</div>
											</form>
										</div>
									</div>	
								</div><!-- centerl meta -->
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
								</div><!-- sidebar -->
							</div>	
						</div>
					</div>
				</div>
			</div>	
		</section>
	</div>
	
		 <!-- ======= footder ======= -->
			<jsp:include page="/WEB-INF/views/module/footer.jsp" />
		<!-- =======End footder =======-->
		
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<script type="text/javascript">

	$('#conf-btn').click(function(event) {
		
		if ($('#input_id').val().length == 0 ) {
			alert("아이디와 비밀번호를 입력해 주세요");
			return false;
		} else if ($('#input_passwd').val().length == 0 ) { 
			alert("비밀번호를 입력해 주세요");
			return false;
		}
	});
	
	</script>
	
</body>	
</html>