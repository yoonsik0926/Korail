<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<link rel="stylesheet"
	href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"type="text/css">
<script type="text/javascript"src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript"src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<style>
.form-control[readonly] {
	cursor: pointer;
	background: white;
	text-align: center;
}
</style>

<script type="text/javascript">


//date객체 YYYY-MM-DD 변환함수
function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

$(function() {
	var ticketday;
	
    $("input[name=jb-radio]").change(function() {
    	ticketday=0;
  	  //라디오 값 가져오기
        var radioVal = $('input[name="jb-radio"]:checked').val();
        
        //일수와 가격을 나누기
        var value = radioVal.split("-"); 
        	
        	ticketNum = value[0];
        	ticketday=value[1];
        	tprice = value[2];
        	
        	
        	tName = value[3];
        	
			$("#ticketprice").val(tprice);		
			$("#ticketNum").val(ticketNum);		
			
			$("#aaa").text("선택한 티켓 : 코레일 티켓 "+tName);
			$("#bbb").text("티켓 가격 : "+tprice+"원");
			

  		});
	

	$("#startdatepicker").datepicker(
			{
				onSelect : function(dateText) {
					
					var split = dateText.split("-");  
					var year =split[0];
					var month = split[1];
					var day = split[2];
					
					var period = parseInt(ticketday)-1;
					
					var edate = new Date(year,month-1,day);
																			
					edate.setDate(edate.getDate() + period); //ticketday일 더하여 setting								
					var e= dateToYYYYMMDD(edate);
															
					$( "#enddatepicker" ).val(e);
					

				}
			});
});
	

 
 $(document).ready(function(){



	});
 </script>
<script type="text/javascript">
function paymemberOk() {
	var f = document.payInfoForm;
	var str;

	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

   
    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email.focus();
        return;
    }

   

 	f.action = "<%=cp%>/ticket/purchaseticket";

		f.submit();
	}
</script>

<div class="body-content-container container tim-container"
	style="max-width: 1200px; padding-top: 50px">

	<div class="page-three-title mt40">
		<div class="box1" style="width: 100%; border: 2px solid #eeeeee">
			<!--상단 메뉴-->
			<div style="margin-top: 20px">
				<div style="width: 93%; margin-top: 10px;">
					<h3 align="center">코레일 티켓 발권하기</h3>
				</div>
			</div>
		</div>
	</div>



	<div>
		<div>
			<table
            style="width: 100%; height: 40%; border-spacing: 20px; border-collapse: separate;">
		
            <tr height="100px">
            <c:forEach var="dto" items="${list}">
               <td><img style="max-width: 100%; height: auto;"
                  src="<%=cp%>/resource/img/carousel_green.png" /></td>
            </c:forEach>
            </tr>
          

            <tr>
            <c:forEach var="dto" items="${list}">
					<td align="center"><input type="radio" value="${dto.ticketNum}-${dto.tDays}-${dto.tprice}-${dto.tName}" name="jb-radio" 
					id="jb-radio-${dto.ticketNum}"></td>			
				</c:forEach>
            </tr>
         </table>
		</div>

		<div style="padding-bottom: 50px; width: 50%; margin: 20px auto;">
			<div class="form-group" style="margin: 15px 0; float: left">
				<p
					style="text-align: center; font-weight: 600; margin-bottom: 5px; color: #334393;">시작
					날짜</p>
				<div class="input-group">

					<input type="text" class="form-control" type="text" name="birth"
						id="startdatepicker" value="${dto.birth}" placeholder="시작 날짜를 선택해주세요" readonly="readonly">
				</div>
			</div>


			<div class="form-group" style="margin: 15px 0; float: right">
				<p
					style="text-align: center; font-weight: 600; margin-bottom: 5px; color: #334393;">마지막
					날짜</p>
				<div class="input-group">

					<input type="text" class="form-control" type="text" name="birth"
						id="enddatepicker" placeholder="마지막 날짜" value="${dto.birth}" readonly="readonly">
				</div>
			</div>
		</div>

		<div>
			<!--선택 정보-->

			<div class="box1"
				style="padding-right: 10px; float: left; width: 45%; margin-bottom: 100px">
				<h3 align="left" style="margin-top: 30px">선택정보</h3>
				<div class="box1"
					style="width: 100%; border: 1px solid #eeeeee; margin: 10px auto;">

					<div class="col"
						style="font-size: 18px; font-weight: 600; margin-top: 10px; margin-left: 10px">
						<p id="aaa">티켓을 선택해주세요</p>

						<p id="bbb"></p>
					</div>
				</div>

				<div class="box1"
					style="width: 100%; height: 200px; border: 1px solid #eeeeee; margin: 10px auto;">
					<img style="width: 100%; height: 100%;"
						src="<%=cp%>/resource/img/advertisement.jpg" />

				</div>

			</div>

			<!--구매자 정보-->
			<div class="box1"
				style="padding-left: 10px; float: right; width: 55%;">
				<h3 align="left" style="margin-top: 30px">결제 정보</h3>
				<div class="box1"
					style="margin: 10px auto; width: 100%; border: 1px solid #eeeeee;">



					<form class="form-horizontal" name="payInfoForm" method="post">


						<div class="form-group" style="margin: 30px auto;">
							<label for="inputinputName" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName"
									name="userName" placeholder="Name" style="width: 90%">
							</div>
						</div>


						<div class="form-group" style="margin: 30px auto;">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="Email" style="width: 90%">
							</div>
						</div>



						<div class="form-group" style="margin: 30px auto;"
							style="float: left">
							<label for="inputEmail3" class="col-sm-2 control-label">Tel</label>

							<div style="float: left; padding-left: 15px;">
								<input type="email" class="form-control" id="tel1" name="tel1"
									placeholder="Tel" style="width: 100px">
							</div>
							<div style="float: left; margin: 0px 10px;">_</div>
							<div class="" style="float: left">
								<input type="email" class="form-control" id="tel2" name="tel2"
									placeholder="" style="width: 142px">
							</div>

							<div style="float: left; margin: 0px 10px;">_</div>
							<div class="" style="float: left">
								<input type="email" class="form-control" id="tel3" name="tel3"
									placeholder="" style="width: 142px">
							</div>
						</div>
						
						<input type="hidden"  id="ticketprice" value="0" name="tprice"> 
						<input type="hidden"  id="ticketNum"  name="ticketNum">

						<div class="form-group">
							<div align="center">
								<button type="button" class="btn" onclick="paymemberOk();">
									카카오페이 결제</button>
							</div>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>
</div>
