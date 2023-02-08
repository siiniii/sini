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
							<h1><img src="/project_catmoa/resources/assets/images/KakaoTalk_20221103_163528518_02.png" style="width:250px; height:45px; margin:15px"></h1>
							<h5>길고양이를 보호하기 위한 캣맘/캣대디의 커뮤니티입니다. 행복하세요 :)</h5>
							<div class="friend-logo">
								<span><img
									src="/project_catmoa/resources/assets/images/KakaoTalk_20221117_090106902.png" style="width:200px; height:190px"></span>
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
								<div class="submit-btns">
									<button class="mtr-btn signin" type="submit" value="로그인"><span>Login</span></button>
									<button class="mtr-btn signup go-signup" type="button">
										<span>Register</span>
									</button>
								</div>
							</form>
						</div>
						<div class="log-reg-area reg">
							<br><br><br><br>
							<form:form id="register_form" method="post" action="/project_catmoa/register" modelAttribute="user" >
								<div class="form-group">
									<input id="register_name" type="text" name="name" required="required" placeholder="이름을 입력해주세요" maxlength="10">
										<i class="mtrl-select"></i>
									<div style="color:green" id="name_ok">이름은 2자 이상이어야 합니다.</div>
									<div style="color:red" id="name_no">이름의 형식이 잘못되었습니다.</div>
									<form:errors path="name" class="error"/>
																			
								</div>
								<div class="form-group">
									<input id="register_id" type="text" name="userId" required="required" placeholder="아이디를 입력해주세요" maxlength="10">
										<i class="mtrl-select"></i>
									<div style="color:green; display:none" id="id_ok">사용 가능한 아이디 입니다.</div>
									<div style="color:red; display:none" id="id_no">이미 사용 중인 아이디 입니다.</div>
										<form:errors path="userId" class="error"/>
										
								</div>
								<div class="form-group">
									<input id="register_nick" type="text" name="nic" required="required" placeholder="닉네임을 입력해주세요" maxlength="10">
										<i class="mtrl-select"></i>
									<div style="color:green" id="nic_ok">사용 가능한 닉네임 입니다.</div>
									<div style="color:red" id="nic_no">이미 사용 중인 닉네임 입니다.</div>
										<form:errors path="nic" class="error"/>
										
								</div>
								<div class="form-group">
									<input id="register_pw" type="password" name="passwd" required="required" placeholder="비밀번호를 입력해주세요" maxlength="20">
										<i class="mtrl-select"></i>
									<div style="color:green" id="passwd_ok">비밀번호는 6~20개의 영문자+특수문자여야 합니다.</div>
									<div style="color:red" id="passwd_no">비밀번호 형식이 잘못되었습니다.</div>
										<form:errors path="passwd" class="error"/>
										
								</div>

								<div class="form-group">
									<input id="register_rpw" type="password" required="required" placeholder="비밀번호를 한번 더 입력해주세요" maxlength="20">
										<i class="mtrl-select"></i>
								</div>
								<div>
									<span style="color: red;">*</span>연령대를 선택해주세요 
										<select id="register_age" name="age"
											class="age_choice" style="color: black;">
											<option value="1">선택해주세요</option>
											<option value="2">미성년자</option>
											<option value="3">20대</option>
											<option value="4">30대</option>
											<option value="5">40대</option>
											<option value="6">50대</option>
											<option value="7">60대</option>
											<option value="8">70대 이상</option>
										</select>
								</div>
								<br>
								
								<!-- 이메일 일단 주석처리해놨음(자리부족) -->
								<!-- <div class="form-group">	
							  <input type="text" required="required">
							  <label class="control-label" for="input">
							  <a href="https://wpkixx.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6c29010d05002c">이메일을 입력해주세요</a>
							  </label><i class="mtrl-select"></i>
							</div> -->

								<div>
									<span style="color: red;">*</span><label for="phone">전화번호</label><br/> 
										<select id="register_num" name="firstPhone" class="num_choice" style="color: black; width:50%;">
											<option value="1">010</option>
											<option value="2">011</option>
											<option value="3">012</option>
											<option value="4">013</option>
											<option value="5">014</option>
										</select>
									<input id="register_num2" type="text" name="middlePhone" style="width: 70px;" maxlength="4"> -
									<input id="register_num3" type="text" name="lastPhone" style="width: 70px;" maxlength="4">
								</div>
									<br/>
								<div>
									
									<span style="color: red;">*</span> <label for="address">주소</label><br/>
									<input type="text" name="zipcode" id="zipcode" placeholder="우편번호">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" name="address" id="address" placeholder="기본주소" style="width:370px; margin-top:2px"><br>
									<input type="text" name="userdetail" id="detailAddress" placeholder="상세주소" style="width:250px; margin-top:2px">
									<input type="hidden" name="addressType" id="addressType">
									<input type="hidden" name="sido" id="sido">
									<input type="hidden" name="gugun" id="gugun">
									<input type="hidden" name="dong" id="dong">
									
								</div>
									<br/>
								<div>
									<span style="color: red;">*</span>성별을 선택해주세요
									<div class="form-radio">
										<div class="radio">
											<label> 
											<input type="radio" name="sex" id="register_gender" value="1">
											<i class="check-box"></i>남성
											</label>
										</div>
										<div class="radio">
											<label> 
											<input type="radio" name="sex" id="register_gender" value="2"><i
												class="check-box"></i>여성
											</label>
										</div>
									</div>
								</div>
								<div id="register_root">
									<span style="color: red;">*</span>유입경로를 선택해주세요<span style="font-size: 10px;">(중복가능)</span>
									<div class="form-radio">
										<div class="radio">
											<label> <input type="checkbox" name="inflow_code" value="1"
												><i class="check-box"></i>SNS
											</label>
										</div>
										<div class="radio">
											<label> <input type="checkbox" name="inflow_code" value="2"><i
												class="check-box"></i>youtube
											</label>
										</div>
										<div class="radio">
											<label> <input type="checkbox" name="inflow_code" value="3"><i
												class="check-box"></i>인터넷
											</label>
										</div>
										<div class="radio">
											<label> <input type="checkbox" name="inflow_code" value="4"><i
												class="check-box"></i>지인소개
											</label>
										</div>
									</div>
								</div>
								<div class="submit-btns">
									<button id="register_btn" class="mtr-btn signup"><span>Finish</span></button>
									<a href="/project_catmoa/intro" title="" class="already-have" id="already_btn" onClick="window.location.reload()">이미 계정이 있습니다</a>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script> -->
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<script src="/project_catmoa/resources/assets/js/intro.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

	 <!-- 다음 카카오 지도 -->
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var dong = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if ( data.userSelectedType === 'R' ) { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                 	
                	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        dong += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y') {
                        dong += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                	dong = data.bname;
                }                

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
/*                 if(data.userSelectedType === 'R') {
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("dong").value = dong;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                } */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("addressType").value = data.userSelectedType;
                document.getElementById("sido").value = data.sido;
                document.getElementById("gugun").value = data.sigungu;
                document.getElementById("dong").value = dong;
                // 커서를 상세주소 필드로 이동한다.--> detailAddress에 시/구가 오게 하자 
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>


<script>
// ------------------------------------로그인 검사---------------------------------------

	$(function() {
		<c:if test="${ not empty loginfail }">
			alert('회원 정보가 없습니다');
		</c:if>
	});
	
	$(function() {
		<c:if test="${ not empty registerfail }">
			$(".go-signup").trigger("click")
		</c:if>
	});

// ---------------------------------아이디 유효성/중복 검사---------------------------------------

	$('#id_ok').html("아이디는 6~10개의 영문자 숫자 조합입니다.").show();
    $('#id_no').html("").hide();
    
 	$('#register_id').keyup(function() {
 		
		// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
		var id_regExp = /^[A-Za-z]+[0-9]+$/;
		var data = $('#register_id').val()// data값이 "register_id"인 입력란의 값을 저장
		
			if(data.length == 0) {
				
				$('#id_ok').html("아이디는 6~10개의 영문자 숫자 조합입니다.").show();
				$('#id_no').html("").hide();
			}
		
			/*
			else if(data.length < 6 ) {
				$('#id_no').html("아이디 형식이 잘못 되었습니다.").show();
			 	$('#id_ok').html("").hide();
				return;
			}
		
			if (data.length == 0) {
				$('#id_ok').html("아이디는 6~10개의 영문자 숫자 조합입니다.").show();
				$('#id_no').html("").hide();
				return;
			}
			*/
			var valid = id_regExp.test(data)
			if (!valid) {
				$('#id_no').html("아이디는 6~10개의 영문자 숫자 조합입니다.").show();
				$('#id_no').css("color", "red").show();
				$('#id_ok').html("").hide();
				return;
			}
				
		$.ajax({
			"url": "idcheck",
            "method": "post",
            "data": "userId=" + data,
			"success": function(data) {
				
				  if (data == "success") {
					  $('#id_ok').html("[중복검사] 사용 가능 합니다.").show;
					  $('#id_ok').css("color","green").show();
					  $('#id_no').html("").hide;
					  $('#register_btn').prop("disabled", false);
					  $('#register_btn').removeAttr("disabled");
					 	 return;
				} else {
					  $('#id_no').html("이미 누군가 사용 중 입니다.").show();
					  $('#id_ok').html("").hide;
					  $('#register_btn').prop("disabled", true);
					  $('#register_btn').attr("disabled","disabled");
					 	 return;
				}
			}
		})
		$('#id_ok').html("").show();
	    $('#id_no').html("").hide();
 	});
 //-----------------------------------비밀번호 검사------------------------------------------ 
 
 	$('#passwd_ok').html("비밀번호는 6~20개의 영문자+특수문자여야 합니다").show();
 	$('#passwd_no').html("").hide();
	$('#register_pw').keyup(function() {
 		
		// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
		var passwd_regExp = /^[A-Za-z0-9+]+[@!#$]{1,}$/;
		var passdata = $('#register_pw').val()// data값이 "register_id"인 입력란의 값을 저장
		
			if (passdata.length == 0) {
				
				$('#passwd_ok').html("비밀번호는 6~20개의 영문자+숫자+특수문자여야 합니다").show();
				$('#passwd_no').html("").hide();
				
			} 
		
			/* else if(passdata.length < 6 ) {
			
				$('#passwd_no').html("비밀번호는 6~20개의 영문자+특수문자여야 합니다").show();
				$('#passwd_ok').html("").hide();
				
				return;
			} */
		
			var valid = passwd_regExp.test(passdata)
			if (!valid) {
				$('#passwd_no').html("비밀번호는 6~20개의 영문자+특수문자여야 합니다").show();
				$('#passwd_no').css("color", "red").show();
				$('#passwd_ok').html("").hide();
				return;
			} 

		$('#passwd_no').html("").show();
		$('#passwd_ok').html("비밀번호는 6~20개의 영문자+특수문자여야 합니다").show();
 	});
	
	//------------------------------------이름 검사------------------------------------------
	
	$('#name_ok').html("이름은 2자 이상이어야 합니다").show();
	$('#name_no').html("").hide();
	
	$('#register_name').keyup(function() {
		
		var name_regExp = /^[A-Za-z|가-힣]{2,}$/;
		var namedata = $('#register_name').val()
		
			if (namedata.length == 0) {
				
				$('#name_ok').html("이름은 2자 이상이어야 합니다").show();
				$('#name_no').html("").hide();
				return;
			}	
			/* 	else if(name_no.length < 2) {
				
				$('#name_no').html("이름 형식이 잘못되었습니다.").show();
				$('#name_ok').html("").hide();
				return; */
			var valid = name_regExp.test(namedata)
			if (!valid) {
				$('#name_no').html("이름의 형식이 잘못되었습니다.").show();
				$('#name_no').css("color", "red").show();
				$('#name_ok').html("").hide();
				return;	
			}
		
		$('#name_no').html("").hide();
		$('#name_ok').html("이름은 2자 이상이어야 합니다").show();
	});
 
 //--------------------------------닉네임 유효성/중복 검사------------------------------------------ 
 
 	$('#nic_ok').html("닉네임은 특수문자없는 2~10자리여야 합니다.").show();
    $('#nic_no').html("").hide();
    
 	$('#register_nick').keyup(function() {
 		//닉네임 서버로 전송 > DB 유효성 검사 > 결과 반환받기
 		var nic_regExp = /^[A-Za-z|가-힣|0-9]{2,}$/;
 		var nicdata = $('#register_nick').val()	// data값이 register_nik인 입력란의 값을 저장
 		
 		
			if (nicdata.length == 0) {
					$('#nic_ok').html("닉네임은 특수문자없는 2~10자리여야 합니다.").show();
					$('#nic_no').html("").hide();
					return;
				} 
			/* 	else if(nicdata.length < 2) {
						
						$('#nic_ok').html("").hide();
						$('#nic_no').html("").hide();
						$('#nic_error').html("닉네임 형식이 잘못 되었습니다.").show();
						return;
					} */
 		
			var valid = nic_regExp.test(nicdata)
			if (!valid) {
				$('#nic_ok').html("닉네임 형식이 잘못되었습니다.").show();
				$('#nic_ok').css("color", "red").show();
				$('#nic_no').html("").hide();
				return;
			}
		
 		$.ajax({
 			"url": "niccheck",
            "method": "post",
            "data": "nic=" + nicdata,
			"success": function(nicdata) {
				  if (nicdata == "success") {
					  $('#nic_ok').html("[중복검사] 사용 가능 합니다.").show();
					  $('#nic_ok').css("color","green").show();
					  $('#register_btn').prop("disabled", false);
					  $('#register_btn').removeAttr("disabled");
					  	return;
				} else {
					  $('#nic_no').html("이미 누군가 사용 중 입니다.").show();
					  $('#nic_ok').html("").hide();
					  $('#register_btn').prop("disabled", true);
					  $('#register_btn').attr("disabled","disabled");
					    return;
				}
			}
		})
			$('#nic_ok').html("").show();
		    $('#nic_no').html("").show();
	});
 	
 	

 	$(function() {
 		
 	});

	</script>
	
	<div class="strp-spinner-move" style="display: none;">
		<div class="strp-spinner" style="display: none;">
			<div class="strp-spinner-rotate"
				style="animation: 1s steps(80) 0s infinite normal none running strp-spinner-spin;">
				<div class="strp-spinner-frame"
					style="opacity: 0.01; transform: rotate(4.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.03; transform: rotate(9deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.04; transform: rotate(13.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.05; transform: rotate(18deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.06; transform: rotate(22.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.08; transform: rotate(27deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.09; transform: rotate(31.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.1; transform: rotate(36deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.11; transform: rotate(40.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.13; transform: rotate(45deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.14; transform: rotate(49.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.15; transform: rotate(54deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.16; transform: rotate(58.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.18; transform: rotate(63deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.19; transform: rotate(67.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.2; transform: rotate(72deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.21; transform: rotate(76.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.23; transform: rotate(81deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.24; transform: rotate(85.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.25; transform: rotate(90deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.26; transform: rotate(94.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.28; transform: rotate(99deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.29; transform: rotate(103.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.3; transform: rotate(108deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.31; transform: rotate(112.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.33; transform: rotate(117deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.34; transform: rotate(121.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.35; transform: rotate(126deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.36; transform: rotate(130.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.38; transform: rotate(135deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.39; transform: rotate(139.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.4; transform: rotate(144deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.41; transform: rotate(148.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.43; transform: rotate(153deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.44; transform: rotate(157.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.45; transform: rotate(162deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.46; transform: rotate(166.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.48; transform: rotate(171deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.49; transform: rotate(175.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.5; transform: rotate(180deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.51; transform: rotate(184.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.53; transform: rotate(189deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.54; transform: rotate(193.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.55; transform: rotate(198deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.56; transform: rotate(202.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.58; transform: rotate(207deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.59; transform: rotate(211.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.6; transform: rotate(216deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.61; transform: rotate(220.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.63; transform: rotate(225deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.64; transform: rotate(229.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.65; transform: rotate(234deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.66; transform: rotate(238.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.68; transform: rotate(243deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.69; transform: rotate(247.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.7; transform: rotate(252deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.71; transform: rotate(256.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.73; transform: rotate(261deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.74; transform: rotate(265.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.75; transform: rotate(270deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.76; transform: rotate(274.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.78; transform: rotate(279deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.79; transform: rotate(283.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.8; transform: rotate(288deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.81; transform: rotate(292.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.83; transform: rotate(297deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.84; transform: rotate(301.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.85; transform: rotate(306deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.86; transform: rotate(310.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.88; transform: rotate(315deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.89; transform: rotate(319.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.9; transform: rotate(324deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.91; transform: rotate(328.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.93; transform: rotate(333deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.94; transform: rotate(337.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.95; transform: rotate(342deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.96; transform: rotate(346.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.98; transform: rotate(351deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 0.99; transform: rotate(355.5deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
				<div class="strp-spinner-frame"
					style="opacity: 1; transform: rotate(360deg);">
					<div class="strp-spinner-line" style="background: rgb(84, 84, 84);"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="strp-window strp-measured strp-window-skin-strip">
		<div class="strp-pages"></div>
		<div class="strp-nav strp-nav-previous" style="display: none;">
			<div class="strp-nav-button" style="display: none;">
				<div class="strp-nav-button-background"></div>
				<div class="strp-nav-button-icon"></div>
			</div>
		</div>
		<div class="strp-nav strp-nav-next" style="display: none;">
			<div class="strp-nav-button" style="display: none;">
				<div class="strp-nav-button-background"></div>
				<div class="strp-nav-button-icon"></div>
			</div>
		</div>
		<div class="strp-close">
			<div class="strp-close-background"></div>
			<div class="strp-close-icon"></div>
		</div>
	</div>
	<div id="topcontrol" title="Scroll Back to Top"
		style="position: fixed; bottom: 10px; right: 5px; opacity: 0; cursor: pointer;">
		<i class="fa fa-angle-up"></i>
	</div>
</body>
</html>