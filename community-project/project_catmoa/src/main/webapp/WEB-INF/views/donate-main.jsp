<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="ko">

<link rel="stylesheet"
	href="/project_catmoa/resources/assets/css/donate.css">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>CatMoa Home</title>

<jsp:include page="/WEB-INF/views/module/common-css.jsp" />
<link rel="stylesheet"
	href="/project_catmoa/resources/assets/css/donate.css">

</head>
<body>

	<!--<div class="se-pre-con"></div>-->
	
	<div class="theme-layout">

		<jsp:include page="/WEB-INF/views/module/responsive-header.jsp" />

		<!-- ======= header ======= -->
		<jsp:include page="/WEB-INF/views/module/topbar.jsp" />
		<!-- End header -->

		<jsp:include page="/WEB-INF/views/module/page-header.jsp">
			<jsp:param value="후원을 해주십시오" name="title" />
		</jsp:include>

		<section>
			<div class="gap gray-bg">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="row" id="page-contents">
								<jsp:include page="/WEB-INF/views/module/left-sidebar.jsp" />

								<div class="col-lg-6">

									<div>
										<h2 class="donate-count" id="donate-count">0</h2>
									</div>

									<div class="area-donate-barChart">
										<canvas id="bar-chart" width="200" height="130"></canvas>
									</div>
									<div>
										<a href="/project_catmoa/donate-detail" class="btn-donate"
											type="button">나도 후원하러가기</a>
											<span class="donate-heart" id="donate-heart"><i class="ti-heart"></i>${dp}</span>
											<a class="donate-msg">보내주신 사랑 감사합니다 애옹<i class="ti-github"></i></a>
									</div>
								</div>
								
								
								
								<jsp:include page="/WEB-INF/views/module/right-sidebar.jsp" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- ======= header ======= -->
		<jsp:include page="/WEB-INF/views/module/footer.jsp" />
		<!-- End header -->

	</div>

	<jsp:include page="/WEB-INF/views/module/common-js.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	
	<script type="text/javascript">
	
	$(function() {
		 
		// 카운트를 표시할 요소
		const $counter = document.querySelector(".donate-count");

		// 목표수치
		const donateSum = ${don};
		
		counter($counter, donateSum);
		function counter($counter, donateSum) {
			let now = donateSum;

			const handle = setInterval(() => {
				$counter.innerHTML = Math.ceil(donateSum - now).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

				// 목표에 도달하면 정지
				if (now < 1) {
					clearInterval(handle);
				}

				// 적용될 수치, 점점 줄어듬
				const step = now / 30;

				now -= step;
			}, 7);
		}

		var areaName = []
		var donationCnt = []
		<c:forEach var="donateRank" items="${ donateAreaRanks }">
			areaName.push("${donateRank.area}");
			donationCnt.push(${donateRank.cnt});
		</c:forEach>
		new Chart(document.getElementById("bar-chart"), {
		    type: 'bar',
		    data: {
		      // labels: ["서울", "경기,인천", "전라도","충청도", "강원도", "경상도", "제주도"],
		      labels: areaName,
		      datasets: [
		        {
		          label: "기부금 백분율",
		          backgroundColor: ["#98B2B1", "#D9D7CA","#827157","#F3EFE3	","#B5C4BF", "#CCC9B8", "#7C6C55"],
		         
		          data: donationCnt
		        }
		      ]
		    },
		    options: {
		      legend: { display: false },
		      title: {
		        display: true,
		        text: '지역별 기부금 비율'
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
		    		}
		    
			});
	
	});

	
	
		
		
	
	
	</script>
</body>


</html>