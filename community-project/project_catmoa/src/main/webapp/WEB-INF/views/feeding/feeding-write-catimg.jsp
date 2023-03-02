<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach varStatus="s" var="catinfomation" items="${ catinfomations }">
<div class="movie-card">
	<div class="movie-img" style="display: block; float: left">
<a href="#" data-cats-id="${ catinfomation.catsId }" class="select-cat-img"><img style="width: 150px; height: 150px;margin-right:15px;margin-top:20px"
	src="/project_catmoa/resources/assets/images/resources/${catinfomation.catImage}"
	class="img-fluid" ></a>
	<p class="text-white text-sm-center font-small flex-center">${catinfomation.catNickname}</p>
	<p style="width:130px;text-align:center">${ catinfomation.characteristic }</p>
	</div>
</div>
</c:forEach>
