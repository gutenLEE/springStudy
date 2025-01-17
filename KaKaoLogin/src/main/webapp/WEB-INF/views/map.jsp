<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=ege"/>
<meta name ="viewport" content="user-scalable=no, inital-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">
   <title>Kakao JavaScript SDK</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6bb98dfa3dc2ce3f444206e574ea27d"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- c6bb98dfa3dc2ce3f444206e574ea27d -->
<div id="map" style="width: 100%; height: 350px;"></div>
<p><em>지도를 클릭해주세요!</em></p>
<div id="clickLatlng"></div>
<p id="demo"></p>


<script>
	
	function startMap(lat, lon){
		
		var mapContainer = document.getElementById('map'),
		   mapOption = {
			center: new kakao.maps.LatLng(lat, lon), //지도의 중심좌표.
		       level : 3 // 지도 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 주소-좌표 변환 객체를 생성합니다
		// var geocoder = new kakao.maps.services.Geocoder();
		
		//지도를 클릭한 위치에 표출할 마커
		var marker = new kakao.maps.Marker({
		    //지도 중심좌표에 마커를 생성합니다.
		    position : map.getCenter()
		});
		// 지도에 마커를 표시합니다.
		marker.setMap(map);
		
		// 지도에 클릭 이벤트를 등록합니다.
		// 지도를 클릭하면 마지막 파라미너로 넘어온 함수를 호출합니다.
		kakao.maps.event.addListener(map, 'click', function(mouseEvent){
		    
			// 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		});
	}

    
    window.addEventListener('DOMContentLoaded', function(){
    	
    	var x = document.getElementById("demo");
    	var lat;
    	var lon;
    	
    	 if (navigator.geolocation) 
    	 {
             //위치 정보를 얻기
    		 navigator.geolocation.getCurrentPosition((position) => {
    			 
    			 startMap(position.coords.latitude, position.coords.longitude);
    			 
    			 console.log(position.coords.latitude, position.coords.longitude);
    			 

    		});
             
             
         } 
    	 else 
    	 {
             alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
         }
        
    });

</script>
</body>
</html>