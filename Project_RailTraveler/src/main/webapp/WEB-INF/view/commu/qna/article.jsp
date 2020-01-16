<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String cp = request.getContextPath();
%>
<link href="<%=cp%>/resource/css/modal.css" rel="stylesheet">
<script src="<%=cp%>/resource/js/commu.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function sendLinkFacebook() {
		var facebook_share_url = "https://www.facebook.com/sharer/sharer.php?u={{ request.build_absolute_uri }}";
		window.open(facebook_share_url, 'Share on Facebook',
				'scrollbars=no, width=500, height=500');
	}
	function sendLinkTwitter() {
		var twitter_share_text = "{{ post.title }}";
		var twitter_share_url = "{{ request.build_absolute_uri }}";
		window.open("https://twitter.com/share?text=" + twitter_share_text
				+ "&url=" + twitter_share_url, 'Share on Twitter',
				'scrollbars=no, width=500, height=500');
	}
	function sendLinkNaver() {
		var raw_url = "{{ request.build_absolute_uri }}";
		var raw_title = "{{ post.title }}"
		var naver_root_url = "http://share.naver.com/web/shareView.nhn?url="
		var naver_share_url = naver_root_url + encodeURI(raw_url) + "&title="
				+ encodeURI(raw_title);
		window.open(naver_share_url, 'Share on Naver',
				'scrollbars=no, width=500, height=500');
	}
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
	function modalOn() {
		$('#myModal').modal('toggle');
	}
	
	
	
	///////////////////////////////////////
	///////////////////////////////////////
	///////////////////////////////////////
	
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
//게시글 공감 여부
$(function(){
// 	$(".btnSendQnaLike").click(function(){
// 		<c:if test="${empty sessionScope.member.userId}">
// 		if(confirm("로그인이 필요한 기능입니다. 로그인페이지로 이동하시겠습니까?"))
<%-- 			location.href="<%=cp%>/member/login"; --%>
// 		else{
// 			return;
// 		}
// 		</c:if>
// 		var cs = document.getElementById("boardLikeIcon");
// 		if( cs.className =="far fa-heart"){
// 			if(! confirm("북마크 하시겠습니까 ? ")) {
// 				return false;
// 			}
			
<%-- 			var url="<%=cp%>/qna/insertQnaBookmark"; --%>
// 			var qnaNum="${dto.qnaNum}";
// 			var query = {qnaNum:qnaNum};
			
// 			var fn = function(data){
// 				var state=data.state;
// 				if(state=="true") {
// 					var count = data.bookmarkCount;
// 					$("#qnabookmarkCount").text(count);
// 					cs.className = 'fas fa-heart';
// 				} else if(state=="false") {
// 					alert("좋아요는 한번만 가능합니다. !!!");
// 				}
// 			}; 
			
// 			ajaxJSON(url, "post", query, fn);
			
			
			
// 		}else{
// 			if(! confirm("북마크를 취소하시겠습니까 ? ")) {
// 				return false;
// 			}
			
<%-- 			var url="<%=cp%>/qna/deleteQnaBookmark"; --%>
// 			var qnaNum="${dto.qnaNum}";
// 			var query = {qnaNum:qnaNum};
			
// 			var fn = function(data){
// 				var state=data.state;
// 				if(state=="true") {
// 					var count = data.bookmarkCount;
// 					$("#qnabookmarkCount").text(count);
// 					cs.className = 'far fa-heart';
// 				} else if(state=="false") {
// 					alert("좋아요는 한번만 가능합니다. !!!");
// 				}
// 			};
			
// 			ajaxJSON(url, "post", query, fn);
// 		}
// 	});
});

//게시물 삭제
function deleteQna(num) {
	var q="qnaNum=${dto.qnaNum}&${query}";
	var url="<%=cp%>/qna/delete?"+q;
	
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
<%-- 		var url="<%=cp%>/notice/delete?num="+num+"&${query}"; --%>
		location.href=url;
	}
}

//채택하기
function updateEnable(num) {
	var q="qnaNum="+${dto.qnaNum}+"&enable="+num+"&${query}";
// 		console.log(q);
	var url="<%=cp%>/qna/updateEnable?"+q;
	
	location.href=url;
}


function insertReArticle(){
	var qnaNum="${dto.qnaNum}";
	var categoryNum="${dto.category}";
	var url="<%=cp%>/qna/createdReArticle?qnaNum="+qnaNum+"&categoryNum="+categoryNum+"&categoryName=${dto.categoryName}&${query}";
// 	console.log(url);
	location.href=url;
	
};

//게시글 공감 여부
$(function(){
	$(".btnSendBoardLike").click(function(){
		<c:if test="${empty sessionScope.member.userId}">
			if(confirm("로그인이 필요한 기능입니다. 로그인페이지로 이동하시겠습니까?"))
				location.href="<%=cp%>/member/login";
			else{
				return;
			}
		</c:if>
		var qnaNum=$(this).data('num');
		var csnum = "boardLikeIcon"+qnaNum;
		var cs = document.getElementById(csnum);
		var $boardLikeCount = "#boardLikeCount"+qnaNum;
		if( cs.className =="far fa-heart"){
			if(! confirm("북마크 하시겠습니까 ? ")) {
				return false;
			}
			
			var url="<%=cp%>/qna/insertQnaBookmark";
			
			var query = {'qnaNum':qnaNum};
			
			var fn = function(data){
				var state=data.state;
				if(state=="true") {
					var count = data.bookmarkCount;
					$($boardLikeCount).text(count);
					cs.className = 'fas fa-heart';
				} else if(state=="false") {
					alert("좋아요는 한번만 가능합니다. !!!");
				}
			}; 
			
			ajaxJSON(url, "post", query, fn);
			
		}else{
			if(! confirm("북마크를 취소하시겠습니까 ? ")) {
				return false;
			}
			
			var url="<%=cp%>/qna/deleteQnaBookmark";
			var query = {'qnaNum':qnaNum};
			
			var fn = function(data){
				var state=data.state;
				if(state=="true") {
					var count = data.bookmarkCount;
					$($boardLikeCount).text(count);
					cs.className = 'far fa-heart';
				} else if(state=="false") {
					alert("좋아요는 한번만 가능합니다. !!!");
				}
			};
			
			ajaxJSON(url, "post", query, fn);
		}
	});
});

/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////
// <div id="reply-div${dto.qnaNum}"></div>
// 			<div id="articleReply-div${dto.qnaNum}"></div>

function listPage(num, page) {
	var url = "<%=cp%>/qna/listReply";
	var query = "qnaNum="+num+"&userId=${dto.userId}&pageNo="+page;
	var selector = "#reply-div"+num;
	
	ajaxHTML(url, "get", query, selector);
}

function listReArticle(page) {
	var num = '${dto.qnaNum}';
	var category = '${dto.category}';
	var url = "<%=cp%>/qna/listReArticle";
	var query = "qnaNum=${dto.qnaNum}&userId=${dto.userId}&category=${dto.category}&pageNo="+page;
	var selector = "#articleReply-div"+num;
	
	ajaxHTML(url, "get", query, selector);
}

$(function(){
	$("body").on("click",".btnSendReply", function(){
		
		var qnaNum=$(this).data('num');
		var $content=$(this).parent().find("textarea");
		var content=$content.val().trim();
		if(! content) {
			alert("내용을 입력해주세요");
			$content.focus();
			return false;
		}
		content = encodeURIComponent(content);
		var url="<%=cp%>/qna/insertReply";
		var query="qnaNum="+qnaNum+"&content="+content;
		console.log(qnaNum);
		var fn = function(data){
			$content.val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(qnaNum,1);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
</script>
<style type="text/css">
::-webkit-scrollbar {
	display:none;
}
.fl {
	float: left;
	margin-top: 8px;
}

.fr {
	float: right;
	margin-top: 8px;
}
tfoot td{
 padding: 6px 10px;
}
.tb-row span {
	display: inline-block;
	float: left;
	margin-right: 5px;
	color: #b2b2b2;
}

.tb-row {
	height: 35px;
}

#boardLikeCount {
	width: 41px;
	font-size: 13px;
	display: block;
	color: #888888;
	margin: 0 auto;
}

a#MOVE_TOP_BTN {
	padding: 7px 0;
	position: fixed;
	right: 3%;
	bottom: 100px;
	display: none;
	z-index: 999;
	width: 60px;
	height: 60px;
	border-radius: 50px;
	text-align: center;
	background: gray;
	color: white;
}

.modal-content ul {
	padding: 0;
	list-style: none;
}

.modal-content li {
	padding: 10px 5px;
	margin-bottom: 1px;
}

.modal-content a {
	color: black;
}

.modal-content a:hover {
	font-weight: bold;
	color: #0b0bf1;
}

.btnSendBoardLike:active, .btnSendBoardLike:hover {
	background: none;
}
.reBoardBtn {
  display: inline-block;
  padding: 10px 25px;
  font-size: 15px;
  cursor: pointer;
  text-align: center;	
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #283164;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.reBoardBtn:hover {background-color: #283164}

.reBoardBtn:active {
  background-color: black;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

/* SNS 공유하기 모달 */
.modal_post_social .modal-content {
    padding: 8px 0;
}
.text-basic, .text-basic a {
    color: #212121;
}

.modal_post_social .social-btn {
    overflow: hidden;
}
.social-btn ul {
    list-style: outside none none;
    padding: 0;
}
.modal_post_social li:first-child, .modal_post_social li:nth-child(5) {
    margin-left: 5px;
}
.modal_post_social li {
    float: left;
    width: 68px;
    margin-top: 10px;
}
.modal_post_social li a {
    text-align: center;
    padding: 0;
    font-size: 12px;
    line-height: 1;
    display: block;
    width: 68px;
    height: 80px;
    background: url(//vendor-cdn.imweb.me/images/site/social_icon3.png?487487) no-repeat;
    background-size: 56px;
    padding-top: 63px;
}
.modal_post_social li.kakao a {
    background-position: 7px 0;
}
.modal_post_social li.story a {
    background-position: 7px -325px;
    letter-spacing: -1px;
}

.modal_post_social li.line a {
    background-position: 7px -81px;
}
.modal_post_social li.band a {
    background-position: 7px -406px;
}
.modal_post_social li.naver a {
    background-position: 7px -648px;
}
.modal_post_social li.face a {
    background-position: 7px -163px;
}
.modal_post_social li.twitter a {
    background-position: 7px -244px;
}
.modal_post_social li.googleplus a {
    background-position: 7px -568px;
}
.modal_post_social .url-copy {
    clear: both;
    padding: 0 8px;
    margin-top: 20px;
}
.holder {
    position: relative;
}
.modal_post_social .url-copy .form-control {
    border: 1px solid rgba(155, 155, 155, 0.4);
    box-shadow: none;
    color: #212121;
    /* padding-right: 65px; */
}
.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
    background-color: #eee;
    opacity: 1;
}
.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.modal_post_social .url-copy button {
    border-radius: 0;
    color: #000;
    border: 1px solid rgba(155, 155, 155, 0.4);
    font-size: 13px;
    padding: 7px 16px;
    height: 34px;
    position: absolute;
    right: 8px;
    top: 0;
    background: #fff;
    letter-spacing: 0;
}

.text-center {
    text-align: center;
}

</style>



<!-- SNS 공유하기 모달 -->
<div id="snsModal" role="dialog" tabindex="-1"
	aria-labelledby="mySmallModalLabel" aria-hidden="true"
	data-backdrop="true" data-keyboard="true"
	class="modal1 modal_post_social" style="display: none;">
	<div class="modal-dialog"
		style="width: 315px; position: absolute; right: 16.5%;
    top: 18.5%;">
		<div class="modal-content">
			<div class="text-basic">
				<div class="social-btn">
					<ul>
						<li role="" class="kakao"><a href="javascript:;"
							onclick="SNS.setSnsApi('kakaotalk')">카카오톡</a></li>
						<li role="" class="story"><a href="javascript:;"
							onclick="SNS.setSnsApi('kakaostory')">카카오스토리</a></li>
						<li role="" class="line"><a href="javascript:;"
							onclick="SNS.setSnsApi('line')">라인</a></li>
						<li role="" class="band"><a href="javascript:;"
							onclick="SNS.setSnsApi('band')">밴드</a></li>
						<li role="" class="naver"><a href="javascript:;"
							onclick="SNS.setSnsApi('naver')">네이버</a></li>
						<li role="" class="face"><a href="javascript:;"
							onclick="SNS.setSnsApi('facebook')">페이스북</a></li>
						<li role="" class="twitter"><a href="javascript:;"
							onclick="SNS.setSnsApi('twitter')">트위터</a></li>
						<li role="" class="googleplus"><a href="javascript:;"
							onclick="SNS.setSnsApi('googleplus')">Google+</a></li>
					</ul>
				</div>
				<div class="url-copy holder">
					<div class="form-control-line">
						<input type="text"
							class="_sns_copy_url form-control"
							value="https://hiconnectpeople.com/30/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&amp;bmode=view&amp;idx=2828226&amp;t=board"
							readonly="readonly">
						<button type="button"
							class="_sns_copy_btn sns_copy_btn btn btn-default"
							onclick="">복사</button>
					</div>
				</div>
				<div id="copy_complete" class="text-center"></div>
			</div>
		</div>
	</div>
</div>

<!--Modal: 신고 모달-->
<form name="singoForm" method="post" action="">
<div class="modal fade  bd-example-modal-sm" id="singo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document" style="width: 560px;">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
<!--       $('#targetType').val('0'); -->
<!-- 		$('#targetUserId').text(targetUserId); -->
<!-- 		$('#targetContent').text(targetContent);		 -->
<!-- 		$('#targetNum').val(num); -->
<!-- 		$('#targetUrl').val(targetUrl); -->
      <input type="hidden"  id="targetType" name="targetType">
      <input type="hidden"  id="targetTitle" name="targetTitle">
      <input type="hidden"  id="targetNum" name="targetNo">
      <input type="hidden"  id="targetUrl" name="targetUrl">
      <input type="hidden" id="singoreason" value="etc" >

      <div class="modal-header d-flex justify-content-center" style="background-color: #d3d3d3; padding: 9px 0px 9px 15px; border-bottom:1px solid #c4c4c4 ">
        <p style="font-size:22px; text-align:left;font-weight: 700;margin: 0px 0px;">신고하기</p>
      </div>

      <!--Body-->
      <div class="modal-body" style="padding: 12px 15px 0px; text-align: left; font-weight:700;">
		<div style=" border-bottom:1px solid #c4c4c4">
		<p>제&nbsp;&nbsp;&nbsp;목 :&nbsp;&nbsp;<input id="targetContent"  style="font-weight: 500; cursor: auto;border: none;" value="얄라리얄라 얄라숑" readonly="readonly"></p>
		<p>작성자 :&nbsp;&nbsp;<input id="targetUserId" name="targetUserId" style="font-weight: 500; cursor: auto;border: none;" value="yoonsik09(김**)" readonly="readonly"></p>
        </div>
        
        <div style="margin: 10px 0px;">
        	<table style="width: 100%; ">
        		<tr>
        			<td width="17%" valign="top">
        			<p>신고사유:&nbsp;&nbsp;</p>
        			</td>
        			<td width="83%" valign="top">
        			<span style="font-size: 14px; color: #949494;font-weight: 500">여러 사유에 해당하는 경우 대표 사례 하나만 선택해주세요</span>
        			</td>
        		</tr>
        		
        		<tr>
        		<td width="17%"></td>
        		<td width="83%">
        		    <P style="font-weight: 500"><input class="notEtc" type="radio" name="chk_info" value="부적절한 홍보 게시물" >부적절한 홍보 게시물<a id="adverClick" style="font-size:12px;color: #949494; cursor: pointer;">&nbsp;| 더보기</a></P> 
        		    <div id="adverInfo" style="display: none ">
        		   	 <ul style="font-size: 13px; color: #a9a9a9;font-weight: 500 ;margin: 10px 0px ; padding: 0px 0px 0px 20px; ">
      						<li>불법 사행성, 도박사이트를 홍보하는 경우</li>
      						<li>개인정보, 이미테이션, 성인의약품, 마약, 대포폰 등 불법 제품 및 정보를 홍보, 판매하는 경우</li>
      						<li>성매매, 장기매매 등의 신체 관련 거래 정보</li>
    				 </ul>
        		    </div>
					<P style="font-weight: 500"><input class="notEtc" type="radio" name="chk_info" value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 내용<a id="19ageClick" style="font-size:12px;color: #949494; cursor: pointer;">&nbsp;| 더보기</a></P>
					<div id="19ageInfo" style="display: none ">
       		   	 		<ul style="font-size: 13px; color: #a9a9a9;font-weight: 500;margin: 10px 0px ; padding: 0px 0px 0px 20px;">
      						<li>음란물 또는 음란한 행위(노골적인 성행위 장면)를 묘사하는 이미지/동영상</li>
      						<li>살해/상해/폭력 등 잔인한 장면을 묘사하는 이미지/동영상</li>
      						<li>중고 속옷 판매, 가출 유도 등의 청소년 유해 정보 공유</li>
    				 	</ul>
        		    </div>
					<P style="font-weight: 500"><input class="notEtc" type="radio" name="chk_info" value="명예훼손/사생활 침해 및 저작권침해 등">명예훼손/사생활 침해 및 저작권침해 등</P>
					<P style="font-weight: 500"><input type="radio" name="chk_info" id="etc" value="etc">기타</P>
					
					<div id="etcTextarea" style="display: none">
						<textarea id="etcText" name="content" style="height:100px; width: 100%" placeholder="해당 신고는 Rail_Traveler 운영자에게 전달됩니다."></textarea>
					</div>					
        		</td>

        		</tr>
        	</table>
      	</div>
      	
      	<div class="modal-footer flex-center" style="margin-top:5px; border-top:1px solid #c4c4c4" align="center">
      	    <a onclick="singosubmit();" type="button" class="btn btn-info " >신고하기</a>
        	<a type="button" class="btn  btn-info waves-effect cancelsingo" data-dismiss="modal">취소</a>
      	</div>
        
        </div>


    </div>
  </div>
</div>
</form>
<!--Modal: 신고모달-->


<!-- 첨부파일 관리 모달 -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content" style="margin: 0 auto; width: 500px;">
			<h3
				style="margin: 0; padding: 10px; color: white; background: #141832f2; text-align: center; font-weight: 900;">첨부파일</h3>
			<div style="padding: 10px;">
				<table id="fileDownTb" style="
    width: 100%;
">
					<tbody><tr style="border-bottom: 1px solid;    height: 35px;">
						<th style="
    width: 10%;
">다운</th>
						<th style="    text-align: center;
    width: 50%;
">파일명</th>
						<th style="
    width: 10%;
">파일크기</th>
					</tr>
					<c:forEach var="file" items="${files}">
					<tr style="    height: 35px;border-bottom: 1px solid #ccc;">
					<td>
					 <a href="<%=cp%>/qna/download?qnaFileNum=${file.qnaFileNum}">
					<i
								class="far fa-arrow-alt-circle-down"></i></a></td>
								<td>${file.originalFilename}</td>
								
								<td>
					(<fmt:formatNumber
							value="${file.fileSize/1024}" pattern="0.00" />KByte)</td>
					</tr>
						
				</c:forEach>
					<tr>
						<td colspan="3"><a class="btn"
							href="<%=cp%>/qna/zipDownload?qnaNum=${dto.qnaNum}" style="    width: 100%;
    height: 45px;
    padding: 10px;
    font-size: 15px;
    background: #eee;">
								zip 파일로 받기</a></td>
					</tr>
					
				</tbody></table>
					
					
			</div>
		</div>
	</div>
</div>



<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 묻고 답하기</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-bottom: 10px;"></div>
			<div class="list-btn-nor2 upper-list" style="padding-bottom: 8px;">
			<div class="fl">
			<c:if test="${not empty preReadDto}">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/qna/article?${query}&qnaNum=${preReadDto.qnaNum}';">
					이전글</button></c:if>
					<c:if test="${not empty nextReadDto}">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/qna/article?${query}&qnaNum=${nextReadDto.qnaNum}';">
					다음글</button></c:if>
			</div>
			<div class="fr">
				<c:if test="${dto.notice!=1}">
					<c:if test="${ (not empty dto.enable) and dto.enable!=0}">
						<button type="button" class="btn btn-default"
							style="background: #aaa; color: white;" disabled='disabled'>완료</button>
					</c:if>
					<c:if test="${dto.enable==0}">
						<button type="button" class="btn btn-default"
							onclick="updateEnable(${dto.qnaNum});"
							style="background: #f97509; color: white;" disabled='disabled'>미완료</button>
					</c:if>
				</c:if>
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/qna/qna?${query}';">
					목록</button>
			</div>
			<div class="cb"></div>
		</div>
		<table
			style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #000; border-bottom: 2px solid #000;">
				<tr>
					<td colspan="3" style="padding-top: 15px;">
						<h3 style="margin: 10px 0 10px; font-size: 25px;"><span style="    font-size: 22px;
    background: #eeeeee45;
    padding: 1px 7px;
    border: 4px double #cccccc;
    border-radius: 10px;">${dto.categoryName}</span> ${dto.subject} 
						
						<span style="float: right;">
						
						<i class="fa fa-heart" style="width: 22px;"></i>&nbsp;${dto.bookmarkCount}
						<i class="fas fa-comments"></i> 5(답글개수)
						
						</span> </h3>
					</td>
				</tr>

				<tr class="tb-row" style="height: 30px;">
					<td colspan="3" align="left"
						style="padding-left: 5px; font-size: 13px;"><span>${dto.userName} </span><span>|</span><span>
						${dto.created} </span><span>|</span><span>조회 ${dto.hitCount}회</span><span>|</span><span>댓글
							${dto.replyCount}</span></td>
				</tr>
				<tr>
					<td colspan="3" style="padding: 20px 5px;" valign="top"
						height="200">${dto.content} </td>
				</tr>

				<tr style="border-bottom: 0;">
					<td colspan="3" height="40" align="center">${dto.myBookMark}
						<button type="button" class="btn btnSendBoardLike btn-default"
							title="좋아요"
							style="padding: 6px 8px; width: 60px; height: 60px; border-radius: 50%; margin-bottom: 5px;" 
							  data-num='${dto.qnaNum}' >
							<i id="boardLikeIcon${dto.qnaNum}" ${dto.myBookMark==0? 'class="far fa-heart"':'class="fas fa-heart"'} 
								style="font-size: 20px; display: block; margin: 0 auto; color: orangered;"></i><span
								id="boardLikeCount${dto.qnaNum}">${dto.bookmarkCount}</span>
						</button>
					</td>
				</tr>
				<c:if test="${not empty dto.fileCount}">
				<tr class="tb-row">
					<td colspan="3" align="left"
						style="padding-left: 5px; color: blue;"><a
						onclick="modalOn();" style="cursor: pointer;"> 첨부된 파일 (${dto.fileCount})</a></td>
				</tr>
				</c:if>
				<c:if test="${empty dto.fileCount}">
				<tr class="tb-row">
					<td colspan="3" align="left"
						style="padding-left: 5px; color: #ccc;">첨부된 파일이 없습니다.</td>
				</tr>
				</c:if>
				</table>
			<div id="reply-div${dto.qnaNum}"></div>
			<div id="articleReply-div${dto.qnaNum}">
				
							
<!-- List group -->
				<ul class="list-group" style="margin: 20px 0;
    box-shadow: none;">

					<li id="note-title" class="list-group-item note-title"
						style="background: beige;">
						<h3 class="panel-title" style="    float: left;">
							답글 <span id="note-count">${reArticleCount}</span>
						</h3>
						<h3 class="panel-title" style="float: right;">
							<a href="#">최신순<a href="#"></a> | <a href="#">추천순</a>
						</h3>
						<div style="clear: both;"></div>
					</li>
					
					
				<c:forEach var="reArticle" items="${listReArticle}">
					<li class="list-group-item note-item clearfix">
					<div style="padding: 5px 0 10px 10px;">
					<c:if test="${reArticle.qnaNum==dto.enable}">
						<div style="color: red;font-size: 15px;text-shadow: 1px 1px yellow;">* 채택 된 답변입니다 *</div>
   					 </c:if>
    </div>
							<div class="content-body panel-body pull-left" style="padding: 0 15px; width: 92%">


								<div class="avatar avatar-medium clearfix ">
								<div style="height: 50px;
    float: left;
    width: 50px;"><i class="far fa-comment-dots" style="font-size: 35px;"></i></div>
									<div class="avatar-info">
									${reArticle.userName }
										<div class="date-created">
											<span class="timeago" title="2019-12-16 22:20:55.0">${reArticle.created }</span>
										</div>
									</div>
								</div>
								<fieldset class="form">
									<article id="note-text-1861368"
										class="list-group-item-text note-text">

										${reArticle.content}

									</article>
								</fieldset>
							</div>

							<div class="content-function pull-right text-center" style="width: 60px;">
								<div class="content-function-group">
								<c:if
						test="${dto.userId==sessionScope.member.userId and (dto.enable==0)}">
						<button type="button" class="btn btn-warning"
							onclick="updateEnable(${reArticle.qnaNum});"
							style="width: 60px; margin-bottom: 5px;">채택</button>
					</c:if>
						
					<button type="button" class="btn btn-default btnSendBoardLike" title="좋아요" data-num='${reArticle.qnaNum}'
						style="width: 60px; margin-bottom: 5px;">
						<i id="boardLikeIcon${reArticle.qnaNum}" ${reArticle.myBookMark==0? 'class="far fa-heart"':'class="fas fa-heart"'} 
							style="font-size: 15px; margin: 0 auto; color: orangered;"></i>
							<span id="boardLikeCount${reArticle.qnaNum}">&nbsp;${reArticle.bookmarkCount}</span>
					</button>
					<c:if test="${reArticle.userId==sessionScope.member.userId}">
						<button type="button" class="btn btn-default"
							onclick="updateBoard(${reArticle.qnaNum});"
							style="width: 60px; margin-bottom: 5px;">수정</button>
					</c:if>
					<c:if
						test="${reArticle.userId==sessionScope.member.userId or reArticle.userId=='admin'}">
						<button type="button" class="btn btn-default"
							onclick="deleteBoard(${reArticle.qnaNum});" style="width: 60px;">삭제</button>
					</c:if>
								</div>
							</div>

			<div id="reply-div${reArticle.qnaNum}">
			
			</div>
					</li>
					
					
					</c:forEach>
					<c:if test="${(not empty sessionScope.member.userId) and 'admin'!=sessionScope.member.userId}">
					<li class="list-group-item note-form" style="padding: 5px 0 15px 0;
    text-align: center;">
<button class="reBoardBtn" style="font-weight: 900;
    width: 20%;
    height: 45px;
    border-radius: 10px 0 10px 0;
    text-shadow: 1px 2px #ffffff59;" onclick="insertReArticle();">답글 쓰기</button>
					</li>
					</c:if>
					<c:if test="${empty sessionScope.member.userId}">
					<li class="list-group-item note-form clearfix">


						<div class="">
							<h5 class="" style="text-align: center;">
								<a href="/login/auth?redirectUrl=%2Farticle%2F661621"
									class="link">로그인</a>을 하시면 답글을 등록할 수 있습니다.
							</h5>
						</div>

					</li>
					</c:if>
				</ul>
			
			</div>
</div>
</div>
<div id="cocoaModal" role="dialog" 
 tabindex="-1" aria-labelledby="mySmallModalLabel"
aria-hidden="true" data-backdrop="true" data-keyboard="true"  class="in modal_post_social">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="text-basic"><div class="social-btn">
		<ul><li role="" class="kakao"><a href="javascript:;" onclick="SNS.setSnsApi('kakaotalk')">카카오톡</a></li>
		<li role="" class="story"><a href="javascript:;" onclick="SNS.setSnsApi('kakaostory')">카카오스토리</a></li>
		<li role="" class="line"><a href="javascript:;" onclick="SNS.setSnsApi('line')">라인</a></li>
		<li role="" class="band"><a href="javascript:;" onclick="SNS.setSnsApi('band')">밴드</a></li>
		<li role="" class="naver"><a href="javascript:;" onclick="SNS.setSnsApi('naver')">네이버</a></li>
		<li role="" class="face"><a href="javascript:;" onclick="SNS.setSnsApi('facebook')">페이스북</a></li>
		<li role="" class="twitter"><a href="javascript:;" onclick="SNS.setSnsApi('twitter')">트위터</a></li>
		<li role="" class="googleplus"><a href="javascript:;" onclick="SNS.setSnsApi('googleplus')">Google+</a></li>
		</ul></div><div class="url-copy holder"><div class="form-control-line">
		<input type="text" class="_sns_copy_url form-control" value="https://hiconnectpeople.com/30/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&amp;bmode=view&amp;idx=2828226&amp;t=board" readonly="readonly">
		<button type="button" class="_sns_copy_btn sns_copy_btn btn btn-default" onclick="">복사</button></div></div><div id="copy_complete" class="text-center"></div></div></div>
	</div>
</div>
<script>
$(function(){
	listPage('${dto.qnaNum}',1);
	<c:forEach var="reArticle" items="${listReArticle}">
		listPage('${reArticle.qnaNum}',1);
	</c:forEach>
// 	listReArticle(1);
});
// $(function () {
// 	$("body").on("click",".reBoardBtn",function(){
// 		console.log("답글쓰기~");
// 	});
// })	

$("body").on("click",'textarea',function(){
	<c:if test="${empty sessionScope.member.userId}">
			location.href="<%=cp%>/member/login";
	</c:if>
});	
	Kakao.init('43fed4f22c437dfe99e213d8555c56e0');
	function sendLinkKakao() {
		Kakao.Link.sendDefault({
			objectType : 'feed',
			content : {
				title : '{{ post.title }}',
				description : '{{ post.content }}',
				imageUrl : '{{ post.content }}',
				link : {
					mobileWebUrl : '{{ request.build_absolute_uri }}',
					webUrl : '{{ request.build_absolute_uri }}'
				}
			},
			buttons : [ {
				title : '링크 열기',
				link : {
					mobileWebUrl : '{{ request.build_absolute_uri }}',
					webUrl : '{{ request.build_absolute_uri }}'
				}
			} ]
		});
	}
</script>