<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!-- 슬라이드를 가져오는 스크립트 및 css -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!--지도 정보를 가져오는 API 스크립트-->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=134ec7b5b1389d0316b7c1bed3033f48"></script>

<!-- full calendar -->
<link rel="stylesheet"
   href="<%=cp%>/resource/fullcalendar/fullcalendar.min.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=cp%>/resource/fullcalendar/fullcalendar.print.min.css"
   media='print' type="text/css">
<link rel="stylesheet"
   href="<%=cp%>/resource/fullcalendar/scheduler/scheduler.min.css"
   type="text/css">

<style type="text/css">
/* 모달대화상자 */
/* 타이틀바 */
.ui-widget-header {
   background: none;
   border: none;
   height: 35px;
   line-height: 35px;
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
li { list-style: none; }
</style>

<script type="text/javascript"
   src="<%=cp%>/resource/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript"
   src="<%=cp%>/resource/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript"
   src="<%=cp%>/resource/fullcalendar/scheduler/scheduler.min.js"></script>
<script type="text/javascript"
   src="<%=cp%>/resource/fullcalendar/locale-all.js"></script>

<script type="text/javascript">

function ajaxJSON(url, type, query, fn) {
   $.ajax({
      type:type
      ,url:url
      ,data:query
      ,dataType:"json"
      ,success:function(data){

         fn(data);
      }
   ,beforeSend:function(jqXHR){
      jqXHR.setRequestHeader("AJAX",true);
   }
   ,error:function(jqXHR){
      if(jqXHR.status==403){
         login();
         return false;
         }
      console.log("에러");
      console.log(jqXHR.responseText);
      }
   });
}



//도시 이동 달력
var calendar=null;
var color = ['#69cffd','#90bbf9','#b1a9f6','#e08ff1','#c49ef4','#d198f3','#bfc6fb'];

$(function() {
   
   calendar=$('#calendar').fullCalendar({
      editable: false, // enable draggable events
      selectable: false, // click하거나 select 할때의 events
      selectHelper: false,
      locale: 'ko',
      aspectRatio: 1.8,
      scrollTime: '09:00', // undo default 6am scrollTime
      header: {
          left: "today",
          center: "title",
          right: "prev,next"

      },
      defaultView: 'month',
      defaultDate :'${dto.sDate}',
      views: {
         timelineThreeDays: {
            type: 'timeline',
            duration: { days: 3 }
         }
      },

      
      events: [
         <c:forEach var="vo" items="${stationList}">
            {
               title :"${vo.staName}역",
               start : "${vo.sDate}",
               end : "${vo.eDate}",
               color : color[Math.floor(Math.random() * (color.length))]
            },
         </c:forEach>
      ],

      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives' // 비영리기관라이선스
   });

});



//일정표 캘린더
var calendar2=null;

$(function() {
   calendar2=$('#scheduler').fullCalendar({
      editable: false, // enable draggable events
      selectable: false, // click하거나 select 할때의 events
      selectHelper: false,
      locale: 'ko',
      aspectRatio: 1.8,
      scrollTime: '00:00', // undo default 6am scrollTime
      header: {
          left: "prev,next",
          center: "",
          right: ""

      },
      defaultView: 'agendaWeek',
      defaultDate : '${dto.sDate}',
      views: {
         timelineThreeDays: {
            type: 'timeline',
            duration: { days: 3 }
         }
      },

      events: [
         <c:forEach var="vo" items="${stationList}">
            {
               title :"${vo.staName}역",
               start : "${vo.sDate}",
               end : "${vo.eDate}",
               color : color[Math.floor(Math.random() * (color.length))]
            },
         </c:forEach>
         
         <c:forEach var="vo" items="${tourList}">
            {
               title :"${vo.name} : ${vo.memo}",
               start : "${vo.sDate} ${vo.sTime}:00",
               end : "${vo.sDate} ${vo.eTime}:00",
               color : "#8bc34a"
            },
         </c:forEach> 
         
         <c:forEach var="vo" items="${foodList}">
            {
               title :"${vo.name} : ${vo.memo}",
               start : "${vo.sDate} ${vo.sTime}:00",
               end : "${vo.sDate} ${vo.eTime}:00",
               color : "#ffc107"
            },
         </c:forEach>
            
         <c:forEach var="vo" items="${hotelList}">
         {
            title :"${vo.name} : ${vo.memo}",
            start : "${vo.sDate} 00:00",
            end : "${vo.sDate} 01:00",
            color : "#9E9E9E"
         },
         </c:forEach>
         
         
      ],

      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives' // 비영리기관라이선스

   });
   
});

//좋아요 관리하는 에이작스
function like(ob){
   
   var userId = "${sessionScope.member.userId}";

     if ( userId == "") {
        $("#likealarm").modal();
      return;
     }
   
   var planNum = ${planNum};
     
   var url = "<%=cp%>/friendPlan/like";
   var query = "planNum="+planNum;
   var fn = function(data){
         if(data.likecheck==0){
            ob.className = "fas fa-heart"; 
         }
         else if (data.likecheck==1){
            confirm("북마크를 삭제하시겠습니까?");
            ob.className = "far fa-heart";
         }

   }; 
      
   ajaxJSON(url, "get", query, fn);
   
};


</script>




<style type="text/css">
.img-button {
   background: transparent;
   border: none;
   width: 30px;
   height: 30px;
   cursor: pointer;
}

.fc-center h2 {
   font-size: 18px;
}

table th span {
    position: unset !important;
    border-left: none !important;
    width: 100% !important;
    display: block !important;
    left: 0px !important;
    padding-left: 0 !important;
}

.carousel-caption{
 bottom: 0%;
    background: #ffffff8a;
    left: 0%;
    height: 50%;
    width: 100%;
}
</style>

<div class="body-content-container">
   <div class="page-three-title mt40">
      <h3 class="fs26">
         <span style="padding: 10px 0px; display: block;"> 추천 코스</span>
      </h3>
   </div>

   <div style="width: 100%; margin-left: 30px;">

      <div style="width: 100%; display: inline-block;">

      
         <div id="planName">
            <h4 style="font-weight: 700; color: #5d5858;">
               ${dto.title==''or dto.title==null?'제목이 없는 여행 플랜':dto.title}
               <span
                  style="font-family: 'Lobster', cursive !important; font-weight: 400; font-size: 18px; color: #b7b7b7;">&nbsp;&nbsp;by
                  ${dto.userId}&nbsp;&nbsp;&nbsp;&nbsp;
               </span>
               <span>
                  <button id="btn-${dto.planNum}" class="img-button find" value="${dto.planNum}" >         
                     <c:choose>
                        <c:when test="${sessionScope.member.userId!=null && like=='like'}">
                           <i class="fas fa-heart" onclick="like(this);" style="font-size: 24px;color: tomato"></i>
                        </c:when>                  
                        <c:otherwise>
                           <i class="far fa-heart" onclick="like(this);" style="font-size: 24px;color: tomato"></i>
                        </c:otherwise>
                     </c:choose>
                  </button>
               </span>
               <span style="float: right; margin-right: 45px;">
                  <button id="back" class="btn btn-success" onclick="javascript:location.href='<%=cp%>/plan/recommand';">목록으로</button>
               </span>
            </h4>
            
         </div>
<hr>
         <div id="planMap"
            style="width: 50%;
    margin: 0 auto; height: 500px; "></div>
      </div>
<hr>
      <div style="width: 100%; display: inline-block;">

         <div
            style="width: 100%; height: 80px; display: inline; float: left; vertical-align: middle; text-align: center; font-size: 18px; border: 1px #84c1fa solid; border-radius: 50px; background: #84c1fa; color: white;">
            <table style="width: 100%; margin-top: 15px;">
               <tr>
                  <td rowspan="2" style="font-size: 30px; font-weight: 700;border-right: 2px solid;">${dto.ticketDay} Days</td>
                  
                  <td style="font-weight: 700;"><i class="fas fa-coins"></i>&nbsp;&nbsp;총
                     예산</td>
                  <td style="font-weight: 700;"><i class="fas fa-utensils"></i>&nbsp;&nbsp;식비</td>
                  <td style="font-weight: 700;"><i
                     class="fas fa-suitcase-rolling"></i>&nbsp;&nbsp;관광</td>
                  <td style="font-weight: 700;"><i class="fas fa-bed"></i>&nbsp;&nbsp;숙소</td>
               </tr>
               <tr>
                  <td>${totPrice}원</td>
                  <td>${foodPrice}원</td>
                  <td>${tourPrice}원</td>
                  <td>${hotelPrice}원</td>
               </tr>
            </table>
         </div>

      </div>
<hr>
      <div style="width: 1200px; margin-top: 40px;">
         <h4 style="font-weight: 700; color: #5d5858;">여행 루트</h4>

         <!-- 여행 루트 최대 6개 역이 한줄에 -->
         <div
            style="width: 100%;margin-top: 30px; ${stationCount>=6? 'height:600px;':'height:300px;'} ">
            <ul class="nolist swiper-wrapper"
               style="list-style: none; margin: 0; padding: 0;">
               
               <c:forEach var="vo" items="${stationList}">
               
                  <li class="swiper-slide"
                     style="width: 150px; border: 0px solid #c0c0c0; position: relative; height: 300px; float: left; margin-right: 30px;">
                     <div
                        style="text-align: center; float: left; width: 150px; heigth: 300px; position: relative;">
   
                        <div style="height: 200px; width: 150px;">
                           <a href="<%=cp%>/tour/${vo.locNum==1?'sudo':vo.locNum==2? 'chungcheong' :vo.locNum==3? 'gangwon' :vo.locNum==4? 'jeonla' : 'gyeongsang'}
                                 ?q=staNum:${vo.staNum},subTitle:
                                    ${vo.locNum==1?'sudo':
                                       vo.locNum==2? 'chungcheong' :
                                          vo.locNum==3? 'gangwon' :
                                             vo.locNum==4? 'jeonla' : 'gyeongsang'}"> 
                           <img
                              src="<%=cp%>/resource/images/station/${vo.imageFileName}"
                              style="border-radius: 5px; width: 100%; height: 90%;"></a>
                        </div>
   
                        <div style="text-align: center;">
                           <div
                              style="height: 25px; padding-top: 3px; font-size: 10pt; font-weight: 400">${vo.staName}역</div>
                           <div style="line-height: 10px;">
                              <div
                                 style="display: inline-block; width: 10px; height: 10px; background: #696969; border-radius: 10px;"></div>
                           </div>
                        </div>
   
                     </div>
                  </li>
               </c:forEach>

               <!-- 점선 역 하나 추가 될 때마다 width 182px씩 증가  초기 width : 173px-->
               <li
                  style="position: absolute; display: block; z-index: 1; top: 1147px; width:${length}px;  left: 474px; border-top: 2px dashed #696969;"></li>
   <li style="clear: both;"></li>
            </ul>

         </div>


      </div>
      <hr>
<div style="width: 1200px; margin-top: 40px;">
<h4 style="font-weight: 700; color: #5d5858;">상세 일정</h4>

<c:forEach var="day" begin="1" end="${dto.ticketDay}" step="1" >

<div style="font: 1.8em TmonMonsori;">Day ${day}</div>
<div class="media">
      
   <c:forEach var="vo" items="${stationList}">
   <c:if test="${vo.nthDay==day}">
      <c:set var="cnt" value="0" />
      <div class="media-left" style="position: relative;float: left; margin-right: 20px;">
      <div style="border-radius: 5px; width:150px; height: 110px; border: 6px double;">
         <img src="<%=cp%>/resource/images/station/${vo.imageFileName}" 
         style="    position: absolute;
    top: 5px;
    left: 5px;
    width: 139px;
    height: 99px;
    border-radius: 2px;">
         </div><div style=" text-align: center; font: 1.2em TmonMonsori;">${vo.staName}역</div>
         
         
         <div style="margin: 10px 50px;">
<%--          <img alt="railway" src="<%=cp%>/resource/images/railway.png" style="width: 60px;display: block;"> --%>
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="railway" src="<%=cp%>/resource/images/railway1.png" style="width: 35px;display: block;    margin: 0 auto;">
         <img alt="train" src="<%=cp%>/resource/images/subway.png" style="width: 50px;display: block;margin-top: 10px;">
         
         
         </div>
      </div>
        <div class="media-body" style="max-width: 60%;">
      <ul class="bxslider">
      <!-- 명소 시작 -->
      <c:forEach var="tl" items="${tourList}">
      <c:if test="${tl.staNum==vo.staNum}">
         <c:set var="cnt" value="${cnt + 1}"/>
      <li style="height: 473px;"><img src="${tl.imageFileName}"  alt="${tl.name}" title="" style=" width: 100%;">
      
      <div style="left: 25px;
    width: 93%;
    bottom: 7px;
    font-weight: bold;
    position: absolute;">
     
    <div style="color: white;
    text-shadow: 0 0 4px #000;
    font: 1.8em TmonMonsori;"> #${cnt} ${tl.name} - ${tl.cateName}</div>
    <div style="    clear: both;
    height: 150px;
    background: #ffffffbf;
    margin: 5px 20px;
    padding: 25px;
    border-radius: 5px;
    font-size: 20px;
    line-height: 1.7;">
    <div>
    ${tl.memo}
  
<%--     ${tl.memo} --%>
    </div> 
    </div>
    <div style="    clear: both;
    height: 30px;
    background: #ffffffbf;
    margin: 5px 20px;
    padding: 0 25px;
    border-radius: 5px;
    font-size: 20px;
    line-height: 1.7;">
    <div>
    금액 : ${tl.price}원 
<%--     ${tl.memo} --%>
    </div> 
    </div>
     
                        
</div></li>
   
         </c:if>
      </c:forEach>
      <!-- 명소 끝 -->
</ul>
         </div>
      <div style="clear: both;"></div>
      </c:if>
      </c:forEach>   
   </div>   <!--미디어끝 -->
   
   <hr style="margin: 35px 0">
   </c:forEach>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
</div><!-- 끝~ -->


</div>
</div>

<!--Modal: modalPush-->
<div class="modal fade  bd-example-modal-sm" id="likealarm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true" >
  <div class="modal-dialog modal-sm" role="document" style="width: 490px;">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center" style="padding: 5px 5px;">
        <h5  class="heading" style="font-size:25px; font-weight: 700; margin: 5px 5px;">Rail Traveler</h5>
      </div>

      <!--Body-->
      <div class="modal-body" style="padding: 5px 5px; margin-top: 30px;">
        <i class="fas fa-bell fa-3x animated rotateIn mb-3"></i>

        <p id="modaltext" style="font-size: 15px; font-weight:500; margin-top: 10px; margin-left: 10px;">회원에게만 제공되는 서비스입니다!</p>
      <p id="modaltext" style="margin-top: 20px;">
   
      </p>
      </div>

      <!--Footer-->
      <div class="modal-footer flex-center" >
        <a type="button" href="<%=cp%>/member/login" class="btn  btn-info waves-effect" >로그인</a>
        <a type="button" href="<%=cp%>/member/member" class="btn  btn-info waves-effect" >회원가입</a>
        <a type="button" class="btn  btn-info waves-effect" data-dismiss="modal">닫기</a>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
var mapContainer = document.getElementById('planMap'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(36.467133, 128.005125), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var distanceOverlay;
var dots = {};

//마커 위치
var positions = [
   <c:forEach var="vo" items="${stationList}">
      {
         title : "${vo.staName}",
         latlng : new daum.maps.LatLng("${vo.latitude}","${vo.longitude}")
      }, 
   </c:forEach>
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
$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
});
</script>