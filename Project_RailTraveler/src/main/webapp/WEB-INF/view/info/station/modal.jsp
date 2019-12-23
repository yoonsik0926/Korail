<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	$("#aaaa").modal();
});

function deleteStation(){
	var q = "staNum=${dto.staNum}&locNum=${dto.locNum}&page=${page}";
	var url = "<%=cp%>/station/delete?" + q;

	if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
		location.href=url;
	}
	
}

function updateStation(){
	var q = "staNum=${dto.staNum}&locNum=${dto.locNum}&page=${page}"
	var url = "<%=cp%>/station/update?"+ q;
	
	location.href = url;
}

</script>

		<!-- 모달 -->
		<div class="modal " id="aaaa" tabindex="-1" role="dialog" aria-labelledby="layerpopLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- header -->
		      <div class="modal-header" style="padding: 5px 5px;">
		        <!-- 닫기(x) 버튼 -->
		        <button type="button" class="close" data-dismiss="modal" style="margin:10px;">×</button>
		        <!-- header title -->
		        <h4 class="modal-title" style="text-align: center;font-weight: 900;margin-top: 20px;margin-left: 25px;padding: 10px 20px;">${dto.staName}역</h4>
		      </div>
		      <!-- body -->
		      <div class="modal-body" style="text-align: center;">
		      	<div class="staImage">
		      		<img src="<%=cp%>/resource/images/station/${dto.imageFilename}" style="width: 90%; height:300px; margin-bottom: 20px;"> 
		      	</div>
		      	
		      	<div style="width: 90%; margin: 0 auto; line-height: 2.5;">
					<div style="text-align: left;">
						<span style="font-size: 18px; font-weight: 800;">
							<i class="fas fa-map-marker-alt" style="color:#e82b2b; font-size: 23px;"></i>&nbsp;&nbsp;위치&nbsp;&nbsp;</span>
						<span class="address" style="font-size: 15px; color: #636363;">${dto.staAddress}</span>
					</div>
				
					<div style="text-align: left;">
						<span style="font-size: 18px; font-weight: 800;">
							<i class="fas fa-phone-volume" style="color: #368416; font-size: 23px;"></i>&nbsp;&nbsp;전화번호&nbsp;&nbsp;</span>
						<span class="tel" style="font-size: 15px; color: #636363;">${dto.staTel}</span>
					</div>
					
					<div style="text-align: left;">
						<span style="font-size: 18px; font-weight: 800;">
							<i class="fas fa-gift" style="color: #1c549a; font-size: 23px;"></i>&nbsp;&nbsp;혜택&nbsp;&nbsp;</span>
						<div style="font-size: 15px; color: #636363;">
							<table style="margin-left:20px; text-align: center; font-size: 12px;">
								<tr style="background: #283164; color: white;">
									<td width="60">분류</td>
									<td width="200">이름</td>
									<td width="250">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
									<td width="100">시작 날짜</td>
									<td width="100">종료 날짜</td>
								</tr>
								<c:forEach var="vo" items="${beneList}">
							 	<tr style="border-bottom: 1px solid #d4cbcb;">								
									<td>${vo.cateName}</td>
									<td>${vo.subject}</td>
									<td>${vo.content}</td>
									<td>${vo.sDate}</td>
									<td>${vo.eDate}</td>
								</tr>
								</c:forEach>
								<c:if test="${count==0}">
									<tr>
										<td colspan="5">아직 등록된 이벤트가 없습니다.</td>
									</tr>
								</c:if>								
								<tr style="border-bottom: 1px solid #d4cbcb;" class="benefit">								

								</tr>
							</table>
							<div class="benefit">
															
							</div>
						</div>
					</div>
		        </div>

		      </div>
		      
		      
		      <!-- Footer -->
		      <div class="modal-footer" style="text-align: center; margin: 20px 0;">
		      	<c:if test="${sessionScope.member.userId!='admin'}">
		        	<button type="button" class="btnTour">관광정보 보러가기</button>
		        </c:if>
		        
		        <c:if test="${sessionScope.member.userId=='admin'}">
			        <div>
						<table style="width: 100%;border-spacing: 0px;">
							<tr height="45">
								<td width="300" style="text-align: center; height: 80px;">    
					        		<button type="button" class="btn btn-default" onclick="updateStation();">수정</button>    
					        		<button type="button" class="btn btn-danger" onclick="deleteStation();">삭제</button>
					    		</td>
							</tr>
						</table>
					</div>
		        </c:if>
		        
		      </div>
		    </div>
		  </div>
		</div>