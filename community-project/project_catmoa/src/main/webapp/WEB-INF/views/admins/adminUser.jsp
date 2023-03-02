<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>회원목록</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

<link href="/project_catmoa/resources/assets/css/style.css" rel="stylesheet" type="text/css" />
<jsp:include page="/WEB-INF/views/module/common-css.jsp" />

</head>
<body>
	<!--<div class="se-pre-con"></div>-->
	<div class="theme-layout">

		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />

		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />

		<section>
			<div class="feature-photo">
				<figure>
					<img src="images/resources/timeline-1.jpg" alt="">
				</figure>
				<div class="add-btn">
					<span>1205 followers</span> <a href="#" title="" data-ripple="">Add
						Friend</a>
				</div>
				<form class="edit-phto">
					<i class="fa fa-camera-retro"></i> <label class="fileContainer">
						Edit Cover Photo <input type="file" />
					</label>
				</form>
				<div class="container-fluid">
					<div class="row merged">
						<div class="col-lg-2 col-sm-3">
							<div class="user-avatar">
								<figure>
									<img src="images/resources/user-avatar.jpg" alt="">
									<form class="edit-phto">
										<i class="fa fa-camera-retro"></i> <label
											class="fileContainer"> Edit Display Photo <input
											type="file" />
										</label>
									</form>
								</figure>
							</div>
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
										<a class="#" href="/project_catmoa/admins/adminMain" title="" data-ripple="">그래프</a> 
										<a class="active"
											href="/project_catmoa/admins/adminUser" title="" data-ripple="">회원목록</a>
										<a class="#" href="/project_catmoa/admins/adminReport" title="" data-ripple="">고양이제보목록</a>
										<a class="#" href="/project_catmoa/admins/adminAddRegion" title="" data-ripple="">지역등록</a>
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
						<div class="col-lg-12" style="margin-left: 100px">
							<div class="row" id="page-contents">
								<div class="col-lg-6">
									<div class="central-meta" style="width: 1700px">
										<div class="messages">
											<h5 class="f-title">
												<i class="fa fa-users" aria-hidden="true"></i>User List
											</h5>
											<div class="insight-box">
												<div class="table-responsive">
													<!-- 관리자 등록 버튼을 눌렀을 때 데이터를 저장하고 서버로 전송할 폼 -->
													<form id="admin-settings-form" action="addAdmin"
														method="post">
														<input type="hidden" name="userId">
														<input type="hidden" name="pageNo" value="${ pageNo }">
													</form>
													<form id="user-settings-form" action="removeAdmin"
														method="post">
														<input type="hidden" name="userId">
														<input type="hidden" name="pageNo" value="${ pageNo }">
													</form>
													<table id="user-list-table" class="table">
														<thead>
															<tr class="table-dark">
																<th>이름</th>
																<th>아이디</th>
																<th>닉네임</th>
																<th>성별</th>
																<th>나이</th>
																<th>회원구분</th>
																<th>권한부여</th>
															</tr>
														</thead>
														<c:forEach var="user" items="${ user }">
															<c:choose>
																<c:when test="${ user.admin eq 1 }">
																	<tr class="table-primary">
																		<td>${ user.name }</td>
																		<td>${ user.userId }</td>
																		<td>${ user.nic }</td>
																		<c:choose>
																			<c:when test="${ user.sex eq 1 }">
																				<td>남성</td>
																			</c:when>
																			<c:otherwise>
																				<td>여성</td>
																			</c:otherwise>
																		</c:choose>
																		<td>${ user.age }세</td>
																		<td>관리자</td>
																		<td>
																			<button class="btn btn-light admin-btn">관리자</button>
																			<button class="btn btn-light user-btn">사용자</button>
																		</td>
																	</tr>

																</c:when>
																<c:otherwise>

																	<tr class="table-light">
																		<td>${ user.name }</td>
																		<td>${ user.userId }</td>
																		<td>${ user.nic }</td>
																		<c:choose>
																			<c:when test="${ user.sex eq 1 }">
																				<td>남성</td>
																			</c:when>
																			<c:otherwise>
																				<td>여성</td>
																			</c:otherwise>
																		</c:choose>
																		<td>${ user.age }세</td>
																		<td>일반 회원</td>
																		<td>
																			<button class="btn btn-light admin-btn">관리자</button>
																			<button class="btn btn-light user-btn">사용자</button>
																		</td>
																	</tr>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</table>

													<br>
													<br>
													${ pager }
													<br>
													<br>
													<br>
													<br>
												</div>
											</div>
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
					<span class="copyright"><a target="_blank"
						href="https://www.templateshub.net">Templates Hub</a></span> <i><img
						src="images/credit-cards.png" alt=""></i>
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

			$('#user-list-table tbody .admin-btn').on('click', function(event) {

				// 버튼의 부모객체 = td, td의 부모객체 = tr
				const tr = $(this).parent().parent();
				const tds = tr.find('td');

				// 1 -> 이름(0), 아이디(1), 닉네임(2), 성별(3), 나이(4), 회원구분(5) 중에서 두번째 td인 아이디를 의미
				const userId = tr.find("td:eq(1)").text();

				// hidden 타입 input에 값 저장
				$('#admin-settings-form input[name=userId]').val(userId);

				$('#admin-settings-form').submit();
			});

			$('#user-list-table tbody .user-btn').on('click', function(event) {

				// 버튼의 부모객체 = td, td의 부모객체 = tr
				const tr = $(this).parent().parent();
				const tds = tr.find('td');

				// 1 -> 이름(0), 아이디(1), 닉네임(2), 성별(3), 나이(4), 회원구분(5) 중에서 두번째 td인 아이디를 의미
				const userId = tr.find("td:eq(1)").text();

				// hidden 타입 input에 값 저장
				$('#user-settings-form input[name=userId]').val(userId);

				$('#user-settings-form').submit();				
			});

		});
	</script>


</body>

</html>