<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
				<h5 style="font-weight: 700; margin-bottom : 10px; border-bottom: #c1bebe 1px solid; padding-bottom: 5px;">${dataCount}개의 북마크</h5>
				<c:forEach var="dto" items="${list}">
				<div class="tourContent" style="width: 100%; height:190px; margin-bottom:15px; background: #F9F0DA; border: none; border-radius: 8px; ">
					<div style="width: 40%; height:100%; float: left;"><img src="${dto.imagefilename}" style="width:100%; height: 100%;"></div>
					
					<div style="width: 55%; height:100%; float: left; margin-left: 15px;">
						<table style="width:100%; margin-top:10px;">
							<tr style="height: 40px;">
								<td style="font-size: 18px; font-weight: 900;" colspan="3">${dto.name}</td>
								<td style="text-align: right;" width="30">
									<button class="img-button" data-tourNum='${dto.tourNum}' data-pageNo='${pageNo}'>
										<i class="fas fa-heart" onclick="test(this);" style="font-size: 20px;color: tomato"></i>
									</button>
								</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700; width:30%; font-size: 13px;"><i class="fas fa-check"></i>  카테고리 : </td>
								<td style=" text-align: left; font-size: 13px;" colspan="3">${dto.cateName}</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700;width:20%;font-size: 13px; "><i class="fas fa-check"></i>  역 : </td>
								<td style="text-align: left; font-size: 13px;" colspan="3">${dto.staName}역</td>
							</tr>
							<tr style="height: 30px;">
								<td style="font-weight: 700;width:20%;font-size: 13px; "><i class="fas fa-check"></i>  위치 : </td>
								<td style="text-align: left; font-size: 13px;" colspan="3">${dto.address}</td>
							</tr>
							
							<tr style="height: 30px;">
								<td style="text-align: right;" colspan="4">
								<c:choose>
									<c:when test="${dto.locNum==1}">
										<button type="button" class="btn btn-default"
											onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=sudo'">바로가기</button>
									</c:when>
									<c:when test="${dto.locNum==2}">
										<button type="button" class="btn btn-default" 
											onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=chungcheong'">바로가기</button>
									</c:when>
									<c:when test="${dto.locNum==3}">
										<button type="button" class="btn btn-default" 
											onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=gangwon'">바로가기</button>
									</c:when>
									<c:when test="${dto.locNum==4}">
										<button type="button" class="btn btn-default"
											onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=jeonla'">바로가기</button>
									</c:when>
									<c:when test="${dto.locNum==5}">
										<button type="button" class="btn btn-default"
											onclick="javascript:location.href='${detailInfoUrl}&cateNum=${dto.cateNum}&tourNum=${dto.tourNum}&subTitle=gyeongsang'">바로가기</button>
									</c:when>
				
								</c:choose>
								
								</td>
								
							</tr>
						
						</table>
					</div>

				</div>
				</c:forEach>
				
				
				
				<div style="width: 89%;">
					<nav style="text-align: center;">
						<ul class="pagination">
							<li>${dataCount==0?"등록된 북마크가 없습니다.":paging}</li>
						</ul>
					</nav>
				</div>