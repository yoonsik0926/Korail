<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String cp=request.getContextPath();
%>

<ul class="cmlist" id="cmt_list">
	<c:forEach var="vo" items="${listReply}">
<%-- 	<div>${vo.secret }</div> --%>
<!-- 	작성자인지 아닌지에 따라 다르게 처리 -->
						<li ${vo.answer==0?'class=""':'class="reply"'} ${vo.userId ==sessionScope.member.userId? 'style="background: #eee"':''}>
							<c:if test="${vo.answer!=0}">
								<div style="float: left; margin-right: 10px;">
									<i class="fas fa-reply" style="transform: rotate(180deg);"></i>&nbsp;
								</div>
							</c:if>
							<c:if test="${vo.secret==1}">
								<div style="float: left;">
									<i class="fas fa-lock"></i>&nbsp;
								</div>
							</c:if>
							<c:choose>
								<c:when test="${vo.secret==1 and not(vo.userId ==sessionScope.member.userId or writer==sessionScope.member.userId)}">
									<div style="font-size: 18px; ">비밀글 입니다.</div>
								</c:when>
								<c:otherwise>
								<div class="comm_cont">
								<div class="h">
									<div class="pers_nick_area">
										<table role="presentation" cellspacing="0">
											<tbody>
												<tr>
													<td class="pc2w"><div class="box_profile">
															<img alt=""
														src="<%=cp%>/resource/images/commu/profileImg.png"
														width="30">
															</div></td>
													<td class="p-nick"><a href="#" 
														class="m-tcol-c _rosRestrict _nickUI" style="font-size: 18px;">${vo.userName} 
														(<c:out value="${fn:substring(vo.userId, 0, fn:length(vo.userId) - 3)}" />***)</a></td>
												</tr>
											</tbody>
										</table>
									</div>
									<span class="date m-tcol-c filter-50">${vo.created}</span>
									<c:if test="${vo.answer==0}">
									<span class="dsc_comm"><a
										class="m-tcol-c btnReReply${vo.friendReplyNum}" style="cursor: pointer;" onclick="displayReplyForm(${vo.friendReplyNum});">답글</a></span>
										</c:if>
										<c:if test="${vo.userId ==sessionScope.member.userId}">	
									<p class="btn_edit m-tcol-c">
										<a href="#" class="filter-70 m-tcol-c _btnEdit">수정</a><span
											class="filter-30 m-tcol-c">|</span><a href="#"
											class="filter-70 m-tcol-c _btnDelete ${vo.answer==0? 'deleteReply':'deleteReplyAnswer'}" 
											data-replyNum = "${vo.friendReplyNum}"
											data-pageNo="${pageNo}">삭제</a>
									</p>
									</c:if>
									<c:if test="${vo.userId !=sessionScope.member.userId and 'admin'!=sessionScope.member.userId}">
									<p class="btn_edit m-tcol-c">
									<a><span style="cursor: pointer;">신고</span></a>
									</p></c:if>
									<div class="cb"></div>
								</div>
								<p class="comm m-tcol-c">
									<span class="comm_body">${vo.content}</span>
								</p>
							</div>
							</c:otherwise>
						</c:choose>
						</li>
						<li class="filter-30 board-box-line-dashed"></li>
						<li class="replyForm${vo.friendReplyNum}" style="display: none;">
						<div style="float: left; margin-right: 10px;">
									<i class="fas fa-reply" style="transform: rotate(180deg);"></i>&nbsp;
								</div>
						<table class="cminput" style="width: 96%;float: left;">
						<tbody>
							<tr>
						<td><textarea
								class='boxTA'
								style='width: 92%; height: 100px; float: left; resize: none; overflow-y: scroll;'></textarea>
							<div
								style='padding: 0 10px; width: 8%; height: 50px; float: left; font-size: 15px;'>
								<input type="checkbox" id="inputCK${vo.friendReplyNum}" name="secret" value="0"><label
									style="margin: 0 0 0px 3px;">비밀글</label>
								<button type='button' class='btn btn-default'
									data-num='${vo.friendReplyNum}'
									style='width: 100%; height: 80px; padding: 2px 1px;'  onclick="insertReply(${vo.friendReplyNum});">등록</button>

							</div></td>
					</tr>
						</tbody>
					</table>
						<div class="cb"></div>
						</li>
						
						<li class="filter-30 board-box-line-dashed"></li>
					</c:forEach>
					</ul>
					<div style="clear: both; height: 0pt; font: 0pt/0pt arial;"></div>
					<div style="display: none;" class="cc_paginate cmt"
						id="cmt_paginate"></div>
						
						
<script>
//댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/friend/deleteReply";
		var query="friendReplyNum="+replyNum+"&mode=reply";
		
		var fn = function(data){
			// var state=data.state;
			alert("삭제완료!");
			listPage(page);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});		

//댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? "))
		    return;
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		
		var url="<%=cp%>/friend/deleteReply";
		var query="friendReplyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			listPage(1);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
						
</script>
