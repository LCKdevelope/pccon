
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>피시방개업</title>
<style type="text/css">
.pcimg {
	width: 100%;
	height: 85%;
}

.top-left {
	position: absolute;
	top: 8px;
	left: 16px;
	font-size: 65px;
	color: white;
}
</style>
</head>
<body style="background-color: yellowgreen">
	
		<div>
		
			<div>
				지점명 : <input id="pcRname" type="text">
			</div>
			<div>
				<div style="display: flex; width: 1000px;">
					<!-- 카카오 맵 출력 -->
					<div id="map" style="width: 500px; height: 400px;"></div>

				</div>
			</div>
			<div>
				자리갯수: <input id="pcrSeatsEa" type="text">
			</div>
			<div>
				<button type="button" onclick="openPCRoom()">피시방 개업</button>
				
			</div>
		</div>


	<div style="text-align: center">인천일보 아카데미</div>




	<!-- 카카오 맵 API -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd87efd6362e67ef57e8c5c68257f358"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
				
	        center: new kakao.maps.LatLng(37.43887161880611, 126.67513244304602), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;

		    /* 정류소 목록 조회(위도, 경도) */
		    mapClick( latlng.getLat(), latlng.getLng() );
		});
		
		var marker = null;
		
	</script>
	<!-- JQUERY -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	

	<script type="text/javascript">
		/* 정류소 목록을 출력할 DIV 선택 */
		let pcrName = document.getElementById('pcRname');
		let pcrSeatsEa=document.getElementById('pcrSeatsEa');
		function mapClick(gpslati, gpslong){
			lati=gpslati;
			long=gpslong;
			console.log("선택한 위도(lati) : " + lati) ;
			console.log("선택한 경도(long) : " + long) ; 
		}
		function openPCRoom() {
			//피시방 개업
			console.log("선택한 위도(lati) : " + lati) ;
			console.log("선택한 경도(long) : " + long) ;
			console.log("피시방이름 : " + pcRname.value) ;
			let seatSEa = Number(pcrSeatsEa.value);
			console.log("자리갯수: " + seatSEa ) ;
		 	$.ajax({
				type : 'post',
				url : 'openPCRoom',
				data: {'pcrName':pcrName.value,'pcrLati':lati,'pcrLong':long ,'pcrSeatsEa':seatSEa },
				success : function(res){
					//개업 완료
					alert('개업')
					window.close();
					
				}
				
			});
		}

	</script>
</body>
</html>