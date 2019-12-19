<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

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

<c:if test="${mode=='update'}">
function confirmDelete(){
	var s = "정말 탈퇴하시겠습니까?\n\n탈퇴 후 5개월 간 회원 정보가 유지됩니다.";
	var result = confirm(s);
	var userId = "${dto.userId}";

	if(result) {
		location.href='<%=cp%>/member/deleteMember?userId='+userId;
	} else {
	}
}
</c:if>

$(function() {
    //input을 datepicker로 선언
    $('form input[name=birth]').datepicker({
    	/* calendarWeeks: true, 
        todayHighlight: true,
        autoclose: true */
    	dateFormat:"yy"+"-"+"mm"+"-"+"dd",
    	todayHighlight: true
        
    });                    
    
    //초기값을 오늘 날짜로 설정
    $('[data-toggle="datepicker"]').datepicker('setDate', 'today');           
});

</script>

<style>
.container tim-container , .mem-member {
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

.form-group {
	width: 60%;
}
</style>

<div class="mem-member">
	<div class="container tim-container"
		style="max-width: 800px; padding: 100px 0; background: #F9F0DA;">
		<div style="text-align: center; margin-bottom: 45px;">
			<img id="logoImg" alt="" src="<%=cp%>/resource/img/logo-title.png"
				style="height: 80px;">
		</div>
		<div style="text-align: center;">
			<form class="form-inline" name="memberForm" method="post">
				  <div class="form-group" style="margin:15px 0; ">
				    <label class="sr-only" for="userId" >id</label>
				    <p style="text-align: left; font-weight:600; margin-bottom: 5px; color:#334393;">UserId</p>
				  	<div class="input-group">
				      <div class="input-group-addon"><i class="far fa-id-badge" style="color:#334393; font-weight: 900;"></i></div>
				      <input type="text" class="form-control" type="text" name="userId" id="userId"
									value="${dto.userId}" onchange="userIdCheck();"
									placeholder="&nbsp;UserId">
				    </div>
				  </div>
				  
				   <div class="form-group" style="margin:15px 0; ">
				    <label class="sr-only" for="password">password</label>
				    <p style="text-align: left; font-weight:600; margin-bottom: 5px; color:#334393;">Password</p>
				  	<div class="input-group">
				      <div class="input-group-addon"><i class="fas fa-unlock" style="color:#334393;"></i></div>
				      <input type="password" class="form-control" type="text" name="userPwd"
									placeholder="&nbsp;Password">
				    </div>
				  </div>
			
				<div class="form-group" style="margin:15px 0; ">
				    <label class="sr-only" for="userPwdCheck">ConfirmPassword</label>
				    <p style="text-align: left; font-weight:600; margin-bottom: 5px; color:#334393;">Confirm Password</p>
				  	<div class="input-group">
				      <div class="input-group-addon"><i class="fas fa-lock" style="color:#334393;"></i></div>
				      <input type="password" class="form-control" type="text" name="userPwdCheck"
									placeholder="&nbsp;Confirm Password">
				    </div>
				  </div>
				  
				<div class="form-group" style="margin:15px 0; ">
				    <label class="sr-only" for="userName" >userName</label>
				    <p style="text-align: left; font-weight:600; margin-bottom: 5px; color:#334393;">Name</p>
				  	<div class="input-group">
				      <div class="input-group-addon"><i class="fas fa-user" style="color:#334393;"></i></div>
				      <input type="text" class="form-control" type="text" name="userName" id="userName"
									value="${dto.userName}"
									placeholder="&nbsp;Name">
				    </div>
				  </div>
				  
				  <div class="form-group" style="margin:15px 0; ">
				    <label class="sr-only" for="birth" >birth</label>
				    <p style="text-align: left; font-weight:600; margin-bottom: 5px; color:#334393;">Birth</p>
				  	<div class="input-group">
				      <div class="input-group-addon"><i class="fas fa-birthday-cake" style="color:#334393;"></i></div>
				      <input type="text" class="form-control" type="text" name="birth"
									value="${dto.birth}"
									readonly="readonly"
									placeholder="&nbsp;Birth">
				    </div>
				  </div>
				  
				  <div class="form-group" style="margin:15px 0; ">
				    <label class="sr-only" for="email" >email</label>
				    <p style="text-align: left; font-weight:600; margin-bottom: 5px; color:#334393;">Email</p>
				  	<div class="input-group">
				      <div class="input-group-addon"><i class="fas fa-envelope" style="color:#334393;"></i></div>
				      <div>
				      <select name="selectEmail" onchange="changeEmail();" class="selectField" style="width:23%;">
									<option value="">선 택</option>
									<option value="naver.com"
										${dto.email2=="naver.com" ? "selected='selected'" : ""}>naver.com</option>
									<option value="hanmail.net"
										${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>hanmail.net</option>
									<option value="gmail.com"
										${dto.email2=="gmail.com" ? "selected='selected'" : ""}>gmail.com</option>
									<option value="direct">직접입력</option>
								</select> 
				      <input type="text" class="form-control" type="text" name="email1"
									value="${dto.email1}" style="width:27%;"> @
					  <input type="text" class="form-control" type="text" name="email2"
									value="${dto.email2}" readonly="readonly" style="width:44%;">
									</div>
				    </div>
				  </div>
				  
				   <div class="form-group" style="margin:15px 0; ">
				    <label class="sr-only" for="tel" >tel</label>
				    <p style="text-align: left; font-weight:600; margin-bottom: 5px; color:#334393;">Tel</p>
				  	<div class="input-group">
				      <div class="input-group-addon"><i class="fas fa-mobile-alt" style="color:#334393;"></i></div>
				      	<div>
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
							</select> - 
				      		<input type="text" class="form-control" name="tel2" value="${dto.tel2}" style="width:40%;"> - 
							<input type="text" class="form-control" name="tel3" value="${dto.tel3}" style="width:40%;">
				      	</div>
				      
				    </div>
				  </div>
				  
				  <table style="width: 100%; margin: 20px auto; border-spacing: 0px;">
					<tr height="45">
						<td align="center">
							<button class="btnJoin" type="button" name="sendButton"
								class="btn" onclick="memberOk();">${mode=="member"? "회원가입":"정보수정"}</button>
						</td>
					</tr>
						<tr height="30">
							<td align="center" style="color: blue;">${message}</td>
						</tr>	
					</table>
					
					<table style="margin: 20px auto; border-spacing: 0px;">
						<tr height="15">
							<td align="right" style="padding: 0 10px;"><a href='#' style="color: red;" onclick="confirmDelete();">${mode=="member"? "":"회원 탈퇴"}</a></td>
							<td align="right" style="padding: 0 10px;"><a href='<%=cp%>/'>${mode=="member"? "가입취소":"수정취소"}</a></td>
						</tr>
					</table>
			
			</form>
				

				
		</div>
	</div>
</div>
