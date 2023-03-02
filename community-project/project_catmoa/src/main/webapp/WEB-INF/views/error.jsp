<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
</head>
<body>
			
		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />

		<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
		<script type="text/javascript">
		$(function() {
			alert("[${ error_type }] : ${ message }");
			location.href = "/project_catmoa/board/list";
		});
		</script>		


</body>
</html>