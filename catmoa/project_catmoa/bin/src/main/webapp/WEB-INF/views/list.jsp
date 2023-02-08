<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">


<head>
<!--     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!--     <meta name="description" content="" /> -->
<!--     <meta name="keywords" content="" /> -->
<!-- 	<title>구조신고 게시판</title> -->
	
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
	
</head>
<body>
	<section>
		<div class="gap gray-bg">
			<div class="container">
				<div class="row" id="page-contents">
					<div class="col-lg-12">
						<div class="blog-sec">
							<div class="post-filter-sec">
								<form method="post" class="filter-form">
									<input type="post" placeholder="Search post">
									<button>
										<i class="ti-search"></i>
									</button>
								</form>
								<div class="purify">
									<span>지역 선택</span> <select>
										<option>서울시</option>
										<option>경기도</option>
										<option>인천</option>
									</select> <select>
										<option>강남구</option>
										<option>서초구</option>
										<option>송파구</option>
									</select>
									<!-- 									<select>
											<option>역삼동</option>
											<option>방배본동</option>
											<option>삼성동</option>
										</select> -->
									<!-- 									<a href="#" title="">purify</a> -->
								</div>
							</div>
							<div class="submit-btns">
								<button type="button" class="mtr-btn go-write-btn" data-groupno='${ boardGroupNo }' ><span>글쓰기</span></button>
							</div>
							&nbsp;
							<c:forEach var="board" items="${ boards }">
							<div class="l-post">
								<figure>
									<!-- 									<ul class="blg-socials">
											<li><a href="#" title="" class="facebook"><i class="fa fa-facebook"></i></a></li>
											<li><a href="#" title="" class="twitter"><i class="fa fa-twitter"></i></a></li>
											<li><a href="#" title="" class="pinterest"><i class="fa fa-pinterest"></i></a></li>
										</ul> -->
								</figure>
								<div class="l-post-meta">
									<h4>
										<c:choose>
										<c:when test="${ boardGroupNo eq 1 }">
										<a href="/project_catmoa/board/report-detail?boardNo=${ board.boardNo }&pageNo=${ pageNo }&boardGroupNo=${ boardGroupNo }" title="">${ board.boardTitle }</a>
										</c:when>
										<c:when test="${ boardGroupNo eq 2 }">
										<a href="/project_catmoa/board/detail?boardNo=${ board.boardNo }&pageNo=${ pageNo }&boardGroupNo=${ boardGroupNo }" title="">${ board.boardTitle }</a>
										</c:when>
										<c:otherwise>
										<a href="/project_catmoa/board/feeding-detail?boardNo=${ board.boardNo }&pageNo=${ pageNo }&boardGroupNo=${ boardGroupNo }" title="">${ board.boardTitle }</a>
										</c:otherwise>
										</c:choose>
									</h4>
									<div class="l-post-ranking">
										<a class="admin" href="#" title="">${ board.userId }</a> <a class="pdate"
											href="#" title="">${ board.writeTime }</a>
									</div>
										
	
	
									<a href="#" title="" class="read">Read More</a>
								</div>
							</div>
							</c:forEach>
							
							${ pager }
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<script type="text/javascript">
	$(function() {
		$('.go-write-btn').on('click', function(event) {
			const groupNo = $(this).data('groupno');
			if (groupNo == '1') {
				location.href = 'report-write?boardGroupNo=' + groupNo;
			} else {
				location.href='write?boardGroupNo=' + groupNo;
			}
		});
	});
	
	</script>

</body>
</html>
