<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>쪽지함</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

<style>
table a:hover {
	color: skyblue;
}
.recvChk td {
	color: lightgray;
}
</style>

<jsp:include page="/WEB-INF/views/module/common-css.jsp" />

</head>
<body>
	<!--<div class="se-pre-con"></div>-->
	<div class="theme-layout">

		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />

		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />

		<section>
			<div class="feature-photo">
				<div class="container-fluid">
					<div class="row merged">
						<div class="col-lg-2 col-sm-3">
						</div>
						<div class="col-lg-10 col-sm-9">
							<div class="timeline-info">
								<ul>
									<li class="admin-name">
									  <h5>${ loginuser.nic }</h5>
									  <span>
									  <c:choose>
									  <c:when test="${ loginuser.admin eq 1 }">
									  Admin
									  </c:when>
									  <c:otherwise>
									  User
									  </c:otherwise>
									  </c:choose>
									  </span>
									</li>
									<li>
										<a class="active" href="/project_catmoa/message/recvMessage" title="" data-ripple="">받은 쪽지함</a>
										<a class="" href="/project_catmoa/message/sendedMessage" title="" data-ripple="">보낸 쪽지함</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- top area -->

		<section>
			<div class="gap gray-bg">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="row" id="page-contents">
								<div class="col-lg-3">
									<aside class="sidebar static">
										<jsp:include page="/WEB-INF/views/module/friend-list.jsp" />
									</aside>
								</div>
								<!-- sidebar -->
								<div class="col-lg-6">
									<div class="central-meta" style="width: 1200px">
										<div class="messages">
											<%-- 즐겨찾기 등록기능 구현용 --%>
											<form id="bookmark-settings-form" action="rAddBookmark" method="post">
												<input type="hidden" name="bookmarkNic">
												<input type="hidden" name="pageNo" value="${ pageNo }">
											</form>
											<%-- 즐겨찾기 해제기능 구현용 --%>
											<form id="remove-bookmark-settings-form" action="rRemoveBookmark" method="post">
												<input type="hidden" name="bookmarkNic">
												<input type="hidden" name="pageNo" value="${ pageNo }">
											</form>
											<form>
												<h5 class="f-title">
													<i class="ti-bell"> Recieved Message</i>
												</h5>
												<div class="message-box">
													<div>
													<button type="button" class="btn btn-light" onclick="location.href = '/project_catmoa/message/writeMessage';">
													<i class="fa fa-plus-square-o" aria-hidden="true"></i>
													New Message
													</button>
													</div>
													<br>
													<div class="table-responsive">
													<table id="recv-list-table" class="table" style="text-align: center">
														<thead>
														<tr class="table-dark">
														<th style="width:50px">No</th>
														<th style="width:750px">제목</th>
														<th style="width:200px">보낸 사람</th>
														<th style="width:200px">보낸 날짜</th>
														</tr>
														</thead>
														<c:forEach var="message" items="${ messages }">
														<c:choose>
														<c:when test="${ message.recvChk eq 1 }">
														<tr class="recvChk">
														<td>
														${ message.msgNo }
														<input type="hidden" name="loginuser" value="${ loginuser.nic }">
														</td>
														<td>
														<a href='recvMessageDetail.action?msgNo=${ message.msgNo }'>
														[읽음]
														&nbsp;
														${ message.msgTitle }
														</a>
														</td>
														<td>
														<button type="button" id="btn${ message.msgNo }" class="btn btn-light" data-toggle="collapse" 
														data-target="#nicClick${ message.msgNo }" aria-expanded="false" aria-controls="collapseExample">
														${ message.sendNic }
														</button>
														<div class="collapse" id="nicClick${ message.msgNo }">
															<c:set var="marked" value="off" />
															<c:forEach var="nic" items="${ nics }">
																<c:if test='${ marked == "off" }'>
																	<c:if test="${ nic == message.sendNic }">
																		<c:set var="marked" value="on" />																	
																	</c:if>
																</c:if>
															</c:forEach>
															<c:choose>
																<c:when test='${ marked == "off" }'>
																	<button class="btn btn-outline-primary bookmark-btn">즐겨찾기 등록</button>
																</c:when>
																<c:otherwise>
																<button class="btn btn-outline-primary remove-bookmark-btn">즐겨찾기 해제</button>
																</c:otherwise>
															</c:choose>
														</div>
														</td>
														<td>
														<fmt:formatDate value="${ message.sendDate }" pattern="Y.M.d hh:mm:ss" />
														</td>
														</tr>
														</c:when>
														<c:otherwise>
														<tr>
														<td>
														${ message.msgNo }
														<input type="hidden" name="loginuser" value="${ loginuser.nic }">
														</td>
														<td>
														<a href='recvMessageDetail.action?msgNo=${ message.msgNo }'>
														${ message.msgTitle }
														</a>
														</td>
														<td>
														<button type="button" id="btn${ message.msgNo }" class="btn btn-light chk-bookmark-btn" data-toggle="collapse" 
														data-target="#nicClick${ message.msgNo }" aria-expanded="false" aria-controls="collapseExample">
														${ message.sendNic }
														</button>
														<div class="collapse" id="nicClick${ message.msgNo }">														
															<c:set var="marked" value="off" />
															<c:forEach var="nic" items="${ nics }">
																<c:if test='${ marked == "off" }'>
																	<c:if test="${ nic == message.sendNic }">
																		<c:set var="marked" value="on" />																	
																	</c:if>
																</c:if>
															</c:forEach>
															<c:choose>
																<c:when test='${ marked == "off" }'>
																	<button class="btn btn-outline-primary bookmark-btn">즐겨찾기 등록</button>
																</c:when>
																<c:otherwise>
																<button class="btn btn-outline-primary remove-bookmark-btn">즐겨찾기 해제</button>
																</c:otherwise>
															</c:choose>
														</div>
														</td>
														<td>
														<fmt:formatDate value="${ message.sendDate }" pattern="Y.M.d hh:mm:ss" />
														</td>
														</tr>
														</c:otherwise>
														</c:choose>
														</c:forEach>
													</table>
													
													<br><br>
													<div style="text-align:center">
													${ pager }
													</div>
													<br><br><br><br>
													</div>
												</div>
											</form>
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
						<span class="copyright"><a target="_blank"
							href="https://www.templateshub.net">Templates Hub</a></span> <i><img
							src="/project_catmoa/resources/assets/images/credit-cards.png"
							alt=""></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="side-panel">
		<h4 class="panel-title">General Setting</h4>
		<form method="post">
			<div class="setting-row">
				<span>use night mode</span> <input type="checkbox" id="nightmode1" />
				<label for="nightmode1" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>Notifications</span> <input type="checkbox" id="switch22" />
				<label for="switch22" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>Notification sound</span> <input type="checkbox" id="switch33" />
				<label for="switch33" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>My profile</span> <input type="checkbox" id="switch44" /> <label
					for="switch44" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>Show profile</span> <input type="checkbox" id="switch55" /> <label
					for="switch55" data-on-label="ON" data-off-label="OFF"></label>
			</div>
		</form>
		<h4 class="panel-title">Account Setting</h4>
		<form method="post">
			<div class="setting-row">
				<span>Sub users</span> <input type="checkbox" id="switch66" /> <label
					for="switch66" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>personal account</span> <input type="checkbox" id="switch77" />
				<label for="switch77" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>Business account</span> <input type="checkbox" id="switch88" />
				<label for="switch88" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>Show me online</span> <input type="checkbox" id="switch99" />
				<label for="switch99" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>Delete history</span> <input type="checkbox" id="switch101" />
				<label for="switch101" data-on-label="ON" data-off-label="OFF"></label>
			</div>
			<div class="setting-row">
				<span>Expose author name</span> <input type="checkbox"
					id="switch111" /> <label for="switch111" data-on-label="ON"
					data-off-label="OFF"></label>
			</div>
		</form>
	</div>
	<!-- side panel -->
	
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	
	<script type="text/javascript">
		$(function() {
			
			// 즐겨찾기 등록
			$('#recv-list-table tbody .bookmark-btn').on('click', function(event) {
				
				event.preventDefault();
				
				const tr = $(this).parent().parent().parent();
				const tds = tr.find('td');
				
				// const bookmarkNic = tr.find("td:eq(2)").text();
				const bookmarkNic = tr.find("td:eq(2) button:eq(0)").text().trim()
				
				$('#bookmark-settings-form input[name=bookmarkNic]').val(bookmarkNic);
				
				$('#bookmark-settings-form').submit();
				
			});
			
			// 즐겨찾기 해제
			$('#recv-list-table tbody .remove-bookmark-btn').on('click', function(event) {
				
				event.preventDefault();
				
				const tr = $(this).parent().parent().parent();
				const tds = tr.find('td');
				
				// const bookmarkNic = tr.find("td:eq(2)").text();
				const bookmarkNic = tr.find("td:eq(2) button:eq(0)").text().trim()
				
				$('#remove-bookmark-settings-form input[name=bookmarkNic]').val(bookmarkNic);
				
				$('#remove-bookmark-settings-form').submit();
				
			});
			
		});
		
		
	</script>
	
</body>

</html>