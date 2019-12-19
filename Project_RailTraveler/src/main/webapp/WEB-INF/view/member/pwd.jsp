<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
	function bgLabel(ob, id) {
	    if(!ob.value) {
		    document.getElementById(id).style.display="";
	    } else {
		    document.getElementById(id).style.display="none";
	    }
	}

	function sendOk() {
        var f = document.pwdForm;

        var str = f.userPwd.value;
        if(!str) {
            alert("\n패스워드를 입력하세요. ");
            f.userPwd.focus();
            return;
        }

        f.action = "<%=cp%>/member/pwd";
        f.submit();
	}
</script>
<style>
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

.container tim-container , .mem-member {
	background: #F9F0DA !important;
}

input{
	background : #8fbbf9 !important;
	border : none !important;
	height: 45px !important;
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
	<div class="container tim-container" style="max-width: 1200px; padding-top: 100px; background:#F9F0DA;">
<div class="body-container">
    <div style="width:420px; margin: 0px auto; padding-top:70px;">
	
		<div style="text-align: center;">
				<img id="logoImg" alt="" src="<%=cp%>/resource/img/logo-title.png" style="height: 80px;">
		</div>
	
		<form name="pwdForm" method="post" action="">
		  <table style="width:100%; margin: 20px auto; padding:30px;  border-collapse: collapse;">
		  <tr style="height:50px;"> 
		      <td style="padding: 0 30px; text-align: center;">
		          정보보호를 위해 패스워드를 다시 한 번 입력해주세요.
		      </td>
		  </tr>

		  <tr style="height:60px;" align="center"> 
		      <td> 
		        &nbsp;
		        <input type="text" name="userId" class="loginTF" maxlength="15"
		                   tabindex="1"
		                   value="${sessionScope.member.userId}"
                           readonly="readonly">
		           &nbsp;
		      </td>
		  </tr>
		  <tr align="center" height="60"> 
		      <td>
		        &nbsp;
		        <label for="userPwd" id="lblUserPwd" class="lbl"></label>
		        <input type="password" name="userPwd" id="userPwd" class="loginTF" maxlength="20" 
		                   tabindex="2"
                           onfocus="document.getElementById('lblUserPwd').style.display='none';"
                           onblur="bgLabel(this, 'lblUserPwd');"
                           placeholder="Password">
		        &nbsp;
		      </td>
		  </tr>
		  <tr align="center" height="30" >
		    	<td><span style="color: red;">${message}</span></td>
		  </tr>
		  <tr align="center" height="65" > 
		      <td>
		        &nbsp;
		        <button type="button" onclick="sendOk();" class="btnConfirm">확인</button>
				<input type="hidden" name="mode" value="${mode}">
		        &nbsp;
		      </td>
		  </tr>
		  <tr align="center" height="10" > 
		      <td>&nbsp;</td>
		  </tr>
	    </table>
		</form>
		         
	</div>
</div>
</div>
</div>