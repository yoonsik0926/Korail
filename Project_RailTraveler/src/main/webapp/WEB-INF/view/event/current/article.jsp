<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">

.tit-heading {position:relative; height:51px; margin-top:30px; border-bottom:3px solid #241d1e;}
.tit-evt {background:none; color:#333333; font-size:14px; text-align:justify; height:38px; line-height:38px; margin:0;}

.subject {
	font-size: 16px;
	padding-top: 10px;
	font-weight: bold;
}

</style>

<div class="body-container" style="width: 700px; margin-left: auto; margin-right: auto;">
    <div class="body-title">
        <h3><i class="far fa-image"></i> 이벤트 보기 </h3>
   
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style= "border-top: 2px solid #444444; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   <p class="subject">${dto.name}<p>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    
			    <td width="50%" align="right" style="padding-right: 5px; background: #fafafa;">
			        <span>기간: </span>${dto.sdate} ~ ${dto.edate}
			    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;">
			      <img src="<%=cp%>/uploads/event/${dto.imageFilename}" style="max-width:100%; 
			      height:auto; resize:both;">
			   </td>
			</tr>			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="50">
			      ${dto.content}
			   </td>
			</tr>
								
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			      	 이전 이벤트 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/event/article?${query}&eventNum=${preReadDto.eventNum}">${preReadDto.name}</a>
			        </c:if>
			    </td>
			</tr>
				<tr height="35" style="border-bottom: 2px solid #444444;">
				   	 <td colspan="2" align="left" style="padding-left: 5px;">
				       다음 이벤트 :
				         <c:if test="${not empty nextReadDto}">
				              <a href="<%=cp%>/event/article?${query}&eventNum=${nextReadDto.eventNum}">${nextReadDto.name}</a>
				        </c:if>
				    </td>
				</tr>
						
			</table>
						
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/event/current?${query}';">목록으로</button>
			    </td>
			</tr>
			</table>
    </div>
    
</div>


		

