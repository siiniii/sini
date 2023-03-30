<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="comment" items="${ comments }">
											<li>
												<div class="comment-box" id="comment-box${ comment.commentNo }">
													<div class="commenter-meta">
														<div class="comment-titles">
															<h6>${ comment.userId }</h6>
															<span>${ comment.regDate }</span>
															<c:if test="${loginuser.userId == comment.userId}">
															<div class="buttons">
																<input type="button" data-comment_no="${ comment.commentNo }" id="del_comments_btn${ comment.commentNo }" value="삭제" >
																<input type="button" data-comment_no="${ comment.commentNo }" id="comments_update_btn${ comment.commentNo }" value="수정" >
															</div>				
															</c:if>										
															<a title="" href="#" class="reply">reply</a>
														</div>
														<p>
														${ comment.content }
														</p>
													</div>
												</div>	
											
											
												<div id="comment-edit-area${ comment.commentNo }" style="display:none">
													<form id="editForm${ comment.commentNo }" action="update-comment" method="post">
													<div class="form-group">									
														<input type="hidden" name="commentNo" value="${ comment.commentNo }">
													</div>										
													<div class="form-group">
														<label for="exampleFormControlTextarea1">댓글</label>
														<textarea class="form-control" name="content" rows="3">${ comment.content }</textarea>
													</div>
													  <button type="button" data-comment_no="${ comment.commentNo }" class="btn btn-primary comment-update-btn">등록</button>	
													  <input type="button" data-comment_no="${ comment.commentNo }" id="cancel${ comment.commentNo }" value="취소" >
													</form>
												</div>
											</li>
											</c:forEach>
						
























