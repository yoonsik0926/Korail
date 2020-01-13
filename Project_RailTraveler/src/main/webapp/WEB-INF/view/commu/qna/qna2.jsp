<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script>
	function searchList() {
		$("#searchCount").css("display", "block");
	}
	function reset() {
		$("#searchCount").css("display", "none");
	}
</script>
<style type="text/css">
optgroup {
	/*  border-bottom: 1px solid black; */
	
}
</style>
<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 묻고 답하기</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-top: 5px;"></div>

		<table class="table table-hover tb-board"
			style="padding: 0; margin: 0; font-size: 1.025em;">
			<thead>
				<tr>
					<td width="200" colspan="5"
						style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
						<select name="category" class="boxTF" style="border-radius: 3px; width: 150px; height: 100%; border: 1px solid #ccc; margin-right: 10px;">
						<option value="all">전체</option>
							<optgroup label="플래너">
								<option value="plan">여행 계획</option>
							</optgroup>
							<optgroup label="관광정보">
								<option value="food">맛집</option>
								<option value="room">숙박</option>
								<option value="sight">명소</option>
							</optgroup>
							<optgroup label="기타">
								<option value="other">기타</option>
							</optgroup>
						</select> <span id="searchCount"
						style="display: none; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
							<span style="color: #ca4a0d;">3569건 </span> <img alt=""
							src="/Project_RailTraveler/resource/images/close_icon.png"
							onclick="reset()"
							style="background: #dadada; width: 20px; padding: 3px; cursor: pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;">
					</span>
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/qna/created';"
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
			<tbody style="border-bottom: 2px solid black;">
				<tr class="lbo_li lbo_notice li_bg0 lbo_like"
					style="font-weight: 600;">
					<td>
						<div class="noticeBox">
							<img alt="" src="<%=cp%>/resource/images/noticeIcon.png"
								width="18" style="display: inline-block; float: left;"> <span
								style="font-size: 14px; font-weight: 600; display: block;">공지</span>
						</div>
					</td>
					<td colspan="2" style="text-align: left; padding-left: 20px;">※
						묻고 답하기의 공지입니다 ※</td>
					<td colspan="2" style="text-align: right; padding-right: 20px;"><i>2018-10-23</i></td>
				</tr>
				<%
					for (int i = 10; i >= 1; i--) {
				%>
				<tr onclick="javascript:location.href='<%=cp%>/qna/article'">
					<td><%=i%></td>
					<td style="text-align: left; padding-left: 20px;">제목입니다22222222 <span style="margin-left: 7px;
    font-size: 14px;"> <i class="far fa-heart" style="margin-right: 2px;
    color: #969696;"></i>3<i class="far fa-comments" style="margin-right: 2px;
    color: #969696;"></i>5</span> <span style="border-radius: 5px;
    font-size: 13px;
    font-weight: 900;
    display: inline-block;
    padding: 1px 3px;
    background: #bb2b23;
    color: #FFFFFF;
    margin-left: 10px;">완료</span>
   </td>
					<td>겨레리</td>
					<td>2018-10-23</td>
					<td>1</td>
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
