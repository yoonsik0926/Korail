<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="<%=cp%>/resource/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="<%=cp%>/resource/img/favicon.png">

<title>나의 계획 짜기</title>

<link href="<%=cp%>/resource/bootstrap3/css/bootstrap.css"
	rel="stylesheet" />
<link href="<%=cp%>/resource/css/demo.css" rel="stylesheet" />
<link rel="stylesheet"
	href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css">
<!--     Font Awesome     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
<script src="https://kit.fontawesome.com/9a196cb2bb.js"
	crossorigin="anonymous"></script>


<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.container {
	padding: 0;
}

#searchStation {
	height: 15%;
	background-color: #647bf5;
	padding: 15px;
}

#mapControllerLeft {
	width: 22%;
	height: 100%;
	float: left;
	margin-top: 0px;
	margin-left: 0px;
	background: rgb(255, 255, 255);
	border-right: 1px solid;
}

#searchStation #selectTripDay {
	width: 30%;
	height: 90.5%;
	cursor: pointer;
	border: 1px solid black;
	background: #fff;
	border-radius: 2px;
	text-align: center;
	padding-top: 5px;
	padding-bottom: 5px;
	float: left;
}

#selectTripDay a {
	color: black;
}

#selectTripDay a:hover {
	text-decoration: none;
	color: black;
}

/* Modal Content/Box */
.modal-content {
	background:#77c3ef;
    margin-top: 130px;
    margin-left: 12%;
    padding: 10px;
    border: 2px solid #1000b5;
    width: 360px; /* Could be more or less, depending on screen size */    
    height: 105px; 
    z-index: 1;                      
}

.modalDays {
	width: 112px;
	height: 60px;
	display:block;
	float: left;
	margin: auto;
	cursor: pointer;
}

</style>
<script type="text/javascript">
$(function() {
	$("#datepicker").datepicker();
});
	
function selectTripDay() {
    $('#myModal').show();
};
//팝업 Close 기능
function close_pop(flag) {
     $('#myModal').hide();
};
function getNumber(day) {
	document.getElementById("selectDays").src=day.src;
	$('#myModal').hide();
}
</script>
</head>

<body>
	<div class="main" style="height: 100%;">
		<div>
			<div id="mapControllerLeft"
				style="width: 25%; height: 100%; float: left; margin-top: 0px; margin-left: 0px; background: rgb(255, 255, 255); border-right: 1px solid;">
				<div id="searchStation">
					<div>
						<div style="float: left; width: 70%; height: 100%;">
							<a href="#"><img
								src="<%=cp%>/resource/images/plan/logoWhite_planner.png"></a>
							<div style="margin-top: 20px; padding-right: 30px; width: 100%;">
								<div
									style="background-color: white; border: 1px solid black; height: 30px; padding: 5px 5px 10px;">
									<i class="far fa-calendar-alt"
										style="font-size: 14px; width: 30%;">&nbsp;출발</i> <input
										type="text" id="datepicker" placeholder="출발 날짜를 고르세요"
										style="border: none; width: 60%; font-size: 14px;">
								</div>
							</div>
						</div>
						<div>
							<div id="selectTripDay" onclick="selectTripDay();">
								<input type="image" id="selectDays" src="<%=cp%>/resource/images/plan/threeDays.png" style="padding: 8px;">
								<span>일수선택</span>
								<i class="fa fa-angle-down"></i>
							</div>
						</div>
					</div>
				</div>
				<div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
          <div style="text-align: center;">
          	<div class="modalDays"><span><input type="image" src="<%=cp%>/resource/images/plan/threeDays.png" value="3" onclick="getNumber(this);"></span></div>
           	<div class="modalDays"><span><input type="image" src="<%=cp%>/resource/images/plan/fiveDays.png" value="5" onclick="getNumber(this);"></span></div>
           	<div class="modalDays"><span><input type="image" src="<%=cp%>/resource/images/plan/sevenDays.png" value="7" onclick="getNumber(this);"></span></div>
          </div>
          <div style="cursor:pointer; text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
            <span class="pop_bt" style="font-size: 13pt;" >닫기</span>
          </div>
      </div>
 
    </div>


				
			</div>
			<div id="mapControllerRight" style="float: left; width: 75%;">
			<div style="z-index: 5; padding: 20px; position: absolute;">
				<div style="width: 250px; background-color: white;">
					<input type="text" id="findStation" style="width: 225px; padding:0 8px; height:35px; z-index: 3; font-size: 16px; border: none;" placeholder="검색할 역을 입력하세요">
					<i class="fas fa-search"></i>
				</div>
			</div>
				<div id="map" style="width: 100%; height: 100%; z-index: 2;"></div>
					<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea24f69cc8602cd4d0ce33868b3dd46d"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center : new kakao.maps.LatLng(36.656960, 128.134321),
						level : 11
					};
					var map = new kakao.maps.Map(container, options);
					
					var imageSrc = '<%=cp%>/resource/images/plan/markerBlack.png', // 마커이미지의 주소입니다     
				    imageSize = new kakao.maps.Size(16, 32), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(8, 32)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				      
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = new kakao.maps.LatLng(36.656960, 128.134321); // 마커가 표시될 위치입니다

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition, 
				    image: markerImage // 마커이미지 설정 
				});
					
				marker.setMap(map);
				
				// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				var iwContent ='<div style="padding:5px; width:350px; height:150px; margin:10px;"><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button><div style="width:100px; height:100px; border:1px solid black;"></div></div>',
					// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwRemoveable = false; // removeable 속성을 true로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    content : iwContent,
				    removable : iwRemoveable
				});

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    // 마커 위에 인포윈도우를 표시합니다
				    infowindow.open(map, marker);  
				});
				</script>
			</div>
		</div>
	</div>
</body>
</html>