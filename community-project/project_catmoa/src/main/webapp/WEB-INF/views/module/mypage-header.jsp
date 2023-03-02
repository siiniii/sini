<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<section>
		<div class="feature-photo">
			<div class="container-fluid">
				<div class="row merged">
					<div class="col-lg-10 col-sm-9">
						<div class="timeline-info">
							<ul>
								<li class="user-name" style="font-size:20px; font-weight:bold">
								<c:choose>
								<c:when test="${ empty loginuser }">
								</c:when> 
									<c:otherwise>
										 ${ loginuser.nic }
									</c:otherwise>
								</c:choose>
								</li>
								<li>
									<a href="/project_catmoa/mypage/profile" title="" data-ripple="">내 프로필</a>
									<a href="/project_catmoa/mypage-Friend" title="" data-ripple="">Friends</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!-- top area -->

    