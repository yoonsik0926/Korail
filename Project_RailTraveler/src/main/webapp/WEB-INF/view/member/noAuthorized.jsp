<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.container tim-container , .mem-member {
	background: #F9F0DA !important;
}

.btnMain{
  background:#f5d80b;
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
.btnMain:hover{
  background:#fff;
  color:#f5d80b;
}
.btnMain:before,.btnMain:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #f5d80b;
  transition:400ms ease all;
}
.btnMain:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btnMain:hover:before,.btnMain:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
<div class="mem-member">
	<div class="container tim-container" style="max-width: 1200px; padding-top: 100px; background:#F9F0DA;">
	<div class="body-container">
	    <div style="margin: 0px auto; padding-bottom:90px; width:420px; ">
		    	 <table style= "width:100%; margin: 20px auto; padding:30px;">
				  <tr style="height:50px;"> 
				      <td style="text-align: center; font-weight: 900; font-size: 52px; color: #f5d80b;">
				         <strong><i class="fas fa-exclamation-triangle" style="color: #d21111;"></i>
				         &nbsp;&nbsp; WARNING</strong>
				      </td>
				  </tr>
				  <tr align="center" height="100"> 
				      <td style="font-size: 18px;">
				      	접근할 수 있는 권한이 없습니다.
				      </td>
				  </tr>
				  <tr align="center" height="60"> 
				      <td>
				      	<button class="btnMain" type="button" onclick="javascript:location.href='<%=cp%>/';" class="btnConfirm">Back to Main</button>
				      </td>
				  </tr>
				  </table>
	     	</div>   
		</div>
	</div>
</div>