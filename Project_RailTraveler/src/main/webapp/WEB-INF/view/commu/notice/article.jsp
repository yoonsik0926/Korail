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
					<button type="button" class="btn btnSendBoardLike btn-default" title="좋아요"><img src="<%=cp%>/resource/images/heart.png" style="width: 20px;">&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
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
    
    <div style="
    margin-bottom: 5px;
"><button type="button" class="btn btn-default" onclick="javascript:location.href='/Project_RailTraveler/bbs/list?';">목록</button>
	</div>
</div>
