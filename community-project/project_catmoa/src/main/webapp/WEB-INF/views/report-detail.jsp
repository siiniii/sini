<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
	
	
</head>

<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">		
		
		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
		
		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
	


	<section>
		<div class="ext-gap bluesh high-opacity">
			<div class="content-bg-wrap" ></div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="top-banner">
							<h1>제보 게시판</h1>
							<nav class="breadcrumb">
							  <a class="breadcrumb-item" href="/project_catmoa/home-feeding">Home</a>
							  <span class="breadcrumb-item active">제보 게시판</span>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!-- top area animated -->
	

	
	<section>
		<div class="gap ext-bottom">
			<div class="container">
				<div class="row">
					<div class="offset-lg-1 col-lg-10">
						<div class="detail-page">
							<div class="detail-meta">
								<h2><a href="#" title="">${ board.boardTitle }</a></h2>
								
								<div class="post-time">
									<div class="author-thumb">
									<span><a href="#" title="">${ board.userId }</a></span>
								</div>
								</div>
								<!-- 첨부파일 & 글내용 -->
								<div class="report-list-detail" style="border:solid 1px">
									<div class="media">
									
										<img src="/project_catmoa/resources/report-attachments/${ reportDto.savedFileName }" class="col-6" style="margin: 20px 10px">
										<div class="media-body" style="margin: 20px 10px">
											<h5 class="mt-0">글번호<span id="report-detail-boardno">${ reportDto.boardNo }</span></h5>
											<h6>작성자 : ${ reportDto.userId } </h6>
											<h6>지역 : ${ reportDto.localName }</h6>
											<h6>목격일시 : ${ reportDto.catTime }</h6>
											<h6>별명 : ${ reportDto.catNickname }</h6>
											<h6>특징 : ${ reportDto.characteristic }</h6>
											<h6>색상 : ${ reportDto.colorName }</h6>
											<c:choose>
											<c:when test="${ reportDto.catGender eq 1 }">
											<h6>성별 : 수컷</h6>
											</c:when>
											<c:when test="${ reportDto.catGender eq 2 }">
											<h6>성별 : 암컷</h6>
											</c:when>
											<c:otherwise>
											<h6>성별 : 미상</h6>
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${ reportDto.tnrYn eq 1 }">
											<h6>중성화여부 : YES</h6>
											</c:when>
											<c:when test="${ reportDto.tnrYn eq 2 }">
											<h6>중성화여부 : NO</h6>
											</c:when>
											<c:otherwise>
											<h6>중성화여부 : 미상</h6>
											</c:otherwise>
											</c:choose>
											<p><span id="report-detail-characteristic"></span></p>
										</div>
									</div>
								</div>
							</div>									
						</div>
					</div>
				</div>
			</div>
			</section>	
		</div>
	
	
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script type="text/javascript">
$(function() {
    
});

</script>
</body>	

</html>


























