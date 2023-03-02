<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    			<div class="widget friend-list stick-widget">
				<h4 class="widget-title">친구 목록</h4>
				<div id="searchDir"></div>
				<ul id="people-list" class="friendz-list">
				
				<c:choose>
				
				<c:when test="${ empty friends }">
				
				<li></li>
				
				</c:when>
				<c:otherwise>
					<c:forEach var="friend" items="${ friends }">
						<li>
						
						<c:choose>
							<c:when test="${ empty friend.memberImg }">
								<img src="/project_catmoa/resources/assets/images/kakaoImg.jpg" alt="" style="width:50px">
							</c:when>
							<c:otherwise>
								<img src="/project_catmoa/resources/images/${ friend.memberImg }" alt="" style="width:50px">
							</c:otherwise>
						</c:choose>
						
						&nbsp;&nbsp;&nbsp;&nbsp;${ friend.nic }
						
						</li>
					</c:forEach>
				</c:otherwise>
				</c:choose>
					
				</ul>
			</div>