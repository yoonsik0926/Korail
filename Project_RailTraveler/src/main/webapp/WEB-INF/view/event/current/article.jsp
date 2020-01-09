<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

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

//게시글 공감 여부
$(function(){
	$(".btnSendEventLike").click(function(){
		if(! confirm("게시물에 공감 하십니까 ? ")) {
			return false;
		}
		
		var userId = "${sessionScope.member.userId}";
		
		  if ( userId == "") {
			  $("#likealarm").modal();
			return;
		  }
		
		var url="<%=cp%>/event/insertEventLike";
		var eventNum="${dto.eventNum}";
		var query = {eventNum:eventNum};
		
		var fn = function(data){
			var state=data.state;
			if(state=="true") {
				var count = data.eventLikeCount;
				$("#eventLikeCount").text(count);
			} else if(state=="false") {
				alert("공감은 한번만 가능합니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

</script>

<style type="text/css">

.tit-heading {position:relative; height:51px; margin-top:30px; border-bottom:3px solid #241d1e;}
.tit-evt {background:none; color:#333333; font-size:14px; text-align:justify; height:38px; line-height:38px; margin:0;}

.subject {
	font-size: 16px;
	padding-top: 10px;
	font-weight: bold;
}
	
</style>

<div class="body-container" style="width: 700px; margin-left: auto; margin-right: auto;">
    <div class="body-title">
        <h3><i class="far fa-image"></i> 이벤트 보기 </h3>
   
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style= "border-top: 2px solid #444444; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   <p class="subject">${dto.name}<p>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    
			    <td width="50%" align="right" style="padding-right: 5px; background: #fafafa;">
			        <span>기간: </span>${dto.sdate} ~ ${dto.edate} &nbsp; view ${dto.hitCount}
			    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;">
			      <img src="<%=cp%>/uploads/event/${dto.imageFilename}" style="max-width:100%; 
			      height:auto; resize:both;">
			   </td>
			</tr>
			
			<tr>
				<td colspan="2" height="40" style="padding-bottom: 15px;" align="center">
					<button type="button" class="btn btnSendEventLike"
						title="좋아요"
						style="background: none; padding: 6px 8px; width: 60px; height: 60px; 
						  border-color: #cccccc; border-radius: 50%; margin-bottom: 5px;">
						<i id="eventLikeIcon" class="fas fa-heart"
							style="font-size: 20px; display: block; margin: 0 auto; color: orangered;"></i><span
							id="eventLikeCount">${dto.eventLikeCount}</span>
					</button>
				</td>
			</tr>
						
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="50">
			      ${dto.content}
			   </td>
			</tr>
											
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			      	 이전 이벤트 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/event/article?${query}&eventNum=${preReadDto.eventNum}">${preReadDto.name}</a>
			        </c:if>
			    </td>
			</tr>
				<tr height="35" style="border-bottom: 2px solid #444444;">
				   	 <td colspan="2" align="left" style="padding-left: 5px;">
				       다음 이벤트 :
				         <c:if test="${not empty nextReadDto}">
				              <a href="<%=cp%>/event/article?${query}&eventNum=${nextReadDto.eventNum}">${nextReadDto.name}</a>
				        </c:if>
				    </td>
				</tr>
						
			</table>
						
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/event/current?${query}';">목록으로</button>
			    </td>
			</tr>
			</table>
    </div>
    
</div>

	<div class="modal fade  bd-example-modal-sm" id="likealarm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	  aria-hidden="true" >
		  <div class="modal-dialog modal-sm" role="document" style="width: 490px;">
		    <!--Content-->
			    <div class="modal-content text-center">
			      <!--Header-->
				      <div class="modal-header d-flex justify-content-center" style="background-color : #808080; padding: 5px 5px;">
				        <h5  class="heading" style="font-size:25px; font-weight: 700; margin: 5px 5px;">Rail Traveler</h5>
				      </div>
			
			      <!--Body-->
				      <div class="modal-body" style="padding: 5px 5px; margin-top: 30px;">
				        <i class="fas fa-bell fa-3x animated rotateIn mb-3"></i>
				
				        <p id="modaltext" style="font-size: 15px; font-weight:500; margin-top: 10px; margin-left: 10px;">회원에게만 제공되는 서비스입니다!</p>
						<p id="modaltext" style="margin-top: 20px;">
						<span style="display: block; cursor: pointer; font-weight:700;font-size: 13px"><a href="<%=cp%>/member/login">로그인</a></span>
						<span style="display: block; cursor: pointer; font-weight:700;font-size: 13px"><a href="<%=cp%>/member/member">회원가입</a></span>
						</p>
				      </div>
			
			      <!--Footer-->
			      <div class="modal-footer flex-center" >
			        
			        <a type="button" class="btn  btn-info waves-effect" data-dismiss="modal">닫기</a>
			      </div>
			    </div>
		  </div>
	</div>


		

