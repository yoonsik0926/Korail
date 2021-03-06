<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
	<thead id='listReplyHeader'>
		<tr height='35'>
			<td colspan='2'>
				<div style='clear: both;'>
					<div style='float: left;'>
						<span style='color: #3EA9CD; font-weight: bold;'>댓글
							${replyCount}개</span>
					</div>
					<div style='float: right; text-align: right;'></div>
				</div>
			</td>
		</tr>
	</thead>


	<tbody id='listReplyBody'>
		<c:forEach var="vo" items="${listReply}">
			<tr height='35'>

				<c:choose>
					<c:when test="${vo.deleted ==1}">
						<td width='93%' style='padding: 5px 5px; border-right: none; '>
						<span style="font-size: 19px; padding: 5px 5px; ">${vo.userId}</span>
						<span style="font-size: 15px; padding-top: 3px; padding-top: 10px; display: block;">
						${vo.deleteId == 'admin' ? '운영자에 의해 삭제된 댓글 입니다.': '삭제된 댓글 입니다.'}
						</span>

					</c:when>

					<c:otherwise>
						<td width='93%' style='padding: 5px 5px; border-right: none;'>
							<span style="font-size: 19px; padding: 5px 5px; font-weight: 700">${vo.userId}</span>
							<c:if test="${vo.likeCount!=0}">
								<span style="font-size: 13px; color: tomato">${vo.likeCount}명이
									댓글 좋아합니다.</span>
							</c:if> <span
							style="font-size: 15px; padding-top: 3px; padding-top: 10px; display: block; font-weight: 500">${vo.content}</span>
							<span
							style="font-size: 12px; padding: 5px 5px; margin-top: 25px; display: block;">${vo.created}</span>
						</td>

						<td style='padding: 7px 5px;' align='right'><c:choose>

								<c:when
									test="${vo.userId==sessionScope.member.userId ||sessionScope.member.userId=='admin'}">
									<span style="display: block;">
										<button type='button' class='btn-danger deleteReply'
											data-replyNum='${vo.replyNum}' data-page='${pageNo}'>삭제</button>
									</span>
								</c:when>

								<c:otherwise>
									<c:if test="${sessionScope.member.userId != null}">
									<a><span style="display: block;">
											<button type='button' class="btn" onclick="replySingo('${vo.replyNum}');" data-replyNum='${vo.replyNum}'
												data-page='${pageNo}'>신고</button>
									</span></a>
									</c:if>
								</c:otherwise>

							</c:choose></td>
					</c:otherwise>

				</c:choose>

			</tr>


			<tr style="border-bottom: 1px solid #c4c4c4;">
				<td style='padding: 10px 5px; width: 93%'>
					<button type='button' class='btn btnReplyAnswerLayout'
						data-replyNum='${vo.replyNum}'>
						답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span>
					</button>
				</td>
				<td style='padding: 7px 5px;' align='center'>
					
					<c:if test="${vo.deleted != 1}">
					<c:choose>
						<c:when test="${vo.likeuserId==sessionScope.member.userId}">
							<i class="fas fa-heart" onclick="replyLike(this);"
								style="font-size: 24px; padding-left: 17px; color: tomato"
								data-replyNum='${vo.replyNum}'></i>
						</c:when>
						<c:otherwise>
							<i class="far fa-heart" onclick="replyLike(this);"
								style="font-size: 24px; padding-left: 17px; color: tomato"
								data-replyNum='${vo.replyNum}'></i>
						</c:otherwise>
					</c:choose>
					</c:if>
				</td>
			</tr>

			<tr class='replyAnswer'
				style='display: none; border-bottom: 1px solid #c4c4c4;'>
				<td colspan='2'>
					<div id='listReplyAnswer${vo.replyNum}' class='answerList'
						style='border-top: 1px solid #cccccc;'></div>
					<div style='clear: both; padding: 10px 10px;'>
						<div style='float: left; width: 5%;'>└</div>
						<div style='float: left; width: 95%'>
							<textarea cols='72' rows='12' class='boxTA'
								style='width: 98%; height: 70px;'></textarea>
						</div>
					</div>
					<div style='padding: 0px 13px 10px 10px; text-align: right;'>
						<button type='button' class='btn btnSendReplyAnswer'
							data-replyNum='${vo.replyNum}'>답글 등록</button>
					</div>

				</td>
			</tr>
		</c:forEach>
	</tbody>

	<tfoot id='listReplyFooter'>
		<tr height='40' align="center">
			<td colspan='2'>${paging}</td>
		</tr>
	</tfoot>
</table>
