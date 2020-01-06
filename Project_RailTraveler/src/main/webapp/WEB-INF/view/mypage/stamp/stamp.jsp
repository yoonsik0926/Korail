<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ij53ss6vck&submodules=geocoder"></script>
<script type="text/javascript">
function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}


//스탬프 리스트 불러오기
function stampListPage(page) {
	var url="<%=cp%>/stamp/modal";
	var query="pageNo="+page;
	var selector = "#stampList";

	ajaxHTML(url, "get", query, selector);
	
	if(page ==1){
		$("#stampListModal").modal('show');
	}	
}

//모달 페이징
function modal(){
	stampListPage(1);
}

</script>


<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 전국 스탬프 지도</span>
		</h3>
	</div>
     
     <div>
	
		<div style="width:80%; margin:0 auto; margin-top: 20px; text-align: right;">
			<button id="stampBtn" class="btn btn-danger" type="button">스탬프 찍기</button>
			<button id="stampListBtn" class="btn btn-success" type="button" onclick="modal();">스탬프 목록</button> 
		</div>
		<div id="map" style="width:80%;height:800px; margin: 0 auto; margin-top: 20px;"></div>
		   

	         
	</div>
</div>


<!-- 스탬프 목록 모달 -->
	<div class="modal" id="stampListModal" tabindex="-1" role="dialog" aria-labelledby="layerpopLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header" style="padding: 5px 5px;">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal" style="margin:10px;">×</button>
	        <!-- header title -->
	        <h4 class="modal-title" style="text-align: center;font-weight: 900;margin-top: 20px;margin-left: 25px;padding: 10px 20px;">스탬프 목록</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body" id="stampList" style="text-align: center;"></div>
	      <!-- Footer -->
	      <div class="modal-footer" style="text-align: center; margin: 20px 0;"></div>
	      
	    </div>
	   </div>
   </div>

	<!-- 역 목록 모달 -->
	<div class="modal" id="matchModal" tabindex="-1" role="dialog" aria-labelledby="layerpopLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header" style="padding: 5px 5px;">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal" style="margin:10px;">×</button>
	        <!-- header title -->
	        <h4 class="modal-title" style="text-align: center;font-weight: 900;margin-top: 20px;margin-left: 25px;padding: 10px 20px;">스탬프 찍을 역을 선택하세요.</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body" id="matchStation" style="text-align: center;">
	      	<table
				style="margin: 0px auto; text-align: center; font-size: 15px; width: 100%">
			
				<tr style="background: #283164; color: white; height: 50px; font-weight: 700">
					<td width="80">선택</td>
					<td width="80">역 이름</td>
					<td width="80">지역</td>
					<td width="350">위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</td>
				</tr>
				<c:forEach var="dto" items="${matchList}">
					<tr style="border-bottom: 1px solid #d4cbcb; height: 40px;">
						<td><input type="radio" name="choice" value="${dto.staNum}"></td>
						<td>${dto.staName}</td>
						<td>${dto.locName}</td>
						<td>${dto.staAddress}</td>
					</tr>
				</c:forEach>
			
			</table>
			
	      
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer" style="text-align: center; margin: 20px 0;"></div>
	      
	    </div>
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
    	    map: map,
    	    animation: naver.maps.Animation.BOUNCE
    	};

    var marker = new naver.maps.Marker(markerOptions);
    
    var contentString = [
        '<div class="iw_inner">',
        ' ${dto.staName}역',
        '</div>'
    ].join('');

    var infowindow = new naver.maps.InfoWindow({
    	content: contentString,
    	borderColor: "#283164",
    	borderWidth: 2,
    	anchorSize: new naver.maps.Size(20, 20),
    	anchorSkew: true
    });

    naver.maps.Event.addListener(marker, "mouseover", function(e) {
    	if (infowindow.getMap()) {
    	    infowindow.close();
    	} else {
    	    infowindow.open(map, marker);
    	}
    });
    
    
});


</c:forEach>


//현재 위치
function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude); //현재 위치
    
    locLatitude = location.lat();                                     
   	locLogitude = location.lng();
    
    
	var url = "<%=cp%>/stamp/calDistance";
	var query = "locLogitude="+locLogitude+"&locLatitude="+locLatitude;
    
	var fn = function(data){
		console.log(data.matchList[0].staName);
		
		$("#matchModal").show();
	}
	
	ajaxJSON(url,"get", query, fn);
	
                                         
/*     map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

   infowindow.setContent('<div class="stationList" data-staNum="${dto.staNum}" data-staName="${dto.staName}" style="padding:20px;">' + '너 지금 여기니? '+ '</div>');

   infowindow.open(map, location);
   
   console.log('Coordinates: ' + location.toString()); */
    

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

