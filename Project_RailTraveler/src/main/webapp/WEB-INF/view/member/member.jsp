<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function memberOk() {
	var f = document.memberForm;
	var str;

	str = f.userId.value;
	str = str.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	f.userId.value = str;

	str = f.userPwd.value;
	str = str.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = str;

	if(str!= f.userPwdCheck.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwdCheck.focus();
        return;
	}
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

    str = f.birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
	str = str.trim();

    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요.");
        f.email2.focus();
        return;
    }

 	f.action = "<%=cp%>/member/${mode}";

    f.submit();
}

function changeEmail() {
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

function userIdCheck() {
	var str = $("#userId").val();
	str = str.trim();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		$("#userId").focus();
		return;
	}
	
	var url="<%=cp%>/member/userIdCheck";
		var q = "userId=" + str;

		$.ajax({
			type : "post",
			url : url,
			data : q,
			dataType : "json",
			success : function(data) {
				var p = data.passed;
				if (p == "true") {
					var s = "<span style='color:blue;font-weight:bold;'>" + str
							+ "</span> 아이디는 사용 가능합니다.";
					$("#userId").parent().next(".help-block").html(s);
				} else {
					var s = "<span style='color:red;font-weight:bold;'>" + str
							+ "</span> 아이디는 사용할 수 없습니다.";
					$("#userId").parent().next(".help-block").html(s);
					$("#userId").val("");
					$("#userId").focus();
				}
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});

	}


</script>

<style>
.main {
	background: #F9F0DA !important;
}

input, select, .btnSearch {
	border: #334393 2px solid !important;
	height: 45px !important;
	border-radius: 4px;
}

.btnJoin {
	background: #334393;
	color: #fff;
	border: none;
	position: relative;
	height: 40px;
	width: 250px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	border-radius: 4px;
}

.btnJoin:hover {
	background: #fff;
	color: #334393;
}

.btnJoin:before, .btnJoin:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #334393;
	transition: 400ms ease all;
}

.btnJoin:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btnJoin:hover:before, .btnJoin:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
</style>

<div class="main">
	<div class="container tim-container"
		style="max-width: 800px; padding: 100px 0; background: #F9F0DA;">
		<div style="text-align: center; margin-bottom: 45px;">
			<img id="logoImg" alt="" src="<%=cp%>/resource/img/logo-title.png"
				style="height: 80px;">
		</div>
		<div>
			<form name="memberForm" method="post">
			
				<table
					style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
					<tr>
						<td width="100" valign="top"
							style="text-align: right; padding-top: 15px;"><label
							style="font-weight: 900; color: #1f364d;">아이디</label></td>
						<td style="padding: 0 0 15px 15px;">
							<p style="margin-top: 1px; margin-bottom: 5px;">
								<input type="text" name="userId" id="userId"
									value="${dto.userId}" onchange="userIdCheck();"
									style="width: 95%;"
									${mode=="update" ? "readonly='readonly' ":""} maxlength="15"
									class="boxTF" placeholder="&nbsp;&nbsp;아이디">
							</p>
							<p class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
						</td>
					</tr>

					<tr>
						<td width="100" valign="top"
							style="text-align: right; padding-top: 15px;"><label
							style="font-weight: 900; color: #1f364d;">패스워드</label></td>
						<td style="padding: 0 0 15px 15px;">
							<p style="margin-top: 1px; margin-bottom: 5px;">
								<input type="password" name="userPwd" maxlength="15"
									class="boxTF" style="width: 95%;"
									placeholder="&nbsp;&nbsp;패스워드">
							</p>
							<p class="help-block">패스워드는 5~10자 이내이며, 하나 이상의 숫자나 특수문자가
								포함되어야 합니다.</p>
						</td>
					</tr>

					<tr>
						<td width="100" valign="top"
							style="text-align: right; padding-top: 15px;"><label
							style="font-weight: 900; color: #1f364d;">패스워드 확인</label></td>
						<td style="padding: 0 0 15px 15px;">
							<p style="margin-top: 1px; margin-bottom: 5px;">
								<input type="password" name="userPwdCheck" maxlength="15"
									class="boxTF" style="width: 95%;"
									placeholder="&nbsp;&nbsp;패스워드 확인">
							</p>
							<p class="help-block">패스워드를 한번 더 입력해주세요.</p>
						</td>
					</tr>

					<tr>
						<td width="100" valign="top"
							style="text-align: right; padding-top: 15px;"><label
							style="font-weight: 900; color: #1f364d;">이름</label></td>
						<td style="padding: 0 0 15px 15px;">
							<p style="margin-top: 1px; margin-bottom: 5px;">
								<input type="text" name="userName" value="${dto.userName}"
									maxlength="30" class="boxTF" style="width: 95%;"
									${mode=="update" ? "readonly='readonly' ":""}
									placeholder="&nbsp;&nbsp;이름">
							</p>
						</td>
					</tr>

					<tr>
						<td width="100" valign="top"
							style="text-align: right; padding-top: 15px;"><label
							style="font-weight: 900; color: #1f364d;">생년월일</label></td>
						<td style="padding: 0 0 15px 15px;">
							<p style="margin-top: 1px; margin-bottom: 5px;">
								<input type="text" name="birth" value="${dto.birth}"
									maxlength="10" class="boxTF" style="width: 95%;"
									placeholder="&nbsp;&nbsp;생년월일">
							</p>
							<p class="help-block">생년월일은 YYYY-MM-DD 형식으로 입력 합니다.</p>
						</td>
					</tr>

					<tr>
						<td width="100" valign="top"
							style="text-align: right; padding-top: 15px;"><label
							style="font-weight: 900; color: #1f364d;">이메일</label></td>
						<td style="padding: 0 0 15px 15px;">
							<p style="margin-top: 1px; margin-bottom: 5px;">
								<select name="selectEmail" onchange="changeEmail();" class="selectField">
									<option value="">선 택</option>
									<option value="naver.com"
										${dto.email2=="naver.com" ? "selected='selected'" : ""}>naver.com</option>
									<option value="hanmail.net"
										${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>hanmail.net</option>
									<option value="gmail.com"
										${dto.email2=="gmail.com" ? "selected='selected'" : ""}>gmail.com</option>
									<option value="direct">직접입력</option>
								</select> 
								<input type="text" name="email1" value="${dto.email1}"
									size="13" maxlength="30" class="boxTF"> @ 
								<input type="text" name="email2" value="${dto.email2}" size="13"
									maxlength="30" class="boxTF" readonly="readonly">
							</p>
						</td>
					</tr>

					<tr>
						<td width="100" valign="top"
							style="text-align: right; padding-top: 15px;"><label
							style="font-weight: 900; color: #1f364d;">전화번호</label></td>
						<td style="padding: 0 0 15px 15px;">
							<p style="margin-top: 1px; margin-bottom: 5px;">
								<select class="selectField" id="tel1" name="tel1">
									<option value="">선 택</option>
									<option value="010"
										${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
									<option value="011"
										${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
									<option value="016"
										${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
									<option value="017"
										${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
									<option value="018"
										${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
									<option value="019"
										${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
								</select> - <input type="text" name="tel2" value="${dto.tel2}"
									class="boxTF" maxlength="4"> - <input type="text"
									name="tel3" value="${dto.tel3}" class="boxTF" maxlength="4">
							</p>
						</td>
					</tr>
					<c:if test="${mode=='member'}">
						<tr>
							<td width="100" valign="top"
								style="text-align: right; padding-top: 15px;"><label
								style="font-weight: 900; color: #1f364d;">약관동의</label></td>
							<td style="padding: 0 0 15px 15px;">
								<p style="margin-top: 7px; margin-bottom: 5px;">
									<label><input id="agree" name="agree" type="checkbox"
										checked="checked"
										onchange="form.sendButton.disabled = !checked"> <a
										href="#">이용약관</a>에 동의합니다. </label>
								</p>
							</td>
						</tr>
					</c:if>
				</table>
				<table style="width: 100%; margin: 20px auto; border-spacing: 0px;">
					<tr height="45">
						<td align="center">
							<button class="btnJoin" type="button" name="sendButton"
								class="btn" onclick="memberOk();">${mode=="member"? "회원가입":"정보수정"}</button>
						</td>
					</tr>
					<tr height="15">
						<td align="right"><a href='<%=cp%>/'>${mode=="member"? "가입취소":"수정취소"}</a></td>
					</tr>
					<tr height="30">
						<td align="center" style="color: blue;">${message}</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</div>
