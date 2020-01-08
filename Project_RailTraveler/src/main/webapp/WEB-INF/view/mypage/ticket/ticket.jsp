<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

//검색 페이징
$(function(){
	   $('.btnDate').click(function(){
		   var keyword = $(this).val();
		   var url = "<%=cp%>/ticket/ticket?keyword="+keyword;
		   
		   location.href = url;
	   });
});

//스탬프 목록
$(function(){
	$('.tstampBtn').click(function(){
		var saleNum = $(this).val();
		console.log(saleNum)
		var url = "<%=cp%>/ticket/stamp";
		var query = "saleNum="+saleNum;
		var selector = "#tstampList";
		
		ajaxHTML(url, "get", query, selector);
		
		$("#tstampModal").modal('show');

	});
});

</script>


<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 나의 승차권</span>
		</h3>
	</div>
     
     <div>
         <div style="margin-top: 20px; border-bottom: 1px solid #c9c3c3; padding-bottom: 10px;"><b>${sessionScope.member.userName}</b>님의 승차권 예매 내역입니다</div>
         
         <div style="margin-top:20px;">
         	 <div style="font-size: 17px; font-weight: 600;"><i class="fas fa-calendar-alt" style="color :#283164;"></i>&nbsp;&nbsp;조회 기간 선택</div>
         	<table style="margin: 10px 0;">
         		<tr>
         			<td><button type="button" id="date1" class="btn btn-default btnDate" value="all">전체</button></td>
         			<td><button type="button" id="date2" class="btn btn-default btnDate" value="7days">7일</button></td>
         			<td><button type="button" id="date3" class="btn btn-default btnDate" value="15days">15일</button></td>
         			<td><button type="button" id="date4" class="btn btn-default btnDate" value="1month">1개월</button></td>
         			<td><button type="button" id="date5" class="btn btn-default btnDate" value="3month">3개월</button></td>
         			<td><button type="button" id="date6" class="btn btn-default btnDate" value="5month">5개월</button></td>
         			<td>
         		</tr>
         	</table>
         </div>
         
         <table class="table table-hover tb-board"
				style="padding: 0; margin: 0; font-size: 1.025em;">
         	<thead>
         	<tr class="lbo_li lbo_legend lbo_legend_like">
						<th width="75" style="padding-left: 1.5%;">번호</th>
						<th width="120"><span>예매일</span></th>
						<th width="120"><span>분기</span></th>
						<th><span style="padding-left: 10px;">상품명</span></th>
						<th width="200"><span>여행 일자</span></th>
						<th width="80"><span>매수</span></th>
						<th width="100"><span>상태</span></th>
						<th width="80"><span>환불</span></th>
						<th width="80"><span>스탬프</span></th>
					</tr>
				</thead>
				<tbody style="border-bottom: 2px solid black;">
					<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.listNum}</td>
						<td style="padding-left: 20px;">${vo.created}</td>
						<td>${vo.year}&nbsp;&nbsp;${vo.division}</td>
						<td>${vo.tName}</td>
						<td>${vo.sDate} ~ ${vo.eDate}</td>
						<td>1</td>
						<td>예매 완료</td>
						<td><button type="button" class="btn btn-danger">환불</button></td>
						<td><button type="button" class="btn btn-success tstampBtn" value="${vo.saleNum}">스탬프</button></td>
					</tr>
					</c:forEach>
					
		
				</tbody>
			</table>
         
         	<div>
         		<nav style="text-align: center;">
					<ul class="pagination">
						<li>${dataCount==0?"내일로 티켓 구매 내역이 없습니다.":paging}</li>
					</ul>
				</nav>
         	</div>
         
         
         <!-- 모달 -->
		<div class="modal fade" id="tstampModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- header -->
		      <div class="modal-header">
		        <!-- 닫기(x) 버튼 -->
		        <button type="button" class="close" data-dismiss="modal">×</button>
		        <!-- header title -->
		        <h4 class="modal-title" style="text-align: center;font-weight: 900;margin-top: 20px;">스탬프 내역</h4>
		      </div>
		      <!-- body -->
		      <div class="modal-body" id="tstampList"  style="text-align: center;">
		      	
		      </div>

		    </div>
		  </div>
		</div>
         
         
         
     </div>
</div>
