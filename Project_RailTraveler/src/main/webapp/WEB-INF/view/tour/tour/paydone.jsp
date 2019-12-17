<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="body-content-container">

<div class="box1" style="width: 85%; margin: 20px auto; border: 3px solid #eeeeee; ">
	
		<h3 align="center" style="font-weight: 700;margin-top: 80px;">결제가 완료되었습니다!<br>${msg}</h3>
			

		<!--상단 메뉴-->
		<div class="box1" style="margin-top: 20px; width: 85%;margin: 20px auto;" >
		
			
			
		
		
		
				<div style="margin: 60px auto;">
					
					<p style="font-size: 20px; font-weight: 900">
						Rail Travler에서 결제하신 내용입니다.
					</p>
					</br>
					
					<p style="font-size: 15px; font-weight: 700">
						고객명 : 김*식님
					</p>
					
					<p style="font-size: 15px; font-weight: 700">
						주문번호	2019121641078171
					</p>
					
					<p style="font-size: 15px; font-weight: 700">
						주문일자	2019.12.16 17:46
					</p>
				</div>
		

		
						<h3 align="left" style="font-weight: 700">주문/배송 상세정보</h3>
			<div  class="box1" style="width: 100%; border: 3px solid #eeeeee; margin-top: 20px; padding: 10px 10px 10px 10px; ">
				<p align="center" style="font-size: 20px; float: left">주문일자 : 2019.10.10&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;주문번호 : 1231548857</p>
				&nbsp;&nbsp;&nbsp;&nbsp;<button>재구매</button>
			</div>
			
		<!--결제 상품 보기-->
		<div class="box1" style="margin-top: 20px;">
			<div class="box1" style="width: 100%; border: 1px solid #eeeeee; border-top: 2px solid black; align-content: center">

				<table style="font-size: 15px;" >
				<tr height="30px" align="center" style="border-bottom: 1px solid #eeeeee; ">
				<td width="200px">상품주문번호</td>
				<td width="500px">상품명</td>
				<td width="200px">상품금액</td>
				<td width="200px">진행상태</td>
				</tr>

				<tr height="150px" align="center">
				<td width="200px" style="font-size: 13px">1231548857</td>
				<td width="500px"style="font-size: 13px">코레일 내일로 7일권</td>
				<td width="200px"style="font-size: 13px">69000원</td>
				<td width="200px"style="font-size: 13px">결제준비</td>				
				</tr>
				
				
				</table>
			</div>

		</div>
		
		<!--장소 설명-->
		<div class="box1" style="margin-top: 20px;">
			<div class="box1"
				style="width: 93%; border: 1px solid #eeeeee; align-content: center">

				<div class="col"style="font-size: 20px; font-weight: 600; margin-top: 10px; margin-left: 10px">

					<p>
						상품 금액 : 69000원
					</p>
					<p>
						할인 금액 : 0원
					</p>
					
					<p>
						결제 수단 : 카드
					</p>
					
					<p style="font-size: 23px; font-weight: 900">
						총 결제 금액 : 69000원
					</p>
				</div>
			</div>
		</div>
		<div style="margin: 60px auto; width: 33%">
			<button class="btn">메인으로 가기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn">마이페이지</button>
		</div>
	

		</div>

		

		</div>

	</div>	


</body>
</html>