<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/info.css" type="text/css">
<style type="text/css">
.displaySta2{
	display: inline; 
	width:28%; 
	height:100%; 
	float: left; 
	margin: 0 10px;
}

.displaySta{
	display: inline-block; 
	width: 100%;
	margin-bottom: 40px; 
	height : 220px;
}
</style>

<script type="text/javascript">
$("figure").mouseleave(
	    function() {
	      $(this).removeClass("hover");
	    }
	  );
	  
$(function(){
	$("#nav-item-${locNum}").addClass("active");
	
	$("ul.nav-tabs li").click(function(){
		locNum = $(this).attr("data-tab");
		
		$("ul.nav-tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#nav-item-"+locNum).addClass("active");
		
		var url = "<%=cp%>/station/info?locNum="+locNum;
		location.href=url;
	});
});


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

function login() {
	location.href="<%=cp%>/member/login";
}
	
function showModal(ob) {
	var staNum =$(ob).closest("div").find("input").val();  
	
	var url = "<%=cp%>/station/modal";
	var query = "staNum="+staNum+"&page="+${page}+"&locNum="+${locNum};
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			
			
			$("#please").html(data);
			//$("#layerpop").modal();
		
		}
	    ,beforeSend :function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
	
	
	
}
</script>

<div class="body-content-container">
    <div class="page-three-title mt40">
		<h3 class="fs26">
		<span style="padding: 10px 0px; display: block;"> 역 소개</span>
		</h3>
	</div>
	
     <div class="body-main">
     
     	<div style="margin-bottom: 20px;">
     	</div>
     	
  		<div class="container">
		<div class="row">
			<div class="col" style="font-size: 18px; font-weight: 600;margin: 0 10px;width: 88%;">
				<ul class="nav nav-tabs" style="margin-bottom: 30px;">
					<li id="nav-item-0" data-tab="0"><a class="nav-link" href="#">전체</a></li>
					<c:forEach var="vo" items="${locList}">
						<li id="nav-item-${vo.locNum}" data-tab="${vo.locNum}" ><a class="nav-link" href="#">${vo.locName}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div style="width: 89%; text-align: right; margin-bottom: 20px;">
				<c:if test="${sessionScope.member.userId=='admin'}">
					<button class="btn btn-success" type="button" onclick="javascript:location.href='<%=cp%>/station/created';"><i class="fas fa-plus"></i>&nbsp;&nbsp;추가하기</button>
				</c:if>
			</div>
		</div>
		</div>
  			
		<!-- 역 리스트 출력 -->
		<c:forEach var="vo" items="${staList}" varStatus="status">
			<c:if test="${status.index==0}">
			    <c:out value="<div class='displaySta'><div class='displaySta2'>" escapeXml="false"/>
			</c:if>
			<c:if test="${status.index!=0 && status.index%3!=0}">
			    <c:out value="</div><div class='displaySta2'>" escapeXml="false"/>
			</c:if>
			<c:if test="${status.index!=0 && status.index%3==0}">
				<c:out value="</div></div><div class='displaySta'><div class='displaySta2'>" escapeXml="false"/>
			</c:if>
			<input type="hidden" name="staNum" value="${vo.staNum}">
			
			<figure class="snip1104 ${status.index%3==0?'red':(status.index%3==1?'blue':'')}" style="height:100%;">
				  <img src="<%=cp%>/resource/images/station/${vo.imageFilename}" style="width: 100%; height:100%;"/>
				  <figcaption>
				    <h4><span> ${vo.staName}</span></h4>
			</figcaption>
				  <a class="staModal" onclick="showModal(this);"></a>
				 <!--  <a class="staModal"  data-target="#layerpop" data-toggle="modal" data-test="${vo.staNum}"></a> -->
			</figure>
		</c:forEach>
		
		</div>	

	</div>
	
	<c:set var="n" value="${staList.size()}"/>
	<c:if test="${n>0&&n%3!=0}">
		<c:forEach var="i" begin="${n%3+1}" end="3" step="1">
			<div class='displaySta2'>
				 &nbsp;
			</div>
		</c:forEach>
	</c:if>
	
	<div style="width: 89%; margin-bottom: 40px;">
		<nav style="text-align: center;">
			<ul class="pagination">
				<li>${dataCount==0?"등록된 게시물이 없습니다.":paging}</li>
			</ul>
		</nav>
	</div>
	
	

 <c:out value="</div>"escapeXml="false"/>

<!-- modal -->
<div id="please">		
		
</div>

