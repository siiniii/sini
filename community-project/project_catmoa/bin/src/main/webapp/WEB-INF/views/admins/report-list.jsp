<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


														<table id="user-list-table" class="table">
															<thead>
																<tr class="table-dark">
																	<th>글번호</th>
																	<th>작성자</th>
																	<th>지역</th>
																	<th>글내용</th>
																	<th>색상</th>
																	<th>작성일자</th>
																</tr>
															</thead>
															
															<c:forEach var="report" items="${ reportList }">
																<tr class="report-tr" data-boardno="${ report.boardNo }">
																	<td>${ report.boardNo }</td>
																	<td>${ report.userId }</td>
																	<td>${ report.localName }</td>
																	<td>${ report.boardContent }</td>
																	<td>${ report.colorName }</td>
																	<td>${ report.writeTime }</td>
																</tr>
															</c:forEach>
														</table>	
														${ reportPager }
														<br>
														<br>
													