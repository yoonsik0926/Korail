<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
//좋아요 관리하는 에이작스
function test(ob){
	
	var userId = "${sessionScope.member.userId}";

	  if ( userId == "") {
		  $("#likealarm").modal();
		return;
	  }
	
	var planNum = $(ob).closest("button").val();
	  
	var url = "<%=cp%>/friendPlan/like";
	var query = "planNum="+planNum;
	var fn = function(data){
			if(data.likecheck==0){
				ob.className = "fas fa-heart"; 
			}
			else if (data.likecheck==1){
				ob.className = "far fa-heart";
			}

	}; 
		
	ajaxJSON(url, "get", query, fn);
	
};
</script>



		<c:forEach var="vo" items="${list}">
			<div style="margin-top: 10px;">
				
				<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px">
					<div class="thumbnail" onclick="javascript:location.href='${articleUrl}planNum=${vo.planNum}&page=${page}'">
						<img style="height: 200px; width: 100%;" src="<%=cp%>/resource/img/friendPlan.PNG">
						<div class="caption" style="width: 100%">
							<div style="margin-top: 10px">
								<table style="width:100%; margin-top:10px; table-layout: fixed;">
									<tr style="height: 40px;">
										<td style="font-size: 18px; font-weight: 900; width: 80%;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" colspan="2">${vo.title==''or vo.title==null?'제목이 없는 여행 플랜':vo.title}</td>
									</tr>
								</table>
								<table style="width:100%; margin-top:10px;">
									<tr style="height: 30px;">
										<td style="font-weight: 700;"><i class="fas fa-pen" style="color: #e190f1;"></i>&nbsp;작성자: </td>
										<td style=" text-align: left;" colspan="2">${vo.writer}</td>
									</tr>
									<tr style="height: 30px;">
										<td style="font-weight: 700; width:35%;"><i class="fas fa-calendar-alt" style="color: #bea2f5;"></i>&nbsp;여행 일자: </td>
										<td style=" text-align: left;" colspan="2">${vo.sDate} ~ ${vo.eDate}</td>
									</tr>
									<tr style="height: 30px;">
										<td style="font-weight: 700;"><i class="fas fa-subway" style="color: #8abefa;"></i>&nbsp;경유역: </td>
										<td style=" text-align: left;" colspan="2">${vo.staName}</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: right;">
											<button id="btn-${vo.planNum}" class="img-button find" value="${vo.planNum}" >
											
											   <c:choose>
						       						<c:when test="${vo.likeuserId==sessionScope.member.userId}">
												<i class="fas fa-heart" onclick="test(this);" style="font-size: 24px;color: tomato"></i>
													</c:when>						
													<c:otherwise>
												<i class="far fa-heart" onclick="test(this);" style="font-size: 24px;color: tomato"></i>
													</c:otherwise>
												</c:choose>
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				</div>
			</c:forEach>
			
			<c:if test="${list.size()!=0 && list.size()%4!=0}">
				<c:forEach var="i" begin="${list.size()%4+1}" end="4">
					<div style="margin-top: 10px;">
						<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px; border: none;">
							<div class="thumbnail" style="height:390px;border: none;">
								&nbsp;
							</div>
						</div>
					</div>
				</c:forEach>

			</c:if>


			<div style="width: 100%;">
				<nav style="text-align: center;">
					<ul class="pagination">
						<li>${dataCount==0?"등록한 게시물이 없습니다.":paging}</li>
					</ul>
				</nav>
			</div>
	
			
			
		

	

