<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

															<table id="cat-info-list-table" class="table">
																<thead>
																	<tr class="table" style="background-color:#088dcd; color:white">
																		<th>고양이아이디</th>
																		<th>지역</th>
																		<th>별명</th>
																		<th>성별</th>
																		<th>색상</th>
																		<th>등록일자</th>
																	</tr>
																</thead>
																<tbody>	
																<c:forEach var="catinfo" items="${ catinfoList }">
																	<tr class="catinfo-tr" data-catsid="${ catinfo.catsId }">
																		<td>${ catinfo.catsId }</td>
																		<td>${ catinfo.localName }</td>
																		<td>${ catinfo.catNickname }</td>
																		<td>${ catinfo.catGender == 1 ? "수컷" : catinfo.catGender == 2 ? "암컷" : "미상" }</td>
																		<td>${ catinfo.colorName }</td>
																		<td>${ catinfo.registerTime }</td>
																	</tr>
																</c:forEach>															
																</tbody>
															</table>
															${ catinfoPager }
															<br>
															<br>