<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

 <div class="topbar stick">
		<div class="logo">
			<a title="" href="/project_catmoa/home-feeding"><img src="/project_catmoa/resources/assets/images/logo.png" style="width:800%;height:80%" alt=""></a>
		</div>
		
		<div class="top-area">
			<ul class="main-menu">
				<li>
					<a href="/project_catmoa/home-feeding" title="">급식소 지도</a>
				</li>
				<li>
					<a href="#" title="">커뮤니티</a>
					<ul>
						<li><a href="/project_catmoa/board/list?boardGroupNo=1" title="">길고양이 제보게시판</a></li>
						<li><a href="/project_catmoa/board/list?boardGroupNo=2" title="">구조신고 게시판</a></li>
					</ul>
				</li>
				<li>
					<a href="#" title="">후원</a>
					<ul>
						<li><a href="/project_catmoa/donate-main" title="">후원누적금액 보기</a></li>
						<li><a href="/project_catmoa/donate-detail" title="">후원하기</a></li>
					</ul>
				</li>
				<li>
					<a href="#" title="">쪽지함</a>
					<ul>
						<li><a href="/project_catmoa/message/writeMessage" title="">쪽지 쓰기</a></li>
						<li><a href="/project_catmoa/message/recvMessage" title="">받은 쪽지함</a></li>
						<li><a href="/project_catmoa/message/sendedMessage" title="">보낸 쪽지함</a></li>
					</ul>
				</li>
			</ul>
			<ul class="setting-area">
				<li>
					<a href="#" title="Home" data-ripple=""><i class="ti-search"></i></a>
					<div class="searched">
						<form method="post" class="form-search">
							<input type="text" placeholder="Search Friend">
							<button data-ripple><i class="ti-search"></i></button>
						</form>
					</div>
				</li>
				<li><a href="#" title="Home" data-ripple=""><i class="ti-home"></i></a></li>
				<li><a href="#" title="Languages" data-ripple=""><i class="fa fa-globe"></i></a>
					<div class="dropdowns languages">
						<a href="#" title=""><i class="ti-check"></i>English</a>
						<a href="#" title="">Arabic</a>
						<a href="#" title="">Dutch</a>
						<a href="#" title="">French</a>
					</div>
				</li>
			</ul>
			<div class="user-img">
			
			<c:choose>
			<c:when test="${ not empty loginuser.memberImg }">
			<img src="/project_catmoa/resources/images/${ loginuser.memberImg }" alt="" style="width:50px">
			</c:when>
			<c:otherwise>
			<img src="/project_catmoa/resources/assets/images/kakaoImg.jpg" alt="" style="width:50px">
			</c:otherwise>
			</c:choose>
				
				<!--<span class="status f-online"></span>-->
				<div class="user-setting">
					<c:if test="${ not empty loginuser and loginuser.admin eq 1 }">
					<a href="/project_catmoa/admins/adminMain" id="adminMain" title=""><i class="ti-settings"></i>관리자페이지</a>
					</c:if>
					<a href="/project_catmoa/mypage-Timeline" id="mypage-Timeline" title=""><i class="ti-settings"></i>마이페이지</a>
				</div>
			</div>
				<a>${ loginuser.nic } 님 환영합니다!</a>
				<a href="/project_catmoa/logout" style="margin-left:10px;color:skyblue"><i class="ti-power-off"></i>로그아웃</a>
		</div>
	</div>
</html>