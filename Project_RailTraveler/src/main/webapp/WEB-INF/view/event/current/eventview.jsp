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

.event-poster {
}

.event-info {

}

</style>

<div class="body-content-container">

	<div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	<h3> ${dto.name} </h3>
	 </div>
	 
	<div class="event-poster">
		<img src="/Project_RailTraveler/resource/img/event1.jpg">
	</div>
	
	<div class="event-info">
		<p>${dto.content}</p>
		<span>기간: </span>${dto.sdate} ~ ${dto.edate}
	</div>
</div>

	<!-- Footer -->
		      <div class="modal-footer" style="text-align: center; margin: 20px 0;">
		      	<c:if test="${sessionScope.member.userId!='admin'}">
		        	<button type="button" class="btnTour">이벤트정보 보러가기</button>
		        </c:if>
		     		        
		      </div>
		

