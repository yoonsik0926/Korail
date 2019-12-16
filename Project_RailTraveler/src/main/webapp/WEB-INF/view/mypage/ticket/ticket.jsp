<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 나의 승차권</span>
		</h3>
	</div>
     
     <div>
         <div style="margin-top: 20px; border-bottom: 1px solid #c9c3c3; padding-bottom: 10px;"><b>이유진</b>님의 승차권 예매 내역입니다</div>
         
         <div style="margin-top:20px;">
         	 <div style="font-size: 17px; font-weight: 600;"><i class="fas fa-calendar-alt" style="color :#283164;"></i>&nbsp;&nbsp;조회 기간 선택</div>
         	<table style="margin: 10px 0;">
         		<tr>
         			<td><button type="button" class="btn btn-default">전체</button></td>
         			<td><button type="button" class="btn btn-default">7일</button></td>
         			<td><button type="button" class="btn btn-default">15일</button></td>
         			<td><button type="button" class="btn btn-default">1개월</button></td>
         			<td><button type="button" class="btn btn-default">3개월</button></td>
         			<td><button type="button" class="btn btn-default">5개월</button></td>
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
						<th><span style="padding-left: 10px;">상품명</span></th>
						<th width="120"><span>여행 일자</span></th>
						<th width="80"><span>매수</span></th>
						<th width="100"><span>상태</span></th>
						<th width="80"><span>환불</span></th>
						<th width="80"><span>스탬프</span></th>
					</tr>
				</thead>
				<tbody style="border-bottom: 2px solid black;">
					<tr>
						<td>1</td>
						<td style="text-align: left; padding-left: 20px;">2019-12-16</td>
						<td>2020 겨울 내일로 3일권</td>
						<td>2019-12-16 ~ 2019-12-18</td>
						<td>1</td>
						<td>예매 완료</td>
						<td></td>
						<td><button type="button" class="btn btn-success" data-target="#layerpop" data-toggle="modal">스탬프</button></td>
					</tr>
					
					<tr>
						<td>1</td>
						<td style="text-align: left; padding-left: 20px;">2019-12-16</td>
						<td>2020 겨울 내일로 3일권</td>
						<td>2019-12-16 ~ 2019-12-18</td>
						<td>1</td>
						<td>결제 완료</td>
						<td><button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/ticket/ticket'">환불</button></td>
						<td></td>
					</tr>
					
					<tr>
						<td>1</td>
						<td style="text-align: left; padding-left: 20px;">2019-12-16</td>
						<td>2020 겨울 내일로 3일권</td>
						<td>2019-12-16 ~ 2019-12-18</td>
						<td>1</td>
						<td>결제 완료</td>
						<td><button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/ticket/ticket'">환불</button></td>
						<td></td>
					</tr>
					
					<tr>
						<td>1</td>
						<td style="text-align: left; padding-left: 20px;">2019-12-16</td>
						<td>2020 겨울 내일로 3일권</td>
						<td>2019-12-16 ~ 2019-12-18</td>
						<td>1</td>
						<td>결제 완료</td>
						<td><button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/ticket/ticket'">환불</button></td>
						<td></td>
					</tr>
		
				</tbody>
			</table>
         
         	<div>
         		<nav style="text-align: center;">
				<ul class="pagination">
					<li class="disabled"><span> <span aria-hidden="true">&laquo;</span>
					</span></li>
					<li class="active"><span>1 <span class="sr-only">(current)</span></span>
					</li>
					<li><span>2</span></li>
					<li><span>3</span></li>
					<li class="disabled"><span> <span aria-hidden="true">&raquo;</span>
					</span></li>
				</ul>
			</nav>
         	
         	</div>
         
         
         <!-- 모달 -->
		<div class="modal fade" id="layerpop">
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
		      <div class="modal-body" style="text-align: center;">
		      	<div style="font-size: 17px; color: white; margin: 0 auto; background: #283164; width: 350px;border-radius: 8px;padding: 3px;">
		      		<i class="fas fa-subway" style="color: white;"></i>&nbsp;&nbsp;
		      		<b>2019-12-16 ~ 2019-12-18</b>의 여행&nbsp;&nbsp;<i class="fas fa-subway" style="color: white;"></i></div>
				<div>
					<table class="table table-hover tb-board" style="padding: 0; margin: 0; font-size: 1.025em;">
         				<thead>
				         	<tr class="lbo_li lbo_legend lbo_legend_like">
								<th width="120"><span>서울역</span></th>
								<th width="120"><span>부산역</span></th>
								<th width="120"><span>대구역</span></th>
								<th width="120"><span>용산역</span></th>
							</tr>
						</thead>
						<tbody style="border-bottom: 2px solid black; height: 100px;">
							<tr>
								<td><img src="<%=cp%>/resource/images/stamp.png" style="height: 50px;"></td>
								<td></td>
								<td><img src="<%=cp%>/resource/images/stamp.png" style="height: 50px;"></td>
								<td><img src="<%=cp%>/resource/images/stamp.png" style="height: 50px;"></td>
							</tr>
						</tbody>
					</table>
				</div>
		      </div>

		    </div>
		  </div>
		</div>
         
         
         
     </div>
</div>
