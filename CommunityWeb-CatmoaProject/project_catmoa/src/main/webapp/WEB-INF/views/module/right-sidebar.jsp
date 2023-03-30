<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="col-lg-3 right-sidebar">
		<aside class="sidebar static">
			<div class="widget">
				<h4 class="widget-title">후원 순위</h4>
				<ul class="followers donate-rank">
					<li>
						<figure>
								<c:choose>
								<c:when test="${ empty intro.memberImg }">
								<img src="/project_catmoa/resources/assets/images/kakaoImg.jpg" alt="">
								</c:when>
								<c:otherwise>
								<img src="/project_catmoa/resources/assets/images/${ intro.memberImg }" alt="">
								</c:otherwise>
								</c:choose>
						</figure>
						<div class="friend-meta">
							<h4>
								<a href="time-line.html" title="" class="nic"></a>
							</h4>
							<a href="#" title="" class="underline sum"></a>
						</div>
					</li>
					<li>
						<figure>
							<img src="/project_catmoa/resources/assets/images/resources/friend-avatar4.jpg" alt="">
						</figure>
						<div class="friend-meta">
							<h4>
								<a href="time-line.html" title="" class="nic"></a>
							</h4>
							<a href="#" title="" class="underline sum"></a>
						</div>
					</li>
					<li>
						<figure>
							<img src="/project_catmoa/resources/assets/images/resources/friend-avatar6.jpg" alt="">
						</figure>
						<div class="friend-meta">
							<h4>
								<a href="time-line.html" title="" class="nic"></a>
							</h4>
							<a href="#" title="" class="underline sum"></a>
						</div>
					</li>
					<li>
						<figure>
							<img src="/project_catmoa/resources/assets/images/resources/friend-avatar8.jpg" alt="">
						</figure>
						<div class="friend-meta">
							<h4>
								<a href="time-line.html" title="" class="nic"></a>
							</h4>
							<a href="#" title="" class="underline sum"></a>
						</div>
					</li>
					<li>
						<figure>
							<img src="/project_catmoa/resources/assets/images/resources/friend-avatar3.jpg" alt="">
						</figure>
						<div class="friend-meta">
							<h4>
								<a href="time-line.html" title="" class="nic"></a>
							</h4>
							<a href="#" title="" class="underline sum">Add Friend</a>
						</div>
					</li>
				</ul>
			</div>
			<!-- who's following -->
				<jsp:include page="/WEB-INF/views/module/friend-list.jsp" />
			<!-- friends list sidebar -->
		</aside>
	</div>
	<!-- sidebar -->

