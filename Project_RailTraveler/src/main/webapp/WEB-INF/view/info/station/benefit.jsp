<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
	
<script type="text/javascript">
function sendOk() {
    var f = document.benefitForm;
	
    var category = document.getElementById("tourCategory");				
	var cateNum = category.options[category.selectedIndex].value;

    var str = f.tourCategory.value;
    if(!str){
    	 alert("카테고리를 선택하세요 ");
         f.tourCategory.focus();
         return;
    }
    
	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요.");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요.");
        f.content.focus();
        return;
    }
    
    str = f.sDate.value;
    if(!str) {
        alert("시작일을 입력하세요.");
        f.sDate.focus();
        return;
    }
    
    str = f.eDate.value;
    if(!str) {
        alert("시작일을 입력하세요.");
        f.eDate.focus();
        return;
    }
    
    var query = "staNum=${staNum}&locNum=${locNum}&page=${page}&cateNum="+cateNum;
    
	f.action="<%=cp%>/station/benefit/${mode}?"+query;

    f.submit();
}
 

$(function() {
    //input을 datepicker로 선언
    $('form input[name=sDate]').datepicker({
    	dateFormat:"yy"+"-"+"mm"+"-"+"dd",
    	todayHighlight: true,
    	showMonthAfterYear: true,
    	changeYear: true, 
    	changeMonth: true       
        
    }); 
    
    $('form input[name=eDate]').datepicker({
    	dateFormat:"yy"+"-"+"mm"+"-"+"dd",
    	todayHighlight: true,
    	showMonthAfterYear: true,
    	changeYear: true, 
    	changeMonth: true       
        
    }); 
    
    //초기값을 오늘 날짜로 설정
    $('[data-toggle="datepicker"]').datepicker('setDate', 'today');           
});



</script>
<style type="text/css">
.tb-row {
	text-align: left;
	height: 50px;
	border-bottom: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
}

.tb-title {
	text-align: center;
	background: #f7f9ff;
}

.tb-content {
	text-align: left;
	padding: 5px 1% 5px 10px;
}

.tb-created {
	width: 100%;
	margin: 0px auto 5px;
	border-spacing: 0px;
	border-collapse: collapse;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

input[type=text], input[type=file] {
	width: 100%; border : 1px solid #ccc;
	border-radius: 2px;
	border: 1px solid #ccc;
}
</style>
<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> ${mode=='update'?'역 별 혜택 - 수정':'역 별 혜택  - 추가'}</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<form name="benefitForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
			<table style="width: 100%; margin: 20px auto 5px; border-spacing: 0px;">
				<tr>
					<td style="text-align: right;">
						<button type="reset" class="btn btn-default"
						  style="padding: 6px 6px;border-radius: 5px;" onclick="resetContent(this);"><img alt="" src="<%=cp%>/resource/images/resetIcon1.png" style="width: 20px;"> </button>
					</td>
				</tr>
			</table>
					
			<table class="tb-created">
				<tr class="tb-row">
				<td width="100" class="tb-title" style="padding-top: 5px; text-align: center;"
						 colspan="2" >혜&nbsp;&nbsp;&nbsp;&nbsp;택</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title" style="padding-top: 5px;">구&nbsp;&nbsp;&nbsp;&nbsp;분</td>
					<td style="padding: 5px 1% 5px 10px;">
						<select name="tourCategory" id="tourCategory">
						<option class="boxTF" value="">:: 카테고리 선택 ::</option>
						<c:forEach var="vo" items="${tourCategory}">
							<option class="boxTF" value="${vo.cateNum}" ${vo.cateNum==dto.cateNum? "selected='selected'":""}>${vo.cateName}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td class="tb-content"><input type="text" name="subject"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.subject}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td class="tb-content">
						<textarea name="content" id="content" style="width:95%; height: 100px;">${dto.content}</textarea>
					</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">시작일</td>
					<td class="tb-content"><input type="text" name="sDate"
						maxlength="100" class="boxTF" style="padding: 5px 5px;" readonly="readonly"
						value="${dto.sDate}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">종료일</td>
					<td class="tb-content"><input type="text" name="eDate"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.eDate}"></td>
				</tr>

			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;text-align: center;">
				<tr>
					<td>
					<button type="button" class="btn btn-default" style="padding: 6px 20px;"
							onclick="javascript:location.href='<%=cp%>/station/info';">${mode=='update'?'수정취소':'등록취소'}</button>
						
						<button type="button" onclick="sendOk();" class="btn btn-danger" style="margin-left: 5px;"><img alt="" src="<%=cp%>/resource/images/check-mark.png" style="width: 15px;"> ${mode=='update'?'수정완료':'작성완료'}</button>
						
						<input type="hidden" name="staNum" value="${staNum}">
						<input type="hidden" name="locNum" value="${locNum}">
						<c:if test="${mode=='update'}">
							<input type="hidden" name="beneNum" value="${dto.beneNum}">
						</c:if>
						
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
