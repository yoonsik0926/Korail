<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>



<c:forEach var="dto" items="${list}">
	<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px; ">
		<div class="thumbnail">

			<img style="height: 200px; width: 360px" src="${dto.imagefilename}">
			<div class="caption" style="width: 100%">
				<div class="nonscroll" style="overflow-y: scroll;  width:100%; height: 30px">
					<span style="font-size: 20px; ">${dto.name}</span>
					</div>				

				<div class="nonscroll" style="overflow-y: scroll; height: 35px">		
				<p>${dto.address}</p>
				</div>
				
				<div style="margin-top: 5px">
				<span >
					<button class="img-button" value="${dto.tourNum}" >
						<i class="far fa-heart" onclick="test(this);" style="font-size: 24px;color: tomato"></i>
					</button>
				</span>	
				<span style="float: right">	
					<button class="btn btn-info" onclick="javascript:location.href='${articleUrl}&tourNum=${dto.tourNum}';">알아보기</button>
				</span>
				</div>	

			</div>
		</div>
	</div>
	</c:forEach>
	
	<table id="pagingTable" style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">${dataCount==0?"등록된 게시물이 없습니다.": paging} 
			</td>
		</tr>
	</table>