<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.container tim-container , .mem-member {
	background: #F9F0DA !important;
}
.btnConfirm:hover {
	width: 185px;
	height: 40px;
	border: none;
	background : #a1b1f7;
	border-radius: 4px;
	color : white;
}

.btnConfirm{
  background:#a1b1f7;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  width: 185px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 4px;
}
.btnConfirm:hover{
  background:#fff;
  color:#a1b1f7;
}
.btnConfirm:before,.btnConfirm:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #a1b1f7;
  transition:400ms ease all;
}
.btnConfirm:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btnConfirm:hover:before,.btnConfirm:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
<div class="mem-member">
	<div class="container tim-container"
		style="max-width: 1200px; padding-top: 100px; background: #F9F0DA;">
		<div class="body-container">
			<div style="margin: 0px auto; margin-bottom:90px; ">
				<div style="text-align: center;">
					<img id="logoImg" alt="" src="<%=cp%>/resource/img/logo-title.png" style="height: 80px;">
				</div>
				<div class="messageBox">
					<div style="line-height: 150%; padding-top: 35px; text-align: center; font-size:15px;">
						${message}</div>
					<div style="margin-top: 40px; text-align: center;">
						<c:if test="${button=='login'}">
							<button type="button"
								onclick="javascript:location.href='<%=cp%>/member/login';" class="btnConfirm">로그인 하러가기</button>
						</c:if>
						<c:if test="${button=='main'}">
							<button type="button"
								onclick="javascript:location.href='<%=cp%>/';" class="btnConfirm">Back to Main</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>