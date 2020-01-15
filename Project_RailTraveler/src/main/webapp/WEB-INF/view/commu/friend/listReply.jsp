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
							<c:if test="${vo.deleted==0}">
							<c:if test="${vo.secret==1}">
								<div style="float: left;">
									<i class="fas fa-lock"></i>&nbsp;
								</div>
							</c:if>
							<c:choose>
								<c:when test="${vo.secret==1 and not(vo.userId ==sessionScope.member.userId or writer==sessionScope.member.userId or 'admin'==sessionScope.member.userId)}">
									<div style="font-size: 14px;
    color: #aaa;"><span>비밀글 입니다.</span></div>
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
														width="25">
															</div></td>
													<td class="p-nick"><a href="#" 
														class="m-tcol-c _rosRestrict _nickUI" style="font-size: 12px;
    font-weight: 600;">${vo.userName} 
														(<c:out value="${fn:substring(vo.userId, 0, fn:length(vo.userId) - 3)}" />***)
										
														</a>
														<c:if test="${writer==vo.userId}">
														<span style="position: relative;
    display: inline-block;
    width: 41px;
    height: 20px;
    margin: 0 8px 0 -2px;
    border: 1px solid;
    border-radius: 8px;
    font-size: 11px;
    font-weight: normal;
    letter-spacing: -1px;
    text-align: center;
    text-indent: -1px;
    cursor: pointer;top: -2;
    line-height: 20px;color: #ff2f3b;">작성자</span></c:if>
														
														</td>
												</tr>
											</tbody>
										</table>
									</div>
									<span class="date m-tcol-c filter-50" style="color: #999;
    top: 3px;
    font-size: 12px;
    position: relative;">${vo.created}</span>
									<c:if test="${vo.answer==0}">
									<span class="dsc_comm"><a
										class="m-tcol-c btnReReply${vo.friendReplyNum}" style="cursor: pointer;    font-size: 10px;" onclick="displayReplyForm(${vo.friendReplyNum});">답글</a></span>
										</c:if>
										<p class="btn_edit m-tcol-c">
						<c:if test="${vo.userId ==sessionScope.member.userId}">
										<a class="filter-70 m-tcol-c _btnEdit btnUpdateReply${vo.friendReplyNum}" style="color: #999;
    cursor: pointer;
    font-size: 11px;" onclick="displayReplyUpdateForm(${vo.friendReplyNum},'${vo.content}');">수정</a><span
											class="filter-30 m-tcol-c" style="">|</span></c:if>
											<c:if
							test="${vo.userId ==sessionScope.member.userId or 'admin'==sessionScope.member.userId}">
											<a href="#"
											class="filter-70 m-tcol-c _btnDelete deleteReply" 
											data-replyNum = "${vo.friendReplyNum}"
											data-pageNo="${pageNo}" style="color: #999;
    cursor: pointer;
    font-size: 11px;">삭제</a></c:if>
									</p>
									<c:if test="${vo.userId !=sessionScope.member.userId and 'admin'!=sessionScope.member.userId}">
									<p class="btn_edit m-tcol-c">
									<a onclick="replySingo('${vo.friendReplyNum}','${pageNo}','${vo.userId}')"><span style="cursor: pointer;color: #999;
    cursor: pointer;
    font-size: 11px;">신고</span></a>
									</p></c:if>
									<div class="cb"></div>
								</div>
								<p class="comm m-tcol-c" style="padding-left: 27px;">
						<span class="comm_body replyContent${vo.friendReplyNum}" style="color: #999; font-size: 14px;">${vo.content}</span>
					<span class="replyUpdateForm${vo.friendReplyNum}" style="display: none;">
						<textarea class='boxTA'
							style='width: 92%; height: 100px; float: left; resize: none; -ms-overflow-style: none;'
							 ${empty sessionScope.member.userId?'placeholder="로그인이 필요한 서비스 입니다.&#13;&#10;클릭시 로그인 창으로 이동합니다."':'placeholder="모두가 함께 만들어 가는 깨끗한 공간입니다. &#13;&#10;훈훈한 댓글 부탁드립니다^^"' }>${vo.content}</textarea>
						<span
							style='padding: 0 10px; width: 8%; height: 50px; float: left; font-size: 15px;'>

							<button type='button' class='btn btn-default'
								data-num='${vo.friendReplyNum}' data-page="${pageNo}"
								style='width: 100%; height: 70px; padding: 2px 1px;'
								onclick="updateReply(${vo.friendReplyNum},${pageNo});">수정</button>

						</span>
					</span>
					</p>
							</div>
							</c:otherwise>
						</c:choose>
						</c:if>
						<c:if test="${vo.deleted==1 }">
						<div style="font-size: 14px;
    color: #aaa;"><span>삭제된 게시물입니다.</span></div>
						</c:if>
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
								style='width: 92%; height: 100px; float: left; resize: none; overflow-y: scroll;' ${empty sessionScope.member.userId?'placeholder="로그인이 필요한 서비스 입니다.&#13;&#10;클릭시 로그인 창으로 이동합니다."':'placeholder="모두가 함께 만들어 가는 깨끗한 공간입니다. &#13;&#10;훈훈한 댓글 부탁드립니다^^"' }></textarea>
							<div
								style='padding: 0 10px; width: 8%; height: 50px; float: left; font-size: 15px;'>
								<input type="checkbox" id="inputCK${vo.friendReplyNum}" name="secret" value="0"><label
									style="margin: 0 0 0px 3px;">비밀글</label>
								<button type='button' class='btn btn-default'
									data-num='${vo.friendReplyNum}'
									style='width: 100%; height: 80px; padding: 2px 1px;'  onclick="insertReply(${vo.friendReplyNum},${pageNo});">등록</button>

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
					<div style="" class="cc_paginate cmt"
						id="cmt_paginate">${paging}</div>
						
						
<script>
//댓글 및 답글 삭제
$(function(){
// 	$("body").off().on("click", ".deleteReply", function(){
// 		if(! confirm("댓글게시물을 삭제하시겠습니까 ? ")) {
// 		    return false;
// 		}
		
// 		var replyNum=$(this).attr("data-replyNum");
// 		var page=$(this).attr("data-pageNo");
		
<%-- 		var url="<%=cp%>/board/deleteReply"; --%>
// 		var query="boardReplyNum="+replyNum+"&mode=reply&pageNo="+page;
// 		console.log(query);
// 		var fn = function(data){
// 			alert("삭제완료!");
// 			listPage(page);
// 		};
		
// 		ajaxJSON(url, "post", query, fn);
// 	});

//댓글별 답글 삭제
	$("body").off().on("click", ".deleteReply", function(){
		if(! confirm("댓글게시물을 삭제하시겠습니까 ? "))
		    return;
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		var pageNo=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/friend/deleteReply";
		var query="friendReplyNum="+replyNum+"&mode=answer&pageNo="+pageNo;
		var fn = function(data){
			listPage(pageNo);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
		
$('textarea').click(function(){
	<c:if test="${empty sessionScope.member.userId}">
			location.href="<%=cp%>/member/login";
	</c:if>
});				
</script>
