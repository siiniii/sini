<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>CatMoa Home</title>
	
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
</head>
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	
	<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
	
	<!-- ======= header ======= -->
	<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
	<!-- End header -->	
		
	<jsp:include page="/WEB-INF/views/module/page-header.jsp">
		<jsp:param value="asdf" name="title"/>
	</jsp:include>
		
	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<jsp:include page="/WEB-INF/views/module/left-sidebar.jsp" />
							
							<div class="col-lg-6">
							<!-- 페이지 내용은 여기에 작성하세요 -->
							</div>
							
							<jsp:include page="/WEB-INF/views/module/right-sidebar.jsp" />
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>

	<!-- ======= header ======= -->
	<jsp:include page="/WEB-INF/views/module/footer.jsp" />
	<!-- End header -->	

</div>

<jsp:include page="/WEB-INF/views/module/common-js.jsp" />

</body>	


</html>