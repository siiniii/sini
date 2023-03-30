<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>지역등록</title>

<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
</head>
<body>

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
										<h5>${ loginuser.nic }</h5> <span> <c:choose>
												<c:when test="${ loginuser.admin eq 1 }">
									  Admin
									  </c:when>
												<c:otherwise>
									  User
									  </c:otherwise>
											</c:choose>
									</span>
									</li>
									<li><a class="#" href="/project_catmoa/admins/adminMain"
										title="" data-ripple="">그래프</a> <a class="#"
										href="/project_catmoa/admins/adminUser" title=""
										data-ripple="">회원목록</a> <a class="#"
										href="/project_catmoa/admins/adminReport" title=""
										data-ripple="">고양이제보목록</a> <a class="active"
										href="/project_catmoa/admins/adminAddRegion" title=""
										data-ripple="">지역등록</a></li>
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
										<div class="messages col-6">
											<h5 class="f-title">
												<i class="fa fa-users" aria-hidden="true"></i>AddRegion
											</h5>
											<div class="insight-box">
												<div class="table-responsive">
													<!-- 관리자 등록 버튼을 눌렀을 때 데이터를 저장하고 서버로 전송할 폼 -->
													<form id="admin-settings-form" action="addAdmin"
														method="post">
														<input type="hidden" name="userId"> <input
															type="hidden" name="pageNo" value="${ pageNo }">
													</form>
													<form id="user-settings-form" action="removeAdmin"
														method="post">
														<input type="hidden" name="userId"> <input
															type="hidden" name="pageNo" value="${ pageNo }">
													</form>
													<form action="addRegion" method="post">
														<div class="text-container">
															<div>
																<label>시</label> <input type="text" class="form-control"
																	id="city" placeholder="도시 입력" name="city"
																	maxlength="50" required="required" pattern=".{2,50}"
																	style="width: 300px" value="${ region.city }">
																<label>구</label> <input type="text" class="form-control"
																	id="gu" placeholder="구 입력" name="gu" maxlength="50"
																	required="required" pattern=".{2,50}"
																	style="width: 300px" value="${ region.gu }">
																<label>구역</label> <input type="text"
																	class="form-control" id="area" placeholder="구역 입력"
																	name="area" maxlength="50" required="required"
																	pattern=".{2,50}" style="width: 300px"
																	value="${ region.area }">
																<label>위도</label> <input type="text"
																	class="form-control" id="lat" placeholder="위도 입력"
																	name="lat" maxlength="50" required="required"
																	pattern=".{2,50}" style="width: 300px"
																	value="${ region.lat }">
																<label>경도</label> <input type="text"
																	class="form-control" id="lng" placeholder="경도 입력"
																	name="lng" maxlength="50" required="required"
																	pattern=".{2,50}" style="width: 300px"
																	value="${ region.lng }">
																<br><br>
																<button type="submit" class="btn btn-outline-primary">지역 등록</button>
															</div>
														</div>
													</form>

													<br> <br> ${ pager } <br> <br> <br>
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
		</section>
	</div>

	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<script type="text/javascript">
		$(function() {
			<c:if test="${ not empty exist }">
			alert('등록 실패 : 이미 등록되어 있는 구역입니다');
			</c:if>
		});
	</script>
</body>
</html>
























