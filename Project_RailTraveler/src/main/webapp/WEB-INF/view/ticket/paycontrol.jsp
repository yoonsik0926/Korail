<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<%-- <%
    String name = "김윤식";//(String)request.getAttribute("name");
    String email = "yoonsik0926@naver.com";//(String)request.getAttribute("email");
    String phone = "01084727476";//(String)request.getAttribute("phone");
    String address = "서울시 양천구 신월로 20길 7";//(String)request.getAttribute("address");
    int totalPrice = 1;//(int)request.getAttribute("totalPrice");    
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp68825719'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var query;
         
        
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : '${dto.ticketNum}'+'Rt-' + new Date().getTime(),
            name : 'Rail Traveler 결제',
            amount : 100,//'${dto.tprice}',
            buyer_email : '${dto.email}',
            buyer_name : '${dto.userName}',
            buyer_tel : '${dto.tel}',
            buyer_addr : '-',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
			
            if (rsp.success) {
            	
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "<%=cp%>/ticket/complete", 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                    	pay_method :rsp.pay_method,
                        imp_uid : rsp.imp_uid,
                        merchant_uid :rsp.merchant_uid,
                        apply_num :rsp.apply_num,
                        tprice :rsp.paid_amount,
                		ticketNum : '${dto.ticketNum}',
                		userNum : '${dto.userNum}',
                		sDate :'${dto.sDate}',
                		eDate : '${dto.eDate}'
                        //기타 필요한 데이터가 있으면 추가 전달
           			   }
	                }).done(function(data) {
	                	if (data.check) {	                			                
	                        //성공시 이동할 페이지
        					query = "merchant_uid="+rsp.merchant_uid;
	                		location.href='<%=cp%>/ticket/paydone?'+query;
	                    } else {
	                    	location.href='<%=cp%>/ticket/payfail?saleNum='+data.saleNum; 
		                   	 //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                    }

	                });


                 }else {
                	 msg = '결제에 실패하였습니다.';
                     msg += '에러내용 : ' + rsp.error_msg;
                     //실패시 이동할 페이지
                     location.href="<%=cp%>/main";   
                     alert(msg);
            
            }
    });
        
    });    
    
    </script>
 
</body>
</html>
