<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<link rel="stylesheet"href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"type="text/css">
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>


<script type="text/javascript">
	$(function() {
		//input을 datepicker로 선언
		$('[data-toggle="datepicker"]').datepicker({
			calendarWeeks : true,
			todayHighlight : true,
			autoclose : true
		});

		//초기값을 오늘 날짜로 설정
		$('[data-toggle="datepicker"]').datepicker('setDate', 'today');
		
	});
	
	
	
	$("#startdatepicker").datepicker({ onSelect: function(dateText) {  

		alert("Selected date: " + dateText + "; input's current value: " + this.value);
		  }
		});




	
	
	

	
		
</script>


<div class="body-content-container container tim-container" style="max-width: 1200px; padding-top: 50px">

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
			<table style=" width: 100%; height: 30%;  border-spacing: 20px;  border-collapse: separate;">
			
			<tr  height="100px">
			<td ><img  style="max-width: 100%; height: auto;"src="<%=cp%>/resource/img/carousel_green.png" /></td>
			<td ><img  style="max-width: 100%; height: auto;"src="<%=cp%>/resource/img/carousel_green.png" /></td>
			<td ><img  style="max-width: 100%; height: auto;"src="<%=cp%>/resource/img/carousel_green.png" /></td>
			</tr>
			
			<tr >
			<td align="center" ><input type="radio" name="jb-radio" id="jb-radio-3" ></td>
			<td align="center" ><input type="radio" name="jb-radio" id="jb-radio-5" ></td>
			<td align="center" ><input type="radio" name="jb-radio" id="jb-radio-7" ></td>
			</tr>
			</table>
		</div>

		<div class="form-group" style="margin: 15px 0;">		
			<p style="text-align: left; font-weight: 600; margin-bottom: 5px; color: #334393;">출발 날짜</p>
			<div class="input-group">

				<input type="text" class="form-control" type="text" name="birth" 
				id="startdatepicker" value="${dto.birth}" placeholder="&nbsp;Birth"
				data-toggle="datepicker">
			</div>
		</div>
		
		
		
		
		<div class="form-group" style="margin: 15px 0;">			
			<p style="text-align: left; font-weight: 600; margin-bottom: 5px; color: #334393;">마지막 날짜</p>
			<div class="input-group">

				<input type="text" class="form-control" type="text" name="birth"
					id="enddatepicker" value="${dto.birth}" placeholder="&nbsp;Birth"
					data-toggle="datepicker">
			</div>
		</div>
	</div>
</div>
