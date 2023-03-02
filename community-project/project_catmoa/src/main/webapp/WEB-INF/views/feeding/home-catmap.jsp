<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div class="nearby-map">
	<div id="map" style="height: 500px;" class="col-12">		 
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e0e046e5a187079fd87e9658ccfa0c0"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.483439, 127.032332),
			level: 4
		};

		var map = new kakao.maps.Map(container, options); // 지도를 생성합니다
		
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var markerPosition = [
			<c:forEach var="feedingArea" items="${ feedingAreas }">
			{
		    	content: '<div class="map-info">${feedingArea.area}<br><a href="#" class="marker" data-local-no="${feedingArea.localNo}">급식구역 자세히보기</a></div>',
		        latlng: new kakao.maps.LatLng(${feedingArea.lat}, ${feedingArea.lng})
		    },
			</c:forEach>
		    /*
		    {
		    	content: '<div class="map-info">구청사<br><a href="#" data-local-no="1">급식구역 자세히보기</a></div>', 
		        latlng: new kakao.maps.LatLng(37.483439, 127.032332)
		    },
		    {
		    	content: '<div class="map-info">우면산<br><a href="#" data-local-no="2">급식구역 자세히보기</a></div>', 
		        latlng: new kakao.maps.LatLng(37.476440627976785, 127.01823562806581)
		    },
		    {
		    	content: '<div class="map-info">서리풀공원<br><a href="#" data-local-no="3">급식구역 자세히보기</a></div>', 
		        latlng: new kakao.maps.LatLng(37.49785873337124, 127.00789908449094)
		    },
		    {
		    	content: '<div class="map-info">방배 13구역<br><a href="#" data-local-no="4">급식구역 자세히보기</a></div>',
		        latlng: new kakao.maps.LatLng(37.477811420835266, 126.99406737715309)
		    }
		    */
		];

		for (var i = 0; i < markerPosition.length; i ++) {
		
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : markerPosition[i].latlng,
				clickable : true
			});

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: markerPosition[i].content // 인포윈도우에 표시할 내용
			});
	
			// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			(function(marker, infowindow) {
				// 마커에 click 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
				kakao.maps.event.addListener(marker, 'click', function() {
					infowindow.open(map, marker);
				});

				//지도의 아무곳을 누르면 인포윈도우가 닫힘
				kakao.maps.event.addListener(map, 'click',function(mouseEvent) {
					infowindow.close(map, marker);
				});
			})(marker, infowindow);
		}
		
		function panTo() {
		    // 이동할 위도 경도 위치를 생성합니다
		    const lat = $('#dong a.active').data('lat');
		    const lng = $('#dong a.active').data('lng');
		    
		    if (!Boolean(lat) || !Boolean(lng) ) {
  	 			alert('지역을 선택하세요');
  	 			return;
  	 		}
		    
		    var moveLatLon = new kakao.maps.LatLng(parseFloat(lat), parseFloat(lng));
		    map.panTo(moveLatLon);
		    
		    
		   /* if(townNo =="SC01") {
		    	var moveLatLon = new kakao.maps.LatLng(37.48998709441099, 127.01948274043176);
		    	// 지도 중심을 부드럽게 이동시킵니다
		    	// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    	map.panTo(moveLatLon);
		    }else if(townNo == "SC02"){
		    	var moveLatLon = new kakao.maps.LatLng(37.48337517366857, 126.9945163688845);
		    	map.panTo(moveLatLon);
		    }else if(townNo == "SC03"){
		    	var moveLatLon = new kakao.maps.LatLng(37.49752111943759, 127.00037318341431);
		    	map.panTo(moveLatLon);
		    }else if(townNo == "SC04"){
		    	var moveLatLon = new kakao.maps.LatLng(37.471627763314366, 127.04177081458135);
		    	map.panTo(moveLatLon);
		    }else if(townNo == "SC05"){
		    	var moveLatLon = new kakao.maps.LatLng(37.458653335900685, 127.07727677842526);
		    	map.panTo(moveLatLon);
		    }else{
		    	alert('동을 선택해주세요');
		    }  */
		            
		}       
		
	</script>
</div>
