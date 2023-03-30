<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	
	<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
	
	<style>
	.buttons{width:920px; margin:0 auto;}
.buttons input{
	height: 35px;
	color: #fff;
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
	padding: 6px 10px;
}
.btns {
	position: absolute;
	bottom: -15px;
	left: 40%;
}

.btns input{
	height: 35px;
	color: #fff;
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
	padding: 6px 10px;
}
	</style>
	
</head>

<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">		
		
		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />
		
		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
	


	<section>
		<div class="ext-gap bluesh high-opacity">
			<div class="content-bg-wrap" ></div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="top-banner">
							<h1>구조 게시판</h1>
							<nav class="breadcrumb">
							  <a class="breadcrumb-item" href="/project_catmoa/home-feeding">Home</a>
							  <span class="breadcrumb-item active">구조게시판</span>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!-- top area animated -->
	

	
	<section>
		<div class="gap ext-bottom">
			<div class="container">
				<div class="row">
					<div class="offset-lg-1 col-lg-10">
						<div class="detail-page">
							<div class="detail-meta">
								<h2><a href="#" title="">${ board.boardTitle }</a></h2>
								
								<div class="post-time">
									<div class="author-thumb">
									<span><a href="#" title="">${ board.userId }</a></span>
								</div>
									<span class="post-date">
										<i class="fa fa-calendar"></i>
										<a title="" href="#">${ board.writeTime }</a>
									</span>
									<span class="coments">
										<i class="fa fa-comments"></i>
										<a title="" href="#">${ replyCount }</a>
									</span>
									
									<!-- 좋아요 -->
									<span class="likes">
									 <i id='like-toggle-i' class="bi-heart" style="font-size:5px; color: red; cursor: pointer;"></i>
									 <a title="" href="#">like</a>
									</span>
									<!-- 좋아요 끝 -->
									
									<!-- 찜 -->
									<span class="jjims">
									 <i id='jjim-toggle-i' class="bi-bookmark" style="font-size:5px; color: green; cursor: pointer;"></i>
									 <a title="" href="#">찜</a>
									</span>
									<!-- 찜 끝 -->
									

								</div>
								<!-- 첨부파일 & 글내용 -->
								<div>
								<table>
								<tr>
								<th>첨부파일</th>
								<td>
								<c:forEach var="attachment" items="${ board.boardAttachments }">
								<a href="downloadBoardAttachment?attachmentNo=${ attachment.attachmentNo }"
									style="text-decoration: none"> ${ attachment.userFileName }
								</a>
								</c:forEach>
								</tr>
								<tr>
								<th>글내용</th>
								<td>
								<c:set var="enter" value="" /> ${ fn:replace(board.boardContent, enter, "<br>") }
								</td>
								</tr>
								</table>
								</div>
								<br><br>
								<div class="gap-60 no-top">
									<div class="comment-area">
										<h4 class="comment-title">comments</h4>
										<ul class="comments" id="comment-list">
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
										</ul>
									</div>
								</div>
							</div><!-- comments sec -->
								<div class="gap-60 no-gap">
									<h4 class="comment-title">Leave a Comment</h4>
									<div class="contact-form">
									
									<form id="commentForm" action="write-comment" method="post">
									<div class="form-group">
										<input type="hidden" name="userId" value="${ loginuser.userId }">
										<input type="hidden" name="boardNo" value="${ board.boardNo }">
										<input type="hidden" name="boardGroupNo" value="${ board.boardGroupNo }">
									</div>
									<div class="form-group">
										<label for="exampleFormControlTextarea1">댓글</label>
										<textarea class="form-control" name="content"rows="3"></textarea>
									</div>
									  <button type="submit" class="btn btn-primary">등록</button>
								   </form>
									</div>
								</div>
								
								
							</div>
							<c:if test="${loginuser.userId == board.userId}">
							<div class="btns">
								<input type="button" id="delete_button" value="삭제" >
								<input type="button" id="update_button" value="편집" >
							</div>
							</c:if>
									
						</div>

					</div>
				</div>
			</div>
			</section>	
		</div>
	
	
	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script type="text/javascript">
$(function() {
	
	var commentNo = 0;
	
	$('#delete_button').on('click', function(event) {
		const ok = confirm("${ board.boardNo }번 글을 삭제할까요?");
		if (!ok) return;
		
		location.href = '${board.boardNo}/delete.action?pageNo=${pageNo}';
	});
	
	$('#update_button').on('click', function(event) {
		location.href = 'edit.action?boardNo=${board.boardNo}&pageNo=${pageNo}';
	});
	
	$('#comment-list').on('click','input[id^=del_comments_btn]', function(event) {
		const ok = confirm("댓글을 삭제할까요?");
		if (!ok) return;
		
		commentNo = $(this).data('comment_no');
		
		$.ajax({
    		"url": "delete-comment.action",
    		"data": "commentNo=" + commentNo,
    		"method": "get",
    		"success": function(data, status, xhr) {
    			$('#comment-list').load('comment-list?boardNo='+${board.boardNo});
    			commentNo=0;
    		},
    		"error": function(xhr, status, err) {
    			alert('실패');
    		}
    		
    	});
		
		
		
	});
	
	
	
	$('#comment-list').on('click','input[id^=comments_update_btn]', function(event) {
		
		if (commentNo != 0) {
			$('#comment-edit-area'+commentNo).hide();
			$('#comment-box'+commentNo).show();
		}
		
		commentNo = $(this).data('comment_no');
		
		$('#comment-edit-area'+commentNo).show();
		$('#comment-box'+commentNo).hide();
	});
	
	$('#comment-list').on('click', '.comment-update-btn', function(event) {
		const cNo = $(this).data('comment_no');
		//alert(cNo);
		
		const formData = $('#editForm' + cNo).serialize();
		//alert(formData);
		//return;
		$.ajax({
			"url": "update-comment",
			"method": "post",
			"data": formData,
	 		"success": function(data) {
	 			if (data == "success") {
	 				$('#comment-list').load('comment-list?boardNo='+${board.boardNo});
	    			commentNo=0;
	 			}
	 		},
	 		"error": function(xhr, status, err) {
	 			alert('실패');
	 		}
		});
	});
		
		

		
	//});

	$('#comment-list').on('click','input[id^=cancel]', function(event) {
		
		commentNo = $(this).data('comment_no');
		
		$('#comment-edit-area'+commentNo).hide();
		$('#comment-box'+commentNo).show();

	});
	
	/* 좋아요 */
    var like = ${ like };
    if(like){        	
        $('#like-toggle-i').attr('class','bi-heart-fill');            
    }else {
        $('#like-toggle-i').attr('class','bi-heart');
    }
    
    $('#like-toggle-i').on('click',function(){
        if(!like){        	
            $(this).attr('class','bi-heart-fill');            
        }else {
            $(this).attr('class','bi-heart');
        }
        like = !like;
        
    	$.ajax({
    		"url": "toggle-like",
    		"data": "userId=${ loginuser.userId }&boardNo=${ board.boardNo }&like=" + like,
    		"method": "post",
    		"success": function(data, status, xhr) {
    			data;
    		},
    		"error": function(xhr, status, err) {
    			status;
    		}
    		
    	});
    	


    }); 
	
	/* 찜 */
    var jjim = ${ jjim };
    if(jjim){        	
        $('#jjim-toggle-i').attr('class','bi-bookmark-fill');            
    }else {
        $('#jjim-toggle-i').attr('class','bi-bookmark');
    }
    
    $('#jjim-toggle-i').on('click',function(){
        if(!jjim){        	
            $(this).attr('class','bi-bookmark-fill');            
        }else {
            $(this).attr('class','bi-bookmark');
        }
        jjim = !jjim;
        
    	$.ajax({
    		"url": "toggle-jjim",
    		"data": "userId=${ loginuser.userId }&boardNo=${ board.boardNo }&jjim=" + jjim,
    		"method": "post",
    		"success": function(data, status, xhr) {
    			data;
    		},
    		"error": function(xhr, status, err) {
    			status;
    		}
    		
    	});
    	


    }); 
	

	
})

</script>
</body>	

</html>


























