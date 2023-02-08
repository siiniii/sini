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
							<h1>급식 게시판</h1>
							<nav class="breadcrumb">
							  <a class="breadcrumb-item" href="/project_catmoa/home-feeding">Home</a>
							  <span class="breadcrumb-item active">급식 게시판</span>
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
									<span><a href="#" title="">${ feedingDto.userId }</a></span>
								</div>
								</div>
								<!-- 첨부파일 & 글내용 -->
								<div class="feeding-list-detail" style="border:solid 1px">
									<div class="media">
									
										<img src="/project_catmoa/resources/board-attachments/${ feedingDto.savedFileName }" class="col-6" style="margin: 20px 10px">
										<div class="media-body" style="margin: 20px 10px">
											<h5 class="mt-0">글번호<span id="report-detail-boardno">${ feedingDto.boardNo }</span></h5>
											<h6>작성자 : ${ feedingDto.userId } </h6>
											<h6>지역 : ${ feedingDto.localName }</h6>
											<h6>글내용 : ${ feedingDto.feedingContent }</h6>
										</div>
									</div>
								</div>
							</div>									
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		
	</section>	
	
	
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script type="text/javascript">
$(function() {
    
});

</script>
</body>	

</html>


























