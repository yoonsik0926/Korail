<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">


<script type="text/javascript">
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

//페이징
$(function(){
	listFriendPlanPage(1);
});

function listFriendPlanPage(page){
	var url = "<%=cp%>/friendPlan/list";
	var query = "page="+page${query};
	var selector = "#listPlan";
	
	ajaxHTML(url, "get", query, selector);
}

function searchList(){
	var condition = $("select[name=condition]").val();
	var keyword = $("input[name=keyword]").val();
	
	var url = "<%=cp%>/friendPlan/list";
	var query = "condition="+condition+"&keyword="+keyword;
	var selector = "#listPlan";
	
	ajaxHTML(url, "get", query, selector);
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
			<span style="padding: 10px 0px; display: block;"> 친구의 여행 플랜</span>
		</h3>
	</div>

	<div style="width: 100%;">
		<div style="margin-bottom: 10px; height: 80px;">
			<form name="searchForm" action="<%=cp%>/notice/list" method="post"
				style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
				<select name="condition" class="boxTF"
					style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
					<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
					<option value="writer"
						${condition=="writer"?"selected='selected'":""}>작성자</option>
					<option value="station"
						${condition=="station"?"selected='selected'":""}>경유 역</option>
					<option value="sDate"
						${condition=="sDate"?"selected='selected'":""}>시작 날짜</option>
						
				</select> <input type="text" name="keyword" value="${keyword}" class="boxTF"
					style="display: inline-block; height: 100%; width: 58%;"> <img
					src="<%=cp%>/resource/images/magnifying-glass.png" class=""
					onclick="searchList()"
					style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
			</form>
		</div>

		<div id="listPlan">
		
		</div>

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

