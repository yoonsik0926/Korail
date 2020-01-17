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
	listPlanBookmarkPage(1);
});

function listPlanBookmarkPage(page){
	var url = "<%=cp%>/bookmark/recList";
	var query = "page="+page${query};
	var selector = "#listPlan";
	
	ajaxHTML(url, "get", query, selector);
}

function searchList(){
	var condition = $("select[name=condition]").val();
	var keyword = $("input[name=keyword]").val();
	
	var url = "<%=cp%>/bookmark/recList";
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
			<span style="padding: 10px 0px; display: block;"> 나의 북마크 : 여행 플랜</span>
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


