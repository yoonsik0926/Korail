<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.btnFindPwd{
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
.btnFindPwd:hover{
  background:#fff;
  color:#a1b1f7;
}
.btnFindPwd:before,.btnFindPwd:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #a1b1f7;
  transition:400ms ease all;
}
.btnFindPwd:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btnFindPwd:hover:before,.btnFindPwd:hover:after{
  width:100%;
  transition:800ms ease all;
}

.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
}
.loginTF {
  width: 340px; height: 35px;
  padding: 5px;
  padding-left: 15px;
  border:1px solid #999999;
  color:#333333;
  margin-top:5px; margin-bottom:5px;
  font-size:14px;
  border-radius:4px;
}
.main{
	background: #F9F0DA !important;
}

input{
	background : #8fbbf9 !important;
	border : none !important;
	height: 45px !important;
}

</style>
<script type="text/javascript">
	function bgLabel(ob, id) {
	    if(!ob.value) {
		    document.getElementById(id).style.display="";
	    } else {
		    document.getElementById(id).style.display="none";
	    }
	}

	function sendOk() {
        var f = document.pwdFindForm;

        var str = f.userId.value;
        if(!str) {
            alert("아이디를 입력하세요. ");
            f.userId.focus();
            return;
        }

        f.action = "<%=cp%>/member/pwdFind";
        f.submit();
	}
</script>
<div class="main">
	<div class="container tim-container" style="max-width: 1200px; padding-top: 100px; background:#F9F0DA;">
	<div class="body-container">
	    <div style="width:420px; margin: 0px auto; padding-top:70px;">
		
			<div style="text-align: center;">
				<img id="logoImg" alt="" src="<%=cp%>/resource/img/logo-title.png" style="height: 80px;">
			</div>
	
			<form name="pwdFindForm" method="post" action="">
			  <table style="width:100%; margin: 20px auto; padding:30px;">
			  <tr style="height:50px;"> 
			      <td style="text-align: center;">
			          회원 아이디를 입력 하세요.
			      </td>
			  </tr>
	
			  <tr align="center" height="60"> 
			      <td>
			        &nbsp;
			        <label for="userId" id="lblUserId" class="lbl" ></label>
			        <input type="text" name="userId" id="userId" class="loginTF" maxlength="20" 
			                   tabindex="2"
	                           onfocus="document.getElementById('lblUserId').style.display='none';"
	                           onblur="bgLabel(this, 'lblUserId');"
	                           placeholder="UserId">
			        &nbsp;
			      </td>
			  </tr>
			  <tr align="center" height="65" > 
			      <td>
			      	&nbsp;
					<button class="btnFindPwd" type="button" onclick="sendOk();">비밀번호 찾기</button>
				  	 &nbsp;
				  </td>
			  </tr>
			  <tr align="center" height="10" > 
			      <td>&nbsp;</td>
			  </tr>
			  <tr>
			  	<td style="text-align: right; padding-right:43px;"><a href="<%=cp%>/">돌아가기</a></td>
			  </tr>
		    </table>
			</form>
			           
		    <table style="width:100%; margin: 10px auto 0; border-collapse: collapse;">
			  <tr align="center" height="30" >
			    	<td><span style="color: blue;">${message}</span></td>
			  </tr>
			</table>
		</div>
	</div>
	</div>
</div>