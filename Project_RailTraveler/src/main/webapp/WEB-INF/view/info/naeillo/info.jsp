<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.btnTicket:hover {
	width: 185px;
	height: 50px;
	border: none;
	background: #a1b1f7;
	border-radius: 4px;
	color: white;
}

.btnTicket {
	background: #a1b1f7;
	color: #fff;
	border: none;
	position: relative;
	height: 50px;
	width: 185px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	border-radius: 4px;
}

.btnTicket:hover {
	background: #fff;
	color: #a1b1f7;
}

.btnTicket:before, .btnTicket:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #a1b1f7;
	transition: 400ms ease all;
}

.btnTicket:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btnTicket:hover:before, .btnTicket:hover:after {
	width: 100%;
	transition: 800ms ease all;
}


</style>

<div class="body-content-container">
     <div class="page-three-title mt40">
		<h3 class="fs26">
		<span style="padding: 10px 0px; display: block;"> 내일로 소개</span>
		</h3>
	</div>
     
     <div style="width: 100%;">
        <img alt="내일로 소개 준비중.." src="<%=cp%>/resource/images/intro.png">
        <div style="text-align: center; width: 999px;">
	     	<button class="btnTicket" type="button" 
	     		onclick="javascript:location.href='<%=cp%>/ticket/pay';">발권하러 가기</button>
    	 </div>
     </div>
     

</div>
