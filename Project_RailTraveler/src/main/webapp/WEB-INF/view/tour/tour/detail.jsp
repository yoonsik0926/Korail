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

<style type="text/css">
.box1 {
	margin: 0 auto
}
</style>


<div class="body-content-container">

	<!--이미지 슬라이드-->
	<div>
		<ul class="bxslider">

			<li><img src="<%=cp%>/resource/img/friendPlan.PNG" /></li>
			<li><img src="<%=cp%>/resource/img/friendPlan.PNG" /></li>
		</ul>
	</div>
	
	<div class="box1" style="width: 90%; border: 2px solid #eeeeee">
	<!--상단 메뉴-->
	<div class="box1" style="margin-top: 20px">
		<div class="box1"
			style="width: 93%; border: 1px solid #eeeeee; align-content: center">
			<h3 align="center">강릉 라테라스리조트</h3>
			<h6 align="center">펜션</h6>


			<div class="row" style="width: 38%; margin: 0 auto;">
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



		
				<div class="col" style="font-size: 18px; font-weight: 600; margin-top: 10px; margin-left: 10px">
					<p><i class="fas fa-phone"></i>  070-4320-7476</p>
					<p><i class="fas fa-map-marker-alt"></i>  전남 여수시 돌산읍 진모1길 29-12</p>
					<p><i class="fas fa-home"></i>  바닷가, 신축펜션</p>
				</div>
		</div>

	</div>
	
	<!--리뷰창-->
	<div class="container" style="margin-top: 40px; border-top: 2px solid black; width: 93%">
		<div class="row" style="width: 100%; margin-top: 5px;">
			<div class="col" style="font-size: 18px; font-weight: 600;">
				<ul class="nav nav-tabs">
					<li class="nav-item " style="width: 130px; margin: 0 auto;"><a style="text-align: center" class="nav-link active"
						href="<%=cp%>/main">주요 정보</a></li>
						
					<li class="nav-item " style="width: 130px; margin: 0 auto;"><a style="text-align: center" class="nav-link active"
						href="<%=cp%>/main">후기/리뷰</a></li>
						
					<li class="nav-item " style="width: 130px; margin: 0 auto;"><a style="text-align: center" class="nav-link active"
						href="<%=cp%>/main">자유게시판</a></li>
												
					<li class="nav-item " style="width: 130px; margin: 0 auto;"><a style="text-align: center" class="nav-link active"
						href="<%=cp%>/main">사진 요약</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<!--설명-->
	<div class="container" style="margin-top: 40px; border-top: 2px solid black; width: 93%">
		<div class="row" style="width: 100%; margin-top: 5px;">
			
		</div>
	</div>


	
	
	
	
	</div>
</div>
