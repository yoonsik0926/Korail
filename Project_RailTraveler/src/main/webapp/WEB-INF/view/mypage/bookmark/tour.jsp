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
	
var cnt =1;

function test(ob){

  if(cnt%2==1){
	  ob.className = "far fa-heart"; 
  }else{
	  ob.className = "fas fa-heart";
  }

	cnt++;	

}



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
			<span style="padding: 10px 0px; display: block;"> 나의 북마크 : 관광
				정보</span>
		</h3>
	</div>

	<div style="width: 100%;">
		<div style="margin-bottom: 10px;">
			<form name="searchForm" action="<%=cp%>/notice/list" method="post"
				style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: left; margin: 20px 0;">
				<select name="condition" class="boxTF"
					style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
					<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
					<option value="subject"
						${condition=="subject"?"selected='selected'":""}>이름</option>
					<option value="content"
						${condition=="content"?"selected='selected'":""}>내용</option>
					<option value="userName"
						${condition=="userName"?"selected='selected'":""}>역이름</option>
					<option value="created"
						${condition=="created"?"selected='selected'":""}>카테고리명</option>
				</select> <input type="text" name="keyword" value="${keyword}" class="boxTF"
					style="display: inline-block; height: 100%; width: 58%;"> <img
					src="<%=cp%>/resource/images/magnifying-glass.png" class=""
					onclick="searchList()"
					style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
			</form>
		</div>
		
		<div style="width: 100%; display: inline-block;">
			<div class="map" style="width: 45%; height:70%; margin-right: 20px; display: inline; float: left;">
				<div id="map" style="width:550px; height: 700px;"></div>
				<%-- <img src="<%=cp%>/resource/images/map.PNG" style="width: 100%; height: 70%;"> --%>
				
			</div>
			

			<div class="tourList" style="width: 52%; margin-bottom:10px; display: inline; float: left;">
				<h5 style="font-weight: 700; margin-bottom : 10px; border-bottom: #c1bebe 1px solid; padding-bottom: 5px;">30개의 북마크</h5>
				<div class="tourContent" style="width: 100%; height:170px; margin-bottom:15px; background: #F9F0DA; border: none; border-radius: 8px; ">
					<div style="width: 40%; height:100%; float: left;"><img src="<%=cp%>/resource/img/sudo.jpg" style="width:100%; height: 100%;"></div>
					<div style="width: 55%; height:100%; float: left; margin-left: 15px;">
						<table style="width:100%; margin-top:10px;">
							<tr style="height: 40px;">
								<td style="font-size: 18px; font-weight: 900;">강릉 펜션</td>
								<td style="text-align: right;" colspan="2">
									<button class="img-button">
										<i class="fas fa-heart" onclick="test(this);" style="font-size: 20px;color: tomato"></i>
									</button>
								</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700; width:30%; "><i class="fas fa-check"></i>  카테고리 : </td>
								<td style=" text-align: left;" colspan="2">숙소</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700;width:20%; "><i class="fas fa-check"></i>  위치 : </td>
								<td style="text-align: left;" colspan="2">강원도 강릉시 포남동 경강로2255번길 21 엄지빌딩 1층</td>
							</tr>
							<tr style="height: 30px;">
								<td style="text-align: right;" colspan="2">
									<button type="button" class="btn btn-default" style="margin-top: 5px;">더 알아보기</button>
								</td>
							</tr>
						
						</table>
					</div>

				</div>
				
				<div class="tourContent" style="width: 100%; height:170px; margin-bottom:15px; background: #F9F0DA; border: none; border-radius: 8px; ">
					<div style="width: 40%; height:100%; float: left;"><img src="<%=cp%>/resource/img/sudo.jpg" style="width:100%; height: 100%;"></div>
					<div style="width: 55%; height:100%; float: left; margin-left: 15px;">
						<table style="width:100%; margin-top:10px;">
							<tr style="height: 40px;">
								<td style="font-size: 18px; font-weight: 900;">강릉 펜션</td>
								<td style="text-align: right;" colspan="2">
									<button class="img-button">
										<i class="fas fa-heart" onclick="test(this);" style="font-size: 20px;color: tomato"></i>
									</button>
								</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700; width:30%; "><i class="fas fa-check"></i>  카테고리 : </td>
								<td style=" text-align: left;" colspan="2">숙소</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700;width:20%; "><i class="fas fa-check"></i>  위치 : </td>
								<td style="text-align: left;" colspan="2">강원도 강릉시 포남동 경강로2255번길 21 엄지빌딩 1층</td>
							</tr>
							<tr style="height: 30px;">
								<td style="text-align: right;" colspan="2">
									<button type="button" class="btn btn-default" style="margin-top: 5px;">더 알아보기</button>
								</td>
							</tr>
						
						</table>
					</div>

				</div>
				
				<div class="tourContent" style="width: 100%; height:170px; margin-bottom:15px; background: #F9F0DA; border: none; border-radius: 8px; ">
					<div style="width: 40%; height:100%; float: left;"><img src="<%=cp%>/resource/img/sudo.jpg" style="width:100%; height: 100%;"></div>
					<div style="width: 55%; height:100%; float: left; margin-left: 15px;">
						<table style="width:100%; margin-top:10px;">
							<tr style="height: 40px;">
								<td style="font-size: 18px; font-weight: 900;">강릉 펜션</td>
								<td style="text-align: right;" colspan="2">
									<button class="img-button">
										<i class="fas fa-heart" onclick="test(this);" style="font-size: 20px;color: tomato"></i>
									</button>
								</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700; width:30%; "><i class="fas fa-check"></i>  카테고리 : </td>
								<td style=" text-align: left;" colspan="2">숙소</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700;width:20%; "><i class="fas fa-check"></i>  위치 : </td>
								<td style="text-align: left;" colspan="2">강원도 강릉시 포남동 경강로2255번길 21 엄지빌딩 1층</td>
							</tr>
							<tr style="height: 30px;">
								<td style="text-align: right;" colspan="2">
									<button type="button" class="btn btn-default" style="margin-top: 5px;">더 알아보기</button>
								</td>
							</tr>
						
						</table>
					</div>

				</div>
				
				<div>
					<nav style="text-align: center;">
						<ul class="pagination">
							<li class="disabled"><span> <span aria-hidden="true">&laquo;</span>
							</span></li>
							<li class="active"><span>1 <span class="sr-only">(current)</span></span>
							</li>
							<li><span>2</span></li>
							<li><span>3</span></li>
							<li class="disabled"><span> <span aria-hidden="true">&raquo;</span>
							</span></li>
						</ul>
					</nav>
				</div>


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

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.553802, 126.969686); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var markerPosition  = new kakao.maps.LatLng(35.849909, 127.161830); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

</script>

