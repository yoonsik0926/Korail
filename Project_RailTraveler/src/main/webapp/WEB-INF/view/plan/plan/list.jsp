<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div style="margin: 10px 0;">
		<c:forEach var="vo" items="${list}">
				<div class="col-md-6 col-md-6" style="max-width: 50%; min-height: 200px">
					<div class="thumbnail" onclick="javascript:location.href='${articleUrl}planNum=${vo.planNum}&page=${page}'">
						<img style="height: 380px; width: 100%;" src="<%=cp%>/uploads/plan/${vo.imageFileName}" onerror="this.src='<%=cp%>/resource/images/no-image.png'">
						<div class="caption sombra_difuminada" style="width: 94%;
    left: 3%;
    height: 382px;
    top: 1%;
    font-weight: bold;
    position: absolute;">
    <div style="color: white;
    text-shadow: 0 0 4px #000;
    font: 1.8em TmonMonsori;    text-align: left;
    padding: 5px 0 0 10px;">${vo.ticketDay} DAYS</div>
							<div style="margin-top: 50px">
								<table style="width:100%; margin-top:10px;">
									<tr style="height: 40px;">
										<td style="padding: 25px 10px;
    line-height: 40px;
    text-align: center;
        background: #ffffff85;
    border-radius: 10px;
    font-size: 25px;
    font-weight: 900;
    width: 80%; " colspan="2">${vo.title==''or vo.title==null?'제목이 없는 여행 플랜':vo.title}</td>
									</tr>
									<tr>
										<td style="    font-weight: 400;
    text-align: center;
    font-size: 13px;
    padding: 5px 0;"><span style="color: #ffffff;
    background: #00000057;
    border-radius: 14px;
    font-size: 14px;
    font-weight: 500;
    padding: 3px 10px;">|&nbsp;${vo.staName}&nbsp;|</span></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div style="clear: both;"></div>
</div>			
<%-- 			<c:if test="${list.size()!=0 && list.size()%4!=0}"> --%>
<%-- 				<c:forEach var="i" begin="${list.size()%4+1}" end="4"> --%>
<!-- 					<div style="margin-top: 10px;"> -->
<!-- 						<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px; border: none;"> -->
<!-- 							<div class="thumbnail" style="height:390px;border: none;"> -->
<!-- 								&nbsp; -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:if> --%>


			<div style="width: 100%;">
				<nav style="text-align: center;">
					<ul class="pagination">
						<li>${dataCount==0?"등록한 게시물이 없습니다.":paging}</li>
					</ul>
				</nav>
			</div>
	
			
			
			


			
		

	

