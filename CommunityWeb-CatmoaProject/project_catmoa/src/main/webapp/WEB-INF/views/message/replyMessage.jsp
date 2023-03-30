<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>쪽지함</title>

<style>

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
	</section><!-- top area -->

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
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta" style="width: 1200px">
									<div class="messages">
										<h5 class="f-title"><i class="ti-bell"> Type Message</i></h5>
										<div class="message-box" style="width: 1100px;">
											<form action=replyMessage method="post" enctype="multipart/form-data">
											<div class="message-text-container">
												<div>
												<label>제목</label>
												<input type="text" class="form-control" id="msgTitle"
												       placeholder="제목 입력 (2~30자)" name="msgTitle"
												       maxlength="30" required="required"
												       pattern=".{2,30}" style="width:800px" value="Re: ${ message.msgTitle }">
												</div>
												<div>
												<input type="hidden" name="sendNic" value="${ loginuser.nic }">
												</div>
												<div>
												<label>받는 사람</label>
												<input type="text" class="form-control"
													   placeholder="받는 사람 닉네임 입력" name="recvNic" value="${ message.recvNic }" required="required" style="width:170px">
												</div>
												<div>
												<label for="exampleFormControlInput1">첨부파일</label>
												<input type="file" class="form-control" name="attach" style="width:300px">
												</div>
												<br>
												<div>
												<label>내용</label>
												<br>
												<textarea name="msgContent" placeholder="내용 입력" required="required"></textarea>
												<button type="submit">
												<i class="fa fa-paper-plane"></i>
												</button>
												</div>
											</div>
											</form>
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
	
		<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
		<script type="text/javascript">
		$(function() {
			<c:if test="${ not empty nouser }">
			alert('전송 실패 : 받는 사람 닉네임을 확인하세요');
			</c:if>
		});
		
		/*
		$('#msgTitle').on('keydown', function(event) {
			// alert($(this).attr('maxlength'));
			var maxLength = parseInt($(this).attr('maxlength'));
			if ($(this).val().length >= maxLength) {
				//event.preventDefault();
				return false;
			}
		});
		*/
		
		$('#msgTitle').on('keyup', function(event) {
			// alert($(this).attr('maxlength'));
			var maxLength = parseInt($(this).attr('maxlength'));
			if ($(this).val().length >= maxLength) {
				$(this).val($(this).val().slice(0, 30));
			}
			
			
		});
		</script>
	
<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	
</body>	

</html>