<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<link rel="stylesheet"
	href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!--지도 정보를 가져오는 API 스크립트-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=134ec7b5b1389d0316b7c1bed3033f48"></script>


<!--이미지 슬라이드 스크립트-->
<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			mode : 'horizontal',// 가로 방향 수평 슬라이드
			speed : 500, // 이동 속도를 설정
			pager : false, // 현재 위치 페이징 표시 여부 설정
			moveSlides : 1, // 슬라이드 이동시 개수
			slideWidth : 1000, // 슬라이드 너비
			minSlides : 4, // 최소 노출 개수
			maxSlides : 4, // 최대 노출 개수
			slideMargin : 5, // 슬라이드간의 간격
			auto : true, // 자동 실행 여부
			autoHover : true, // 마우스 호버시 정지 여부
			controls : false
		// 이전 다음 버튼 노출 여부
		});
	});
</script>

<script type="text/javascript">


//페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/tour/listReply";
	var query="num=${dto.num}&pageNo="+page;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#listReply").html(data);
		}
	    ,beforeSend :function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}
</script>

<style type="text/css">
.box1 {
	margin: 0 auto
}
</style>


<div class="body-content-container">
	<div style="width:600px; margin: 10px auto;">
		<img  style="height: 300px; width: 600px; border: 5px solid #c4c4c4" src="${vo.imagefilename}"/>
	</div>


	<div class="box1" style="width: 90%; border: 2px solid #eeeeee">
			
		<!--상단 메뉴-->
				
		<div class="box1" style="margin-top: 20px">

			<div class="box1"
				style="width: 93%; border: 1px solid #eeeeee; margin-top:10px; " >
				<h3 align="center">${vo.name}</h3>
				<h6 align="center">${vo.detailcateName}</h6>

				<div class="row" style="width: 340px; margin: 10px auto;">
					<div class="col" style="font-size: 18px; font-weight: 600;">
						<ul class="nav nav-tabs">
							<li class="nav-item "><a class="nav-link active"
								href="<%=cp%>/main"><i class="fas fa-map-marker-alt"></i>
									길찾기</a></li>

							<li class="nav-item "><a class="nav-link active"
								href="<%=cp%>/main"><i class="fas fa-map-marker-alt"></i>
									로드뷰</a></li>

							<li class="nav-item "><a class="nav-link active"
								href="<%=cp%>/main"><i class="fas fa-map-marker-alt"></i>
									공유하기</a></li>


						</ul>
					</div>
				</div>



			</div>

		</div>

		<!--장소 설명-->
		<div class="box1" style="margin-top: 20px;">
			<div class="box1"
				style="width: 93%; border: 1px solid #eeeeee; align-content: center">

				<div class="col"
					style="font-size: 18px; font-weight: 600; margin-top: 10px; margin-left: 10px">
					<p>
						<i class="fas fa-phone"></i> ${vo.tel}
					</p>
					<p>
						<i class="fas fa-map-marker-alt"></i>  ${vo.address}
					</p>
					<p>
						<i class="fas fa-home"></i> ${vo.content}
					</p>
				</div>
			</div>

		</div>

		<!--리뷰창-->
		<div class="container"
			style="margin-top: 40px; border-top: 2px solid black; width: 93%">
			<div class="row" style="width: 100%; margin: 10px auto;">
				<div class="col" style="font-size: 18px; font-weight: 600;">
					<ul class="nav nav-tabs">
						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							href="<%=cp%>/main">주요 정보</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							href="<%=cp%>/main">후기/리뷰</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							href="<%=cp%>/main">자유게시판</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							href="<%=cp%>/main">사진 요약</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		
		

		<!--찾아가는 길 설명-->
		<div class="container"
			style="margin-top: 10px; margin-bottom: 50px; border-bottom: 2px solid #eeeeee; width: 93%">


			<div class="row" style="width: 100%; ">
				<p style="font-size: 25px; font-weight: 700">"${vo.name}" 교통정보</p>
			</div>
			<div id="map" style="width:100%;height:350px;margin-bottom: 50px;"></div>
		</div>

		<!--후기 리뷰창 설명-->
		<div class="container"
			style="margin-top: 10px; margin-bottom: 50px; border-bottom: 2px solid #eeeeee; width: 93%">
			<div class="row" style="width: 100%; margin-bottom: 5px; ">
				<p style="font-size: 25px; font-weight: 700">후기/리뷰</p>
			</div>
			<div style="margin-bottom: 50px;">
				
				
			<c:forEach var="list" items="${bloglist}">
			<div class="box1" style="margin-top: 20px;">
			<div class="box1" style="width: 93%; padding:10px 10px;
			border: 1px solid #eeeeee; align-content: center">

				<div class="col"
					style="font-size: 18px; font-weight: 600; margin-top: 10px; margin-left: 10px">
					
						<span style="text-align: left; font-size: 20px ">${list.blogSubject}</span>
						&nbsp;
						<span style="text-align: right; font-size: 14px" >${list.created}</span>
					
					<h6 style="font-weight: 500">
						${list.blogContent}
					</h6>
					
					<span style="font-size: 17px;font-weight: 700">${list.blogName} </span>
					<span style="font-size: 14px">/ <a href="${list.blogUrl}">블로그로 가기</a></span> 
					
				</div>
			</div>

			</div>
			</c:forEach>
			
				
				
			</div>
		</div>





		<div class="container" style="margin-top: 10px; border-bottom: 2px solid #eeeeee; width: 93%">
		
			<div class="row" style="width: 100%;  margin-bottom: 5px;">
				<p style="font-size: 25px; font-weight: 700">자유게시판</p>
			</div>
			

				<div id="listReply">여기에 AJAX 처리</div>
			
			
			<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; margin-top: 20px; margin-bottom: 50px;'>
					<tr height='30'>
						<td align='left'><span style='font-weight: bold;'>댓글쓰기</span><span>
								- 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span></td>
					</tr>
					<tr>
						<td style='padding: 5px 5px 0px;'><textarea class='boxTA'
								style='width: 100%; height: 70px;'></textarea></td>
					</tr>
					<tr>
						<td align='right'>
							<button type='button' class='' data-num='10'
								style='padding: 10px 20px;'>댓글 등록</button>
						</td>
					</tr>
				</table>
		</div>
		
				<!--후기 리뷰창 설명-->
		<div class="container" style="margin-top: 50px;  width: 93%">
			<div class="row" style="width: 100%; margin-top: 5px;">
				<p style="font-size: 25px; font-weight: 700">사진 요약</p>
			</div>
			<div style="margin-bottom: 50px;">
				네이버 블로그 형태로 집어넣을 것

			</div>
		</div>






	</div>
</div>

<!--지도 API 스크립트!!!-->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.longitude}, ${vo.latitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

var iwContent = '<div><a href="https://map.kakao.com/link/map/${vo.name},${vo.longitude},${vo.latitude}" style="color:blue; text-align:right; target="_blank">큰지도보기</a> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(${vo.longitude}, ${vo.latitude}); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);  

</script>
