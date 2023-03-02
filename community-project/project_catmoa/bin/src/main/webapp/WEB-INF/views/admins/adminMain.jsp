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
<title>관리자 페이지</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

<jsp:include page="/WEB-INF/views/module/common-css.jsp" />

</head>
<body>
	<div class="theme-layout">

		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />

		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />

		<section>
			<div class="feature-photo">
				<div class="container-fluid">
					<div class="row merged">
						<div class="col-lg-2 col-sm-3">
							<div class="user-avatar">
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
									<li><a class="active" href="/project_catmoa/admins/adminMain"
										title="" data-ripple="">그래프</a> <a class="#"
										href="/project_catmoa/admins/adminUser" title=""
										data-ripple="">회원목록</a> <a class="#"
										href="/project_catmoa/admins/adminReport" title=""
										data-ripple="">고양이제보목록</a> <a class="#"
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
						<div class="col-lg-12">
							<div class="row" id="page-contents">
								<div class="col-lg-12" style="padding:100px 50px">
								<div class="central-meta">
									<div class="messages">
										<h5 class="f-title"><i class="fa fa-line-chart"></i>관리자 그래프 <span class="more-options"><i class="fa fa-ellipsis-h"></i></span></h5>
										<div class="insight-box">
											<div class="x_panel">
												<div class="x_title">
													<h2>회원별 거주지</h2>
												</div>
												<ul class="toolbox">
												  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
												  </li>
												</ul>
												<div class="x_content">
													
													<!--  회원별 거주지 그래프 -->
													<canvas id="bar-chart"></canvas>
													
											  	</div>
											</div>
											<div class="row">
											<div class="x_panel col-6">
											  <div class="x_title">
												<h2>연령대</h2>
												<ul class="toolbox">
												  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
												  </li>
												  
												</ul>
											  </div>
											  <div class="x_content">
													
													<!--  연령대 그래프 -->
													<canvas id="donut-chart"></canvas>

											  </div>
											</div>
											<div class="x_panel col-6">
											  <div class="x_title">
												<h2>유입경로</h2>
												<ul class="toolbox">
												  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
												  </li>
												</ul>
											  </div>
											  <div class="x_content">
													
													<!--  유입경로 그래프 -->
													<canvas id="pie-chart" ></canvas>
												
												</div>

											  </div>
											  
											  <div class="x_panel col-6">
											  <div class="x_title">
												<h2>성별</h2>
												<ul class="toolbox">
												  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
												  </li>
												</ul>
											  </div>
											  <div class="x_content">
													
													<!--  성별 그래프 -->
													<canvas id="gender-chart" ></canvas>
												
												</div>

											  </div>
											  
											</div>
											</div>
										</div>
									</div>
								</div>	
							</div><!-- centerl meta -->
							</div>
							<!-- centerl meta -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<!-- <script src="/project_catmoa/resources/assets/js/echarts.min.js"></script> -->
    <script src="/project_catmoa/resources/assets/js/world.js"></script>
	<script src="/project_catmoa/resources/assets/js/custom.js"></script>
	<script src="/project_catmoa/resources/assets/js/script.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	
	<script type="text/javascript">
	
	
	 // 회원별 거주지 차트
	// var labels = ["서울", "경기,인천", "전라도", "충청도", "강원도", "경상도", "제주도"];
	// var data = [10, 18, 27, 9, 15, 30, 25];
	var areaName = []
	var userCnt = []
	<c:forEach var="userArea" items="${ userAreaList }">
		areaName.push("${userArea.area}");
		userCnt.push(${userArea.cnt});
	</c:forEach>
	
	new Chart(document.getElementById("bar-chart"), {
	    type: 'bar',
	    data: {
	      // labels: ["서울", "경기,인천", "전라도","충청도", "강원도", "경상도", "제주도"],
	      labels: areaName,
	      datasets: [
	        {
	          label: "회원 연령대 비율",
	          backgroundColor: ["#98B2B1", "#D9D7CA","#827157","#F3EFE3	","#B5C4BF", "#CCC9B8", "#7C6C55"],
	          
	          data: userCnt
	          
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: '지역별 거주지 비율'
	      },
	      
	       scales: {
	                    yAxes: [{
	                            display: true,
	                            ticks: {
	                                beginAtZero: true,
	                                steps: 10,
	                                stepValue: 10,
	                                max: 100
	                            }
	                        }]
	                }
	   		 }
	    
	});
	
	
    // 연령대별 차트
    
	//var labels2 = ["미성년자", "20대", "30대", "40대", "50대", "60대", "70대 이상"];
	//var data2 = [10, 18, 27, 9, 15, 30, 25];
	var userAge = []
	var userAgeCnt = []
	<c:forEach var="userAge" items="${ userAges }">
		userAge.push("${userAge.age}");
		userAgeCnt.push(${userAge.cnt});
	</c:forEach>
	
	new Chart(document.getElementById("donut-chart"), {
	    type: 'doughnut',
	    data: {
	      // labels: ["서울", "경기,인천", "전라도","충청도", "강원도", "경상도", "제주도"],
	      labels: userAge,
	      datasets: [
	        {
	          label: "연령대 비율",
	          backgroundColor: ["#98B2B1", "#D9D7CA","#827157","#F3EFE3	","#B5C4BF", "#CCC9B8", "#7C6C55"],
	         
	          data: userAgeCnt
	        }
	      ]
	    },
	    /* options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: '연령대 비율'
	      },
	      
	       scales: {
	                    yAxes: [{
	                            display: true,
	                            ticks: {
	                                beginAtZero: true,
	                                steps: 10,
	                                stepValue: 5,
	                                max: 50
	                            }
	                        }]
	                }
	    		} */
	    
		});
	
	
	
	// 유입경로 차트
	//var labels3 = ["SNS", "Youtube", "인터넷", "지인소개"];
	//var data3 = [10, 18, 27, 9];
	var userInflow = []
	var userInflowCnt = []
	<c:forEach var="userInflowcode" items="${ userInflowcodes }">
		userInflow.push("${userInflowcode.inflowcode}");
		userInflowCnt.push(${userInflowcode.cnt});
	</c:forEach>
	new Chart(document.getElementById("pie-chart"), {
	    type: 'pie',
	    data: {
	      // labels: ["서울", "경기,인천", "전라도","충청도", "강원도", "경상도", "제주도"],
	      labels: userInflow,
	      datasets: [
	        {
	          label: "유입경로 비율",
	          backgroundColor: ["#98B2B1", "#D9D7CA","#827157","#F3EFE3	"],
	         
	          data: userInflowCnt
	        }
	      ]
	    },
	    /* options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: '유입경로 비율'
	      },
	      
	       scales: {
	                    yAxes: [{
	                            display: true,
	                            ticks: {
	                                beginAtZero: true,
	                                steps: 10,
	                                stepValue: 5,
	                                max: 50
	                            }
	                        }]
	                }
	    		} */
	    
		});
	
			// 성별 차트
			//var labels2 = ["남성", "여자"];
			//var data2 = [10, 18, 27, 9, 15, 30, 25];
			var userGender = []
			var userGenderCnt = []
			<c:forEach var="userGender" items="${ userGenders }">
				userGender.push("${userGender.sex}");
				userGenderCnt.push(${userGender.cnt});
			</c:forEach>
			
			new Chart(document.getElementById("gender-chart"), {
			    type: 'doughnut',
			    data: {
			      // labels: ["서울", "경기,인천", "전라도","충청도", "강원도", "경상도", "제주도"],
			      labels: userGender,
			      datasets: [
			        {
			          label: "성별 비율",
			          backgroundColor: ["#98B2B1", "#D9D7CA"],
			         
			          data: userGenderCnt
			        }
			      ]
			    },
			    /* options: {
			      legend: { display: false },
			      title: {
			        display: true,
			        text: '연령대 비율'
			      },
			      
			       scales: {
			                    yAxes: [{
			                            display: true,
			                            ticks: {
			                                beginAtZero: true,
			                                steps: 10,
			                                stepValue: 5,
			                                max: 50
			                            }
			                        }]
			                }
			    		} */
			    
				});
	</script>
</body>
</html>
</html>