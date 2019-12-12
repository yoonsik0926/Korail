<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26"><span style="  padding: 10px 0px;
    display: block;"> 자유게시판</span></h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
<div style="padding-top: 5px;"></div>
		<table class="table table-hover"
			style="padding: 0; margin: 0; font-size: 1.025em;">
			<thead>
			<tr><td width="200" colspan="5" style="background: whitesmoke;
    text-align: left;
    vertical-align: bottom;
    font-size: 14px;
    border-radius: 5px;"><span style="display: block; float: left;     font-size: 16px;
    padding-top: 9px; vertical-align: bottom;">1 / 35 페이지 [ 총 10개 ]</span>
    <button type="button" class="btn btn-default"
						onclick="javascript:location.href='<%=cp%>/notice/created';"
						style="float: right; margin-left:6px;"><img alt="" src="<%=cp%>/resource/images/editIcon.png" style=" height: 21px;"> 글쓰기</button>
    <form name="searchForm" action="<%=cp%>/notice/list" method="post"
						style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
						<select name="condition" class="boxTF" style="border-radius: 3px;width: 30%;height: 100%;border-left: 0;">
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
							class="boxTF" style="display: inline-block;height: 100%; width: 58%;">
						<input type="image" src="<%=cp%>/resource/images/magnifying-glass.png"
							class="" onclick="searchList()"
							style="padding: 6px;     opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
					</form>
    </td></tr>
				<tr class="lbo_li lbo_legend lbo_legend_like">
					<th width="75" style="padding-left: 1.5%;">번호</th>
					<th><span style="padding-left: 10px;">제목</span></th>
					<th width="120"><span>작성자</span></th>
					<th width="100"><span>작성일</span></th>
					<th width="80"><span>조회수</span></th>
				</tr>
			</thead>
			<tbody style="border-bottom: 2px solid black;">
				<tr class="lbo_li lbo_notice li_bg0 lbo_like">
					<td>
					<div class="noticeBox">
					<img alt="" src="<%=cp%>/resource/images/noticeIcon.png"
						width="18" style="display: inline-block;float: left;">
					<span style="font-size: 14px;
    font-weight: 600;
    display: block;">공지</span>
					</div>
						</td>
					<td style="text-align: left; padding-left: 20px;">제목입니다1111111</td>
					<td>관리자</td>
					<td>2018-10-23</td>
					<td>123</td>
				</tr>

				<tr class="lbo_li lbo_notice li_bg0 lbo_like">
					<td>
					<div class="noticeBox">
					<img alt="" src="<%=cp%>/resource/images/noticeIcon.png"
						width="18" style="display: inline-block;float: left;">
					<span style="font-size: 14px;
    font-weight: 600;
    display: block;">공지</span>
					</div>
						</td>
					<td style="text-align: left; padding-left: 20px;">제목입니다1111111</td>
					<td>관리자</td>
					<td>2018-10-23</td>
					<td>123</td>
				</tr>

				<%
					for (int i = 10; i >= 1; i--) {
				%>
				<tr>
					<td><%=i%></td>
					<td style="text-align: left; padding-left: 20px;">제목입니다22222222</td>
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
