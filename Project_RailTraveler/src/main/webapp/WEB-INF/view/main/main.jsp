<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/flickity.min.css">
<script src="<%=cp%>/resource/js/flickity.pkgd.min.js"></script> 
   
<style>
* {

	box-sizing: border-box;
}

.carousel {
	background: white;
}

.carousel-cell {
	width: 25%;
	height: 300px;
	margin-right: 10px;
	margin-top: 22.5px;
	margin-bottom: 22.5px;
	border-radius: 5px;
	counter-increment: carousel-cell;
}

.carousel-cell2 {
	width: 25%;
	height: 350px;
	margin-right: 10px;
	margin-top: 22.5px;
	margin-bottom: 22.5px;
	border-radius: 5px;
	counter-increment: carousel-cell;
}


/* cell number */
.carousel-cell:before  {
	display: block;
	text-align: center;
	line-height: 300px;
	font-size: 80px;
	color: white;
}
.carousel-cell2:before{
	display: block;
	text-align: center;
	line-height: 350px;
	font-size: 80px;
	color: white;
}


.fPlan, .event {
	width: 100%;
	height: 100%;
	margin-right: 10px;
	margin-bottom: 22.5px;
	border-radius: 5px;
}

.btnPlan:hover {
	width: 185px;
	height: 40px;
	border: none;
	background: #a1b1f7;
	border-radius: 4px;
	color: white;
}

.btnPlan {
	background: #a1b1f7;
	color: #fff;
	border: none;
	position: relative;
	height: 40px;
	width: 185px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	border-radius: 4px;
}

.btnPlan:hover {
	background: #fff;
	color: #a1b1f7;
}

.btnPlan:before, .btnPlan:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #a1b1f7;
	transition: 400ms ease all;
}

.btnPlan:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btnPlan:hover:before, .btnPlan:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.rc {
	width : 280px;
	margin-left: 10px;
	display: inline;
	float: left;
}

.commu {
	background: none;
	border: none;
}

.page-three-title h4 {
    margin-bottom : 30px;
    background: linear-gradient(#e28ff1, #68d0fd) no-repeat 0 0 / 7px 100%;
    line-height: 30px;
    padding-left: 20px;
    font-weight: 550;
    color: #1b1b1b;
    /* margin: 0; */
    font-family: Roboto, 'Nanum Square', Helvetica, Arial, sans-serif;
}
</style>
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);

figure.snip1384 {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	overflow: hidden;
	margin: 10px;
	min-width: 230px;
	max-width: 315px;
	width: 100%;
	color: #ffffff;
	text-align: left;
	font-size: 16px;
	background-color: #000000;
	height: 230px;
}

figure.snip1384 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

figure.snip1384 img {
	max-width: 100%;
	backface-visibility: hidden;
	vertical-align: top;
	height: 230px;
}

figure.snip1384:after, figure.snip1384 figcaption {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

figure.snip1384:after {
	content: '';
	background-color: rgba(0, 0, 0, 0.65);
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	opacity: 0;
}

figure.snip1384 figcaption {
	z-index: 1;
	padding: 40px;
}

figure.snip1384 h3, figure.snip1384 .links {
	width: 100%;
	margin: 5px 0;
	padding: 0;
}

figure.snip1384 h3 {
	line-height: 1.1em;
	font-weight: 700;
	font-size: 1.4em;
	text-transform: uppercase;
	opacity: 0;
}

figure.snip1384 p {
	font-size: 0.8em;
	font-weight: 300;
	letter-spacing: 1px;
	opacity: 0;
	top: 50%;
	-webkit-transform: translateY(40px);
	transform: translateY(40px);
}

figure.snip1384 i {
	position: absolute;
	bottom: 10px;
	right: 10px;
	padding: 20px 25px;
	font-size: 34px;
	opacity: 0;
	-webkit-transform: translateX(-10px);
	transform: translateX(-10px);
}

figure.snip1384 a {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 1;
}

figure.snip1384:hover img, figure.snip1384.hover img {
	zoom: 1;
	filter: alpha(opacity = 50);
	-webkit-opacity: 0.5;
	opacity: 0.5;
}

figure.snip1384:hover:after, figure.snip1384.hover:after {
	opacity: 1;
	position: absolute;
	top: 10px;
	bottom: 10px;
	left: 10px;
	right: 10px;
}

figure.snip1384:hover h3, figure.snip1384.hover h3, figure.snip1384:hover p,
	figure.snip1384.hover p, figure.snip1384:hover i, figure.snip1384.hover i
	{
	-webkit-transform: translate(0px, 0px);
	transform: translate(0px, 0px);
	opacity: 1;
}
</style>
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
figure.snip1132 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
 /*  max-width: 310px;
  max-height: 220px; */
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

figure.snip1132 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}

figure.snip1132 img {
  max-width: 100%;
  height: 200px;
  position: relative;
  opacity: 1;
}

figure.snip1132 figcaption {
  position: absolute;
  top: 20px;
  left: 20px;
  right: 20px;
  bottom: 20px;
  border: 1px solid white;
  border-width: 0 1px;
}

figure.snip1132 .heading {
  overflow: hidden;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}

figure.snip1132 .caption {
  overflow: hidden;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
  position: absolute;
  width: 100%;
  bottom: 0;
}

figure.snip1132 h5,
figure.snip1132 p {
  display: table;
  margin: 0 auto;
  padding: 0 10px;
  position: relative;
  text-align: center;
  width: auto;
  text-transform: uppercase;
  font-weight: 400;
}

figure.snip1132 h5 span,
figure.snip1132 p span {
  font-weight: 800;
}

figure.snip1132 h5:before,
figure.snip1132 p:before,
figure.snip1132 h5:after,
figure.snip1132 p:after {
  position: absolute;
  display: block;
  width: 1000%;
  height: 1px;
  content: '';
  background: white;
}

figure.snip1132 h5:before,
figure.snip1132 p:before {
  left: -1000%;
}

figure.snip1132 h5:after,
figure.snip1132 p:after {
  right: -1000%;
}

figure.snip1132 h5:before,
figure.snip1132 h5:after {
  top: 50%;
}

figure.snip1132 p {
  font-size: 0.8em;
  font-weight: 500;
}

figure.snip1132 p:before,
figure.snip1132 p:after {
  bottom: 50%;
}

figure.snip1132 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
   height: 200px;
}

figure.snip1132:hover img,
figure.snip1132.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.15);
  transform: scale(1.15);
   height: 200px;
}

.st {
	margin-left: 15px;
	display: inline;
	float: left;
}
</style>
<script type="text/javascript">
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
<body class="">
	<div class="container tim-container"
		style="max-width: 1200px; padding-top: 100px">
		<div class="main1">
			<h1 class="text-center">
				Design Your Rail Trip <small class="subtitle">with Rail
					Traveler</small>
			</h1>
		</div>

		<div class="main2">
			<div class="carousel" data-flickity='{"groupCells": true }'
				style="height: 350px;">
				<c:forEach var="vo" items="${fplanList}">
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/uploads/plan/${vo.imageFileName}"  onerror="this.src='<%=cp%>/resource/images/empty.png'"  onclick="javascript:location.href='<%=cp%>/friendPlan/detail?planNum=${vo.planNum}'"/>
				<div style="width: 100%;
    padding: 10px;
    left: 0%;
    height: 60px;
    bottom: 0%;
    font-weight: bold;
    position: absolute;
    color: white;
    background: #00000099;"><span style="margin: 0 auto;"> ${vo.ticketDay}일<br>${vo.title}</span></div>
				</div>
				</c:forEach>
			</div>

			<div style="text-align: center; margin: 30px 0;">
				<button class="btnPlan" type="button"
					onclick="javascript:location.href='<%=cp%>/plan/write';">나의
					플래너 시작</button>
			</div>
		</div>
	
		<div class="main3" style="margin-top: 100px;">
			<div class="page-three-title mt40">
				<h4 class="fs26">
				<span style="padding: 10px 0px; display: block;"> 추천 코스</span>
				</h4>
			</div>
			
			<div style="display: inline-block; width: 100%; margin: 0 10px;">
				<c:forEach var="vo" items="${planList}">
					<div class="rc" onclick="javascript:location.href='<%=cp%>/plan/detail?planNum=${vo.planNum}';">
						<figure class="snip1384">
							<img src="<%=cp%>/uploads/plan/${vo.imageFileName}" onclick="javascript:location.href='<%=cp%>/plan/detail?planNum=${vo.planNum}'"/>
							<figcaption>
								<h3>${vo.title}</h3>
								<p>${vo.staName}</p>
								<i class="ion-ios-arrow-right"></i>
							</figcaption>
							<a href="#"></a>
						</figure>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="main4" style="margin-top: 100px;">
			<div class="page-three-title mt40">
				<h4 class="fs26">
				<span style="padding: 10px 0px; display: block;"> 역 소개</span>
				</h4>
			</div>
			<div style="display: inline-block; width: 100%; margin: 0 10px;">
				<div class="st" style="margin-left: 10px !important;">
				<figure class="snip1132" style="width: 220px; height: 200px;">
					<img src="<%=cp%>/resource/img/sudo.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>수도권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="<%=cp%>/station/info?page=1&locNum=1"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 220px; height: 200px;">
					<img src="<%=cp%>/resource/img/gang.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>강원권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="<%=cp%>/station/info?page=1&locNum=3"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 220px; height: 200px;">
					<img src="<%=cp%>/resource/img/chung.jpg"  />
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>충청권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="<%=cp%>/station/info?page=1&locNum=2"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 220px; height: 200px;">
					<img src="<%=cp%>/resource/img/jun.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>전라권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="<%=cp%>/station/info?page=1&locNum=4"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 220px; height: 200px;">
					<img src="<%=cp%>/resource/img/gyeong.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>경상권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="<%=cp%>/station/info?page=1&locNum=5"></a>
				</figure>
				</div>				
			</div>
		</div>
		
		<div class="main5" style="margin-top: 100px;">
			<div class="page-three-title mt40">
				<h4 class="fs26">
				<span style="padding: 10px 0px; display: block;"> 커뮤니티</span>
				</h4>
			</div>
			
			<div class="commu1" style="display: inline-block; width: 100%;">
			
			<div class="notice" style="width: 46%; display: inline; float: left; margin-right: 80px;">
			<table style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse; border:2px solid #cccccc; border-bottom: none; ">
				<tr>
		 			<td style="border-right: 2px solid #cccccc;">
		 			<button class="commu" type="button" onclick="javascript:location.href='<%=cp%>/notice/notice'">공지사항</button></td>
		 		</tr>
			</table>
 			<table class="table table-striped" style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse;">
		 		<tr align="center" bgcolor="#eeeeee" height="35" style="font-weight:800; border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td >제목</td>
			      <td width="100">작성자</td>
			      <td width="100">작성일</td>
		 		 </tr>
		 		 <c:forEach var="vo" items="${noticeList}">
		 		 <tr align="center">
		 		 	<td><a style="color: #666; " href="<%=cp%>/notice/article?noticeNum=${vo.noticeNum}">${vo.subject}
		 		 	<c:if test="${vo.gap<1}">
						<img alt="" src="<%=cp%>/resource/images/commu/new1.png" style="width: 17px;"> </c:if>
		 		 	</a></td>
		 		 	<td>(<c:out value="${fn:substring(vo.userId, 0, fn:length(vo.userId) - 3)}" />***)</td>
		 		 	<td>${vo.created}</td>
		 		 </tr>
		 		 </c:forEach>
			</table>
			</div>
			
			<div class="qna" style="width: 46%; display: inline; float: left;">
			<table style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse; border:2px solid #cccccc; border-bottom: none; ">
				<tr>
		 			<td style="border-right: 2px solid #cccccc;"><button class="commu" type="button" onclick="javascript:location.href='<%=cp%>/qna/qna'">묻고 답하기</button></td>
		 		</tr>
			</table>
 			<table class="table table-striped" style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse;">
		 		<tr align="center" bgcolor="#eeeeee" height="35" style="font-weight:800; border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td >제목</td>
			      <td width="100">작성자</td>
			      <td width="100">작성일</td>
		 		 </tr>
		 		 <c:forEach var="vo" items="${qnaList}">
		 		 <tr align="center">
		 		 	<td><a style="color: #666; " href="<%=cp%>/qna/article?qnaNum=${vo.qnaNum}">${vo.subject}
		 		 	<c:if test="${vo.gap<1}">
						<img alt="" src="<%=cp%>/resource/images/commu/new1.png" style="width: 17px;"> </c:if>
		 		 	</a></td>
		 		 	<td>(<c:out value="${fn:substring(vo.userId, 0, fn:length(vo.userId) - 3)}" />***)</td>
		 		 	<td>${vo.created}</td>
		 		 </tr>
		 		 </c:forEach>
			</table>
			</div>
			
			</div>
			
			<div class="commu2" style="display: inline-block; width: 100%; margin-top: 60px;">
			
			<div class="board" style="width: 46%; display: inline; float: left; margin-right: 80px;">
			<table style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse; border:2px solid #cccccc; border-bottom: none; ">
				<tr>
		 			<td style="border-right: 2px solid #cccccc;"><button class="commu" type="button" onclick="javascript:location.href='<%=cp%>/board/board'">자유 게시판</button></td>
		 		</tr>
			</table>
 			<table class="table table-striped" style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse;">
		 		<tr align="center" bgcolor="#eeeeee" height="35" style="font-weight:800; border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td >제목</td>
			      <td width="100">작성자</td>
			      <td width="100">작성일</td>
		 		 </tr>
		 		 <c:forEach var="vo" items="${boardList}">
		 		 <tr align="center">
		 		 	<td><a style="color: #666; " href="<%=cp%>/board/article?boardNum=${vo.boardNum}">${vo.subject}
		 		 	<c:if test="${vo.gap<1}">
						<img alt="" src="<%=cp%>/resource/images/commu/new1.png" style="width: 17px;"> </c:if>
		 		 	</a></td>
		 		 	<td>(<c:out value="${fn:substring(vo.userId, 0, fn:length(vo.userId) - 3)}" />***)</td>
		 		 	<td>${vo.created}</td>
		 		 </tr>
		 		 </c:forEach>
			</table>
			</div>
			
			<div class="friend" style="width: 46%; display: inline; float: left;">
			<table style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse; border:2px solid #cccccc; border-bottom: none; ">
				<tr>
		 			<td style="border-right: 2px solid #cccccc;"><button class="commu" type="button" onclick="javascript:location.href='<%=cp%>/qna/qna'">동행 구하기</button></td>
		 		</tr>
			</table>
 			<table class="table table-striped" style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse;">
		 		<tr align="center" bgcolor="#eeeeee" height="35" style="font-weight:800; border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td >제목</td>
			      <td width="100">작성자</td>
			      <td width="100">작성일</td>
		 		 </tr>
		 		 <c:forEach var="vo" items="${friendList}">
		 		 <tr align="center">
		 		 	<td><a style="color: #666; " href="<%=cp%>/friend/article?friendNum=${vo.friendNum}">${vo.subject}
		 		 	<c:if test="${vo.gap<1}">
						<img alt="" src="<%=cp%>/resource/images/commu/new1.png" style="width: 17px;"> </c:if>
		 		 	</a></td>
		 		 	<td>(<c:out value="${fn:substring(vo.userId, 0, fn:length(vo.userId) - 3)}" />***)</td>
		 		 	<td>${vo.created}</td>
		 		 </tr>
		 		 </c:forEach>
			</table>
			</div>
			
			</div>
			
			
		</div>
		
		<div class="main6" style="margin-top: 60px;">
			<div class="page-three-title mt40">
				<h4 class="fs26">
				<span style="padding: 10px 0px; display: block;"> 이벤트</span>
				</h4>
			</div>
			
			<div class="carousel" data-flickity='{"groupCells": true }'
				style="height: 350px;">
				 <c:forEach var="vo" items="${eventList}">
				<div class="carousel-cell2">
					<img class="event" src="<%=cp%>/uploads/event/${vo.imageFilename}"  onerror="this.src='<%=cp%>/resource/images/empty.png'"  onclick="javascript:location.href='<%=cp%>/event/article?mode=0&eventNum=${vo.eventNum}'" />
				</div>
				</c:forEach>

		</div>
		</div>
		
		
		
		<div class="service" style="margin-bottom: 120px;"></div>
	</div>
