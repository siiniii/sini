<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
    	 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				   <c:forEach var="vehicle" items="${ vehicles }" varStatus="status" >
                  <tr>
                  	  <td style="display:none">${ vehicle.indexNo }</td>
                      <td>${ status.count }</td>
                      <td>${ vehicle.regCarNo }</td>
                      <td>${ vehicle.regInfo }</td>
                      <td>${ vehicle.regDate }</td>
                      <td class="project-actions text-right">
                      	  <button class="btn btn-primary btn-sm inout-btn">
                              <i class="fas fa-folder">
                              </i>
                              출입기록
		                  </button> 
		                  
					<button class="btn btn-info btn-sm modify-btn">
                              <i class="fas fa-pencil-alt">
                              </i>
                              수정
                          </button>
                          
                          <button class="btn btn-danger btn-sm delete-btn" >
                              <i class="fas fa-trash">
                              </i>
                              삭제
                          </button>
                          
                      </td>
                  </tr>
                  </c:forEach>
                  
                  