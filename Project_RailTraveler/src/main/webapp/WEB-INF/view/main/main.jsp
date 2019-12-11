<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>

<style>
* { box-sizing: border-box; }

.carousel {
  background: white;
}

.carousel-cell {
  width: 25%;
  height: 300px;
  margin-right: 10px;
  margin-top : 22.5px;
  margin-bottom : 22.5px;
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
	background : #a1b1f7;
	border-radius: 4px;
	color : white;
}

.btnPlan{
  background:#a1b1f7;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  width: 185px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 4px;
}
.btnPlan:hover{
  background:#fff;
  color:#a1b1f7;
}
.btnPlan:before,.btnPlan:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #a1b1f7;
  transition:400ms ease all;
}
.btnPlan:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btnPlan:hover:before,.btnPlan:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>


<div class="main">
	<div class="container tim-container"
		style="max-width: 1200px; padding-top: 100px">
		<h1 class="text-center" >
			Design Your Rail Trip <small class="subtitle">with
				Rail Traveler</small>
		</h1>

		<div class="carousel" data-flickity='{"groupCells": true }' style="height: 350px;">
			<div class="carousel-cell"><img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG"/></div>
			<div class="carousel-cell"><img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG"/></div>
			<div class="carousel-cell"><img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG"/></div>
			<div class="carousel-cell"><img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG"/></div>
			<div class="carousel-cell"><img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG"/></div>
			<div class="carousel-cell"><img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG"/></div>
			<div class="carousel-cell"><img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG"/></div>
		</div>
		
		<div style="text-align: center; margin: 30px 0;">
			<button class="btnPlan" type="button" onclick="javascript:location.href='<%=cp%>/plan/write';">나의 플래너 시작</button>
		</div>

		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
			do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
			enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
			ut aliquip ex ea commodo consequat. Duis aute irure dolor in
			reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
			culpa qui officia deserunt mollit anim id est laborum.</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
			do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
			enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
			ut aliquip ex ea commodo consequat. Duis aute irure dolor in
			reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
			culpa qui officia deserunt mollit anim id est laborum.</p>
		<!--     end extras -->
	</div>
	<div class="space"></div>
	<!-- end container -->
</div>
