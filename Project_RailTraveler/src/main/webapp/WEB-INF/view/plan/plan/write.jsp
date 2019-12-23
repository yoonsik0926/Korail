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
<link rel="apple-touch-icon" sizes="76x76" href="<%=cp%>/resource/img/apple-icon.png">
<link rel="icon" type="image/png" href="<%=cp%>/resource/img/favicon.png">

<title>나의 계획 짜기</title>

<link href="<%=cp%>/resource/bootstrap3/css/bootstrap.css" rel="stylesheet" />
<link href="<%=cp%>/resource/css/demo.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--     Font Awesome     -->
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
<script src="https://kit.fontawesome.com/9a196cb2bb.js" crossorigin="anonymous"></script>

<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

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
body::-webkit-scrollbar {
	display:none;
}
#planListForm::-webkit-scrollbar {
	display:none;
}
#planListForm {
	height:85%;
	overflow: scroll;
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

.planList1, .planList2, .planList3, .planList4, .planList5, .planList6, .planList7 {
	width: 100%;
	height: 90px;
	border: 1px solid blue;
	background: white;
}

.planList-selected {
	width: 100%;
	height: 90px;
	border: 1px solid blue;
	background: #8a8a8a;
}


.planListDetail1, .planListDetail2, .planListDetail3, .planListDetail4,
.planListDetail5, .planListDetail6, .planListDetail7 {
	width: 100%;
	height: 450px;
	border: 1px solid black;
	display: none;
	margin-bottom: 0;
	list-style: none;
}

.planListDetail:hover {
	background: red;
}

.dayCount {
	margin: 15px 5px 10px 5px;
	width: 20%;
	height: 60px;
	font-size: 25px;
	display: block;
	float: left;
	/* 	border: 1px solid black; */
}

.selectedStation {
	margin: 5% 3% 0 3%;
	width: 35%;
	height: 60px;
	display: block;
	float: left;
	font-size: 16px;
	text-align: center;
	/* 	border: 1px solid black; */
}

.selectedDay {
	width: 90px;
	font-size: 15px;
	height: 30px;
	display: block;
	float: left;
	/* 	border: 1px solid black; */
}

.detailPlanning {
	margin: 15px 0 15px 10px;
	border: 0;
	outline: 0;
	width: 30%;
	height: 60px;
	font-size: 25px;
	display: block;
	float: left;
}


/* Modal Content/Box */
.modal-content {
	background: white;
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
	display: block;
	float: left;
	margin: auto;
	cursor: pointer;
}

.modal-planning {
	background: blue;
	/* 	opacity: 0.7; */
	/* 	padding: 10px; */
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	/*     float: right;  */
	/*     z-index: 3;   */
}

.modal2 {
	width: 75%;
	height: 100%;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	/* left: 0; */
	z-index: 1040;
	display: none;
	overflow: auto;
	overflow-y: scroll;
	position: fixed;
}

.plusStation {
	padding: 5px;
	width: 350px;
	height: 150px;
	margin: 10px;
	border: 1px solid black;
	background: white;
	margin
}

.insertStaPlan {
	width: 100%;
	height: 30px;
	border: 1px solid black;
	display: block;
	float: left;
	margin:10px;
	margin-left:0;
	font-size:20px;
	text-align:center;
	cursor:pointer;
}

.activeGreen {
	background: #9af6b6;
}

.staContent {
	width:100px;
	height:100px;
	border:1px solid black;
	display:block;
	float:left;
	margin-right:10px;
}

.staName {
	width: 200px;
	height: 100px;
	border: 1px solid black;
	display: block;
	float: left;
}

.pickedStation {
	margin: auto;
	width: 100%;
	line-height: normal;
	height: 90px;
	border: 1px solid black;
	display: block;
/* 	position: absolute; */
	cursor: pointer;
}

.pickedStationCancel {
	margin: 14px;
	width: 20%;
/* 	height: 100%; */
/* 	border-right: 1px solid black; */
	text-align: center;
	font-size: 60px;
	display: block;
	float: left;
	cursor: pointer;
}

.pickedStationDetail {
	margin: 14px;
	width: 20%;
/* 	height: 100%; */
/* 	border-left: 1px solid black; */
	text-align: center;
	font-size: 60px;
	display: block;
	float: right;
	cursor: pointer;
}

.redThing {
	background: red;
}

.movingEnd {
	width: 100%;
	height: 90px;
	background: #9af6b6;
}

#detailPlanPlus {
	width: 75%;
	height: 100%;
	border: 1px solid black;
	background: black;
	float: right;
	transition: All 0.2s ease;
		-webkit-transition: All 0.2s ease;
		-moz-transition: All 0.2s ease;
		-o-transition: All 0.2s ease;
	position: fixed;
}

#detailPlanPlus .open {
	right: 0px;
}


.timeSelect {
	width: 25%;
	height: 100%;
	background: blue;
	float: left;
}

</style>
<script type="text/javascript">

$(function() {	// "mm"+'월'+"dd"+'일'+'('+"D"+')'
		$("#datepicker").datepicker({
			dateFormat:"yy"+"-"+"mm"+"-"+"dd",
			altField:"#selectedDay1",
			showAnim: "slide"
		});
	        
		$("#datepicker").change(function(){	        
	        var tempDate=$("#selectedDay1").val();
	       
	        for (var i = 1; i <= $("#selectDays").val(); i++) {
	        	$("#selectedDay"+i).val(getDaysLater1(tempDate, i));
			}
	  
	    });
});

// 기준일부터 몇일 후(기준일 포함)
function getDaysLater1(sDate, days) {
	var week = ['일', '월', '화', '수', '목', '금', '토'];
    var y, m, d, s;
    
    var date=new Date();
    
    var regexp=/(\.)|(\-)|(\/)/g;
    sDate=sDate.replace(regexp, "");
    if(sDate.length!=8)
        return "";
    
    y = parseInt(sDate.substr(0, 4));
    m = parseInt(sDate.substr(4, 2));
    // d = parseInt(sDate.substr(6, 2))+parseInt(days);
    d = parseInt(sDate.substr(6, 2))+parseInt(days)-1;

    date.setFullYear(y, m-1, d);

    y=date.getFullYear();
    m=date.getMonth()+1;
    dd=week[date.getDay()];
    if(m<10) m="0"+m;
    d=date.getDate();
    if(d<10) d='0'+d;
    
    s=m+"월"+d+"일("+dd+")";

    return s;
}

// 일수 선택 모달
function selectTripDay() {
    $('#myModal').show();
};

// 팝업 Close 기능
function close_pop(flag) {
     $('#myModal').hide();
};


function close_planning() {
	$("#planModal").hide();
};

function getNumber(day) {
	days=new Array(day.value);
	
	var f=$(".planList1").length;
	$("#selectDays").val(day.value);
	if(f) {
		if(! confirm("작성중이던 계획을 모두 지우시겠습니까?")) {	
			return;
		}
		days=new Array(day.value);	
		$('#myModal').hide();
	}
	
	$('#planListForm').empty();
	document.getElementById("selectDays").src=day.src;
	
	days=new Array(day.value);
	for (var i = 1; i <=day.value; i++) {
		days[i-1]=new Array();
		$("#planListForm").append(
								"<div class='planList"+i+"'>"
								+	"<div class='dayCount'>"
								+		"<div style='width: 90px; text-align: center;'>"
								+			"<span>"+i+"일차</span>"
								+		"</div>"
								+		"<input readonly='readonly' class='selectedDay' name='selectedDay' id='selectedDay"+i+"' style='display:block; border:none; outline: none; font-size:17px; width:110px;'>"
								+	"</div>"
								+	"<div class='selectedStation'></div>"
								+	"<button class='detailPlanning'>계획짜기</button>"
								+"</div>"
								+"<ul class='planListDetail"+i+" leftThing' data-day='"+i+"'></ul>"
								);
	}
	console.log(days);
	$('#myModal').hide();
}


$(document).ready(function(){
	$('.plusStation').parent().hide();
});
    

</script>
</head>

<body>
	<div class="main" style="height: 100%;">
		<div>
			<div id="mapControllerLeft"
				style="width: 25%; z-index: 5; height: 100%; float: left; margin-top: 0px; margin-left: 0px; background: rgb(255, 255, 255); border-right: 1px solid;">
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
								<input type="image" id="selectDays"
									src="<%=cp%>/resource/images/plan/threeDays.png"
									style="padding: 8px;"> <span>일수선택</span> <i
									class="fa fa-angle-down"></i>
							</div>
						</div>
					</div>
				</div>
				<div id="planListForm"></div>
				

				<div id="myModal" class="modal" style="z-index: 1045;">
					<!-- Modal content -->
					<div class="modal-content">
						<div style="text-align: center;">
							<div class="modalDays">
								<span><input type="image"
									src="<%=cp%>/resource/images/plan/threeDays.png" value="3"
									onclick="getNumber(this);"></span>
							</div>
							<div class="modalDays">
								<span><input type="image"
									src="<%=cp%>/resource/images/plan/fiveDays.png" value="5"
									onclick="getNumber(this);"></span>
							</div>
							<div class="modalDays">
								<span><input type="image"
									src="<%=cp%>/resource/images/plan/sevenDays.png" value="7"
									onclick="getNumber(this);"></span>
							</div>
						</div>
						<div
							style="cursor: pointer; text-align: center; padding-bottom: 10px; padding-top: 10px;"
							onClick="close_pop();">
							<span class="pop_bt" style="font-size: 13pt;">닫기</span>
						</div>
					</div>
				</div>
			</div>


			<div id="mapControllerRight" style="float: left; width: 75%;">
				<div style="z-index: 5; padding: 20px; position: absolute;">
					<div style="width: 250px; background-color: white;">
						<input type="text" id="findStation"
							style="width: 225px; padding: 0 8px; height: 35px; z-index: 4; font-size: 16px; border: none;"
							placeholder="검색할 역을 입력하세요"> <i class="fas fa-search"></i>
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
	               
	               var positions = [
	                   {
	                    	latlng: new kakao.maps.LatLng(36.656960, 128.134321) // 마커가 표시될 위치입니다
	                    	,staContent:'하위하위1'
	                    	,staName:'문경역'
	                    	,staNum:1
	                   },
	                   {   
	                      	latlng: new kakao.maps.LatLng(35.821812, 128.564345) // 마커가 표시될 위치입니다
	                   	  	,staContent:'하위하위2'
	                   	  	,staName:'전주역'
	                   	  	,staNum:2
	                   },
	                   {
	                      	latlng: new kakao.maps.LatLng(35.839614, 127.1151431) // 마커가 표시될 위치입니다
	                   	  	,staContent:'하위하위3'
	                   	  	,staName:'예비역'
	                   	  	,staNum:3
	                   }
	                ];
	             
	            // 마커이미지의 주소입니다
	            var imageSrc = '<%=cp%>/resource/images/plan/markerBlack.png';      
	            var imageSize = new kakao.maps.Size(16, 32); // 마커이미지의 크기입니다
	            var imageOption = {offset: new kakao.maps.Point(8, 32)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	           	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

	            var markers=[];
	            var contents=[];
	        	var i=0;
	          positions.forEach(function(pos) {
	            var marker = new kakao.maps.Marker({
	            	position:pos.latlng,
	            	map: map,
	                image: markerImage // 마커이미지 설정 
	            });
	            
	            var closeOverlay = function() {
	            	customOverlay.setMap(null);
	            };
	            var $plusStation=$('<div class="plusStation" />');
	            var $close=$('<button type="button" onclick="close(this);" class="close" aria-label="Close" style="font-size:30px;" />').click(closeOverlay);
	            var $span=$('<span aria-hidden="true">&times;</span>');
	            var $staContent=$('<div class="staContent" />');
	            var $staName=$('<div class="staName" />')
				var $insertStaPlan=$('<div class="insertStaPlan">추가하기</div>');
				
	            $plusStation.append($close);
	            $plusStation.append($staContent);
	            $staContent.append(pos.staContent);
	            $plusStation.append($staName);
	            $($staName).append(pos.staName);
	            $($staName).attr("data-staNum",pos.staNum);
				$plusStation.append($insertStaPlan);
				
	            $close.append($span);
	            
	            
	            var content=$plusStation[0];
	            
	            var customOverlay = new kakao.maps.CustomOverlay({
	            	content: content,
	            	position: pos.latlng
	            });
	            markers[i]=marker;
	            contents[i]=content;
	            
	            kakao.maps.event.addListener(markers[i], 'click', function() {
	            	customOverlay.setMap(map);
	            	$('.plusStation').parent().css('margin', '-200px 0px 0px -185px');
	            	$('.plusStation').parent().show();
				});
	            i++;
	          });
	         </script>

				<div id="planModal" class="modal2">
					<div class="modal-planning">
						<button type="button" class="close" aria-label="Close" onclick="close_planning();"
								style="display: block; font-size: 40px; margin: 10px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>

				<div id="detailPlanPlus" class="modal2">
					<div class="modal-detailPlanning">
						<div class="timeSelect">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

$(function() {
    $("body").on('click', '.detailPlanning', function(){
// 		console.log(detailPlan=$('.detailPlanning').parent().parent().next().attr("class"));
// 		var cname="."+$(this).parent().parent().attr("class")+".planListDetail";
		if($(this).parent().siblings().hasClass("activeGreen")) {
			alert("이미 선택된 일차가 있습니다.");
			return;
		}
		
    	if($(this).parent().next().css("display")=="none") {
    		$(this).parent().next().slideDown();
    		$(this).parent().addClass('activeGreen');
    		$(this).prev().prev().find("input[name=selectedDay]").attr("class", "activeGreen");
        } else {
        	$(this).parent().next().slideUp();
        	$(this).parent().removeClass('activeGreen');
        	$(this).prev().prev().find("input[name=selectedDay]").removeClass("activeGreen");
//         	$(this).parent().parent().next().toggleClass("activeGreen");
        }
    });
});




/*
// 눌렀을때 붉게 변함
$(function() {
// 	var detailPlan="."+$('.detailPlanning').parent().parent().next().attr("class");
	$("body").on('click', '.leftThing', function() {
		if($(this).hasClass('activeGreen')) {
			$(this).removeClass('activeGreen');
		} else {
			$(".planListDetail").removeClass('activeGreen');
			$(this).addClass('activeGreen');
		}
	});
});
*/

// 클릭했을때 빨간색으로 표시해주기
/* $(function() {
	$("body").on('click', '.planListDetail', function() {
		
		if($(this).hasClass('activeGreen')) {
			$(this).removeClass('activeGreen');
		} else {
			$(".planListDetail").removeClass('activeGreen');
			$(this).addClass('activeGreen');
		}
		
	});
}); */


// 맵에서 역 선택해서 일차계획에 추가하기
$(function() {
	$("body").on('click', ".insertStaPlan", function() {
// 		console.log($(this).prev().text());
// 		console.log($("#planListForm").children().hasClass("activeGreen"));
		
	var ilcha=$("div[class*='activeGreen']").attr("class").substring(8,9); // 일차
	var ilchaFullname=".planListDetail"+$("div[class*='activeGreen']").attr("class").substring(8,9); // 일차가 들어간 클래스명
	
		if($("#planListForm").children().hasClass("activeGreen")) {
			if(days[ilcha-1].length>4) {
				alert("최대로 추가 할 수 있는 역의 개수는 5개 입니다.");
				return;
			}
			var staNum=$(this).prev().attr("data-staNum");
			
			for(var n=0; n<days[ilcha-1].length; n++ ){
				if(days[ilcha-1][n]==staNum) {
					return false;
				}
			}
			days[ilcha-1].push(staNum);
			$(ilchaFullname).append("<li class='pickedStation' data-staName='"+$(this).prev().text()+"' data-staNum='"+staNum+"'>"
								   +$(this).prev().text()
								   +	"<div class='pickedStationDetail'><i class='fas fa-plus-circle'></i></div>"
								   +"</li>"
								   );
			
		} else {
			alert("역을 추가할 일차를 먼저 선택해주세요.");
			return;
		}
// 	console.log(days);
	});
});

$(function() {
	$("body").on('click',".insertStaPlan", function() {
		$("#planListForm ul").sortable({
			items:$(".pickedStation"),
			placeholder:"movingEnd",
		    stop: function( event, ui ) {
		    	var day = ui.item.parent().attr("data-day");
		    	ui.item.parent().find("li").each(function(index){
		    		days[day-1][index] = $(this).attr("data-staNum");
		    	});
		    	
			// ajax로 db작업(업데이트)
		    	
		    }
		});	
		

		$("#planListForm ul").droppable({
	        out: function (event, ui) {
	        	var $p=ui.helper.parent();
	        	var day = ui.helper.parent().attr("data-day");
	        	ui.helper.remove();
 		    	days[day-1].length=0;

 		    	var n=0;
 		    	$p.find("li").each(function(index){
		    		if($(this).attr("data-staNum")) {		    				 
				    	days[day-1][n++] = $(this).attr("data-staNum");
		    		}		
				});
// 	        	console.log(days[day-1]);
// 	        	console.log(days);
	        }
		    
		});
	});	
});

$(function() {
	$("body").on('click', ".pickedStationDetail", function() {
		$("#detailPlanPlus").addClass("open");
		$("#detailPlanPlus").show();
	});
});
// $(".planListDetail1 leftThing sortable").disableSelection();


</script>
</body>
</html>