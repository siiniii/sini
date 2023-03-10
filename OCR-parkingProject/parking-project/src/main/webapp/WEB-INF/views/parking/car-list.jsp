<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
    	 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
             <c:forEach var="vehicle" items="${ vehicles }" varStatus="status" >
              	<c:forEach var="rates" items="${ rate }" varStatus="rateStatus" >
              	 <fmt:formatNumber var="totalMinutes" value="${ (vehicle.exitTime.getTime() - vehicle.enterTime.getTime()) / (1000 * 60) }" minFractionDigits="0" maxFractionDigits="0"></fmt:formatNumber>
              	
                  <tr>
                  	  <td style="display:none">${ vehicle.indexNo }</td>
                      <td>${ status.count }</td>
                      <td id="rate-check-carno">${ vehicle.carNo }</td>
                      <td>${ vehicle.parkingType }</td>
                      <td>${ vehicle.enterTime }</td>
                      <td>${ vehicle.exitTime != null ? vehicle.exitTime : '(NULL)' }</td>
                      <td>&nbsp;&nbsp;${ vehicle.exitTime != null ? totalMinutes : 0 }분</td>
                      <td>${ (vehicle.exitTime != null ? totalMinutes : 0) * (vehicle.parkingType == "일반방문차량"? rates.visitorRate : vehicle.parkingType == "상가방문차량" ? rates.customerRate : rates.residentRate) }</td>
                      
                      <td class="project-actions">
					  	 <a class="btn btn-primary btn-sm register-btn" data-index_no="${ vehicle.indexNo }" href="#">등록</a>
					  	 <c:choose>
						  	 <c:when test="${ vehicle.exitTime != null }">
		                     	 <a class="btn btn-primary btn-sm payment-btn" data-index_num="${ vehicle.indexNo }" href="#">
		                             <i class="fas fa-check"></i>정산
		                         </a>
	                         </c:when>
	                         <c:otherwise>
	                         	<a class="btn btn-primary btn-sm payment-btn" data-index_num="${ vehicle.indexNo }" href="#" style= "pointer-events: none; background-color: gray; border-color: gray">
		                             <i class="fas fa-check"></i>정산
		                         </a>
	                         </c:otherwise>
                         </c:choose>
                      </td>
                  </tr>
                  </c:forEach>
              </c:forEach>
              