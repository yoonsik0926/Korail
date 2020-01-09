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
<!-- 	작성자인지 아닌지에 따라 다르게 처리 -->
						<li ${vo.answer==0?'class=""':'class="reply"'} ${vo.userId ==sessionScope.member.userId? 'style="background: #eee"':''}>
							
							<c:if test="${vo.answer!=0}">
								<div style="float: left; margin-right: 10px;">
									<i class="fas fa-reply" style="transform: rotate(180deg);"></i>&nbsp;
								</div>
							</c:if>
							<c:if test="${empty vo.deleteId}">
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
										class="m-tcol-c btnReReply${vo.boardReplyNum}" style="cursor: pointer;    font-size: 10px;" onclick="displayReplyForm(${vo.boardReplyNum});">답글</a></span>
										</c:if>
										<c:if test="${vo.userId ==sessionScope.member.userId}">	
									<p class="btn_edit m-tcol-c">
										<a href="#" class="filter-70 m-tcol-c _btnEdit" style="color: #999;
    cursor: pointer;
    font-size: 11px;">수정</a><span
											class="filter-30 m-tcol-c" style="">|</span><a href="#"
											class="filter-70 m-tcol-c _btnDelete ${vo.answer==0? 'deleteReply':'deleteReplyAnswer'}" 
											data-replyNum = "${vo.boardReplyNum}"
											data-pageNo="${pageNo}" style="color: #999;
    cursor: pointer;
    font-size: 11px;">삭제</a>
									</p>
									</c:if>
									<c:if test="${vo.userId !=sessionScope.member.userId and 'admin'!=sessionScope.member.userId}">
									<p class="btn_edit m-tcol-c">
									<a><span style="cursor: pointer;color: #999;
    cursor: pointer;
    font-size: 11px;">신고</span></a>
									</p></c:if>
									<div class="cb"></div>
								</div>
								<p class="comm m-tcol-c" style="padding-left: 27px;">
									<span class="comm_body" style="color: #999;
    font-size: 14px;">${vo.content}</span>
								</p>
							</div>
						</c:if>
						<c:if test="${not empty vo.deleteId}">
						<div style="font-size: 14px;
    color: #aaa;"><span>삭제된 게시물입니다.</span></div>
						</c:if>
						</li>
						<li class="filter-30 board-box-line-dashed"></li>
						<li class="replyForm${vo.boardReplyNum}" style="display: none;">
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
								
								<button type='button' class='btn btn-default'
									data-num='${vo.boardReplyNum}' data-pageNo="${pageNo}" 
									style='width: 100%; height: 90px; padding: 2px 1px;'  onclick="insertReply(${vo.boardReplyNum});">등록</button>

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
						id="cmt_paginate">${paging }</div>
						
						
<script>
//댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/board/deleteReply";
		var query="boardReplyNum="+replyNum+"&mode=reply&pageNo="+page;
		
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
		var pageNo=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/board/deleteReply";
		var query="boardReplyNum="+replyNum+"&mode=answer&pageNo="+pageNo;
		
		var fn = function(data){
			listPage(pageNo);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
						
</script>
