<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>

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
	background: #ED2;
	border-radius: 5px;
	counter-increment: carousel-cell;
}

.carousel-cell.is-selected {
	background: #ED2;
}

/* cell number */
.carousel-cell:before {
	display: block;
	text-align: center;
	line-height: 300px;
	font-size: 80px;
	color: white;
}

.fPlan {
	width: 100%;
	height: 300px;
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
  max-width: 310px;
  max-height: 220px;
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
  height: 180px;
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
   height: 180px;
}

figure.snip1132:hover img,
figure.snip1132.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.15);
  transform: scale(1.15);
   height: 180px;
}

.st {
	margin-left: 30px;
	display: inline;
	float: left;
}
</style>
<script type="text/javascript">
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>

<div class="main">
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
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
				</div>
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
				</div>
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
				</div>
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
				</div>
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
				</div>
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
				</div>
				<div class="carousel-cell">
					<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
				</div>
			</div>

			<div style="text-align: center; margin: 30px 0;">
				<button class="btnPlan" type="button"
					onclick="javascript:location.href='<%=cp%>/plan/write';">나의
					플래너 시작</button>
			</div>
		</div>

		<div class="main3" style="argin-top: 60px;">
			<h4 style="margin-bottom: 30px;">| 추천 코스</h4>
			<div style="display: inline-block; width: 100%; margin: 0 10px;">
				<div class="rc">
					<figure class="snip1384">
						<img src="<%=cp%>/resource/img/snow.jpg"/>
						<figcaption>
							<h3>겨울 분위기 가득 여행</h3>
							<p>겨울 분위기를 느끼고 싶은 여러분들께 추천합니다!</p>
							<i class="ion-ios-arrow-right"></i>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
				<div class="rc">
					<figure class="snip1384">
						<img src="<%=cp%>/resource/img/snow.jpg"/>
						<figcaption>
							<h3>겨울 분위기 가득 여행</h3>
							<p>겨울 분위기를 느끼고 싶은 여러분들께 추천합니다!</p>
							<i class="ion-ios-arrow-right"></i>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
				<div class="rc">
					<figure class="snip1384">
						<img src="<%=cp%>/resource/img/snow.jpg"/>
						<figcaption>
							<h3>겨울 분위기 가득 여행</h3>
							<p>겨울 분위기를 느끼고 싶은 여러분들께 추천합니다!</p>
							<i class="ion-ios-arrow-right"></i>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
				<div class="rc">
					<figure class="snip1384">
						<img src="<%=cp%>/resource/img/snow.jpg"/>
						<figcaption>
							<h3>겨울 분위기 가득 여행</h3>
							<p>겨울 분위기를 느끼고 싶은 여러분들께 추천합니다!</p>
							<i class="ion-ios-arrow-right"></i>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
			</div>
		</div>

		<div class="main4" style="margin-top: 60px;">
			<h4 style="margin-bottom: 30px;">| 역소개</h4>
			<div style="display: inline-block; width: 100%; margin: 0 10px;">
				<div class="st" style="margin-left: 10px !important;">
				<figure class="snip1132" style="width: 200px; height: 180px;">
					<img src="<%=cp%>/resource/img/sudo.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>수도권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="#"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 200px; height: 180px;">
					<img src="<%=cp%>/resource/img/gang.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>강원권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="#"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 200px; height: 180px;">
					<img src="<%=cp%>/resource/img/chung.jpg"  />
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>충청권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="#"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 200px; height: 180px;">
					<img src="<%=cp%>/resource/img/jun.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>전라권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="#"></a>
				</figure>
				</div>
				<div class="st">
				<figure class="snip1132" style="width: 200px; height: 180px;">
					<img src="<%=cp%>/resource/img/gyeong.jpg"/>
					<figcaption style="margin-top: 5px;">
						<div class="heading">
							<h5>
								<span>경상권</span>
							</h5>
						</div>
						<div class="caption"><p>*</p></div>
					</figcaption>
					<a href="#"></a>
				</figure>
				</div>				
			</div>
		</div>
		
		<div style="display: inline-block; width: 100%;">
		<div class="main5" style="margin-top: 60px; width: 45%; display: inline; float: left; margin-right: 110px;">
			<h4 style="margin-bottom: 30px;">| 커뮤니티</h4>
			<table style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse; border:2px solid #cccccc; border-bottom: none; ">
				<tr>
		 			<td style="border-right: 2px solid #cccccc;"><button class="commu" type="button" onclick="#">공지사항</button></td>
		 			<td style="border-right: 2px solid #cccccc;"><button class="commu" type="button" onclick="#">묻고답하기</button></td>
		 			<td style="border-right: 2px solid #cccccc;"><button class="commu" type="button" onclick="#">자유게시판</button></td>
		 			<td style="border-right: 2px solid #cccccc;"><button class="commu" type="button" onclick="#">동행구하기</button></td>
		 		</tr>
			</table>
 			<table class="table table-striped" style="margin-left: 10px; border-spacing: 0px; border-collapse: collapse;">
		 		<tr align="center" bgcolor="#eeeeee" height="35" style="font-weight:800; border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="60">번호</td>
			      <td >제목</td>
			      <td width="100">작성자</td>
			      <td width="100">작성일</td>
			      <td width="60">조회수</td>
		 		 </tr>
		 		 <tr align="center">
		 		 	<td>1</td>
		 		 	<td>제목입니다</td>
		 		 	<td>이유진</td>
		 		 	<td>2019-12-11</td>
		 		 	<td>1</td>
		 		 </tr>
		 		 <tr align="center">
		 		 	<td>2</td>
		 		 	<td>제목입니다</td>
		 		 	<td>이유진</td>
		 		 	<td>2019-12-11</td>
		 		 	<td>1</td>
		 		 </tr>
			</table>
		</div>
		<div class="main6" style="margin-top: 60px; width: 45%; display: inline; float: left;">
			<h4 style="margin-bottom: 30px;">| 이벤트</h4>
			<div><img src="<%=cp%>/resource/img/eventex.jpg" style="width: 100%;"></div>
		</div>
		
		</div>
		
		<div class="service" style="margin-bottom: 120px;"></div>
	</div>
</div>
