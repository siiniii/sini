<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>고양이제보목록</title>

<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
</head>
<body>

	<div class="theme-layout">

		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />

		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />

		<section>
			<div class="feature-photo">
			<br>
				<div class="container-fluid">
					<div class="row merged">
						<div class="col-lg-2 col-sm-3">
							<div class="user-avatar">
								<figure>
									<img src="images/resources/user-avatar.jpg" alt="">
									<form class="edit-phto">
										<i class="fa fa-camera-retro"></i> <label
											class="fileContainer"> Edit Display Photo <input
											type="file" />
										</label>
									</form>
								</figure>
							</div>
						</div>
						<div class="col-lg-10 col-sm-9">
							<div class="timeline-info">
								<ul>
									<li class="admin-name">
									  <h5>${ loginuser.nic }</h5>
									  <span>
									  <c:choose>
									  <c:when test="${ loginuser.admin eq 1 }">
									  Admin
									  </c:when>
									  <c:otherwise>
									  User
									  </c:otherwise>
									  </c:choose>
									  </span>
									</li>
									<li>
										<a class="#" href="/project_catmoa/admins/adminMain" title=""
										data-ripple="">그래프</a>
										<a class="#" href="/project_catmoa/admins/adminUser" title="" data-ripple="">회원목록</a>
										<a class="active" href="/project_catmoa/admins/adminReport" title="" data-ripple="">고양이제보목록</a>
										<a class="#" href="/project_catmoa/admins/adminAddRegion" title="" data-ripple="">지역등록</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- top area -->
		
		<section>
			<div class="gap gray-bg">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12" style="margin-left: 100px">
								<div class="central-meta" style="width: 1700px">
									<div class="row" id="page-contents">
										<div class="col-lg-6">
											<div class="messages">
												<h5 class="f-title">
													<i class="fa fa-users" aria-hidden="true"></i>제보 리스트
												</h5>
												<div class="insight-box">
													<div class="table-responsive report-list-table-container">
														<table id="user-list-table" class="table">
															<thead>
																<tr class="table-dark">
																	<th>글번호</th>
																	<th>작성자</th>
																	<th>지역</th>
																	<th>글내용</th>
																	<th>색상</th>
																	<th>작성일자</th>
																</tr>
															</thead>
															
															<c:forEach var="report" items="${ reportList }">
																<tr class="report-tr" data-boardno="${ report.boardNo }">
																	<td>${ report.boardNo }</td>
																	<td>${ report.userId }</td>
																	<td>${ report.localName }</td>
																	<td>${ report.boardContent }</td>
																	<td>${ report.colorName }</td>
																	<td>${ report.writeTime }</td>
																</tr>
															</c:forEach>
														</table>	
														${ reportPager }
														<br>
														<br>
													</div>
												</div>
											
												<div class="report-list-detail">
												<button class="btn btn-primary report-detail-write-btn">등록</button>
													<div class="media" style="border:solid 1px">
														<img id="report-detail-catimage" class="col-6" alt="..." style="margin: 20px 10px">
														
														<div class="media-body" style="margin: 20px 10px">
															<h5 class="mt-0">글번호<span id="report-detail-boardno"></span></h5>
															<h6>작성자 : <span id="report-detail-writer"></span></h6>
															<h6>지역 : <span id="report-detail-localname"></span></h6>
															<h6>별명 : <span id="report-detail-nickname"></span></h6>
															<h6>색상 : <span id="report-detail-catcolor"></span><span id="report-detail-catcolorcode" style="display:none"></span></h6>
															<h6>성별 : <span id="report-detail-gender"></span></h6>
															<h6>중성화여부 : <span id="report-detail-tnr"></span></h6>
															<p><span id="report-detail-characteristic"></span></p>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-lg-6">
												<div class="messages">
													<div class="col-3">
														<h5 class="f-title">
															<i class="fa fa-users" aria-hidden="true"></i>등록된 고양이
														</h5>
													</div>
													<div class="col-2">
														<div class="dropdown">
														  <button class="btn btn-outline-primary dropdown-toggle col-12" type="button" data-toggle="dropdown" aria-expanded="false">
														    시/도 선택
														  </button>
														  <div class="dropdown-menu" id="sido"></div>
														</div>
													</div>
													<div class="col-2">											
														<div class="dropdown">
														  <button class="btn btn-outline-primary dropdown-toggle col-12" type="button" data-toggle="dropdown" aria-expanded="false">
														    구/군 선택
														  </button>
														  <div class="dropdown-menu col-12" id="gugun"></div>
														</div>
													</div>
													<div class="col-2">											
														<div class="dropdown">
														  <button class="btn btn-outline-primary dropdown-toggle col-12" type="button" data-toggle="dropdown" aria-expanded="false">
														    색상 선택
														  </button>
														  <div class="dropdown-menu" id="color-select">
														  <c:forEach var="catcolor" items="${ catcolors }">
														  	<a class='dropdown-item col-12' href='#' data-color='${ catcolor.colorCode }'>${ catcolor.colorName }</a>
														  </c:forEach>
														  </div>
														</div>
													</div>
													<div class="col-2">
														<button class="btn btn-primary load-cat-info-list-btn">검색</button>
													</div>
													
													<div class="insight-box">
														<div class="table-responsive catinfo-list-table-container">
															<table id="cat-info-list-table" class="table">
																<thead>
																	<tr class="table" style="background-color:#088dcd; color:white">
																		<th>고양이아이디</th>
																		<th>지역</th>
																		<th>별명</th>
																		<th>성별</th>
																		<th>색상</th>
																		<th>등록일자</th>
																	</tr>
																</thead>
															</table>
														</div>
													</div>
													
													<div class="catinfo-list-detail" style="border:solid 1px">
														<div class="media">
															<img id="catinfo-detail-catimage" class="col-6" alt="..." style="margin: 20px 10px">
															<div class="media-body" style="margin: 20px 10px">
																<h5 class="mt-0">ID:<span id="catinfo-detail-catsId"></span></h5>
																<h6>지역 : <span id="catinfo-detail-localname"></span></h6>
																<h6>별명 : <span id="catinfo-detail-nickname"></span></h6>
																<h6>색상 : <span id="catinfo-detail-catcolor"></span></h6>
																<h6>성별 : <span id="catinfo-detail-gender"></span></h6>
																<h6>중성화여부 : <span id="catinfo-detail-tnr"></span></h6>
																<p><span id="catinfo-detail-characteristic"></span></p>
															</div>
														</div>
													</div>
											
												</div>
											</div>
									</div>
								</div>
								<!-- centerl meta -->
							</div>
						</div>
					</div>
			</div>
		</section>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<script type="text/javascript">
	$(function() {
		
		$('.report-list-detail').hide();
		
		$(".report-list-table-container").on('click', '.report-tr', function(event) {
			// alert($(this).data('boardno'));
			$.ajax({
				"url": "load-report-detail",
				"method": "get",
				"data": "boardNo=" + $(this).data('boardno'), 
				"dataType": "json",
				"success": function(data, status, xhr) {
					$('#report-detail-boardno').text(data.boardNo);
					$('#report-detail-writer').text(data.userId);
					$('#report-detail-localname').text(data.localName);
					$('#report-detail-nickname').text(data.catNickname);
					$('#report-detail-catcolor').text(data.colorName);
					$('#report-detail-catcolorcode').text(data.colorCode);
					$('#report-detail-gender').text(data.catGender == 1 ? "수컷" : data.catGender == 2 ? "암컷" : "미상");
					$('#report-detail-tnr').text(data.tnrYn == 1 ? "O" : data.tnrYn == 2 ? "X" : "미상");
					$('#report-detail-characteristic').text(data.characteristic);
					$('#report-detail-catimage').attr('src', '/project_catmoa/resources/assets/images/resources/' + data.savedFileName);
					$('.report-list-detail').show();
				},
				"error": function(xhr, status, err) {
					$('.report-list-detail').hide();
					alert('fail to load report detail');
				}
			});
		});
		
		$('.report-detail-write-btn').css({			
			'position': 'relative',
			'left': '710px',
			'margin-bottom': '10px',
		});
		
		$('.report-detail-write-btn').on('click', function(event) {
			$.ajax({
				"url": "insert-catinfo",
				"method": "post",
				"data": "boardNo=" + $('#report-detail-boardno').text(),
				"success": function(data, status, xhr) {
					
					const localName = $('#report-detail-localname').text();
					const localNameWords = localName.split(' ')
					const colorCode = $('#report-detail-catcolorcode').text();
					
					$('.catinfo-list-table-container').load('load-cat-info-list?sido=' + localNameWords[0] + "&gu=" + localNameWords[1] + "&colorCode=" + colorCode + "&pageNo=1");
					
					alert('등록 되었습니다.');
					
				},
				"error": function(xhr, status, err) {
					alert('fail to insert catinfo');
				}
			});
		});
		
		$('.catinfo-list-detail').hide();
		
		$(".catinfo-list-table-container").on('click', '.catinfo-tr', function(event) {
			//alert($(this).data('catsid'));
			$.ajax({
				"url": "load-catinfo-detail",
				"method": "get",
				"data": "catsId=" + $(this).data('catsid'),
				"dataType": "json",
				"success": function(data, status, xhr) {
					$('#catinfo-detail-catsId').text(data.catsId);
					$('#catinfo-detail-localname').text(data.localName);
					$('#catinfo-detail-nickname').text(data.catNickname);
					$('#catinfo-detail-catcolor').text(data.colorName);
					$('#catinfo-detail-gender').text(data.catGender == 1 ? "수컷" : data.catGender == 2 ? "암컷" : "미상");
					$('#catinfo-detail-tnr').text(data.tnrYn == 1 ? "O" : data.tnrYn == 2 ? "X" : "미상");
					$('#catinfo-detail-characteristic').text(data.characteristic);
					$('#catinfo-detail-catimage').attr('src', '/project_catmoa/resources/assets/images/resources/' + data.catImage);
					$('.catinfo-list-detail').show();
				},
				"error": function(xhr, status, err) {
					$('.catinfo-list-detail').hide();
					alert('fail to load catinfo-detail');
					
				}
			}); 
		});
		
		$('.messages .col-2, .messages .col-3').css({
			"display": "inline-block",
			"float": "left",
		});
		
		///////////////////
		
		$.ajax({
	    	"url": "/project_catmoa/load-sido-list",
	    	"method": "get",
	    	"dataType": "json",
	    	"success": function(data, status, xhr) {
	    		$.each(data, function(idx, v) {
	    			const a = "<a class='dropdown-item' href='#' data-sido='" + v + "'>" + v +"</a>";
	    			$('#sido').append(a);
	    		});
	    	},
	    	"error": function(xhr, status, err) {
	    		alert('fail');
	    	}
	    });
	    
	    
  	 	$('#sido').on('click', 'a', function(event) {
	    	$('#sido a').removeClass('active');
	    	$(this).addClass('active');
	    	
	    	const sido = $(this).data('sido'); // 사용자가 선택한 시도명
	    	// ajax 요청
	    	$('#gugun').empty();
	    	$.ajax({
		    	"url": "/project_catmoa/load-gugun-list",
		    	"method": "get",
		    	"data": "sido=" + sido,
		    	"dataType": "json",
		    	"success": function(data, status, xhr) {
		    		$.each(data, function(idx, v) {
		    			const a = "<a class='dropdown-item' href='#' data-gugun='" + v + "'>" + v +"</a>";
		    			$('#gugun').append(a);
		    		});
		    	},
		    	"error": function(xhr, status, err) {
		    		alert('fail');
		    	}
		    });

	  	});
  	 	
  	 	$('#gugun').on('click', 'a', function(event) {
	    	$('#gugun a').removeClass('active');
	    	$(this).addClass('active');
  	 	});
		
  	 	$('#color-select').on('click', 'a', function(event) {
	    	$('#color-select a').removeClass('active');
	    	$(this).addClass('active');
  	 	});
  	 	
  	 	// 검색버튼 클릭 이벤트처리
  	 	$(".load-cat-info-list-btn").on('click', function(event) {
  	 		
  	 		const sido = $('#sido a.active').data('sido');
  	 		const gu = $('#gugun a.active').data('gugun');
  	 		const colorCode = $('#color-select a.active').data('color');
  	 		
  	 		if (!Boolean(sido) || !Boolean(gu) || !Boolean(colorCode)) {
  	 			alert('검색 옵션을 선택하세요');
  	 			return;
  	 		}
  	 		
  	 		$('.catinfo-list-table-container').load('load-cat-info-list?sido=' + sido + "&gu=" + gu + "&colorCode=" + colorCode + "&pageNo=1");
  	 	});
  	 	
		$(".catinfo-list-table-container").on('click', 'a[data-pageno]', function(event) {
			const sido = $('#sido a.active').data('sido');
  	 		const gu = $('#gugun a.active').data('gugun');
  	 		const colorCode = $('#color-select a.active').data('color');
  	 		
  	 		if (!Boolean(sido) || !Boolean(gu) || !Boolean(colorCode)) {
  	 			alert('검색 옵션을 확인하세요');
  	 			return;
  	 		}
  	 		
  	 		const pageNo = $(this).data('pageno');
  	 	
  	 		$('.catinfo-list-table-container').load('load-cat-info-list?sido=' + sido + "&gu=" + gu + "&colorCode=" + colorCode + "&pageNo=" + pageNo);
  	 	});
  	 	
  	 	////////////////////////////////////////
  	 	
  	 	$(".report-list-table-container").on('click', 'a[data-pageno]', function(event) {
  	 		
  	 		const pageNo = $(this).data('pageno');
  	 	
  	 		$('.report-list-table-container').load('load-report-list?pageNo=' + pageNo);
  	 	});
	});
	</script>
</body>
</html>
























