<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<!--지도 정보를 가져오는 API 스크립트-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=134ec7b5b1389d0316b7c1bed3033f48"></script>

<!-- full calendar -->
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.print.min.css" media='print' type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/scheduler/scheduler.min.css" type="text/css">

<style type="text/css">
/* 모달대화상자 */
/* 타이틀바 */
.ui-widget-header {
	background: none;
	border: none;
	height:35px;
	line-height:35px;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
}
/* 내용 */
.ui-widget-content {
   /* border: none; */
   border-color: #cccccc; 
}

#calendar {
    max-width: 900px;
	margin: 20px auto 20px;
}

#schLoading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}




</style>

<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/scheduler/scheduler.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/locale-all.js"></script>

<script type="text/javascript">
function login() {
	location.href="<%=cp%>/member/login";
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

var calendar=null;

$(function() {
	calendar=$('#calendar').fullCalendar({
		editable: true, // enable draggable events
		selectable: true, // click하거나 select 할때의 events
		selectHelper: true,
		locale: 'ko',
		aspectRatio: 1.8,
		scrollTime: '09:00', // undo default 6am scrollTime
		header: {
			 left: "",
			 center: "title",
			 right: "today prev,next"

		},
		defaultView: 'month',
		views: {
			timelineThreeDays: {
				type: 'timeline',
				duration: { days: 3 }
			}
		},

		<%-- resourceGroupField: 'groupName',
		resources: {
			url: '<%=cp%>/scheduler/resources',
			type:'post',
			error: function() {
				console.log("error...");
			}
		}, --%>
		
		events: [
            {
                title : "서울역",
                start : "2020-01-13",
                end : "2020-01-15",
                color : "#69cffd"
         	},
         	{
                title : "부산역",
                start : "2020-01-14",
                end : "2020-01-17",
                color : "#90bbf9"
         	},
         	{
                title : "대구역",
                start : "2020-01-16",
                end : "2020-01-19",
                color : "#b1a9f6"
         	},
         	{
                title : "여수역",
                start : "2020-01-18",
                end : "2020-01-20",
                color : "#e08ff1"
         	},

		],
			
			<%-- function(start, end, timezone, callback){
			var startDay=start.format("YYYY-MM-DD");
			var endDay=end.format("YYYY-MM-DD");
			var url= '<%=cp%>/scheduler/events';
			var query="start="+startDay+"&end="+endDay;

			var fn = function(data){
				callback(data);
			};
			ajaxJSON(url, "post", query, fn);
			}, --%>
		
		/* select: function(start, end, jsEvent, view, resource) {
			// var s=start.format();
			// var e=end.format();
			// var r=resource ? resource.id : '';
			
			insertForm(start, end, resource);
		},
		
		eventClick: function(calEvent, jsEvent, view) {
			// 일정 제목을 선택할 경우
			articleForm(calEvent);
		},
		
		eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
			// 일정을 드래그 한 경우
			updateDrag(event);
		},
		eventResize: function(event, dayDelta, minuteDelta, allDay, revertFunc) {
			// 일정의 크기를 변경 한 경우
			updateDrag(event);
		}, */
		
		// schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source'
		schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives' // 비영리기관라이선스
	});
	
	// var s="<select class='selectField'><option>예제1</option><option>예제2</option></select>";
	// $(".fc-widget-header .fc-cell-text:first").html(s);
});


</script>



<script type="text/javascript">


</script>

<style type="text/css">
.img-button {
	background: transparent;
	border: none;
	width: 30px;
	height: 30px;
	cursor: pointer;
}

.day {
	background: #ffffff21;
    border-radius: 40px;
    /* border: white 1px solid; */
    font-size: small;
    line-height: 40px;
    height: 40px;
    width: 360px;
    margin-top: 15px;
}



</style>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 친구의 여행 플랜</span>
		</h3>
	</div>

	<div style="width: 100%;" class="container">

		<div style="margin-top: 50px; margin-left: 30px;" class="row">
			

			<div id="planName"><h4 style="font-weight: 700;">겨울 느낌 뿜뿜 여행</h4></div>
			
			<div id="planMap" style="width: 45%; height: 500px; float: left; margin-right: 80px;"></div>
			<div id="planCal" style="width: 45%; height: 500px; float: left;">
				<div>
			        <div id='schLoading'>loading...</div>
			        <div id='calendar'></div>
			    </div>
			</div>
			
			<!-- <div style=" text-align: center; margin: 40px 100px;"> -->
				<div style="width: 20%; height:80px; vertical-align:middle; float: left; margin-right: 200px; margin-top:40px;text-align:center; font-size: 18px; border: 1px black solid; border-radius: 50px;">
					<div>7 days</div>
					<div>2020-01-13 ~ 2020-01-20</div>
				</div>
				
				<div style="width: 50%; float: right; font-size: 18px; height:80px; vertical-align:middle; margin-top:40px;margin-right: 50px; text-align:center; font-size: 18px; border: 1px black solid; border-radius: 50px;" >
					<table>
						<tr>
							<td><i class="fas fa-coins"></i>&nbsp;&nbsp;총 예산</td>
							<td><i class="fas fa-utensils"></i>&nbsp;&nbsp;식비</td>
							<td><i class="fas fa-suitcase-rolling"></i>&nbsp;&nbsp;관광</td>
							<td><i class="fas fa-bed"></i>&nbsp;&nbsp;숙소</td>
						</tr>
						<tr>
							<td>50만원</td>
							<td>22만원</td>
							<td>8만원</td>
							<td>20만원</td>
						</tr>
					
					</table>
					
				<!-- </div> -->
				
			</div>







		</div>

	</div>
</div>



<script type="text/javascript">


var mapContainer = document.getElementById('planMap'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(36.062611, 128.081476), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var distanceOverlay;
var dots = {};

//마커 위치
var positions = [
	{
		title : "서울역",
		latlng : new daum.maps.LatLng(37.549243,126.970429)
	}, {
		title : "부산역",
		latlng : new daum.maps.LatLng(35.115471,129.042222)
	}, {
		title : "대구역",
		latlng : new daum.maps.LatLng(35.876068,128.596355)
	}, {
		title : "여수역",
		latlng : new daum.maps.LatLng(34.753071,127.748977)
	}
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}

var linePath;
var lineLine = new daum.maps.Polyline();
var distance;

for(var i = 0; i< positions.length;i++){
	if(i !=0){
		linePath = [positions[i-1].latlng,positions[i].latlng]
	};
	lineLine.setPath(linePath); //선 그릴 라인 세팅
	
	var drawLine = new daum.maps.Polyline({
		map : map,
		path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 3, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	
	distance = Math.round(lineLine.getLength());
	displayCircleDot(positions[i].latlng,distance);
}

function displayCircleDot(position,distance){
	if (distance>0){
		var distanceOverlay = new daum.maps.CustomOverlay({
			position : position,
			yAnchor : 1,
			zIndex : 2
		});
		distanceOverlay.setMap(map);
		
	}
}

</script>