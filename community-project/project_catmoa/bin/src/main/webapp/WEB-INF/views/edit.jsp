<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Winku Social Network Toolkit</title>
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
					<form action="edit.action" method="post">
					<div class="form-group">
						<input type="hidden" name="boardNo" value="${ board.boardNo }">
						<input type="hidden" name="boardGroupNo" value="${ board.boardGroupNo }">
						<input type="hidden" name="pageNo" value="${ pageNo }">
						<label for="exampleFormControlInput1">제목</label> 
						<input type="text" class="form-control" name="boardTitle" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">글 내용</label>
						<textarea class="form-control" name="boardContent"
							rows="3"></textarea>
					</div>
					  <button type="submit" class="btn btn-primary">글 수정</button>
					  </form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />

</body>

</html>