<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>



<table
	style="margin: 15px auto; text-align: center; font-size: 15px; width: 100%">

	<tr
		style="background: #283164; color: white; height: 50px; font-weight: 700">

		<td width="80">선택</td>
		<td width="100">지역</td>
		<td width="100">분류</td>
		<td width="350">장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
		<td width="150">링크</td>
	</tr>
	<c:forEach var="dto" items="${list}">

		<tr style="border-bottom: 1px solid #d4cbcb; height: 40px;">
			<td><input type="checkbox" name="choice" value="${dto.tourNum}" class="checkSelect"></td>
			<td>${dto.locName}</td>
			<td>${dto.cateName}</td>
			<td>${dto.name}</td>
			<td><c:choose>
					<c:when test="${dto.locNum==1}">
						<button type="button" class="btn"
							onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=sudo'">바로가기</button>
					</c:when>

					<c:when test="${dto.locNum==2}">
						<button type="button" class="btn"
							onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=chungcheong'">바로가기</button>
					</c:when>

					<c:when test="${dto.locNum==3}">
						<button type="button" class="btn"
							onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=gangwon'">바로가기</button>
					</c:when>

					<c:when test="${dto.locNum==4}">
						<button type="button" class="btn"
							onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=jeonla'">바로가기</button>
					</c:when>

					<c:when test="${dto.locNum==5}">
						<button type="button" class="btn"
							onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=gyeongsang'">바로가기</button>
					</c:when>

				</c:choose></td>
		</tr>

	</c:forEach>

</table>

<table id="pagingTable"
	style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	<tr height="35">
		<td align="center">${dataCount==0?"등록된 게시물이 없습니다.": paging}</td>
	</tr>
</table>