<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<title>CATMOA</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

	<style type="text/css">
			.error {
			color:red;
			font-weight:bold;
			font-size:10px;
			}
	</style>
		
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />

</head>
<body>
	<!--<div class="se-pre-con"></div>-->
	<div class="theme-layout">
		<div class="container-fluid pdng0">
			<div class="row merged">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="land-featurearea">
						<div class="land-meta">
							<h1>CATMOA</h1>
							<p>길고양이를 보호하기 위한 캣맘/캣대디의 커뮤니티입니다. 행복하세요 :)</p>
							<div class="friend-logo">
								<span><img
									src="/project_catmoa/resources/assets/images/wink.png" alt=""></span>
							</div>
							<a href="/project_catmoa/home-feeding" title="" class="folow-me" id="home_btn" >Let's start!</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="login-reg-bg">
						<div class="log-reg-area sign">
							<h2 class="log-title">Login</h2>
							<form id="login_form" method="post" action="/project_catmoa/login">
								<div class="form-group">
									<input type="text" required="required" name="userId" id="userid"> 
									<label class="control-label" for="input">Username</label><i class="mtrl-select"></i>
								</div>
								<div class="form-group">
									<input type="password" required="required" name="passwd" id="user_passwd"> <label
										class="control-label" for="input">Password</label><i class="mtrl-select"></i>
								</div>
								<div class="checkbox">
									<label> <input type="checkbox" checked="checked">
									<i class="check-box"></i>Always Remember Me.
									</label>
								</div>
								
								<!-- 네이버 아이디로 로그인 -->
								<div id="naver_id_login"></div>
								
								<a href="#" title="" class="forgot-pwd">Forgot Password?</a>
								<div class="submit-btns">
									<button class="mtr-btn signin" type="submit" value="로그인"><span>Login</span></button>
									<button class="mtr-btn signup go-signup" type="button">
										<span>Register</span>
									</button>
								</div>
							</form>
						</div>

	<!-- <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script> -->
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<script src="/project_catmoa/resources/assets/js/intro.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

	<script>

 	//-------------------------------------네이버 로그인 콜백--------------------------------------
 	
	var naver_id_login = new naver_id_login("tAABP2SiFjAottI_qvLi", "http://localhost:8081/project_catmoa/naver-login-callback");
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
	    /* alert(naver_id_login.getProfileData('id'));
	    alert(naver_id_login.getProfileData('nickname'));
	    alert(naver_id_login.getProfileData('phone')); */
	   	alert('로그인 성공');
	    const id = naver_id_login.getProfileData('id');
	   
	    location.herf="naver-login-sucess?id=" + id;
	  }
	
 	$(function() {
 	
 	});

	</script>
	
</body>
</html>