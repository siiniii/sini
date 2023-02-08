<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>쪽지함</title>

<style>
table {
	border : 1px solid #0AB1FF;
}
td {
	padding-left:10px;
}
th {
	padding-left:10px;
}
</style>

<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
   
</head>
<body>
<div class="theme-layout">

<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
	
<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
	
	<section>
		<div class="feature-photo">
			<figure><img src="/project_catmoa/resources/assets/images/resources/timeline-1.jpg" alt=""></figure>
			<div class="add-btn">
				<span>1205 followers</span>
				<a href="#" title="" data-ripple="">Add Friend</a>
			</div>
			<form class="edit-phto">
				<i class="fa fa-camera-retro"></i>
				<label class="fileContainer">
					Edit Cover Photo
				<input type="file"/>
				</label>
			</form>
			<div class="container-fluid">
				<div class="row merged">
					<div class="col-lg-2 col-sm-3">
						<div class="user-avatar">
							<figure>
								<img src="/project_catmoa/resources/assets/images/resources/user-avatar.jpg" alt="">
								<form class="edit-phto">
									<i class="fa fa-camera-retro"></i>
									<label class="fileContainer">
										Edit Display Photo
										<input type="file"/>
									</label>
								</form>
							</figure>
						</div>
					</div>
					<div class="col-lg-10 col-sm-9">
						<div class="timeline-info">
							<ul>
								<li class="admin-name">
								  <h5>Janice Griffith</h5>
								  <span>Group Admin</span>
								</li>
								<li>
									<a class="" href="/project_catmoa/message/recvMessage" title="" data-ripple="">받은 쪽지함</a>
									<a class="active" href="/project_catmoa/message/sendedMessage" title="" data-ripple="">보낸 쪽지함</a>
									<a class="" href="timeline-videos.html" title="" data-ripple="">Videos</a>
									<a class="" href="timeline-friends.html" title="" data-ripple="">Friends</a>
									<a class="" href="groups.html" title="" data-ripple="">Groups</a>
									<a class="" href="about.html" title="" data-ripple="">about</a>
									<a class="" href="#" title="" data-ripple="">more</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!-- top area -->

	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<div class="col-lg-3">
								<aside class="sidebar static">
									<div class="widget stick-widget">
										<h4 class="widget-title">Shortcuts</h4>
										<ul class="naves">
											<li>
												<i class="ti-clipboard"></i>
												<a href="newsfeed.html" title="">News feed</a>
											</li>
											<li>
												<i class="ti-mouse-alt"></i>
												<a href="inbox.html" title="">Inbox</a>
											</li>
											<li>
												<i class="ti-files"></i>
												<a href="fav-page.html" title="">My pages</a>
											</li>
											<li>
												<i class="ti-user"></i>
												<a href="timeline-friends.html" title="">friends</a>
											</li>
											<li>
												<i class="ti-image"></i>
												<a href="timeline-photos.html" title="">images</a>
											</li>
											<li>
												<i class="ti-video-camera"></i>
												<a href="timeline-videos.html" title="">videos</a>
											</li>
											
										</ul>
									</div><!-- Shortcuts -->										
								</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta">
									<div class="messages">
										<h5 class="f-title"><i class="ti-bell"> Sended Message Detail</i></h5>
										<div class="table-responsive" style="text-align:center;">
										<table id="datatable-scroller"
											class="table table-bordered tbl_Form">
											<caption></caption>
											<colgroup>
												<col width="250px" />
												<col />
											</colgroup>
											<tbody>
												<tr>
													<th class="active">제목</th>
													<td>
													${ message.title }
													</td>
												</tr>
												<tr>
													<th class="active" >받는 사람</th>
													<td>
													${ message.recvId }
													</td>
												</tr>
												<tr>
													<th class="active" >보낸 날짜</th>
													<td>
													<fmt:formatDate value="${ message.sendDate }" pattern="Y년 M월 d일 hh:mm:ss" />
													</td>
												</tr>
												<tr>
													<th class="active">첨부파일</th>
													<td>
													<c:forEach var="attachment" items="${ message.attachments }">
													<a href="download.action?msgFileNo=${ attachment.msgFileNo }"
														style="text-decoration: none"> ${ attachment.userFileName }
													</a>
													</c:forEach>
													<td>
												</tr>
												<tr>
													<th class="active" >내용</th>
													<td>
<c:set var="enter" value="
" />
${ fn:replace(message.msgContent, enter, "<br>") }
													</td>
												</tr>
											</tbody>
										</table>
										</div>

									</div>
								</div>
							</div>
							<!-- centerl meta -->
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>

<jsp:include page="/WEB-INF/views/module/footer.jsp" />

	<div class="bottombar">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<span class="copyright"><a target="_blank" href="https://www.templateshub.net">Templates Hub</a></span>
					<i><img src="/project_catmoa/resources/assets/credit-cards.png" alt=""></i>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="side-panel">
			<h4 class="panel-title">General Setting</h4>
			<form method="post">
				<div class="setting-row">
					<span>use night mode</span>
					<input type="checkbox" id="nightmode1"/> 
					<label for="nightmode1" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>Notifications</span>
					<input type="checkbox" id="switch22" /> 
					<label for="switch22" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>Notification sound</span>
					<input type="checkbox" id="switch33" /> 
					<label for="switch33" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>My profile</span>
					<input type="checkbox" id="switch44" /> 
					<label for="switch44" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>Show profile</span>
					<input type="checkbox" id="switch55" /> 
					<label for="switch55" data-on-label="ON" data-off-label="OFF"></label>
				</div>
			</form>
			<h4 class="panel-title">Account Setting</h4>
			<form method="post">
				<div class="setting-row">
					<span>Sub users</span>
					<input type="checkbox" id="switch66" /> 
					<label for="switch66" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>personal account</span>
					<input type="checkbox" id="switch77" /> 
					<label for="switch77" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>Business account</span>
					<input type="checkbox" id="switch88" /> 
					<label for="switch88" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>Show me online</span>
					<input type="checkbox" id="switch99" /> 
					<label for="switch99" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>Delete history</span>
					<input type="checkbox" id="switch101" /> 
					<label for="switch101" data-on-label="ON" data-off-label="OFF"></label>
				</div>
				<div class="setting-row">
					<span>Expose author name</span>
					<input type="checkbox" id="switch111" /> 
					<label for="switch111" data-on-label="ON" data-off-label="OFF"></label>
				</div>
			</form>
		</div><!-- side panel -->		
	
<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	
</body>	

</html>