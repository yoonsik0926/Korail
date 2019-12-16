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
	
<script type="text/javascript">
var cnt =1;

function test(ob){

  if(cnt%2==1){
	  ob.className = "fas fa-heart"; 
  }else{
	  ob.className = "far fa-heart";
  }

	cnt++;	

}
</script>

<style type="text/css">
.carousel {
	background: white;
}

.carousel-cell {
	width: 25%;
	height: 300px;
	margin-right: 10px;
	/* margin-top: 22.5px; */
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
	line-height: 200px;
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

.sample_image  img {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.sample_image:hover img {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}

a {
	color: #484848;
}

.img-button {
	background: transparent;
	border: none;
	width: 30px;
	height: 30px;
	cursor: pointer;
	outline: 0;
}
</style>


<div class="body-content-container">

	<div class="body-title" style="margin-top: 3%; margin-bottom: 35px">
		<h3 style="font-weight: 700">${title} 추천 장소</h3>
	</div>


	<div class="container">
		<div class="row" style="width: 25%">
			<div class="col" style="font-size: 18px; font-weight: 600;">
				<ul class="nav nav-tabs">
					<li class="nav-item active"><a class="nav-link active"
						href="<%=cp%>/main">전체</a></li>

					<li class="nav-item "><a class="nav-link active"
						href="<%=cp%>/main">관광</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">맛집</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="#">숙소</a>
					</li>

				</ul>
			</div>
		</div>
	</div>



	<div class="recommend" style="width: 100%; height: 50% !important;">
		<div class="carousel" data-flickity='{"groupCells": true }'
			style="height: 350px;">
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
			</div>
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
			</div>
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
			</div>
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
			</div>
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
			</div>
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
			</div>
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/resource/img/friendPlan.PNG" />
			</div>
		</div>



	</div>



	<div
		style="border: 1px solid black; border-radius: 20px; height: 80px; width: 90%; margin-left: 5%; margin-bottom: 2%">

		<div class="form-group"
			style="width: 20%; margin-top: 20px; float: left; margin-left: 10%; margin-right: 15%">
			<select id="disabledSelect" class="form-control">
				<option class="boxTF" value="">:: 역 구분::</option>
			</select>
		</div>

		<div class="form-group"
			style="width: 15%; margin-top: 20px; float: left; margin-right: 15px">
			<select id="disabledSelect" class="form-control">
				<option class="boxTF" value="">:: 대분류::</option>
			</select>
		</div>

		<div class="form-group"
			style="width: 15%; margin-top: 20px; float: left;">
			<select id="disabledSelect" class="form-control">
				<option class="boxTF" value="">:: 소분류::</option>
			</select>
		</div>

		<button type="submit" class="btn btn-succees"
			style="margin-top: 20px; height: 40px; width: 100px; margin-left: 20px;">검색하기
		</button>

	</div>


	<div class="col-sm-6 col-md-4"
		style="max-width: 25%; min-height: 200px">
		<div class="thumbnail">

			<img style="height: 200px; width: 300px"
				src="<%=cp%>/resource/img/friendPlan.PNG">
			<div class="caption">
				<div style="margin-top: 10px">
					<span style="font-size: 25px;">테스트</span>
					<button class="img-button" style="margin-left: 140px">
						<i class="far fa-heart" onclick="test(this);" style="font-size: 20px;color: tomato"></i>
					</button>
				</div>
				<p>...</p>
				<p align="right">
					<button class="btn btn-info">알아보기</button>
				</p>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-md-4"
		style="max-width: 25%; min-height: 200px">
		<div class="thumbnail">

			<img style="height: 200px; width: 300px"
				src="<%=cp%>/resource/img/friendPlan.PNG">
			<div class="caption">
				<div style="margin-top: 10px">
					<span style="font-size: 25px;">테스트</span>
					<button class="img-button" style="margin-left: 140px">
						<i class="far fa-heart" onclick="test(this);" style="font-size: 20px;color: tomato"></i>
					</button>
				</div>
				<p>...</p>
				<p align="right">
					<button class="btn btn-info" onclick="javascript:location.href='<%=cp%>/tour/detail';">알아보기</button>
				</p>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-md-4"
		style="max-width: 25%; min-height: 200px">
		<div class="thumbnail">

			<img style="height: 200px; width: 300px"
				src="<%=cp%>/resource/img/friendPlan.PNG">
			<div class="caption">
				<div style="margin-top: 10px">
					<span style="font-size: 25px;">테스트</span>
					<button class="img-button" style="margin-left: 140px">
						<i class="far fa-heart" onclick="test(this);" style="font-size: 20px;color: tomato"></i>
					</button>
				</div>
				<p>...</p>
				<p align="right">
					<button class="btn btn-info">알아보기</button>
				</p>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-md-4"
		style="max-width: 25%; min-height: 200px">
		<div class="thumbnail">

			<img style="height: 200px; width: 300px"
				src="<%=cp%>/resource/img/friendPlan.PNG">
			<div class="caption">
				<div style="margin-top: 10px">
					<span style="font-size: 25px;">테스트</span>
					<button class="img-button" style="margin-left: 140px">
						<i class="far fa-heart" onclick="test(this);" style="font-size: 20px; color: tomato"></i>
					</button>
				</div>
				<p>...</p>
				<p align="right">
					<button class="btn btn-info">알아보기</button>
				</p>
			</div>
		</div>
	</div>

	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">1 2 3 <%--  ${dataCount==0?"등록된 게시물이 없습니다.":paging} --%>
			</td>
		</tr>
	</table>



</div>
