<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<table class="table table-hover tb-board" style="padding: 0; margin: 0; font-size: 1.025em; text-align: center;">
			<thead style="text-align: center">
				<tr>

				<td width="200" colspan="6" style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
				

					<span id="singoCount" 	style="display: none; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
					<span style="color: #ca4a0d;">3569건 </span> <img alt="" src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
					style="background: #dadada; width: 20px; padding: 3px; cursor:pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;"></span>
						<form name="" action="<%=cp%>/singo/singo" method="post"
							style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
							<select name="" class="boxTF"
								style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
								<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
								<option value="created"
									${condition=="created"?"selected='selected'":""}>유저아이디</option>
								<option value="reason"
									${condition=="reason"?"selected='selected'":""}>유저이름</option>
								
							</select>
							
							 <input id="" type="text" name="keyword" value="${keyword}"
								class="boxTF"
								style="display: inline-block; height: 100%; width: 58%;">
							<img
								src="<%=cp%>/resource/images/magnifying-glass.png" class="" onclick="searchList()"
								style="padding: 6px; cursor:pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
						</form></td>
				</tr>
				<tr class="lbo_li lbo_legend lbo_legend_like">
					<th width="60" >번호</th>
					<th width="100"><span >이름</span></th>
					<th width="100"><span >아이디</span></th>
					<th width="60" ><span >총 신고횟수</span></th>
					<th width="110"><span>비고</span></th>


				</tr>
			</thead>
			<tbody style="border-bottom: 2px solid black;">
				<c:forEach var="vo" items="${singoCountList}">
				<tr >
					<td>${vo.singoNum}</td>
					<td>${vo.userName}</td>
					<td>${vo.targetUserId }</td>
					<td>${vo.singoCount}회</td>
					<td><button class="btn">제명</button></td>

				</tr>
			</c:forEach>
			
			</tbody>
		</table>