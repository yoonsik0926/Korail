<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String cp = request.getContextPath();
%>
<link href="<%=cp%>/resource/css/modal.css" rel="stylesheet">
<script src="<%=cp%>/resource/js/commu.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
td {
    padding: 0 5px;
}
</style>
	
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px; border-collapse: collapse;">
				<tr height='30'>
					<td align='left' colspan="3"><span style='font-weight: bold;'>댓글
							(${replyCount})</span></td>
				</tr>
				<tr>
					<td style='padding: 5px 0px 15px;' colspan="3"><textarea
							class='boxTA'
							style='width: 89%; height: 50px; float: left; resize: none; overflow-y: scroll;'></textarea>
						<button type='button' class='btn btnSendReply btn-default'
							data-num='${qnaNum}'
							style='margin-left: 1%; width: 10%; height: 50px; padding: 10px 1px; float: left;'>등록</button>

					</td>
				</tr>
	<c:forEach var="relist" items="${listReply}">
				<tr height='35' style="border: 1px solid #cccccc;">
					<td width='110' style=''><span>${relist.userName}</span><c:if test="${writer==relist.userId}">
												<span
													style="position: relative; display: inline-block; width: 41px; height: 20px; margin:0 5px 0 0; border: 1px solid; border-radius: 8px; font-size: 11px; font-weight: normal; letter-spacing: -1px; text-align: center; text-indent: -1px; cursor: pointer; top: -2; line-height: 20px; color: #ff2f3b;">작성자</span>
											</c:if></td>
					<td>| ${relist.content}</td>
					<td width='250' style="text-align: right;"><span>${relist.created}</span> | <span class="deleteReply" style="cursor: pointer;"
						data-replyNum='0' data-pageNo='0'>삭제</span> <span
						class="notifyReply">신고</span></td>
				</tr>
				</c:forEach>
				<c:if test="${not empty paging}">
				<tr height='35' style="border: 1px solid #cccccc;">
					<td colspan="3">${paging}</td>
				</tr>
				</c:if>
		</table>
		