<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

</script>
<style type="text/css">
.tb-row span{
	display: inline-block;
	float: left;
	margin-right: 5px;
	color: #b2b2b2;
}
.tb-row{
height: 35px;
}

#boardLikeCount{
    width: 41px;
    font-size: 13px;
    display: block;
    color: #cccccc;
    margin: 0 auto;
}
</style>
<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 공지게시판</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-bottom:10px;"></div>
			<div style="margin-bottom: 10px;"><button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">목록</button>
			    </div>
			<table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;
			    border-top: 2px solid #000;
    border-bottom: 2px solid #000;">
			<tr>
			    <td>
			    	<h3 style="margin: 10px 0 2px;
    font-size: 25px;">공지게시판의 공지입니다.</h3>
			    </td>
			</tr>
			
			<tr class="tb-row" style="    height: 30px;">
			    <td align="left" style="padding-left: 5px; font-size: 13px;">
			    <span>이겨레</span><span>|</span><span>2019. 12. 15. 20:47:43</span><span>|</span><span>조회 101회</span><span>|</span><span>댓글 4</span>
			    </td>
			</tr>
			
			<tr>
			  <td style="padding: 20px 5px;" valign="top" height="200">
			      내용입니드아아아
			   </td>
			</tr>
			
			<tr class="tb-row">
				<td height="40" align="center">
					<button type="button" class="btn btnSendBoardLike btn-default" title="좋아요" style="padding: 6px 8px;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-bottom: 5px;"><img src="<%=cp%>/resource/images/heart.png" style="width: 25px;display: block;
    margin: 0 auto;"><span id="boardLikeCount" >${dto.boardLikeCount}0</span></button>
				</td>
			</tr>
			
			<tr class="tb-row">
			    <td align="left" style="padding-left: 5px;">
			       첨&nbsp;&nbsp;부 :
		           <c:if test="${not empty dto.saveFilename}">
		                   <a href="<%=cp%>/bbs/download?num=${dto.num}">${dto.originalFilename}</a>
		           </c:if>
			    </td>
			</tr>
			
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left"> <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">목록</button>
			    </td>
			
			    <td align="right"><c:if test="${sessionScope.member.userId==dto.userId}">				    
			          <button type="button" class="btn btn-default" onclick="updateBoard();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn btn-default" onclick="deleteBoard();">삭제</button>
			       </c:if>
			       </td>
			</tr>
			</table>
			<div>
		<table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
    	<tr class="tb-row">
			    <td  align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/bbs/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr class="tb-row">
			    <td  align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="<%=cp%>/bbs/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
    </table></div>
    </div>
    
    <div>
		<table style='width: 100%; margin: 15px auto 10px; border-spacing: 0px;'>
			<tr height='30'> 
				 <td align='left' >
				 	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding: 5px 0px 0px;'>
					<textarea class='boxTA' style='width: 89%;
    height: 50px;
    float: left;
    resize: none;
    overflow-y: scroll;'></textarea> <button type='button' class='btn btnSendReply btn-default' data-num='10' style='margin-left: 1%;
    width: 10%;
    height: 50px;
    padding: 10px 1px;
    float: left;'>등록</button>
			    
			    </td>
			</tr>
		</table>
		     
		<div id="listReply">
		
<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
	<thead id='listReplyHeader'>
		<tr height='35'>
		    <td colspan='2'>
		       <div style='clear: both;'>
		           <div style='float: left;'><span style='color: #3EA9CD; font-weight: bold;'>댓글 ${replyCount}개</span> <span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span></div>
		           <div style='float: right; text-align: right;'></div>
		       </div>
		    </td>
		</tr>
	</thead>
	
	<tbody id='listReplyBody'>
	<c:forEach var="vo" items="${listReply}">
	    <tr height='35' style='background: #eeeeee;'>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <span><b>${vo.userName}</b></span>
	        </td>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
	           <span>${vo.created}</span> |
	           <c:if test="${vo.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
	                <span class="deleteReply" style="cursor: pointer;" data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</span>
	           	</c:if>
	           <c:if test="${vo.userId != sessionScope.member.userId &&  sessionScope.member.userId != 'admin' }">
	           		<span class="notifyReply">신고</span>
	           	</c:if>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
	              ${vo.content}
	        </td>
	    </tr>
	    
	    <tr>
	        <td style='padding:7px 5px;'>
	            <button type='button' class='btn btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
	        </td>
	        <td style='padding:7px 5px;' align='right'>
                <button type='button' class='btn btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="far fa-hand-point-up"></i> <span>${vo.likeCount}</span></button>
                <button type='button' class='btn btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="far fa-hand-point-down"></i> <span>${vo.disLikeCount}</span></button>	        
	        </td>
	    </tr>
	
	    <tr class='replyAnswer' style='display: none;'>
	        <td colspan='2'>
	            <div id='listReplyAnswer${vo.replyNum}' class='answerList' style='border-top: 1px solid #cccccc;'>
	             <div class='answer' style='padding: 0px 10px;'>
        <div style='clear:both; padding: 10px 0px;'>
            <div style='float: left; width: 5%;'>└</div>
            <div style='float: left; width:95%;'>
                <div style='float: left;'><b>${vo.userName}</b></div>
                <div style='float: right;'>
                    <span>${vo.created}</span> |
                    <c:if test="${sessionScope.member.userId==vo.userId || sessionScope.member.userId=='admin'}">
                    	<span class='deleteReplyAnswer' style='cursor: pointer;' data-replyNum='${vo.replyNum}' data-answer='${vo.answer}'>삭제</span>
                    </c:if>
                    <c:if test="${sessionScope.member.userId!=vo.userId && sessionScope.member.userId!='admin'}">
                    	<span class="notifyReply">신고</span>
                    </c:if>
                </div>
            </div>
        </div>
        <div style='clear:both; padding: 5px 5px 5px 5%; border-bottom: 1px solid #ccc;'>
            ${vo.content}
        </div>
    </div>	
	            </div>
	            <div style='clear: both; padding: 10px 10px;'>
	                <div style='float: left; width: 5%;'>└</div>
	                <div style='float: left; width:95%'>
	                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea>
	                 </div>
	            </div>
	             <div style='padding: 0px 13px 10px 10px; text-align: right;'>
	                <button type='button' class='btn btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button>
	            </div>
	        
	        </td>
	    </tr>
	</c:forEach>
	</tbody>
	
	<tfoot id='listReplyFooter'>
		<tr height='40' align="center">
            <td colspan='2' >
              ${paging}
            </td>
           </tr>
	</tfoot>
</table>
		
		
		</div>
    
    <div style="
    margin-bottom: 5px;
"><button type="button" class="btn btn-default" onclick="javascript:location.href='/Project_RailTraveler/bbs/list?';">목록</button>
			    </div>
    </div>
    
</div>
