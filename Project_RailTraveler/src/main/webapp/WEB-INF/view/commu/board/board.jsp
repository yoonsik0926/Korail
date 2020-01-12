<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<link rel="stylesheet"
	href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css">
	
	
<script>

function searchList() {
	var f = document.searchForm;
	f.submit();
}
function reset() {
	location.href="<%=cp%>/board/board";
	}

	function changeSelectBox() {
		if ($("select[name=condition]").val() == 'created') {
			$("input[name=keyword]").attr("id", "datepicker1");

			$("#datepicker1").datepicker({
				dateFormat : "yy" + "-" + "mm" + "-" + "dd",
				altField : "#sDate",
				showAnim : "slide",
				changeYear : true //콤보박스에서 년 선택 가능
				,
				changeMonth : true
			//콤보박스에서 월 선택 가능    
			});
		} else {
			$("input[name=keyword]").attr("class", "boxTF");
			$("#ui-datepicker-div").remove();

		}
	}
</script>
<style type="text/css">
a{
color:#666;
font-weight:300;
}
a:hover{
 font-weight:300;
color:#666;
text-decoration: underline;
}
</style>
<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 자유게시판</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-top: 5px;"></div>
		
		<table class="table table-hover tb-board"
			style="padding: 0; margin: 0; font-size: 1.025em;">
			<thead>
				<tr>
				<td width="200" colspan="5" style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
						<c:if test="${search=='search'}">
							<span id="searchCount" style="float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
								<span style="color: #ca4a0d;">${dataCount}건 </span> 
								<img alt="" src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
								style="background: #dadada; width: 20px; padding: 3px; cursor: pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;">
							</span>
						</c:if>
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/board/created';"
							style="float: right; margin-left: 6px;">
							<img alt="" src="<%=cp%>/resource/images/editIcon.png"
								style="height: 21px;"> ${sessionScope.member.userId=='admin'?"공지작성":"글쓰기" }
						</button>
						<!-- 검색 폼 -->
						<form name="searchForm" action="<%=cp%>/board/board"
							method="post"
							style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
							<select name="condition" class="boxTF"
								style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;"
								onchange="changeSelectBox();">
								<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
								<option value="subject"
									${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content"
									${condition=="content"?"selected='selected'":""}>내용</option>
								<option value="userName"
									${condition=="userName"?"selected='selected'":""}>작성자</option>
								<option value="created"
									${condition=="created"?"selected='selected'":""}>등록일</option>
							</select> <input type="text" name="keyword" value="${keyword}"
								class="boxTF"
								${condition=="created"?"id='datepicker1'":""}
								style="display: inline-block; height: 100%; width: 58%;">
							<img src="<%=cp%>/resource/images/magnifying-glass.png" class=""
								onclick="searchList()"
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
			<!-- 공지사항 리스트 + 일반 자유게시판 게시물 리스트 -->
			<tbody style="border-bottom: 2px solid black;">
			<!-- 공지사항 리스트 출력 -->
			<c:forEach var="dto" items="${noticeList}">
					<tr class="lbo_li lbo_notice li_bg0 lbo_like"
						style="font-weight: 600;"
						onclick="javascript:location.href='${articleUrl}&boardNum=${dto.boardNum}'">
						<td>
							<div class="noticeBox">
								<img alt="" src="<%=cp%>/resource/images/noticeIcon.png"
									width="18" style="display: inline-block; float: left;"> <span
									style="font-size: 14px; font-weight: 600; display: block;">공지</span>
							</div>
						</td>
						<td colspan="2" style="text-align: left; padding-left: 20px;">※
							${dto.subject} ※ <c:if test="${dto.gap<=1}"><img alt="" style="width: 17px;" src="<%=cp%>/resource/images/commu/new1.png"> </c:if></td>
						<td colspan="2" style="text-align: right; padding-right: 13px;"><i>${dto.created}</i></td>
					</tr>
				</c:forEach>
				<!-- 자유게시판 리스트 출력 -->
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.listNum}</td>
					<c:if test="${empty dto.deleteId}">
						<td style="text-align: left; padding-left: 20px;">
						
						<a href="${articleUrl}&boardNum=${dto.boardNum}">${dto.subject} </a> <span style="margin-left: 7px;
    font-size: 14px;"> <i class="far fa-heart" style="margin-right: 2px;
    color: #969696;"></i>${dto.bookmarkCount} <i class="far fa-comment-alt" style="margin-right: 2px;
    color: #969696;"></i>${dto.replyCount}<c:if test="${dto.fileCount>0}"><i class="far fa-save" style="margin-left: 5px; margin-right: 2px; color: #969696;"></i>${dto.fileCount}</c:if>
								<c:if test="${dto.gap<=1}"><img alt="" 
								src="<%=cp%>/resource/images/commu/new1.png" style="width: 17px;"> </c:if>
								</span></td>
					<td>${dto.userName}</td>
						<td>${dto.created}</td>
						<td>${dto.hitCount}</td>
					</c:if>
					<c:if test="${dto.deleteId eq 'admin'}">
							<td style="color: #888;
    height: 30px;
    padding: 7px 0; text-align: center;"><div>관리자에 의해 삭제된 게시물입니다.</div></td><td colspan="3"></td>
						</c:if>
						<c:if test="${(not empty dto.deleteId) and dto.deleteId ne 'admin'}">
							<td style="color: #888;
    height: 30px;
    padding: 7px 0; text-align: center;"><div>삭제된 게시물입니다.</div></td><td colspan="3"></td>
						</c:if>
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav style="text-align: center;">
		${dataCount==0? "등록된 자료가 없습니다":paging}
<!-- 			<ul class="pagination"> -->
<!-- 				<li class="disabled"><span> <span aria-hidden="true">&laquo;</span> -->
<!-- 				</span></li> -->
<!-- 				<li class="active"><span>1 <span class="sr-only">(current)</span></span> -->
<!-- 				</li> -->
<!-- 				<li><span>2</span></li> -->
<!-- 				<li><span>3</span></li> -->
<!-- 				<li class="disabled"><span> <span aria-hidden="true">&raquo;</span> -->
<!-- 				</span></li> -->
<!-- 			</ul> -->
		</nav>

	</div>
</div>
