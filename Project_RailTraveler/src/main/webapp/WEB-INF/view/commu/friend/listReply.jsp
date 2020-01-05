<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<ul class="cmlist" id="cmt_list">
	<c:forEach var="vo" items="${listReply}">
<!-- 	작성자인지 아닌지에 따라 다르게 처리 -->
						<li ${vo.answer==0?'class=""':'class="reply"'}>
						<c:if test="${vo.answer!=0}">
								<div style="float: left; margin-right: 10px;">
									<i class="fas fa-reply" style="transform: rotate(180deg);"></i>&nbsp;
								</div>
								</c:if>
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
														class="m-tcol-c _rosRestrict _nickUI" style="font-size: 20px;">${vo.userName}</a></td>
												</tr>
											</tbody>
										</table>
									</div>
									<span class="date m-tcol-c filter-50">${vo.created}</span>
									<c:if test="${vo.answer==0}">
									<span class="dsc_comm"><a
										class="m-tcol-c btnReReply${vo.friendReplyNum}" style="cursor: pointer;" onclick="displayReplyForm(${vo.friendReplyNum});">답글</a></span>
										</c:if>
									<p class="btn_edit m-tcol-c">
										<a href="#" class="filter-70 m-tcol-c _btnEdit">수정</a><span
											class="filter-30 m-tcol-c">|</span><a href="#"
											class="filter-70 m-tcol-c _btnDelete">삭제</a>
									</p>
									<div class="cb"></div>
								</div>
								<p class="comm m-tcol-c">
									<span class="comm_body">${vo.content}</span>
								</p>
							</div>
						</li>
						<li class="filter-30 board-box-line-dashed"></li>
						<c:if test=""></c:if>
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
								<input type="checkbox" name="secret" value="0"><label
									style="margin: 0 0 0px 3px;">비밀글</label>
								<button type='button' class='btn btnSendReReply btn-default'
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


<!-- 	<tr height='35' style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> -->
<!-- 						<td colspan="3"> -->
<!-- 							<div> -->
								
<%-- 								<c:if test="${vo.userId==sessionScope.member.userId}"> --%>
<!-- 									<div>비밀글입니다.</div> -->
<%-- 								</c:if> --%>
								
<%-- 								<c:if test="${vo.userId!=sessionScope.member.userId}"> --%>
<%-- 									<c:if test="${vo.secret==1}"> --%>
<!-- 									<div style="float: left;"> -->
<!-- 									<i class="fas fa-lock"></i>&nbsp; -->
<!-- 									</div> -->
<!-- 									<div>비밀글입니다.</div> -->
<%-- 									</c:if> --%>
									
									
<%-- 								</c:if> --%>
								
<%-- 								<c:if test="${vo.secret!=0}"> --%>
<!-- 								<div style="float: left;"> -->
<!-- 									<i class="fas fa-lock"></i>&nbsp; -->
<!-- 								</div> -->
									
<%-- 								</c:if> --%>
<%-- 								<c:if test="${vo.secret==0}"> --%>
<!-- 								<div style="width: 85%; float: left;"> -->
<!-- 									<div> -->
<%-- 										<b>${vo.userName}</b> --%>
<!-- 									</div> -->
<!-- 									<div style="clear: both;"> -->
<!-- 										<div style="clear: both;"> -->
<%-- 											<span>${vo.content}</span> --%>
<!-- 										</div> -->
<!-- 										<div style="clear: both;"> -->
<%-- 										<c:if test="${vo.answer==0}"> --%>
<!-- 											<button class="btn btn-default btnReplyAnswerLayout"> -->
<!-- 												<i class="fas fa-reply" style="transform: rotate(180deg);"></i> -->
<!-- 											</button> -->
<%-- 											</c:if> --%>
<%-- 											<c:if test="${vo.userId==sessionScope.member.userId}"> --%>
<!-- 											<button class="btn btn-default"> -->
<!-- 												<i class="fas fa-pencil-alt"></i> -->
<!-- 											</button> -->
<!-- 											<button class="btn btn-default"> -->
<!-- 												<i class="fas fa-times"></i> -->
<!-- 											</button> -->
<%-- 											</c:if> --%>
<%-- 											<c:if test="${vo.userId!=sessionScope.member.userId}"> --%>
<!-- 											<button class="btn btn-danger" -->
<!-- 												style="width: 25px; height: 25px; padding: 0px; border-radius: 5px;"> -->
<!-- 												<i class="far fa-bell" style="color: white"></i> -->
<!-- 											</button> -->
<%-- 											</c:if> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div> -->
<!-- 									<textarea -->
<!-- 																class='boxTA' -->
<!-- 																style='width: 90%; height: 83px; float: left; resize: none; overflow-y: scroll;'></textarea> -->
<!-- 															<div -->
<!-- 																style='padding: 0 10px; -->
<!-- 									    width: 8%; height: 50px; float: left; font-size: 15px;'> -->
<!-- 																<input type="checkbox" name="ss"><label -->
<!-- 																	style="margin: 0 0 0px 3px;">비밀글</label> -->
<!-- 																<button type='button' class='btn btnSendReply btn-default' -->
<!-- 																	data-num='10' -->
<!-- 																	style='width: 100%; height: 29px; padding: 2px 1px;'>수정</button> -->
<!-- 																	<button type='button' class='btn btn-default' -->
<!-- 																	data-num='10' -->
<!-- 																	style='width: 100%; height: 29px; padding: 2px 1px;'>취소</button> -->

<!-- 															</div> -->
<!-- 															</div> -->


<!-- 								</div> -->
<!-- 								<div style="float: right; text-align: right;"> -->
<%-- 									<div>${vo.created}</div> --%>
<!-- 								</div> -->
<%-- 								</c:if> --%>
<!-- 							</div> -->

<!-- 						</td> -->
<!-- 					</tr> -->



						
<%-- 	<c:forEach var="vo" items="${listReply}"> --%>
<!-- 	    <tr height='35' style='background: #eeeeee;'> -->
<!-- 	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'> -->
<%-- 	           <span><b>${vo.userName}</b></span> --%>
<!-- 	        </td> -->
<!-- 	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'> -->
<%-- 	           <span>${vo.created}</span> | --%>
<%-- 	           <c:if test="${vo.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }"> --%>
<%-- 	                <span class="deleteReply" style="cursor: pointer;" data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</span> --%>
<%-- 	           	</c:if> --%>
<%-- 	           <c:if test="${vo.userId != sessionScope.member.userId &&  sessionScope.member.userId != 'admin' }"> --%>
<!-- 	           		<span class="notifyReply">신고</span> -->
<%-- 	           	</c:if> --%>
<!-- 	        </td> -->
<!-- 	    </tr> -->
<!-- 	    <tr> -->
<!-- 	        <td colspan='2' valign='top' style='padding:5px 5px;'> -->
<%-- 	              ${vo.content} --%>
<!-- 	        </td> -->
<!-- 	    </tr> -->
	    
<!-- 	    <tr> -->
<!-- 	        <td style='padding:7px 5px;'> -->
<%-- 	            <button type='button' class='btn btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button> --%>
<!-- 	        </td> -->
<!-- 	        <td style='padding:7px 5px;' align='right'> -->
<%--                 <button type='button' class='btn btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="far fa-hand-point-up"></i> <span>${vo.likeCount}</span></button> --%>
<%--                 <button type='button' class='btn btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="far fa-hand-point-down"></i> <span>${vo.disLikeCount}</span></button>	         --%>
<!-- 	        </td> -->
<!-- 	    </tr> -->
	
<!-- 	    <tr class='replyAnswer' style='display: none;'> -->
<!-- 	        <td colspan='2'> -->
<%-- 	            <div id='listReplyAnswer${vo.replyNum}' class='answerList' style='border-top: 1px solid #cccccc;'></div> --%>
<!-- 	            <div style='clear: both; padding: 10px 10px;'> -->
<!-- 	                <div style='float: left; width: 5%;'>└</div> -->
<!-- 	                <div style='float: left; width:95%'> -->
<!-- 	                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea> -->
<!-- 	                 </div> -->
<!-- 	            </div> -->
<!-- 	             <div style='padding: 0px 13px 10px 10px; text-align: right;'> -->
<%-- 	                <button type='button' class='btn btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button> --%>
<!-- 	            </div> -->
	        
<!-- 	        </td> -->
<!-- 	    </tr> -->
<%-- 	</c:forEach> --%>

