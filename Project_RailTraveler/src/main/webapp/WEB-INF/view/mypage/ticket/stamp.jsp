<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=py1da5jld2&submodules=geocoder"></script>
<script type="text/javascript">
	
</script>

	<div>
		<table style="margin: 0 auto; text-align: center; font-size: 14px;">
		<tr>
			<c:forEach var="vo" items="${listStamp}">
			<td>
			<table>
			<tr style="background: #283164; color: white;">
				<td width="120"><span>${vo.staName}역</span></td>
			</tr>
			
			<tr>
				<td><img src="<%=cp%>/resource/images/stamp.png"
					style="height: 50px;"></td>
			</tr>
			</table>
			</td>
			</c:forEach>
		</tr>

		</table>
		<c:if test="${dataCount==0}">
			<div style="color: red; font-weight: 600; font-size: 15px; margin-bottom: 20px;">적립한 스탬프가 존재하지 않습니다.</div>
			<button id="matchBtn" class="btn btn-success" type="button" onclick="location.href='<%=cp%>/stamp/stamp'">스탬프 찍기</button>
		</c:if>
	</div>
