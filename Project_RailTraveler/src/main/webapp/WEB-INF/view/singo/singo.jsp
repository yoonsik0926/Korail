<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
	<link href="<%=cp%>/resource/css/commu.css" rel="stylesheet" />
<style type="text/css">

.nonscroll::-webkit-scrollbar { 

    display: none; 

}

.carousel {
	background: white;
}

.carousel-cell {
	width: 25%;
	height: 300px;
	margin-right: 10px;
	/* margin-top: 22.5px; */
	margin-bottom: 22.5px;
	background: #ED2;
	border-radius: 5px;
	counter-increment: carousel-cell;
}

.carousel-cell.is-selected {
	background: #ED2;
}

/* cell number */
.carousel-cell:before {
	display: block;
	text-align: center;
	line-height: 200px;
	font-size: 80px;
	color: white;
}

.fPlan {
	width: 100%;
	height: 300px;
	margin-right: 10px;
	margin-bottom: 22.5px;
	border-radius: 5px;
}

.sample_image  img {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.sample_image:hover img {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}

a {
	color: #484848;
}

.img-button {
	background: transparent;
	border: none;
	width: 30px;
	height: 30px;
	cursor: pointer;
	outline: 0;
}
</style>


<div class="container tim-container"
		style="max-width: 1500px; padding-top: 30px ; margin: 0px auto;">
		

<div class="body-content-container">
		<div class="container" style="margin:20px auto; margin-bottom:50px; width: 93%">
			<div class="row" style="width: 100%; margin: 10px auto;">
				<div class="col" style="font-size: 18px; font-weight: 600;">
					<ul class="nav nav-tabs" style="width: 100%">
						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="1st" onclick="fnMove('1');" >신고목록</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="2st" onclick="fnMove('2');">유저관리</a></li>

					</ul>
				</div>
			</div>
		




		<div id="sir_lbo" class="sir_lbo" style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-top: 5px;"></div>
		
		<table class="table table-hover tb-board" style="padding: 0; margin: 0; font-size: 1.025em; text-align: center;">
			<thead style="text-align: center">
				<tr>

				<td width="200" colspan="6" style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
				
					<select name="condition" class="boxTF"
								style="border-radius: 3px; width: 15%; height: 100%; border-left: 0;">
								<option value="all" ${condition=="all"?"selected='selected'":""}>투어리스트</option>
								<option value="subject"
									${condition=="subject"?"selected='selected'":""}>묻고답하기</option>
								<option value="content"
									${condition=="content"?"selected='selected'":""}>자유게시판</option>
								<option value="userName"
									${condition=="userName"?"selected='selected'":""}>동행구하기</option>							
					</select> 
				
				
				
				
					<span id="searchCount" 	style="display: none; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
					<span style="color: #ca4a0d;">3569건 </span> <img alt="" src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
					style="background: #dadada; width: 20px; padding: 3px; cursor:pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;"></span>
						<form name="searchForm" action="<%=cp%>/notice/list" method="post"
							style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
							<select name="condition" class="boxTF"
								style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
								<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
								<option value="subject"
									${condition=="subject"?"selected='selected'":""}>날짜</option>
								<option value="content"
									${condition=="content"?"selected='selected'":""}>내용</option>
								<option value="userName"
									${condition=="userName"?"selected='selected'":""}>신고자</option>
								<option value="created"
									${condition=="created"?"selected='selected'":""}>피신고자</option>
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
					<th width="70" style="padding-left: 1.5%;">번호</th>
					<th width="120"><span>글쓴이ID</span></th>
					<th><span style="padding-left: 10px;">신고게시물내용</span></th>
					<th width="120"><span>신고자ID</span></th>
					<th><span style="padding-left: 10px;">신고사유</span></th>										
					<th width="100"><span>신고일</span></th>

				</tr>
			</thead>
			<tbody style="border-bottom: 2px solid black;">

				<tr >
					<td>1</td>
					<td style="text-align: left; padding-left: 20px;">yoonsik0926</td>
					<td>야이 개~~~~새꺄</td>
					<td>youjin</td>
					<td>비속어사용ㅡㅅㅡ</td>
					<td>2020-01-07</td>
				</tr>
				
				<tr >
					<td>1</td>
					<td style="text-align: left; padding-left: 20px;">yoonsik0926</td>
					<td>야이 개~~~~새꺄</td>
					<td>youjin</td>
					<td>비속어사용ㅡㅅㅡ</td>
					<td>2020-01-07</td>
				</tr>
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
</div>



