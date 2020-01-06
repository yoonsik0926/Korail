<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ij53ss6vck&submodules=geocoder"></script>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 전국 스탬프 지도</span>
		</h3>
	</div>
     
     <div>
	
		<div style="width:80%; margin:0 auto; margin-top: 20px; text-align: right;">
			<button  id="stampBtn" class="btn btn-danger" type="button">스탬프 찍기</button>
			<button  id="stampListBtn" class="btn btn-success" type="button">스탬프 목록</button> 
		</div>
		<div id="map" style="width:80%;height:800px; margin: 0 auto; margin-top: 20px;"></div>
		
		
			
		         
		         
	         
	         
	         
	</div>
</div>


<script type="text/javascript">
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(36.534263, 127.900000),
    zoom: 3,
    mapTypeId: naver.maps.MapTypeId.NORMAL,
    mapTypeControl : true
});

var infowindow = new naver.maps.InfoWindow();

<c:forEach var="dto" items="${stampList}">

naver.maps.Service.geocode({
    query: '${dto.staAddress}'
}, function(status, response) {
    if (status !== naver.maps.Service.Status.OK) {
        return alert('Something wrong!');
    }

    var result = response.v2, // 검색 결과의 컨테이너
        items = result.addresses; // 검색 결과의 배열

    var latitude = items[0].x;
    var longitude = items[0].y;
    
    var position = new naver.maps.LatLng(longitude, latitude);

    var markerOptions = {
    	    position: position,
    	    map: map
    	};

    var marker = new naver.maps.Marker(markerOptions);
    
});




</c:forEach>


$("#stampListBtn").on("click", function() {
	naver.maps.Service.geocode({
        query: '경기도 가평군 가평읍 문화로 13-42 가평역'
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }

        var result = response.v2, // 검색 결과의 컨테이너
            items = result.addresses; // 검색 결과의 배열
	
	    var latitude = items[0].x;
	    var longitude = items[0].y;
	    
	    alert(longitude+"&"+latitude);
	});
});


//현재 위치
function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

    infowindow.setContent('<div style="padding:20px;">' + '너 지금 여기니?' + '</div>');

    infowindow.open(map, location);
    console.log('Coordinates: ' + location.toString());
}

function onErrorGeolocation() {
    var center = map.getCenter();

    infowindow.setContent('<div style="padding:20px;">' +
        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

    infowindow.open(map, center);
}

$("#stampBtn").on("click", function() {
    if (navigator.geolocation) {
        /**
         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
         */
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
        infowindow.open(map, center);
    }
});

</script>

