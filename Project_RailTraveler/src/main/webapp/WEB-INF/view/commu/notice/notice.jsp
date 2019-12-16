<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
.sir_lbo .lbo_notice {
    background: #f7f9ff;
}
</style>
<script>
function searchList() {
	$("#searchCount").css("display","block");
}
function reset() {
	$("#searchCount").css("display","none");
}
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
											<span id="searchCount" 					style="display: none; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
												<span style="color: #ca4a0d;">3569건 </span> <img alt=""
												src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
												style="background: #dadada; width: 20px; padding: 3px; cursor:pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;">
										</span>
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/notice/created';"
							style="float: right; margin-left: 6px;">
							<img alt="" src="<%=cp%>/resource/images/editIcon.png"
								style="height: 21px;"> 글쓰기
						</button>
						<form name="searchForm" action="<%=cp%>/notice/list" method="post"
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
				<%
					for (int i = 14; i >= 5; i--) {
				%>

				<tr class="lbo_li lbo_notice li_bg0 lbo_like" onclick="javascript:location.href='<%=cp%>/notice/article'">
<%-- 					<td width="75"><%=i%></td> --%>
<%-- 					<td width="75"><%=i%></td> --%>
					<td width="75">
					<div class="noticeBox">
					<img alt="" src="/Project_RailTraveler/resource/images/noticeIcon.png" width="18" style="display: inline-block;float: left;">
					<span style="font-size: 14px;
    font-weight: 600;
    display: block;">공지</span>
					</div>
						</td>
					<td style="text-align: left; padding-left: 20px; font-weight: 400;">※
						공지사항 게시판의 공지입니다 ※</td>
					<td width="120">2018-10-23</td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>

		<nav style="text-align: center;">
			<ul class="pagination">
				<li class="disabled"><span> <span aria-hidden="true">&laquo;</span>
				</span></li>
				<li class="active"><span>1 <span class="sr-only">(current)</span></span>
				</li>
				<li><span>2</span></li>
				<li><span>3</span></li>
				<li class="disabled"><span> <span aria-hidden="true">&raquo;</span>
				</span></li>
			</ul>
		</nav>


	</div>
</div>
