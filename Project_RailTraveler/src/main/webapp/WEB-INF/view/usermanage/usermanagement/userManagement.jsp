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
<script type="text/javascript">
function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
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

function searchList() {
	var f=document.searchForm;
 	f.action = "<%=cp%>/member/totalList";
	f.submit();		
}

function restrictId(userId) {

		var result = confirm("해당 계정을 활성화 시키겠습니까?");
	
	if(result){
		var url = "<%=cp%>/member/loginfailbyCount";
		var query = "userId="+userId;
		
		var fn = function(data) {
			if(data.state=='true'){
					alert("아이디 활성화 완료")				
			}else{
				alert("사용자 아이디 활성화 실패!!")
			}
		}
		
		ajaxJSON(url, "get", query, fn);

	}
}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container tim-container"
		style="max-width: 1500px; padding-top: 30px; margin: 0px auto;">


		<div class="body-content-container">
			<div class="container"
				style="margin: 20px auto; margin-bottom: 50px; width: 100%">

				<div id="singoForm" class="sir_lbo"
					style="padding: 0; margin: 0; font-size: 1.025em; display: block">


					<table class="table table-hover tb-board"
						style="padding: 0; margin: 0; font-size: 1.025em; text-align: center;">
						<thead style="text-align: center">
							<tr>

								<td width="200" colspan="8"
									style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">





								<span id="searchCount"
									style="display: block; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">총 가입자 수 : 
										<span style="color: #ca4a0d;">${dataCount} </span> 
										<!-- <img alt="" src="/Project_RailTraveler/resource/images/close_icon.png"
										onclick="reset()" style="background: #dadada; width: 20px; padding: 3px; cursor: pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;"> -->
								</span>
									<form name="searchForm"
										style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
										<select name="condition" class="boxTF"
											style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
											<option value="all"
												${condition=="all"?"selected='selected'":""}>모두</option>
											<option value="created"
												${condition=="created"?"selected='selected'":""}>가입 날짜</option>
											<option value="name"
												${condition=="name"?"selected='selected'":""}>이름</option>
											<option value="userId"
												${condition=="userId"?"selected='selected'":""}>사용자 ID</option>										
										</select> <input id="keyword" type="text" name="keyword"
											value="${keyword}" class="boxTF"
											style="display: inline-block; height: 100%; width: 58%;">
										<img src="<%=cp%>/resource/images/magnifying-glass.png"
											class="" onclick="searchList();"
											style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
									</form>
								</td>
							</tr>
							<tr class="lbo_li lbo_legend lbo_legend_like">
								<th width="50" style="padding-left: 1.5%;">번호</th>
								<th width="100"><span>ID</span></th>
								<th width="100"><span style="padding-left: 10px;">이름</span></th>
								<th width="170"><span>이메일</span></th>
								<th width="150"><span style="padding-left: 10px;">전화번호</span></th>
								<th width="150"><span>가입날짜</span></th>
								<th width="150"><span>상태</span></th>
								<th width="130"><span>비고</span></th>
							</tr>
						</thead>
						<tbody style="border-bottom: 2px solid black;">
							<c:forEach var="dto" items="${totalUserList}">
								<c:if test="${dto.userId !='admin'}">
								<tr>
									<td>${dto.userNum}</td>
									<td>${dto.userId}</td>
									<td>${dto.userName}</td>
									<td>${dto.email}</td>
									<td>${dto.tel}</td>
									<td>${dto.registration_date}</td>
									<c:choose>
										<c:when test="${dto.enabled==0}">
										<td style="color: tomato;font-weight: 700">로그인 5회오류</td>
										<td>
										<button class="btn" onclick="restrictId('${dto.userId}');">계정 활성화</button>
										</td> 
										</c:when>
										
										<c:when test="${dto.enabled==2}">
										<td  style="color: red; font-weight: 700">신고 접수 상태</td>
										<td>
										<button class="btn" onclick="location.href='<%=cp%>/singo/userManagment?mode=userManagment'">신고현황보기</button>
										</td> 
										</c:when>
										
										<c:otherwise>
										<td>정상 계정</td>
										<td>
										&nbsp;
										</td> 
										</c:otherwise>
									
									</c:choose>
									
			
								</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>

					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
						<tr height="35">
							<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging}</td>
						</tr>
					</table>
				</div>

			</div>


		</div>
	</div>
</body>
</html>