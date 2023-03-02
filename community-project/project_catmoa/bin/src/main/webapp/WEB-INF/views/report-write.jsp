<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>report-write-form</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/topbar.jsp" />

	<div class="central-meta">
		<div class="new-postbox">
			<!-- 			<figure> -->
			<!-- 				<img src="images/resources/admin3.jpg" alt=""> -->
			<!-- 			</figure> -->
			<div class="newpst-input">
				<form id="report-write-form" action="report-write" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<input type="hidden" name="boardGroupNo" value="${ boardGroupNo }">
						<input type="hidden" name="userId" value="${ loginuser.userId }">
						<input type="hidden" name="localNo" value="">
						<label for="exampleFormControlInput1">제목</label> 
						<input type="text" class="form-control" name="boardTitle" placeholder="제목">
					</div>

					<div class="form-group">
						<div class="row">
							<div class="dropdown col-4">
								<button
									class="btn btn-outline-primary dropdown-toggle col-12 city-select-btn"
									type="button" data-toggle="dropdown" aria-expanded="false">
									지역을 선택하세요</button>
								<div class="dropdown-menu col-12" id="catCitySelect">
									<c:forEach var="city" items="${ feedingArea }">
										<a class="dropdown-item active" href="#" data-city="${ city }">${ city }</a>
									</c:forEach>
								</div>
							</div>
							<div class="dropdown col-4">
								<button
									class="btn btn-outline-primary dropdown-toggle col-12 gu-select-btn"
									type="button" data-toggle="dropdown" aria-expanded="false">
									구를 선택하세요</button>
								<div class="dropdown-menu col-12" id="catGuSelect">
									<a class="dropdown-item active" href="#" data-gu="">구를
										선택하세요</a>
								</div>
							</div>
							<div class="dropdown col-4">
								<button
									class="btn btn-outline-primary dropdown-toggle col-12 area-select-btn"
									type="button" data-toggle="dropdown" aria-expanded="false">
									동을 선택하세요</button>
								<div class="dropdown-menu col-12" id="catAreaSelect">
									<a class="dropdown-item active" href="#" data-area="">동을
										선택하세요</a>
								</div>
							</div>

						</div>

						<!-- 고양이 색상 -->
						<select id="catcolorSelect" name="colorCode">
							<option selected>고양이 색상을 선택해주세요.</option>
							<c:forEach var="color" items="${ color }">
								<option value="${ color.colorCode }">${ color.colorName }</option>
							</c:forEach>
						</select>

						<!-- 특징 -->
						<div class="catchar">
							<input id="catchar" name="characteristic" required="required"
								placeholder="고양이 특징을 작성해주세요" maxlength="100">
						</div>
						<!-- 별명 -->
						<div class="catnic">
							<input id="catnic" name="catNickname" required="required"
								placeholder="고양이의 별명을 작성해주세요" maxlength="20">

							<!-- 성별 -->
							<div>
								<span style="color: red;">*</span>고양이의 성별을 선택해주세요
								<div class="form-radio">
									<div class="radio">
										<label> <input type="radio" name="catGender" id="cat_sex"
											value="1"> <i class="check-box"></i>수컷
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="catGender" id="cat_sex"
											value="2"><i class="check-box"></i>암컷
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="catGender" id="cat_sex"
											value="3"><i class="check-box"></i>미상
										</label>
									</div>
								</div>

							</div>

							<!-- 중성화YN -->
							<div>
								<span style="color: red;">*</span>고양이 중성화 여부를 선택해주세요
								<div class="form-radio">
									<div class="radio">
										<label> <input type="radio" name="tnrYn" id="tnr_YN"
											value="1"> <i class="check-box"></i>YES
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="tnrYn" id="tnr_YN"
											value="2"><i class="check-box"></i>NO
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="tnrYn" id="tnr_YN"
											value="3"><i class="check-box"></i>미상
										</label>
									</div>
								</div>
							</div>



							<!-- 목격일시 -->
							<span style="color: red;">*</span>
							<label for="phone">고양이를
								목격한 날짜를 선택해주세요</label>
							<select id="catMonth" name="catMonth"
								class="catMonth" style="color: black; width: 50%;">
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
							<select id="catDay" name="catDay" class="catDay"
								style="color: black; width: 50%;">
								<option value="1">1일</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
								<option value="4">4일</option>
								<option value="5">5일</option>
								<option value="6">6일</option>
								<option value="7">7일</option>
								<option value="8">8일</option>
								<option value="9">9일</option>
								<option value="10">10일</option>
								<option value="11">11일</option>
								<option value="12">12일</option>
								<option value="13">13일</option>
								<option value="14">14일</option>
								<option value="15">15일</option>
								<option value="16">16일</option>
								<option value="17">17일</option>
								<option value="18">18일</option>
								<option value="19">19일</option>
								<option value="20">20일</option>
								<option value="21">21일</option>
								<option value="22">22일</option>
								<option value="23">23일</option>
								<option value="24">24일</option>
								<option value="25">25일</option>
								<option value="26">26일</option>
								<option value="27">27일</option>
								<option value="28">28일</option>
								<option value="29">29일</option>
								<option value="30">30일</option>
								<option value="31">31일</option>
							</select> <select id="catHour" name="catHour" class="catHour"
								style="color: black; width: 50%;">
								<option value="0">목격 시간을 선택해주세요</option>
								<option value="1">00시~1시</option>
								<option value="2">1시~2시</option>
								<option value="3">2시~3시</option>
								<option value="4">3시~4시</option>
								<option value="5">4시~5시</option>
								<option value="6">5시~6시</option>
								<option value="7">6시~7시</option>
								<option value="8">7시~8시</option>
								<option value="9">8시~9시</option>
								<option value="10">9시~10시</option>
								<option value="11">10시~11시</option>
								<option value="12">11시~12시</option>
								<option value="13">12시~13시</option>
								<option value="14">13시~14시</option>
								<option value="15">14시~15시</option>
								<option value="16">15시~16시</option>
								<option value="17">16시~17시</option>
								<option value="18">17시~18시</option>
								<option value="19">18시~19시</option>
								<option value="20">19시~20시</option>
								<option value="21">20시~21시</option>
								<option value="22">21시~22시</option>
								<option value="23">22시~23시</option>
								<option value="24">23~24시</option>
							</select>
						</div>
						<!-- 첨부파일 -->
						<div>
							<label for="exampleFormControlInput1">첨부파일</label> 
							<input id= "reportAttach" type="file" class="form-control" name="reportAttach" accept="image/*" style="width: 300px">
						</div>
					</div>
					<div>
					<textarea class="form-control" name="boardContent" rows="3"></textarea>
					</div>
					<div>
					<button type="button" class="btn btn-primary" id="write-btn">제출</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />

	<script type="text/javascript">
		$(function() {
			/* $.ajax({
				"url": "load-city-list",
				"method": "get",
				"dataType": "json",
				"success": function(data, status, xhr) {
					$.each(data, function(idx, v) {
						const a = "<a class='dropdown-item' href='#' data-city='" + v + "'>" + v +"</a>";
						$('#city').append(a);
					});
				},
				"error": function(xhr, status, err) {
					alert('fail');
				}
			}); */

			$('#catCitySelect')
					.on(
							'click',
							'a',
							function(event) {

								const city = $(this).data('city'); // 사용자가 선택한 시도명
								$('.city-select-btn').text(city);

								// ajax 요청
								$('#catGuSelect').empty();
								$
										.ajax({
											"url" : "load-gu-list",
											"method" : "get",
											"data" : "city=" + city,
											"dataType" : "json",
											"success" : function(data, status,
													xhr) {
												$
														.each(
																data,
																function(idx, v) {
																	const a = "<a class='dropdown-item' href='#' data-gu='" + v + "'>"
																			+ v
																			+ "</a>";
																	$(
																			'#catGuSelect')
																			.append(
																					a);
																});
											},
											"error" : function(xhr, status, err) {
												alert('fail');
											}
										});

							});

			$('#catGuSelect')
					.on(
							'click',
							'a',
							function(event) {
								$('#catGuSelect a').removeClass('active');
								$(this).addClass('active');

								const gu = $(this).data('gu'); // 사용자가 선택한 구군명
								$('.gu-select-btn').text(gu);

								// ajax 요청
								$('#catAreaSelect').empty();
								$
										.ajax({
											"url" : "load-area-list",
											"method" : "get",
											"data" : "gu=" + gu,
											"dataType" : "json",
											"success" : function(data, status,
													xhr) {
												$
														.each(
																data,
																function(idx,
																		area) {
																	const a = "<a class='dropdown-item' href='#' data-localno='" + area.localNo + "'>"
																			+ area.area
																			+ "</a>";
																	$(
																			'#catAreaSelect')
																			.append(
																					a);
																});
											},
											"error" : function(xhr, status, err) {
												alert('fail');
											}
										});

							});

			$('#catAreaSelect').on('click', 'a', function(event) {
				$('#catAreaSelect a').removeClass('active');
				$(this).addClass('active');

				const area = $(this).text();
				$('.area-select-btn').text(area);
			});
			
			$('#write-btn').on('click', function(event) {
				
				event.preventDefault();
				
				if($('#reportAttach').val().length == 0 ) {
					alert("사진을 업로드해주세요");
					return false;
				}
				
				const localNo = $('#catAreaSelect a.active').data('localno');
				$('#report-write-form input[name=localNo]').val(localNo);
				
				$('#report-write-form')[0].submit();
				
				
			});
			
	
		});
	</script>


</body>

</html>