

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
	<link href="<%=cp%>/resource/css/commu.css" rel="stylesheet" />

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

function searchList(option) {
	if(option == 'singo'){
	var f=document.searchForm;
	var targetTitle =$("select[name=category]").val();
 	f.action = "<%=cp%>/singo/singo?mode=singo&targetTitle="+targetTitle; 
	f.submit();
	}
	else if(option =='userManagment'){
		var f=document.userListForm;
		var targetTitle =$("select[name=userListsearch]").val();
	 	f.action = "<%=cp%>/singo/userManagment?mode=userManagment"; 
		f.submit();
	}
	
}


//메뉴를 조절하는 에이작스
$(function(){
	
	$("select[name=category]").change(function(){
			
		var targetTitle = $(this).val();
		
		var url = "<%=cp%>/singo/singo?targetTitle="+targetTitle+"&mode=singo";
		
		location.href= url;
});
	});
	
$(function(){
	$("ul.tabs li").on("click",function(){
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		
		if(tab ==1){		
			var url = "<%=cp%>/singo/userManagment?mode=userManagment"
			location.href=url;	
		}else{		
			var url = "<%=cp%>/singo/singo?mode=singo";
			location.href= url;		
		}

	});
	
	


});


function restrictId(targetUserId, userState) {
	
	
	if(userState =='unabled'){
		var result = confirm("해당 아이디 사용 정지시키겠습니까?");
	}else{
		var result = confirm("해당 아이디의 비활성화를 푸시겠습니까?");
	}


	
	if(result){
		var url = "<%=cp%>/singo/restrictUserId";
		var query = "targetUserId="+targetUserId+"&userState="+userState;
		
		var fn = function(data) {
			if(data.state=='true'){
				if (userState =='unabled') {
					alert("아이디 비활성화 완료")
				}else{
					alert("아이디 활성화 완료")
				}
				
			}else{
				alert("사용자 아이디 정지 실패!!")
			}
		}
		
		ajaxJSON(url, "get", query, fn);

	}
}
</script>

<style type="text/css">

.nonscroll::-webkit-scrollbar { 

    display: none; 

}

.carousel {
	background: white;
}

.carousel-cell {
	width: 25%;
	height: 300px;
	margin-right: 10px;
	/* margin-top: 22.5px; */
	margin-bottom: 22.5px;
	background: #ED2;
	border-radius: 5px;
	counter-increment: carousel-cell;
}

.carousel-cell.is-selected {
	background: #ED2;
}

/* cell number */
.carousel-cell:before {
	display: block;
	text-align: center;
	line-height: 200px;
	font-size: 80px;
	color: white;
}

.fPlan {
	width: 100%;
	height: 300px;
	margin-right: 10px;
	margin-bottom: 22.5px;
	border-radius: 5px;
}

.sample_image  img {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.sample_image:hover img {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}

a {
	color: #484848;
}

.img-button {
	background: transparent;
	border: none;
	width: 30px;
	height: 30px;
	cursor: pointer;
	outline: 0;
}
</style>


<div class="container tim-container"
		style="max-width: 1500px; padding-top: 30px ; margin: 0px auto;">
		

<div class="body-content-container">
		<div class="container" style="margin:20px auto; margin-bottom:50px; width: 93%">
			<div class="row" style="width: 100%; margin: 10px auto;">
				<div class="col" style="font-size: 18px; font-weight: 600;">
					<ul class="nav nav-tabs tabs" style="width: 100%; cursor: pointer;">
						
						<li class="nav-item " style="width: 130px; margin: 0 auto; "
						id="tab-0" data-tab="0"><a
							style="text-align: center;" class="nav-link "
							id="1st" >신고목록</a></li>					

						<li class="nav-item " style="width: 130px; margin: 0 auto;"
						id="tab-1" data-tab="1"><a
							style="text-align: center" class="nav-link "
							id="2st">유저관리</a></li>

					</ul>
				</div>
			</div>
		


	<c:choose>
	<c:when test="${mode=='singo'}">
	
		<div id="singoForm"  class="sir_lbo" style="padding: 0; margin: 0; font-size: 1.025em; display: block">

		
		<table class="table table-hover tb-board" style="padding: 0; margin: 0; font-size: 1.025em; text-align: center;">
			<thead style="text-align: center">
				<tr>

				<td width="200" colspan="6" style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
				
				
					<select name="category" class="boxTF"
								style="border-radius: 3px; width: 15%; height: 100%; border-left: 0;">
					<optgroup label="투어리스트">
   	 					<option label="댓글" value="tourreply" ${targetTitle=="tourreply"?"selected='selected'":""}>댓글</option>
 					 </optgroup>
 					 
 					<optgroup label="묻고답하기">
    				<option  value="qna" ${targetTitle=="qna"?"selected='selected'":""}>게시판</option>
   					 <option value="qnareply" ${targetTitle=="qnareply"?"selected='selected'":""}>댓글</option>
  					</optgroup>
 					 
 					<optgroup label="자유게시판">
    				<option value="board" ${targetTitle=="board"?"selected='selected'":""}>게시판</option>
   					 <option value="boardreply" ${targetTitle=="boardreply"?"selected='selected'":""}>댓글</option>
  					</optgroup>
  					
  					 <optgroup label="동행구하기">
    				<option value="friend" ${targetTitle=="friend"?"selected='selected'":""}>게시판</option>
   					 <option value="friendreply"${targetTitle=="friendreply"?"selected='selected'":""}>댓글</option>
  					</optgroup>
					</select>
				
	
					<span id="searchCount" 	style="display: none; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
					<span style="color: #ca4a0d;">3569건 </span> <img alt="" src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
					style="background: #dadada; width: 20px; padding: 3px; cursor:pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;"></span>
						<form name="searchForm" action="<%=cp%>/singo/singo" method="post"
							style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
							<select name="condition" class="boxTF"
								style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
								<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
								<option value="created"
									${condition=="created"?"selected='selected'":""}>날짜</option>
								<option value="reason"
									${condition=="reason"?"selected='selected'":""}>신고사유</option>
								<option value="userId"
									${condition=="userId"?"selected='selected'":""}>신고자Id</option>
								<option value="targetUserId"
									${condition=="targetUserId"?"selected='selected'":""}>피신고자Id</option>
							</select>
							
							 <input id="keyword" type="text" name="keyword" value="${keyword}"
								class="boxTF"
								style="display: inline-block; height: 100%; width: 58%;">
							<img
								src="<%=cp%>/resource/images/magnifying-glass.png" class="" onclick="searchList('singo')"
								style="padding: 6px; cursor:pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
						</form></td>
				</tr>
				<tr class="lbo_li lbo_legend lbo_legend_like">
					<th width="60" style="padding-left: 1.5%;">번호</th>
					<th width="110"><span>글쓴이ID</span></th>
					<th width="350"><span style="padding-left: 10px;">신고게시물내용</span></th>
					<th width="110" ><span>신고자ID</span></th>
					<th width="350"><span style="padding-left: 10px;">신고사유</span></th>										
					<th width="200"><span>신고일</span></th>

				</tr>
			</thead>
			<tbody style="border-bottom: 2px solid black;">
			<c:forEach var="dto" items="${singoList}">
				<tr >
					<td>${dto.blameNo}</td>
					<td>${dto.targetUserId}</td>
					<td><a href="${dto.targetUrl}">${dto.targetContent}</a></td>
					<td>${dto.userId}</td>
					<td>${dto.content}</td>
					<td>${dto.created}</td>
				</tr>
			</c:forEach>	
			
			</tbody>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging}
			</td>
		</tr>
			</table>
	</div>
	</c:when>
	<c:when test="${mode=='userManagment'}">
	<div id="usermanagment" style="display: block; width:90%; margin: 0px auto;">

	<table class="table table-hover tb-board" style="padding: 0; margin: 0; font-size: 1.025em; text-align: center;">
			<thead style="text-align: center">
				<tr>

				<td width="200" colspan="6" style="background: #fbfbfb; text-align: left; vertical-align: bottom; font-size: 14px; border-radius: 5px;">
				
					<span id="singoCount" 	style="display: none; float: left; font-size: 16px; padding-top: 9px; vertical-align: bottom;">검색결과
					<span style="color: #ca4a0d;">3569건 </span> <img alt="" src="/Project_RailTraveler/resource/images/close_icon.png" onclick="reset()"
					style="background: #dadada; width: 20px; padding: 3px; cursor:pointer; border: 1px solid #cacaca; border-radius: 50%; margin-bottom: 2px;"></span>
						<form name="userListForm" action="<%=cp%>/singo/userManagment" method="post"
							style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
						
							<select name="condition" class="boxTF"
								style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
								<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
								<option value="userId"
									${condition=="userId"?"selected='selected'":""}>유저아이디</option>
								<option value="userName"
									${condition=="userName"?"selected='selected'":""}>유저이름</option>
								
							</select>
							
							 <input id="" type="text" name="keyword" value="${keyword}"
								class="boxTF"
								style="display: inline-block; height: 100%; width: 58%;">
							<img
								src="<%=cp%>/resource/images/magnifying-glass.png" class="" onclick="searchList('userManagment')"
								style="padding: 6px; cursor:pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
						</form></td>
				</tr>
				<tr class="lbo_li lbo_legend lbo_legend_like">
					<th width="60" >번호</th>
					<th width="100"><span >이름</span></th>
					<th width="100"><span >아이디</span></th>
					<th width="80" ><span >총 신고횟수</span></th>
					<th width="100" ><span >비고</span></th>
					<th width="60" ><span >상태</span></th>
					<th width="50"><span>/</span></th>



				</tr>
			</thead>
			<tbody style="border-bottom: 2px solid black;">
				<c:forEach var="vo" items="${singoCountList}">
				<tr >
					<td>${vo.singoNum}</td>
					<td>${vo.userName}</td>
					<td>${vo.targetUserId }</td>
					<td>${vo.singoCount}회</td>
					
										<c:choose>
					<c:when test="${vo.singoCount>=5}">
					<td>
						<span style="color: red; font-weight: 700"> 아이디 정지 대상입니다.</span>
					</td>

					</c:when>
					<c:otherwise>
					<td>
						<span>경고 대상입니다.</span>
					</td>
					</c:otherwise>
					</c:choose>
					
					<c:choose>
					<c:when test="${vo.enabled==1}">
					<td>
						<span style="color: blue; font-weight: 700">활성화</span>
					</td>
					<td>
						<button class="btn"  onclick="restrictId('${vo.targetUserId}','unabled');">비활성화 적용</button>
					</td>
					</c:when>
					<c:otherwise>
					<td>
						<span style="color: red; font-weight: 700">비활성화</span>
					</td>
					<td>
					<button class="btn" onclick="restrictId('${vo.targetUserId}','enabled');">비활성화 풀기</button>
					</td>
					</c:otherwise>
					</c:choose>
					
					



				</tr>
			</c:forEach>
			
			</tbody>
		</table>
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging}
			</td>
		</tr>
			</table>
			
	
	
	</div>
	</c:when>
	</c:choose>
</div>


</div>
</div>



