<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css"
	type="text/css">




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

//페이징 처리
$(function(){
	tourlistPage(1);	
});

function tourlistPage(page) {
	var condition = $("select[name=condition]").val();
	var keyword = $("input[name=keyword]").val();
	
	var url="<%=cp%>/bookmark/tourlist";
	var query="pageNo="+page+"&keyword="+keyword+"&condition="+condition;
	var selector = "#bookmarkList";

	ajaxHTML(url, "get", query, selector);

}

//소메뉴 관리
$(function(){
	$("#tab-${group}").addClass("active");
	
	$("ul.tabs li").click(function(){
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		var url = "<%=cp%>/bookmark/bookmark?group=" + tab;
			location.href = url;
		});
	});
	

//검색
function searchList(){
	var condition = $("select[name=condition]").val();
	var keyword = $("input[name=keyword]").val();
	
	var url="<%=cp%>/bookmark/tourlist";
	var query="pageNo="+${pageNo}+"&keyword="+keyword+"&condition="+condition;
	var selector = "#bookmarkList";
	
	ajaxHTML(url, "get", query, selector);
	
}

//북마크 삭제
$(function(){
	$("body").on("click", ".img-button", function(){
		if(! confirm("북마크를 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var tourNum=$(this).attr("data-tourNum");
		var page=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/bookmark/deleteBookmark";
		var query="tourNum="+tourNum;
		
		var fn = function(data){
			//var state=data.state;
			tourlistPage(page);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});



</script>

<style type="text/css">
.img-button {
	background: transparent;
	border: none;
	width: 30px;
	height: 30px;
	cursor: pointer;
}
</style>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 나의 북마크 : 관광 정보</span>
		</h3>
	</div>

	<div style="width: 100%;">
		<div style="margin-bottom: 10px;">
			<form name="searchForm" action="<%=cp%>/bookmark/tour" method="post"
				style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: left; margin: 20px 0;">
				<select name="condition" class="boxTF"
					style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
					<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
					<option value="name"
						${condition=="name"?"selected='selected'":""}>이름</option>
					<option value="staName"
						${condition=="staName"?"selected='selected'":""}>역이름</option>
					<option value="cateName"
						${condition=="cateName"?"selected='selected'":""}>카테고리명</option>
				</select> 
				<input type="text" name="keyword" value="${keyword}" class="boxTF"
					style="display: inline-block; height: 100%; width: 58%;"> 
				<img src="<%=cp%>/resource/images/magnifying-glass.png" class=""
					onclick="searchList()"
					style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
			</form>
		</div>
		
		<div style="width: 100%; display: inline-block;">
			<div class="map" style="width: 45%; height:70%; margin-right: 20px; display: inline; float: left;">
				<div id="map" style="width:550px; height: 700px;"></div>

			</div>

			<div id="bookmarkList" class="tourList" style="width: 52%; margin-bottom:10px; display: inline; float: left;">
				
			</div>
				
		</div>
						
	</div>
			
</div>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2945f1b51ebe08a70d044a045286f0c9"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.518543, 127.817279), // 지도의 중심좌표
        level: 12 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
//전체 리스트 마커 뽑는거
<c:forEach var="dto" items="${list}">
	var longitude = ${dto.longitude};
	var latitude = ${dto.latitude};
	var imageSrc = '<%=cp%>/resource/images/mapmarker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(25, 30), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(10, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	var markers = [];
	
	var positions = [
	    {
	        content: '<div>${dto.name}</div>', 
	        latlng: new kakao.maps.LatLng(longitude, latitude)
	    }
	];

	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커의 위치
	        image: markerImage // 마커이미지 설정
	    });
		marker.setMap(map);
	    markers.push(marker);

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
/* 	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow)); */
	}
</c:forEach>

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

/* //지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];

//마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new kakao.maps.InfoWindow({  });
 */
// 마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(markerImage,markerPosition,name) {
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);

    infowindow.setContent('<div>'+name+'</div>');
	infowindow.open(map, marker);
}

// 마커 배열을 지도에 표시
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

// 마커 삭제
function hideMarkers() {
    //setMarkers(null);
    infowindow.close();
}

$(function(){
	$("body").on("mouseover", ".tourContent", function(){
		var tourNum=$(this).attr("data-tourNum");
		
		var url = "<%=cp%>/bookmark/address";
		var query = "tourNum="+tourNum;
		
		var fn = function(data){
			var dto = data.dto;
			var longitude = dto.longitude;
			var latitude = dto.latitude;
			var name = dto.name;
			
			var imageSrc = '<%=cp%>/resource/images/mapmarker.png',// 마커이미지의 주소입니다    
			 	imageSize = new kakao.maps.Size(25, 30), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(10, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    markerPosition = new kakao.maps.LatLng(longitude, latitude); // 마커가 표시될 위치입니다
	
			
			addMarker(markerImage,markerPosition,name);
			
			};
			
			ajaxJSON(url, "get", query, fn);
			
	});
	
	$("body").on("mouseout", ".tourContent", function(){
		hideMarkers();
	});
});



</script>

