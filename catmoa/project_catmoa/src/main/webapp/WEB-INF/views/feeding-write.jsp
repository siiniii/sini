<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	<form id="report-write-form" action="feeding-write" method="post"
					enctype="multipart/form-data">
		<div class="new-postbox">
			<!-- 			<figure> -->
			<!-- 				<img src="images/resources/admin3.jpg" alt=""> -->
			<!-- 			</figure> -->
			<div class="newpst-input">
					<div class="form-group">
						<input type="hidden" name="boardGroupNo" value="${ boardGroupNo }">
						<input type="hidden" name="userId" value="${ loginuser.userId }">
						<input type="hidden" name="localNo" value=""> <input
							type="hidden" name="catsId" value=""> <label
							for="exampleFormControlInput1">제목</label> <input type="text"
							class="form-control" name="boardTitle" placeholder="제목">
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

						<div id="catImg"></div>

					</div>

					<!-- 첨부파일 -->
					<div>
						<label for="exampleFormControlInput1">첨부파일</label> <input
							id="attach" type="file" class="form-control" name="attach"
							accept="image/*" style="width: 300px">
					</div>
					<div>
						<c:forEach varStatus="s" var="catinfomation"
							items="${ catinfomations }">
							<img
								src="/project_catmoa/resources/assets/images/resources/${catinfomation.catImage}"
								class="img-fluid" data-local="${ local.localNo }">
						</c:forEach>
					</div>
			</div>
			<div>
				<textarea class="form-control" name="feedingContent" rows="3"></textarea>
			</div>
			<div>
				<button type="button" class="btn btn-primary" id="write-btn">제출</button>
			</div>
		</div>
		</form>
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

			$('#catCitySelect').on('click', 'a', function(event) {
				const city = $(this).data('city'); // 사용자가 선택한 시도명
				$('.city-select-btn').text(city);

				// ajax 요청
				$('#catGuSelect').empty();
				$.ajax({
						"url" : "load-gu-list",
						"method" : "get",
						"data" : "city=" + city,
						"dataType" : "json",
						"success" : function(data, status, xhr) {
									$.each(data, function(idx, v) {
										const a = "<a class='dropdown-item' href='#' data-gu='" + v + "'>" + v + "</a>";
										$('#catGuSelect').append(a);
									});
						},
						"error" : function(xhr, status, err) {
							alert('fail');
						}
					});
				});

			$('#catGuSelect').on('click', 'a', function(event) {
				$('#catGuSelect a').removeClass('active');
				$(this).addClass('active');

				const gu = $(this).data('gu'); // 사용자가 선택한 구군명
				$('.gu-select-btn').text(gu);

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
																	const a = "<a class='dropdown-item select-gu' href='#' data-localno='" + area.localNo + "'>"
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
			
				// ajax 요청
				$('#catAreaSelect').empty();
				$.ajax({
							"url" : "load-area-list",
							"method" : "get",
							"data" : "gu=" + gu,
							"dataType" : "json",
							"success" : function(data, status, xhr) {
								$.each(data, function(idx, area) {
									const a = "<a class='dropdown-item' href='#' data-localno='" + area.localNo + "'>" + area.area + "</a>";
									$('#catAreaSelect').append(a);
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
				var localNo = $(this).data('localno');
				$('input[name=localNo]').val(localNo);
				$('.area-select-btn').text(area);
				
				$('#catImg').load("showCatImgList?localNo=" + localNo);
				
			});
			
			$('#write-btn').on('click', function(event) {
				
				event.preventDefault();
				
				if($('#attach').val().length == 0 ) {
					alert("사진을 업로드해주세요");
					return false;
				}
				
				const localNo = $('#catAreaSelect a.active').data('localno');
				$('#report-write-form input[name=localNo]').val(localNo);
				
				$('#report-write-form')[0].submit();
				
				
			});
			
		$('#catImg').on('click','.select-cat-img',function(event) {
			var catsId = $(this).data('cats-id');
			alert('선택');
			$('input[name=catsId]').val(catsId);
		})
			
	
		});
	</script>


</body>

</html>