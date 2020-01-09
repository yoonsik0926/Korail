<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<table
	style="margin: 0px auto; text-align: center; font-size: 15px; width: 100%">

	<tr style="background: #283164; color: white; height: 50px; font-weight: 700">
		<td width="80">구매 번호</td>
		<td width="100">시작 날짜</td>
		<td width="100">종료 날짜</td>
		<td width="80">역 이름</td>
		<td width="80">지역</td>
		
	</tr>
	<c:forEach var="dto" items="${stampList}">
		<tr style="border-bottom: 1px solid #d4cbcb; height: 40px;">
			<td>${dto.saleNum}</td>
			<td>${dto.sDate}</td>
			<td>${dto.eDate}</td>
			<td>${dto.staName}</td>
			<td>${dto.locName}</td>
		</tr>
	</c:forEach>

</table>

<table id="pagingTable" style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	<tr height="35">
		<td align="center">${dataCount==0?"등록된 스탬프가 없습니다.": paging}</td>
	</tr>
</table>
