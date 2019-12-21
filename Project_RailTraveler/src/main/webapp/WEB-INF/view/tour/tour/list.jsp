<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>


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


$(function(){
	$("#tab-${cateNum}").addClass("active");
	
	$("ul.tabs li").click(function(){
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		var url = "<%=cp%>/tour/${subTitle}?cateNum="+tab;
		location.href=url;
	});
});

</script>

<script type="text/javascript">

/* function checkStaion() {
	if(! $("#stationSelect option").value){
		$("#selectStationModal").modal();			
	}
}; */

function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			console.log(data);
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

function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
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



$(function(){
		
	
	$("select[name=1stSelect]").change(function(){
				
		$("select[name=2stSelect] option").remove();
		$("select[name=2stSelect]").append("<option class='boxTF' value=''' selected='selected'>:: 소분류 ::</option>");
		
		var cateNum = $(this).val();
		if(! cateNum) {
			return false;
		}

		var url = "<%=cp%>/tour/detailTourCategory";
		var query = "cateNum="+cateNum;
		var fn = function(data){

			for(var i =0 ; i<data.detailTourCategoy.length ;i++){
				$("select[name=2stSelect]").append("<option value="+data.detailTourCategoy[i].detailcateNum+">"+data.detailTourCategoy[i].detailcateName+"</option>");				
			}			
		}; 

		ajaxJSON(url, "post", query, fn);
		
	});
});

function optionslist() {
	
	//셀렉트 박스 다 되어있는지 검사하고..
	var staion = document.getElementById("stationSelect");
	var detailcategory = document.getElementById("2stSelect");
	
	
	var staNum =staion.options[staion.selectedIndex].value;
	var detailcateNum =detailcategory.options[detailcategory.selectedIndex].value;
	

	

	var url = "<%=cp%>/tour/detailTourList";
	var query = "staNum="+staNum+"&detailcateNum="+detailcateNum+"&subTitle=${subTitle}";
	var selector = "#please";

	ajaxHTML(url, "post", query, selector);
	
	
	

 }

</script>
<style type="text/css">

.nonscroll::-webkit-scrollbar { 

    display: none; 

}

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
		<div class="row" style="width: 100%; cursor: pointer;" >
			<div class="col" style="font-size: 18px; font-weight: 600; width: 100%">
				<ul class="nav nav-tabs tabs">
					<li id="tab-0" class="nav-item" data-tab="0"><a class="nav-link" >전체</a></li>				
				<c:forEach var="vo" items="${tourCategoryList}">
					<li class="nav-item" id="tab-${vo.cateNum}" data-tab="${vo.cateNum}">
					<a class="nav-link" >${vo.cateName}</a></li>
				</c:forEach>
	

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
			<select id="stationSelect" name="stationSelect" class="form-control">
				<option class="boxTF" value="">:: 역 구분::</option>
			<c:forEach var="sta" items="${localStation}">
					<option class="boxTF" value="${sta.staNum}" <%-- ${vo.categoryNum==dto.groupCategoryNum? "selected='selected'":""} --%>>${sta.staName}</option>
			</c:forEach>
			</select>
		</div>

		<div class="form-group"
			style="width: 15%; margin-top: 20px; float: left; margin-right: 15px">
			<select  name="1stSelect" class="form-control">
				<option class="boxTF" value="">:: 대분류::</option>
			<c:forEach var="mid" items="${tourCategoryList}">
					<option class="boxTF" value="${mid.cateNum}" <%-- ${vo.categoryNum==dto.groupCategoryNum? "selected='selected'":""} --%>>${mid.cateName}</option>
			</c:forEach>				
			</select>
		</div>

		<div class="form-group"
			style="width: 15%; margin-top: 20px; float: left;">
			<select name="2stSelect" id="2stSelect" class="form-control">
				<option class="boxTF" value="">:: 소분류::</option>
			</select>
		</div>

		<button type="submit" class="btn btn-succees"
			style="margin-top: 20px; height: 40px; width: 100px; margin-left: 20px; "
			onclick="optionslist();">검색하기
		</button>

	</div>

	<div id="please">
	<c:forEach var="dto" items="${list}">
	<div class="col-sm-6 col-md-4" style="max-width: 33%; min-height: 200px; ">
		<div class="thumbnail">

			<img style="height: 200px; width: 300px" src="${dto.imagefilename}">
			<div class="caption" style="width: 100%">
				<div class="nonscroll" style="overflow-y: scroll;  width:100%; height: 30px">
					<span style="font-size: 20px; ">${dto.name}</span>
					</div>				

				<div class="nonscroll" style="overflow-y: scroll; height: 35px">		
				<p>${dto.address}</p>
				</div>
				
				<div style="margin-top: 5px">
				<span >
					<button class="img-button" style="">
						<i class="far fa-heart" onclick="test(this);" style="font-size: 24px;color: tomato"></i>
					</button>
				</span>	
				<span style="float: right">	
					<button class="btn btn-info" onclick="javascript:location.href='<%=cp%>/tour/detail';">알아보기</button>
				</span>
				</div>	

			</div>
		</div>
	</div>
	</c:forEach>
	</div>

	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging} 
			</td>
		</tr>
	</table>



</div>


<!--Modal: modalPush-->
<div class="modal fade  bd-example-modal-sm" id="selectStationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document" style="width: 490px;">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading" style="font-size:25px;font-weight: 700">Rail Traveler</p>
      </div>

      <!--Body-->
      <div class="modal-body" style="padding: 5px 5px;">
        <i class="fas fa-bell fa-3x animated rotateIn mb-3"></i>

        <p id="modaltext" style="font-size: 17px; font-weight:500; margin-top: 10px;">역을 먼저 선택해주세요!</p>

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center" style="margin-top: 5px;">
        <a type="button" class="btn  btn-info waves-effect" data-dismiss="modal">Yes</a>
      </div>
    </div>
  </div>
</div>
<!--Modal: modalPush-->
