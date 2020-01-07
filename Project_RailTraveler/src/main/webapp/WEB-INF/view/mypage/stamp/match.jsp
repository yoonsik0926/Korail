<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
//역 선택 후스탬프 찍기
$("#stampBtn").click(function(){
	var saleNum = $('select[name="saleNum"]').val();
	if(saleNum==""){
		alert("티켓을 먼저 선택해주세요");
		return;
	}
	
	var staNum = $('input[name="choice"]:checked').val();
	if(staNum==null){
		alert("역을 먼저 선택해주세요");
		return;
	}
	
	var url = "<%=cp%>/stamp/insert";
	var query = "saleNum="+saleNum+"&staNum="+staNum;
	var fn = function(data){
		var state = data.state;
		if(state == "true"){
			$("#matchModal").modal('hide');
			location.reload();
		} else if(state == "false"){
			alert("스탬프 찍기에 실패했습니다.");
		} else if(state == "again"){
			alert("해당 역은 이미 적립된 스탬프입니다.");
		}
	};
	
	ajaxJSON(url, "post", query, fn);
	
});

</script>

<p style="font-weight: 700;">▶ 스탬프를 적립할 티켓을 선택하세요 ◀</p>
<div style="margin-bottom: 20px;">
	<select name="saleNum">
		<option class="boxTF" value="">:: 여행 시작 날짜 선택 ::</option>
		<c:forEach var="vo" items="${saleList}">
			<option class="boxTF" value="${vo.saleNum}"
				${vo.saleNum==dto.saleNum? "selected='selected'":""}>${vo.sDate}</option>
		</c:forEach>
	</select>
	

</div>

<p style="font-weight: 700;">▶ 스탬프를 적립할 역을 선택하세요 ◀</p>
<table
	style="margin: 0px auto; text-align: center; font-size: 15px; width: 100%">

	<tr
		style="background: #283164; color: white; height: 30px; font-weight: 700">
		<td width="80">선택</td>
		<td width="80">역 이름</td>
		<td width="80">지역</td>
		<td width="500">위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</td>
	</tr>
	<c:forEach var="dto" items="${matchList}">
		<tr style="border-bottom: 1px solid #d4cbcb; height: 30px;">
			<td><input type="radio" name="choice" value="${dto.staNum}"></td>
			<td>${dto.staName}</td>
			<td>${dto.locName}</td>
			<td>${dto.staAddress}</td>
		</tr>
	</c:forEach>
	<c:if test="${result == 0}">
		<tr style="border-bottom: 1px solid #d4cbcb; height: 30px;">
			<td colspan="4">현재 위치 근처의 역이 존재하지 않습니다.</td>
		</tr>
	</c:if>
</table>

<div style="text-align: center; margin-top: 20px;">
	<button class="btn btn-danger" id="stampBtn" type="submit">스탬프 찍기</button>
</div>
