<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<%-- <link href="<%=cp%>/resource/css/paging.css" rel="stylesheet"> --%>
<style type="text/css">
.sir_lbo .lbo_notice {
    background: #f7f9ff;
}
a {
    color: #666;
}
</style>
<script>
function searchList() {
	var f = document.searchForm;
	f.submit();
}
function reset() {
	location.href="<%=cp%>/notice/notice";
}
<c:if test="${search=='search'}">
console.log("${search}");
</c:if>
</script>
<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 공지게시판</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-top: 5px;"></div>
		<table class="table table-hover tb-notice"
			style="padding: 0; margin: 0; font-size: 1.025em;">
			<thead>
				<tr class="sir_lbo lbo_li">
					<td width="200" colspan="5"
						style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
											<c:if test="${search=='search'}">
											<span id="searchCount" style="float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
												<span style="color: #ca4a0d;">${dataCount}건 </span> <img alt=""
												src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
												style="background: #dadada; width: 20px; padding: 3px; cursor:pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;">
											</span>
												</c:if>
						<c:if test="${'admin'==sessionScope.member.userId}">
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/notice/created';"
							style="float: right; margin-left: 6px;">
							<img alt="" src="<%=cp%>/resource/images/editIcon.png"
								style="height: 21px;"> 글쓰기
						</button></c:if>
						<form name="searchForm" action="<%=cp%>/notice/notice" method="post"
							style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
							<select name="condition" class="boxTF"
								style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
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
								style="display: inline-block; height: 100%; width: 58%;">
							<img
								src="<%=cp%>/resource/images/magnifying-glass.png" class=""
								onclick="searchList()"
								style="padding: 6px; cursor:pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
						</form>
					</td>
				</tr>
				<tr class="lbo_li lbo_legend lbo_legend_like">
					<th width="200" colspan="5" style="text-align: center;">공지목록</th>
				</tr>
			</thead>
			<tbody style="border-bottom: 2px solid black;">
			<c:forEach var="dto" items="${list}">
				<tr class="lbo_li lbo_notice li_bg0 lbo_like" onclick="javascript:location.href='${articleUrl}&noticeNum=${dto.noticeNum}'">
					<td width="75">
					<div class="noticeBox">
					<img alt="" src="/Project_RailTraveler/resource/images/noticeIcon.png" width="18" style="display: inline-block;float: left;">
					<span style="font-size: 14px;
    font-weight: 600;
    display: block;">공지</span>
					</div>
						</td>
					<td style="text-align: left; padding-left: 20px; font-weight: 400;">
					<a href="${articleUrl}&noticeNum=${dto.noticeNum}">${dto.subject}</a><span style="
    font-size: 14px; color: #969696
    ;"> 
    <c:if test="${dto.fileCount!=0}">
					<a href="<%=cp%>/notice/zipDownload?noticeNum=${dto.noticeNum}">
						<i class="far fa-save" style="display: inline-block; margin-left: 5px;"></i></a>
					</c:if>
    <c:if test="${dto.gap<1}">
						<img alt="" src="<%=cp%>/resource/images/commu/new1.png" style="width: 17px;"> </c:if>
    </span></td>
					<td width="120">${dto.created}</td>
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
<!-- 				<li><span>2</span></li> -->
<!-- 				<li><span>3</span></li> -->
<!-- 				<li class="disabled"><span> <span aria-hidden="true">&raquo;</span> -->
<!-- 				</span></li> -->
<!-- 			</ul> -->
<%-- <div>${dataCount==0? "등록된 자료가 없습니다":paging}</div> --%>
		</nav>


	</div>
</div>
