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
									<h1 style="text-align: center">내 정보수정</h1>
									<div class="central-meta">
										<div class="rounded-top text-white d-flex flex-row"
											style="height: 200px;">
											<div class="ms-4 mt-5 d-flex flex-column"
												style="width: 150px;">
												
												<c:choose>
													<c:when test="${ not empty loginuser.memberImg }">
														<img
															src="/project_catmoa/resources/images/${ loginuser.memberImg }"
															alt="" style="width: 200px">
													</c:when>
													<c:otherwise>
														<img
															src="/project_catmoa/resources/assets/images/kakaoImg.jpg"
															alt="" style="width: 200px">
													</c:otherwise>
												</c:choose>
												
											</div>
											<div class="ms-3"
												style="margin-top: 130px; margin-left: 10px; border: 0">
												<h5>
													<input style="color: black; background-color: none;"
														type="text" name="name" required="required"
														value="${ loginuser.name }" disabled>
												</h5>
												<p>
													<input style="color: black; background-color: none;"
														id="register_id" type="text" name="userId"
														required="required" value="ID: ${ loginuser.userId }"
														disabled>
												</p>
											</div>
										</div>
										<br />
										<br />
										<br />
										<br />
										<div class="">
											<form method="post" action="mypagesujung2"
												id="mypage-edit-form">
												<div class="form-group">
													<input type="hidden" name="userId"
														value="${ loginuser.userId }"> <input
														id="register_nick" type="text" name="nic"
														required="required" maxlength="10"
														value="${ loginuser.nic }"> <i class="mtrl-select"></i>
													<div style="color: green" id="nic_ok">사용 가능한 닉네임 입니다.</div>
													<div style="color: red" id="nic_no">이미 사용 중인 닉네임 입니다.</div>
												</div>
												<br>
												<div>
													<span style="color: red;">*</span><label for="phone">전화번호</label><br />
													<select id="register_num" name="firstPhone"
														class="num_choice" style="color: black; width: 50%;"
														value="${loginuser.firstPhone}">
														<option value="1">010</option>
														<option value="2">011</option>
														<option value="3">012</option>
														<option value="4">013</option>
														<option value="5">014</option>
													</select> <input id="register_num2" type="text" name="middlePhone"
														value="${loginuser.middlePhone}" style="width: 70px;"
														maxlength="4"> - <input id="register_num3"
														type="text" name="lastPhone"
														value="${loginuser.lastPhone}" style="width: 70px;"
														maxlength="4">
												</div>
												<br />
												<div>

													<span style="color: red;">*</span> <label for="address">주소</label><br />
													<input type="text" name="zipcode" id="zipcode"
														placeholder="우편번호" value="${ loginuser.zipcode }">
													<input type="button" onclick="sample6_execDaumPostcode()"
														value="우편번호 찾기"><br> <input type="text"
														name="address" id="address" placeholder="기본주소"
														style="width: 370px; margin-top: 2px"
														value="${ loginuser.address }"><br> <input
														type="text" name="userdetail" id="detailAddress"
														placeholder="상세주소" style="width: 250px; margin-top: 2px"
														value="${ loginuser.userdetail }"> <input
														type="hidden" name="addressType" id="addressType"
														value="${ loginuser.addressType }"> <input
														type="hidden" name="sido" id="sido"
														value="${ loginuser.sido }"> <input type="hidden"
														name="gugun" id="gugun" value="${ loginuser.gugun }">
													<input type="hidden" name="dong" id="dong"
														value="${ loginuser.dong }">

												</div>
												<br />
												<div class="submit-btns">
													<button type="submit" class="mtr-btn signup"
														style="width: 100%" id="mypage-updatebutton">
														<span>수정</span>
													</button>
												</div>
											</form>
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

	<!-- 다음 카카오 지도 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var dong = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;

								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									dong += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									dong += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
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

		//--------------------------------닉네임 유효성/중복 검사------------------------------------------ 

		$('#nic_ok').html("닉네임은 특수문자없는 2~10자리여야 합니다.").show();
		$('#nic_no').html("").hide();

		$('#register_nick').keyup(function() {
			//닉네임 서버로 전송 > DB 유효성 검사 > 결과 반환받기
			var nic_regExp = /^[A-Za-z|가-힣|0-9]{2,}$/;
			var nicdata = $('#register_nick').val() // data값이 register_nik인 입력란의 값을 저장

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
				$('#nic_ok').html("닉네임을 사용할 수 없습니다.").show();
				$('#nic_ok').css("color", "red").show();
				$('#nic_no').html("").hide();
				return;
			}

			$.ajax({
				"url" : "niccheck",
				"method" : "post",
				"data" : "nic=" + nicdata,
				"success" : function(nicdata) {
					if (nicdata == "success") {
						$('#nic_ok').html("사용 가능 합니다.").show();
						$('#nic_ok').css("color", "green").show();
						$('#register_btn').prop("disabled", false);
						$('#register_btn').removeAttr("disabled");
						return;
					} else {
						$('#nic_no').html("사용할 수 없습니다.").show();
						$('#nic_ok').html("").hide();
						$('#register_btn').prop("disabled", true);
						$('#register_btn').attr("disabled", "disabled");
						return;
					}
				}
			});

			$('#nic_ok').html("").show();
			$('#nic_no').html("").show();

		});

		$('#mypage-updatebutton').on('click', function(event) {
			$('#mypage-edit-form')[0].submit();
		});
	</script>

</body>

</html>