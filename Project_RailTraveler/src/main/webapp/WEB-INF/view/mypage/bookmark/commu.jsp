<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css"
	type="text/css">


<script type="text/javascript">
//버튼
$(function(){
	$("#nav-item-${commuNum}").addClass("active");
	
	$("ul.nav-tabs li").click(function(){
		commuNum = $(this).attr("data-tab");
		
		$("ul.nav-tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#nav-item-"+commuNum).addClass("active");
		
		var url = "<%=cp%>/station/info?locNum="+locNum;
		location.href=url;
	});
});


function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
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

function searchList() {
	var f = document.searchForm;
	
	f.submit();
	
}

function resetList() {
	var q = "condition='all'&query=''";
	var url = "<%=cp%>/bookmark/commu?"+q;
	
	location.href= url;
}

function commuListPage(page){

	var query = "page="+page+"&condition="+${condition}+"&keyword="+${keyword}+"&commuNum="+commuNum;
	var url = "<%=cp%>/bookmark/commu";
	var selector = "#listCommu";
	
	
	ajaxHTML(url, "get", query, selector);
}



</script>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 나의 북마크 :
				커뮤니티</span>
		</h3>
	</div>

	<div>
	
		<div class="container">
		<div class="row">
			<div class="col" style="font-size: 18px; font-weight: 600;margin: 0 10px;">
				<ul class="nav nav-tabs tabs">
					<li id="nav-item-${commuNum}" data-tab="${commuNum}"><a class="nav-link" href="#">묻고답하기</a></li>
					<li id="nav-item-${commuNum}" data-tab="${commuNum}"><a class="nav-link" href="#">자유게시판</a></li>
					<li id="nav-item-${commuNum}" data-tab="${commuNum}"><a class="nav-link" href="#">동행구하기</a></li>
				</ul>
			</div>
		</div>
		</div>

		<div id="sir_lbo" class="sir_lbo"
			style="padding: 0; margin: 0; font-size: 1.025em;">
			<div style="padding-top: 5px;"></div>

		<div id="listCommu">
			<table class="table table-hover tb-board"
				style="padding: 0; margin: 0; font-size: 1.025em;">
				<thead>
					<tr>
						<td width="200" colspan="5"
							style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
 							<c:if test="${search=='search'}">
							<span id="searchCount" style="float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
								<span style="color: #ca4a0d;">${dataCount}건 </span> 
								<img alt="" src="/Project_RailTraveler/resource/images/close_icon.png" onclick="resetList()"
								style="background: #dadada; width: 20px; padding: 3px; cursor: pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;">
							</span>
							</c:if>
						
							<form name="searchForm" action="<%=cp%>/bookmark/commu"
								method="post"
								style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
								<select name="condition" class="boxTF"
									style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
									<option value="all"
										${condition=="all"?"selected='selected'":""}>모두</option>
									<option value="subject"
										${condition=="subject"?"selected='selected'":""}>제목</option>
									<option value="content"
										${condition=="content"?"selected='selected'":""}>내용</option>
									<option value="writer"
										${condition=="userName"?"selected='selected'":""}>작성자</option>
									<option value="created"
										${condition=="created"?"selected='selected'":""}>작성일</option>
								</select> <input type="text" name="keyword" value="${keyword}"
									class="boxTF"
									style="display: inline-block; height: 100%; width: 58%;">
								<img src="<%=cp%>/resource/images/magnifying-glass.png" class="searchBtn"
									onclick="searchList();"
									style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
								
								
							</form>
						</td>
					</tr>
					<tr class="lbo_li lbo_legend lbo_legend_like">
						<th width="75" style="padding-left: 1.5%;">번호</th>
						<th><span style="padding-left: 10px;">제목</span></th>
						<th width="120"><span>작성자</span></th>
						<th width="100"><span>작성일</span></th>
						<th width="80"><span>조회수</span></th>
					</tr>
				</thead>
				<tbody style="border-bottom: 2px solid black;" id="commuList">
					<c:forEach var="vo" items="${list}">
						<tr onclick="javascript:location.href='<%=cp%>/friend/article?friendNum=${vo.friendNum}&page=1'">
							<td>${vo.listNum}</td>
							<td style="text-align: left; padding-left: 20px;">${vo.subject}</td>
							<td>${vo.writer}</td>
							<td>${vo.created}</td>
							<td>${vo.hitCount}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			
			<div>
				<nav style="text-align: center;">
					<ul class="pagination">
						<li>${dataCount==0?"북마크한 게시물이 없습니다.":paging}</li>
					</ul>
				</nav>
			</div>
		
		</div>
		




		</div>
	</div>
</div>
