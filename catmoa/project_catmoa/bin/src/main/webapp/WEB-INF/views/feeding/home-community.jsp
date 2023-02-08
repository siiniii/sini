<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="cat-info">
			<!-- 고양이 정보 게시란 -->

			<div class="gray-bg">
				<div class="row">
					<div class="col-lg-12">
						<div class="shop-page">
							<div class="row">
								<div class="container text-center my-3">


									<h4 class="font-weight-light">우리 동네 고양이</h4>
									<br>
									<div class="row mx-auto my-auto justify-content-center">
										<div id="recipeCarousel" class="carousel slide"
											data-ride="carousel" data-interval="false">
											<div class="carousel-inner col-12" role="listbox">
												
													<c:choose>
														<c:when test="${ empty catsId && localNo }">
															<br>
															<br>
															<h6 style='color: gray'>등록된 정보가 없습니다.</h6>
															<br>
															<br>
														</c:when> 

														<c:otherwise>
														<div class="carousel-item active">
															<c:forEach varStatus="s" var="catinfomation" items="${ catinfomations }">
																<div class="col-lg-3">
																	<div class="movie-card">
																		<div class="movie-img">
																			<a href="#"><img
																				src="/project_catmoa/resources/assets/images/resources/${catinfomation.catImage}"
																				class="img-fluid"></a>
																		</div>
																		<div class="movie-title">
																				<p class="text-white text-sm-center font-small flex-center">${catinfomation.catNickname}</p>
																				<p>${ catinfomation.characteristic }</p>
																		</div>
																</div>
															</div>
															</c:forEach>
														</div>
														</c:otherwise>
													</c:choose> 
												 
											</div>
											<!-- inner -->
											<!-- ---------------------------------------------------------------- -->
											<a class="carousel-control-prev bg-dark w-auto"
												href="#recipeCarousel" role="button" data-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="sr-only">Previous</span></a>
												<a class="carousel-control-next bg-dark w-auto"
												href="#recipeCarousel" role="button" data-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="sr-only">Next</span></a>
												

										</div>
									</div>
									<h5 class="mt-2">Advances one slide at a time</h5>
								</div>

								<%-- <c:forEach var="catinfomation" items="${ catinfomations }">
										<div class="col-lg-3 col-sm-6">
											<div class="product-box">
												<figure>
													<img src="/project_catmoa/resources/assets/images/resources/${catinfomation.cat_image}" alt="">
													
													<ul class="cart-optionz">
														<li><a href="#" title="크게보기"
															data-toggle="tooltip"><i class="ti-eye"></i></a></li>
														<li><a href="#" title="관심있어요"
															data-toggle="tooltip"><i class="ti-heart"></i></a></li>
													</ul>
												</figure>
												<div class="product-name">
													<h5>${ catinfomation.cat_nickname }</h5>
													<div class="prices">
														<h6>${ catinfomation.characteristic }</h6>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									<div class="col-lg-12">
										<ul class="paginationz">
										${ pager }
											<!-- <li class="prev"><a title="" href="#"><i
													class="fa fa-angle-left"></i></a></li>
											<li><a title="" href="#">01</a></li>
											<li><a title="" href="#" class="active">02</a></li>
											<li><a title="" href="#">03</a></li>
											<li><a title="" href="#">04</a></li>
											<li class="space">.......</li>
											<li><a title="" href="#">21</a></li>
											<li class="next"><a title="" href="#"><i
													class="fa fa-angle-right"></i></a></li> -->
										</ul> 
									</div>
									<!-- pagination -->
								</div>
							</div>
						</div>
					</div> 
--%>

							</div>
						</div>
						<div>
							<h4>커뮤니티</h4>
							<section>
								<div class="gap gray-bg">
									<div class="container">
										<div class="row" id="page-contents">
											<div class="col-lg-12">
												<div class="blog-sec">
													<div class="post-filter-sec">
														<form method="post" class="filter-form">
															<input type="post" placeholder="Search post">
															<button>
																<i class="ti-search"></i>
															</button>
														</form>
														<div class="purify">
															<span>지역 선택</span> <select>
																<option>서울시</option>
																<option>경기도</option>
																<option>인천</option>
															</select> <select>
																<option>강남구</option>
																<option>서초구</option>
																<option>송파구</option>
															</select>
														</div>
													</div>
													<div class="submit-btns">
														<a class="addnewforum"
															href="/project_catmoa/board/feeding-write?boardGroupNo=3"
															title=""><i class="fa fa-plus"></i> 글쓰기</a>
													</div>
													<div class="forum-list">
														<table class="table table-responsive">
															<thead>
																<tr>
																	<th scope="col">forum</th>
																</tr>
															</thead>
															<c:forEach var="feedingBoard" items="${ feedingBoards }">
															
																<c:forEach var="board" items="${ boards }">
																<c:if test="${ feedingBoard.boardNo eq board.boardNo }">
																	<tbody>
																		<tr>
																			<td><i class="fa fa-comments"></i>
																			 <a href="/project_catmoa/board/feeding-detail?boardNo=${ board.boardNo }" title="">${ board.boardTitle }</a>
																				<p> ${ board.boardContent }</p>
																			</td>
																		</tr>
																	</tbody>
																</c:if>
																</c:forEach>
															
															</c:forEach>
														</table>
													</div>
													${ Pager }
													<button class="btn-view btn-load-more">Load More</button>
												</div>
											</div>

										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	
<jsp:include page="/WEB-INF/views/module/common-js.jsp" />

<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
