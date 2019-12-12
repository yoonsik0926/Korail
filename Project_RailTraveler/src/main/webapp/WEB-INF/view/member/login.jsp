<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
.lbl {
	position: absolute;
	margin-left: 15px;
	margin-top: 17px;
	color: #999999;
	font-size: 11pt;
}

.loginTF {
	width: 340px;
	height: 35px;
	padding: 5px;
	padding-left: 15px;
	border: 1px solid #999999;
	color: #333333;
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 14px;
	border-radius: 4px;
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

function sendLogin() {
    var f = document.loginForm;

	var str = f.userId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    str = f.userPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/login";
	f.submit();
	}
</script>
<style>

.btnlogIn{
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
.btnlogIn:hover{
  background:#fff;
  color:#a1b1f7;
}
.btnlogIn:before,.btnlogIn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #a1b1f7;
  transition:400ms ease all;
}
.btnlogIn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btnlogIn:hover:before,.btnlogIn:hover:after{
  width:100%;
  transition:800ms ease all;
}


.main {
	background : #F9F0DA !important;
}

input{
	background : #8fbbf9 !important;
	border : none !important;
	height: 45px !important;
}

</style>
<div class="main">
	<div class="container tim-container"
		style="max-width: 800px; padding-top: 80px; background:#F9F0DA; ">
		<div style="width: 360px; margin: 0px auto; padding-top: 70px; ">
			<div style="text-align: center; margin-bottom: 45px;">
				<img id="logoImg" alt="" src="<%=cp%>/resource/img/logo-title.png" style="height: 80px;">
			</div>

			<form name="loginForm" method="post" action="">
				<table style="margin: 15px auto; width: 100%; border-spacing: 0px;">
					<tr align="center" height="60">
						<td><label for="userId" id="lblUserId" class="lbl"></label>
						 <input
							type="text" name="userId" id="userId" class="loginTF"
							maxlength="15" tabindex="1"
							onfocus="document.getElementById('lblUserId').style.display='none';"
							onblur="bgLabel(this, 'lblUserId');"
							placeholder="UserId"></td>
					</tr>
					<tr align="center" height="60">
						<td><label for="userPwd" id="lblUserPwd" class="lbl"></label>
							<input type="password" name="userPwd" id="userPwd"
							class="loginTF" maxlength="20" tabindex="2"
							onfocus="document.getElementById('lblUserPwd').style.display='none';"
							onblur="bgLabel(this, 'lblUserPwd');"
							placeholder="Password"></td>
					</tr>
					<tr align="center" height="60">
						<td>
							<button class="btnlogIn" type="button" onclick="sendLogin();" class="btnConfirm">로그인</button>
						</td>
					</tr>
					<tr align="center" height="60">
						<td>
							<div id="naver_id_login" style="border: 3px #00c73c solid; width: 190px;border-radius: 4px;"></div>
						</td>
					</tr>
					
					<tr align="center" height="45">
						<td><a href="<%=cp%>/member/idFind" style="color: #999999;">아이디찾기</a>&nbsp;&nbsp;&nbsp; <a
							href="<%=cp%>/member/pwdFind" style="color: #999999;">패스워드찾기</a>&nbsp;&nbsp;&nbsp; <a
							href="<%=cp%>/member/member" style="color: #999999;">회원가입</a></td>
					</tr>

					<tr align="center" height="40">
						<td><span style="color: blue;">${message}</span></td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
</div>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
		var clientId = "e2FLdnwqeota8urONJ21";
		var callbackUrl = "http://localhost:9090/Project_RailTraveler/";
		var naver_id_login = new naver_id_login(clientId, callbackUrl);
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3, 40);
		naver_id_login.setDomain("localhost:9090/Project_RailTraveler/");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
</script>