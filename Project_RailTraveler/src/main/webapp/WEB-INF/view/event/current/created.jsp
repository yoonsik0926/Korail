<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

jQuery(document).ready(function() {

    jQuery("#startDate, #endDate").datepicker();
    
    // jQuery UI Datepicker 한글 변환
    jQuery.datepicker.regional['ko'] = {
          closeText : "닫기"
        , prevText : ""
        , nextText : ""
        , currentText : "오늘"
        , monthNames : ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
        , monthNamesShort : ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
        , dayNames : ["일", "월", "화", "수", "목", "금", "토"]
        , dayNamesShort : ["일", "월", "화", "수", "목", "금", "토"]
        , dayNamesMin : ["일", "월", "화", "수", "목", "금", "토"]
        , weekHeader : "Wk"
        , dateFormat : "yy-mm-dd"
        , firstDay : 0
        , isRTL : false
        , yearSuffix : "&nbsp;년"
        , showMonthAfterYear : true
        , changeMonth : true
        // , changeYear : true
        // , autoSize : true
   
        , beforeShow:function(input) {
            var position = jQuery(input).position();
            setTimeout(function() {
                jQuery("#ui-datepicker-div").css({"left":position.left});
           })
        }
    };
    jQuery.datepicker.setDefaults(jQuery.datepicker.regional['ko']);
});

	function inputDateComparison(obj) {

    // 날짜 입력 엘리먼트 ID는 startDate(시작일), endDate(종료일)로 동일해야 한다.
    var startDate = inputDateSplit(document.getElementById("startDate").value);    // 시작일
    var endDate = inputDateSplit(document.getElementById("endDate").value);        // 종료일
    
    var objDate = inputDateSplit(obj.value);    // 입력한 엘리먼트의 일자
    // 입력일을 확인하는 이유는 현재 작성한 일자가 시작일인지 종료일인지 확인하기 위해서이다.
   
    if(startDate == objDate && startDate > endDate) {

        alert("시작일이 종료일보다 이 후 일수는 없습니다.\n다시 선택하여 주시기 바랍니다.");
        obj.value = document.getElementById("endDate").value;
        obj.focus();
    } else if(endDate == objDate && endDate < startDate) {

        alert("종료일이 시작일보다 이 전 일수는 없습니다.\n다시 선택하여 주시기 바랍니다.");
        obj.value = document.getElementById("startDate").value;
        obj.focus();
    } else {
        return false;
    }
}

	// 날짜형식에 "-"이 사용된 경우에 한하여 날짜값에서 "-" 기호를 제거한다.
	function inputDateSplit(obj) {



    var dateArray = obj.split("-");
    return dateArray[0] + dateArray[1] + dateArray[2];
}
	
	function sendBoard() {
        var f = document.boardForm;
    	
        f.action = "<%=cp%>/event/${mode}";

        f.submit();
  }	
    
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

 .datePicker {
        text-align:center;
        width:80px;    
    }

</style>
<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> ${mode=='update'?'이벤트 수정':'이벤트 등록'}</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		
		<form name="boardForm" method="post">
			
			<table style="width: 100%; margin: 20px auto 5px; border-spacing: 0px;">
				<tr>
					<td style="text-align: right;">
					<button type="reset" class="btn btn-default"  style="
    					padding: 6px 6px; border-radius: 5px;" onclick="resetContent(this);">
    					<img alt="" src="<%=cp%>/resource/images/resetIcon1.png" style="width: 20px;"> 
    				</button>
					</td>
				</tr>
			</table>
					
			<table class="tb-created">
				<tr class="tb-row">
					<td width="100" class="tb-title">제&nbsp;&nbsp;목</td>
					<td class="tb-content"><input type="text" name="name"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.name}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">시작일</td>
					<td class="tb-content">
						 <input type="text" class="datePicker" id="startDate" name="sdate" onChange="inputDateComparison(this);" value=""/>
    				</td>
				</tr>
				
				<tr class="tb-row">
					<td width="100" class="tb-title">종료일</td>
					<td class="tb-content">
						 <input type="text" class="datePicker" id="endDate" name="edate" onChange="inputDateComparison(this);" value=""/>
					</td>
				</tr>
				
				<tr class="tb-row">
					<td width="100" class="tb-title" style="padding-top: 5px;"
						valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td valign="top" style="padding: 5px 1% 5px 10px;">
						<textarea name="content" rows="12" class="boxTA" style="width:100%;">${dto.content}</textarea>
					</td>
				</tr>
				
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; text-align: center;">
				<tr>
					<td>
					<button type="button" class="btn btn-default" style="padding: 6px 20px;"
							onclick="javascript:location.href='<%=cp%>/event/current';">${mode=='update'?'수정취소':'등록취소'}</button>
						
						<button type="submit" class="btn btn-danger" onclick="sendBoard();" style="margin-left: 5px;"><img alt="" src="<%=cp%>/resource/images/check-mark.png" style="width: 15px;"> ${mode=='update'?'수정완료':'작성완료'}</button>
						
						<c:if test="${mode =='update'}">
							<input type="hidden" name="num" value="${dto.num}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
