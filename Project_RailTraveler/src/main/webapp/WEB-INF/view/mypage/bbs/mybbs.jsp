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



//버튼
$(function(){
	$("#nav-item-${commuNum}").addClass("active");
	
	$("ul.nav-tabs li").click(function(){
		tab = $(this).attr("data-tab");

		
		$("ul.nav-tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#nav-item-"+tab).addClass("active");
		
		var url = "<%=cp%>/bbs/list";
		var query = "commuNum="+tab${query};
		var selector = "#mybbsList";
		
		ajaxHTML(url, "get", query, selector);
		

	});
});

//페이징
$(function(){
	listMybbsPage(1);
});

function listMybbsPage(page){
	var url = "<%=cp%>/bbs/list";
	var query = "page="+page${query}+"&commuNum=${commuNum}";
	var selector = "#mybbsList";
	
	ajaxHTML(url, "get", query, selector);
}



</script>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 내가 쓴 게시물</span>
		</h3>
	</div>

	<div>
		<div class="container">
			<div class="row">
				<div class="col" style="font-size: 18px; font-weight: 600;margin: 0 10px;">
					<ul class="nav nav-tabs">
						<li id="nav-item-1" data-tab="1"><a class="nav-link" href="#">묻고답하기</a></li>
						<li id="nav-item-2" data-tab="2"><a class="nav-link" href="#">자유게시판</a></li>
						<li id="nav-item-3" data-tab="3"><a class="nav-link" href="#">동행구하기</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div id="mybbsList"></div>
		
		
	</div>
</div>
