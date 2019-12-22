<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">


<script type="text/javascript">
$(function(){
	$("#tab-${group}").addClass("active");
	
	$("ul.tabs li").click(function(){
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		var url = "<%=cp%>/bookmark/bookmark?group=" + tab;
			location.href = url;
		});
	});
</script>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 내가 쓴 게시물</span>
		</h3>
	</div>

	<div>
		<div style="clear: both;">
			<ul class="tabs">
				<li id="tab-0" data-tab="0"> 전체</li>
				<%-- <c:forEach var="vo" items="${groupCategory}">
					<li id="tab-${vo.categoryNum}" data-tab="${vo.categoryNum}">
					${vo.category}</li>
				</c:forEach> --%>
				<li id="tab-1" data-tab="1"> 묻고 답하기</li>
				<li id="tab-2" data-tab="2"> 자유 게시판</li>
				<li id="tab-3" data-tab="3"> 동행 구하기</li>
			</ul>
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
<span id="searchCount" 					style="display: none; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
												<span style="color: #ca4a0d;">3569건 </span> <img alt=""
												src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
												style="background: #dadada; width: 20px; padding: 3px; cursor:pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;">
										</span>

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
						</form></td>
				</tr>
				<tr class="lbo_li lbo_legend lbo_legend_like">
					<th width="75" style="padding-left: 1.5%;">번호</th>
					<th><span style="padding-left: 10px;">제목</span></th>
					<!-- <th width="120"><span>작성자</span></th> -->
					<th width="100"><span>작성일</span></th>
					<th width="80"><span>조회수</span></th>
					<th width="80"><span>신고수</span></th>
				</tr>
			</thead>
			<tbody style="border-bottom: 2px solid black;">

				<%
					for (int i = 10; i >= 1; i--) {
				%>
				<tr onclick="javascript:location.href='<%=cp%>/board/article'">
					<td><%=i%></td>
					<td style="text-align: left; padding-left: 20px;">제목입니다22222222</td>
					<!-- <td>겨레리</td> -->
					<td>2018-10-23</td>
					<td>1</td>
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
</div>