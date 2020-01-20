<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String cp = request.getContextPath();
	StringBuffer sb = request.getRequestURL();
	String url = sb.toString();
	String uri = request.getRequestURI();
	String path = request.getServletPath();
	String nowUrl =request.getRequestURL().toString();
%>
<link href="<%=cp%>/resource/css/modal.css" rel="stylesheet">
<script src="<%=cp%>/resource/js/commu.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
//게시글 공감 여부
$(function(){
	$(".btnSendBoardLike").click(function(){
		<c:if test="${empty sessionScope.member.userId}">
			if(confirm("로그인이 필요한 기능입니다. 로그인페이지로 이동하시겠습니까?")){
				location.href="<%=cp%>/member/login";
				return;
			}
			else{
				return;
			}
		</c:if>
		var cs = document.getElementById("boardLikeIcon");
		if( cs.className =="far fa-heart"){
			if(! confirm("북마크 하시겠습니까 ? ")) {
				return false;
			}
			
			var url="<%=cp%>/board/insertBoardBookmark";
			var boardNum="${dto.boardNum}";
			var query = {boardNum:boardNum};
			
			var fn = function(data){
				var state=data.state;
				if(state=="true") {
					var count = data.bookmarkCount;
					$("#boardbookmarkCount").text(count);
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
			
			var url="<%=cp%>/board/deleteBoardBookmark";
			var boardNum="${dto.boardNum}";
			var query = {boardNum:boardNum};
			
			var fn = function(data){
				var state=data.state;
				if(state=="true") {
					var count = data.bookmarkCount;
					$("#boardbookmarkCount").text(count);
					cs.className = 'far fa-heart';
				} else if(state=="false") {
					alert("좋아요는 한번만 가능합니다. !!!");
				}
			};
			
			ajaxJSON(url, "post", query, fn);
		}
	});
});
	
	//첨부파일 모달
	function modalOn() {
		$('#myModal').modal('toggle');
	}
	//게시물 삭제
	function deleteBoard() {
		var q="boardNum=${dto.boardNum}&${query}";
		var url="<%=cp%>/board/delete?"+q;
		
		if(confirm("게시물을 삭제 하시겠습니까 ?")) {
	<%-- 		var url="<%=cp%>/notice/delete?num="+num+"&${query}"; --%>
			location.href=url;
		}
	}

	
// *********
// 댓글 처리 관련
// *********

// 리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		var boardNum="${dto.boardNum}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			alert("내용을 입력해주세요");
			$tb.find("textarea").focus();
			return false;
		}
		console.log(content);
		content = encodeURIComponent(content);
		var url="<%=cp%>/board/insertReply";
		var query="boardNum="+boardNum+"&content="+content+"&answer=0";
		var fn = function(data){
			$tb.find("textarea").val("");
			
			
			var state=data.state;
			if(state=="true") {
				listPage(data.total_page);
				console.log(data.total_page);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
// _btnReply
function displayReplyForm(num){
	var cs = ".replyForm"+num;
	var $cs = $(cs);
	var test_cs=".btnReReply"+num;
		if($(cs).is(":visible")){
			$cs.find("textarea").val("");
			$(cs).css("display","none");
			$(test_cs).text("답글");
		}else{
			$(cs).css("display","block");
			$cs.find("textarea").focus();
			$(test_cs).text("답글취소");
			
		}
};
//_btnReply
function displayReplyUpdateForm(num, content){
	console.log(content);
	var cs = ".replyUpdateForm"+num;	//수정창
	var ct = ".replyContent"+num;	//댓글 내용
	var $cs = $(cs);
	var $ct = $(ct);
	
	var test_cs=".btnUpdateReply"+num;
		if($(cs).is(":visible")){
			$cs.find("textarea").val(content);
			$(cs).css("display","none");
			$(ct).css("display","block");
			$(test_cs).text("수정");
		}else{
			$(cs).css("display","block");
			$(ct).css("display","none");
			$cs.find("textarea").focus();
			$(test_cs).text("수정취소");
			
		}
};
function insertReply(num,pageNo){
	var boardNum="${dto.boardNum}";
	var cs = ".replyForm"+num;
	var $tb = $(cs);
	var content=$tb.find("textarea").val().trim();
	if(! content) {
		alert("내용을 입력해주세요");
		$tb.find("textarea").focus();
		return false;
	}
	content = encodeURIComponent(content);
	var url="<%=cp%>/board/insertReply";
	var query="boardNum="+boardNum+"&content="+content+"&answer="+num+"&pageNo="+pageNo;
	console.log(query);
	var fn = function(data){
		displayReplyForm(num);
		
		var state=data.state;
		if(state=="true") {
			listPage(data.pageNo);
		} else if(state=="false") {
			alert("댓글을 추가 하지 못했습니다.");
		}
	};
	
	ajaxJSON(url, "post", query, fn);
};

function updateReply(boardReplyNum,pageNo){
	var cs = ".replyUpdateForm"+boardReplyNum;
	var $tb = $(cs);
	var content=$tb.find("textarea").val().trim();
	if(! content) {
		alert("내용을 입력해주세요");
		$tb.find("textarea").focus();
		return false;
	}
	content = encodeURIComponent(content);
	var url="<%=cp%>/board/updateReply";
	var query="boardReplyNum="+boardReplyNum+"&content="+content+"&pageNo="+pageNo;
	var fn = function(data){
		var state=data.state;
		if(state=="true") {
			listPage(data.pageNo);
		} else if(state=="false") {
			alert("댓글을 수정 하지 못했습니다.");
		}
	};
	
	ajaxJSON(url, "post", query, fn);
};

//페이징 처리
$(function(){
	<c:if test="${not empty pageNo}">
		listPage(${pageNo});
	</c:if>
	<c:if test="${empty pageNo}">
	listPage(1);
</c:if>
});

function listPage(page) {
	var url = "<%=cp%>/board/listReply";
	var query = "boardNum=${dto.boardNum}&userId=${dto.userId}&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}
	
	
function copy_trackback() {
	var trb = "<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=cp %>/board/article?boardNum=${dto.boardNum }";
	var browse = navigator.userAgent.toLowerCase(); 
    
    if( (navigator.appName == 'Netscape' && browse.indexOf('trident') != -1) || (browse.indexOf("msie") != -1)) {
    	if(confirm("이 글의 트랙백 주소를 클립보드에 복사하시겠습니까?")){
			window.clipboardData.setData("Text", trb);
    		alert("복사완료!");
    	}
    }else{
    	temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", trb);
    }
}	

//***************신고관련
//***************신고관련
//***************신고관련
//***************신고관련
//***************신고관련


//취소 버튼 눌렀을 시 '기타' 지우기
$(function(){
	$('.cancelsingo').click(function(){
		var f = document.singoForm;		
		$('#etcText').val("");		
		//f.etcText.value="";		
	});
});

//게시글에서 "신고" 버튼 눌렀을 시 
function articleSingo() {
	var num = '${dto.boardNum}';
	var userId = "${sessionScope.member.userId}";
	  
	if ( userId == "") {
		if(confirm("로그인이 필요한 기능입니다. 로그인페이지로 이동하시겠습니까?"))
			location.href="<%=cp%>/member/login";
		else{
			return;
		}
	}
		var targetUserId  = '${dto.userId}';
		var targetContent = '${dto.subject}';
		var targetUrl = "<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=cp %>/board/article?boardNum=${dto.boardNum }";
		
		$('#targetType').val('0');
		$('#targetUserId').val(targetUserId);
		$('#targetContent').val(targetContent);		
		$('#targetTitle').val("board");		
		$('#targetNum').val(num);
		$('#targetUrl').val(targetUrl);

		$("#singo").modal(); 
	
}

//댓글에서 "신고" 버튼 눌렀을 시 
function replySingo(num,pageNo,t_userId) {
	var userId = "${sessionScope.member.userId}";
	  
	if ( userId == "") {
		if(confirm("로그인이 필요한 기능입니다. 로그인페이지로 이동하시겠습니까?"))
			location.href="<%=cp%>/member/login";
		else{
			return;
		}
	}
		var targetUserId  = t_userId;
		var $targetContent  = ".replyContent"+num;
		var targetContent  = $($targetContent).text();
		
		var targetUrl = "<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=cp %>/board/article?boardNum=${dto.boardNum }&pageNo="+pageNo;
		
		$('#targetType').val('1');
		$('#targetUserId').val(targetUserId);
		$('#targetContent').val(targetContent);			
		$('#targetTitle').val("boardReply");		
		$('#targetNum').val(num);
		$('#targetUrl').val(targetUrl);

		$("#singo").modal(); 
	
}

//모달창 내부에서 신고하기 버튼 눌렀을 때
function singosubmit() {	
	var f = document.singoForm;
	var content = $('#singoreason').val();
	if (content == 'etc'){		
		 content = f.content.value;		 
	}
	var url = "<%=cp%>/singo/insertSingo2";
	var query = "targetNo="+f.targetNo.value+"&targetType="+f.targetType.value+"&targetTitle="+f.targetTitle.value
					+"&targetUserId="+f.targetUserId.value+"&content="+content+"&targetUrl="+f.targetUrl.value;
	console.log(f.targetUrl.value);
	var fn = function(data){
		
			if(data.state=="true"){
				alert("신고 접수 성공");
				$("#singo").modal('hide');
			}else{
				alert("신고 접수 실패");
			}
	}; 
	
	ajaxJSON(url, "get", query, fn);
}



//신고 모달을 관리하는 스크립트
$(function() {
	
	//첫번째 더보기 클릭시 보이기/숨기기
	$('#adverClick').click(function(){
		if($("#adverInfo").css("display") == "none"){   
	        $('#adverInfo').css("display", "block");   
	    } else {  
	        $('#adverInfo').css("display", "none");   
	    } 
	});
	
	//두번째 더보기 클릭시 보이기/숨기기
	$('#19ageClick').click(function(){
		if($("#19ageInfo").css("display") == "none"){   
	        $('#19ageInfo').css("display", "block");   
	    } else {  
	        $('#19ageInfo').css("display", "none");   
	    } 
	});
	
	//라디오 박스 중 기타를 선택했을 시
	$("input:radio[id=etc]").click(function(){		
		if($("#etcTextarea").css("display") == "none"){   
	        $('#etcTextarea').css("display", "block");   
	    } else {  
	        $('#etcTextarea').css("display", "none");   
	    } 
		
	});
	
	//기타를 선택하지 않은 나머지를 선택했을시
	$("input:radio[class=notEtc]").click(function(){		
		 $('#etcTextarea').css("display", "none");  		
	});
	
	//content 값 보내기	
	$("input:radio[name=chk_info]").click(function(){		
		var val = $(this).val();
		var content;
		
		if(val != 'etc'){
			content =$(this).val();	
			$('#singoreason').val(content);
		}else{
			$('#singoreason').val('etc');
		}
		
	});
	
	
	
	
})

</script>
<style type="text/css">
::-webkit-scrollbar {
	display:none;
}
tfoot td {
	padding: 6px 10px;
}

.tb-row span {
	display: inline-block;
	float: left;
	margin-right: 5px;
	color: #b2b2b2;
}

.tb-row {
	height: 40px;
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

.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control
	{
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
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
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

.reTbody tr td {
	padding: 10px 20px;
}

.reTbody tr td .btn {
	width: 25px;
	height: 25px;
	padding: 0px;
	border-radius: 5px;
}

#noticeListTb td, #noticeListTb th {
	height: 40px;
}

#noticeListTb tr {
	font-weight: 600;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
}

.fl {
	float: left;
	margin-top: 8px;
}

.fr {
	float: right;
	margin-top: 8px;
}

a {
	color: black;
}

.cb {
	clear: both;
}

.list-blog .tit-box td, .gate-box .tit-box td {
	padding-right: 5px;
	line-height: 1.5;
}

.board-box-line-dashed {
	border-bottom-style: dashed;
	border-bottom-width: 1px;
	-ms-filter: "alpha(opacity=30)";
	filter: alpha(opacity = 30);
	opacity: 0.3;
	height: 3px;
}

.span {
	font-size: 14px;
}

.m-tcol-c {
	color: #666;
	word-wrap: break-word;
}

.h-10 {
	clear: both;
	height: 15px;
	margin: 0;
	font-size: 0;
	overflow: hidden;
}

#main-area .inbox .tbody {
	/*     width: 743px; */
	margin: 20px auto 0;
	color: #222;
}

.h-35 {
	clear: both;
	height: 35px;
	margin: 0;
	font-size: 0;
	overflow: hidden;
}

.filter-30 {
	opacity: 0.3;
}

.reply-box .filter-30 {
	padding-right: 3px;
}

.list-blog .inbox .reply-box td {
	vertical-align: middle;
}

.reply-box .fr .m-tcol-c.filter-30 {
	padding-top: 1px;
}

.reply-box td {
	padding-right: 3px;
	vertical-align: top;
}

.spi_lst li {
	float: left;
	position: relative;
	margin-left: 5px;
	list-style: none;
}

.reply-box .u_likeit_list_module {
	display: inline-block;
	margin: -2px 0 0 3px;
	vertical-align: top;
}

.reply-box .u_likeit_list_module .u_likeit_list_btn {
	height: 25px;
	padding: 0 10px 0 8px;
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #fff;
}

.u_likeit_list_module .u_likeit_list_btn {
	display: inline-block;
	overflow: hidden;
	vertical-align: top;
}

.reply-box .u_likeit_list_module .u_likeit_list_btn .u_ico {
	width: 14px;
	height: 9px;
	margin-top: 4px;
	background-position: -14px -26px;
}

.u_likeit_list_module .u_likeit_list_btn .u_ico, .article-movie-sub .u_likeit_list_module .u_likeit_list_btn .u_ico
	{
	background-image:
		url(https://ssl.pstatic.net/static/common/likeit/cafe/sp_likeit.png);
}

.u_likeit_list_module .u_likeit_list_btn .u_ico {
	display: inline-block;
	overflow: hidden;
}

.reply-box .u_likeit_list_module .u_likeit_list_btn .u_cnt {
	margin-top: 2px;
	color: #666;
	font-weight: bold;
	font-size: 12px;
	font-family: '돋움', dotum, Helvetica, sans-serif;
}

.u_likeit_list_module .u_likeit_list_btn .u_cnt, .u_likeit_list_module .u_likeit_list_btn .u_txt
	{
	display: inline-block;
	vertical-align: top;
	font-weight: 700;
}

.list-btn-nor {
	height: auto;
	padding-top: 8px;
}

.list-btn-nor {
	clear: both;
}

/* 댓글관련 */
.box-reply2 {
	zoom: 1;
	margin: 0;
	padding: 5px 26px 16px 24px;
}

.box-reply2 {
	background-color: #f9f9f9;
}

.cmlist {
	margin: 0;
	padding: 0;
}

.u_cbox ul, .u_cbox ol {
	list-style: none;
}

.cmlist li {
	list-style: none;
	margin: 0;
	padding: 10px 10px 7px;
	height: 1%;color: #666;
}

.cmlist .board-box-line-dashed {
	height: 1px;
	padding: 0;
	overflow: hidden;
	font: 0/0 arial;
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

.box-reply2 .pers_nick_area {
    padding: 0 !important;
    margin: 0;
    text-align: left;
    width: auto;
    float: left;
}

.cmlist .date {
    float: left;
   font-size: 15px;
    font-family: '돋움',dotum,Helvetica,sans-serif;
    margin: 2px 0 0 1px;
}
.box-reply2 .m-tcol-c {
    color: #666;
}
.cmlist .dsc_comm {
    float: left;
    margin: 3px 0 0 7px;
    padding-left: 10px;
    background: url(https://cafe.pstatic.net/cafe4/bu_arr.png) no-repeat 0 0;
    _background: none;
    _filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='https://cafe.pstatic.net/cafe4/bu_arr.png', sizingMethod='crop');
    font-size: 11px;
    font-family: '돋움',Dotum;
    letter-spacing: -1px;
}
.cmlist .btn_edit {
    float: right;
    margin: 0;
    padding-top: 3px;
}
.box-reply2 .h ~ .comm {
    padding-left: 40px;
}
.cmlist .comm {
    overflow: hidden;
    padding: 3px 0 3px 28px;
    margin: 0;
    line-height: 15px;
    text-align: left;
    word-break: break-all;
    word-wrap: break-word;
}

/* 댓글의 페이징 */
.cc_paginate.cmt {
    height: 29px;
}
.cc_paginate {
    height: 51px;
    padding: 7px 0 0;
    text-align: center;
}

.cmlist li.reply {
    padding-left: 29px;
}
</style>

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
						<input type="text" id="sns_copy_url"
							class="_sns_copy_url form-control"
							value="https://hiconnectpeople.com/30/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&amp;bmode=view&amp;idx=2828226&amp;t=board"
							readonly="readonly">
						<button type="button"
							class="_sns_copy_btn sns_copy_btn btn btn-default"
							onclick="SNS.copyToClipboard()"
							data-clipboard-target="._sns_copy_url">복사</button>
					</div>
				</div>
				<div id="copy_complete" class="text-center"></div>
			</div>
		</div>
	</div>
</div>

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
					 <a href="<%=cp%>/board/download?boardFileNum=${file.boardFileNum}">
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
							href="<%=cp%>/board/zipDownload?boardNum=${dto.boardNum}" style="    width: 100%;
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
			<span style="padding: 10px 0px; display: block;">자유게시판</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-bottom: 10px;"></div>

		<div class="list-btn-nor2 upper-list" style="padding-bottom: 8px;">
			<div class="fl">
			<c:if test="${not empty preReadDto}">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/board/article?${query}&boardNum=${preReadDto.boardNum}';">
					이전글</button></c:if>
					<c:if test="${not empty nextReadDto}">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/board/article?${query}&boardNum=${nextReadDto.boardNum}';">
					다음글</button></c:if>
			</div>
			<div class="fr">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/board/board?${query}';">
					목록</button>
			</div>
			<div class="cb"></div>
		</div>

		<div style="border: 1px solid rgba(139, 139, 139, 0.3); clear: both;">
			<div class="inBox" style="margin: 14px; clear: both;">
				<div class="tit-box">
					<div class="fl" style="width: 470px; margin-top: 4px;">
						<table role="presentation" border=0>
							<tbody>
								<tr valign="top">
									<td><span class="b m-tcol-c" style="font-weight: 900;">${dto.subject}</span></td>
									<td nowrap="" class="m-tcol-c filter-30">|</td>
									<td nowrap="" class="m-tcol-c"><a
										href="<%=cp%>/board/board?${query}">자유게시판</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="fr">
						<table role="presentation">
							<tbody>
								<tr>
									<td></td>
									<td class="m-tcol-c date">${dto.created}</td>
<c:if test="${dto.userId ==sessionScope.member.userId}">
									<td class="m-tcol-c filter-30">|</td>

									<td class="" onclick="updateBoard();"><a
										id="modifyFormLink" href="#" class="m-tcol-c">수정</a></td>
</c:if>
<c:if test="${dto.userId ==sessionScope.member.userId or 'admin'==sessionScope.member.userId}">
									<td nowrap="" class="m-tcol-c filter-30">|</td>
									<td class="" onclick="deleteBoard();"><a
										href="javascript:checkLogin('delete');" class="m-tcol-c">삭제</a></td>
									</c:if>	
								</tr>
							</tbody>
						</table>
					</div>
					<div class="cb"></div>
				</div>
				<div class="board-box-line-dashed"></div>
				<div class="etc-box">
					<div class="fl">
						<table>
							<tbody>
								<tr>
									<td class="m-tcol-c b nick">
										<table>
											<tbody>
												<tr>
													<td class="pc2w"><img alt=""
														src="<%=cp%>/resource/images/commu/profileImg.png"
														width="30"></td>
													<td class="p-nick"><a href="#">
													<c:out value="${fn:substring(dto.userName, 0, fn:length(dto.userName) - 1)}" />**
														(<c:out value="${fn:substring(dto.userId, 0, fn:length(dto.userId) - 3)}" />***)</a></td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="m-tcol-c step">
									<c:if test="${dto.userId=='admin'}">
									<span class="filter-50">관리자</span>
									</c:if>
									<c:if test="${dto.userId!='admin'}">
									<span class="filter-50">회원</span>
									</c:if>
										<span><img class="levelico"
											src="https://cafe.pstatic.net/levelicon/1/3_110.gif"
											border="0"></span></td>

								</tr>
							</tbody>
						</table>
					</div>
					<div class="fr">
						<table role="presentation" cellspacing="0" cellpadding="0"
							border="0">
							<tbody>
								<tr>
									<td valign="top" class="url" align="right"><span
										class="filter-50"><a
											href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=cp %>/board/article?boardNum=${dto.boardNum }" target="_top"
											class="m-tcol-c url-txt"><%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=cp %>/board/article?boardNum=${dto.boardNum }</a></span>
											
										<span><a href="#" onclick="return false;"
											class="_copyUrl url-btn" data-clipboard-action="copy"
											data-clipboard-target="#linkUrl"><img
												src="https://cafe.pstatic.net/cafe4/btn-copy-add.gif"
												width="41" height="15" alt="주소복사" class="copy" onclick="copy_trackback(); return false;"
></a></span>
												
												</td></tr>
								
							</tbody>
						</table>
					</div>
					<div class="cb"></div>
				</div>
				<c:if test="${not empty files}">
					<div class="atch_file_area">

						<a class="fr" onclick="modalOn();" style="cursor: pointer;">
							첨부파일 <span class="m-tcol-p" style="margin-right: 2px;">(<em>${dto.fileCount}</em>)
						</span><i class="far fa-caret-square-up"></i>
						</a>
						<div class="cb"></div>
					</div>
				</c:if>

				<div class="h-10"></div>
				<div class="tbody m-tcol-c" id="tbody"
					style="width: 744px; padding-left: 43px; padding-right: 43px; margin-right: 0px;">
					${dto.content}</div>

				<div class="h-35"></div>
				<div class="reply-box" id="cmtMenu">
					<div class="fl reply_sort">
						<table role="presentation" cellspacing="0" cellpadding="0"
							border="0">
							<tbody>
								<tr style="vertical-align: top">

									<td class="reply"><a href="javascript:"
										class="reply_btn b m-tcol-c m-tcol-p _totalCnt" id="comment">댓글
											${dto.replyCount} <img
											src="https://cafe.pstatic.net/cafe4/ico-new.gif" width="10"
											height="9" alt="new" style="margin-left: 3px;">

									</a></td>
									<td class="m-tcol-c filter-30">|</td>
									<td class="_sortList" style="padding: 0;">
										<div style="position: relative; top: -3px;">
<!-- 											<a href="#" class="b m-tcol-c"> -->
											<span>등록순</span><span
												style="display: none">최신순</span><i class="fas fa-caret-down"
												style="margin: 5px;"></i> 
<!-- 												</a> -->
										</div>
									</td>
									<td class="m-tcol-c filter-30">|</td>

									<td><span class="b m-tcol-c reply ">조회수 </span><span
										class="b m-tcol-c reply">${dto.hitCount}</span></td>

									<td class="m-tcol-c filter-30">|</td>
									<td id=><a href="#"
										class="b m-tcol-c like like_lst_btn " id="likeItMemberBtn" style="top: -3px;
    color: tomato;
    position: relative;">좋아요<i
											class="fas fa-caret-down" style="margin: 5px;"></i></a>
										<div class="u_likeit_list_module _reactionModule"
											style="visibility: visible;">
											<a href="#" class="u_likeit_list_btn _button off btnSendBoardLike"
												> 
												<i id="boardLikeIcon"
								${dto.myBookMark==0? "class='far fa-heart'": "class='fas fa-heart'"}
								style="color: orangered;"></i>
												<em class="u_cnt _count" id="boardbookmarkCount">${dto.bookmarkCount}</em>
											</a>
										</div></td>

								</tr>
							</tbody>
						</table>
					</div>

					<div class="fr cafe_spi">
						<table role="presentation">
							<tbody>
								<tr>
									<td>
										<div id="spiButton" data-style="type_c" class="naver-splugin"
											data-url="https://cafe.naver.com/ite/653777"
											data-title="답변이 어떻게 달리는지 확인 하는 게시물" data-likeserviceid="CAFE"
											data-likecontentsid="11672934_ite_653777"
											data-option="{textClass: 'm-tcol-c', align: 'right', onLoginRedirect: parent.openLoginLayer}"
											data-cafe-source-type="111"
											data-cafe-source-title="답변이 어떻게 달리는지 확인 하는 게시물"
											data-blog-source-type="111"
											data-blog-source-title="답변이 어떻게 달리는지 확인 하는 게시물"
											data-blog-proxy-url="https://cafe.naver.com/CafeScrapContent.nhn?clubid=11672934&amp;articleid=653777&amp;type=blog"
											data-cafe-proxy-url="https://cafe.naver.com/CafeScrapContent.nhn?clubid=11672934&amp;articleid=653777&amp;type=cafe"
											data-me-display="off"
											data-oninitialize="splugin_oninitialize();"
											splugin-id="2779035978"></div>
									</td>
									<td><i class="far fa-share-square btnSendBoardLike"
										onclick="snsShare();"
										style="font-size: 20px; display: block; margin: 0 auto; color: #555555; cursor: pointer;"></i><span
										class="blind"></span></td>
									<td class="m-tcol-c filter-30">|</td>
									<td onclick="articleSingo();" style="cursor: pointer;">신고</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="cb"></div>

				</div>





				<div class="box-reply2 bg-color u_cbox" id="eNvhT"
					style="display: block;">
					<!-- 댓글 리스트  -->
						<div id="listReply"></div>



<div style="padding-top: 20px;">
					<table class="cminput" style="width: 100%;">
						<tbody>
							<tr>
						<td><textarea
								class='boxTA'
								style='width: 92%; height: 100px; float: left; resize: none; overflow-y: scroll;' ${empty sessionScope.member.userId?'placeholder="로그인이 필요한 서비스 입니다.&#13;&#10;클릭시 로그인 창으로 이동합니다."':'placeholder="모두가 함께 만들어 가는 깨끗한 공간입니다. &#13;&#10;훈훈한 댓글 부탁드립니다^^"' }></textarea>
							<div
								style='padding: 0 10px; width: 8%; height: 50px; float: left; font-size: 15px;'>
								<button type='button' class='btn btnSendReply btn-default'
									data-num='${dto.boardNum}'
									style='width: 100%; height: 90px; padding: 2px 1px;'>등록</button>

							</div></td>
					</tr>
						</tbody>
					</table>
</div>


					<div class="m-tcol-c reply_error" style="display: none;">
						<strong>죄송합니다. 댓글 시스템 오류로 댓글을 읽거나 쓸 수 없습니다.</strong> 문제가 지속될 경우 <a
							href="http://help.naver.com/" target="_blank" class="m-tcol-c">고객센터</a>에
						알려주시면 친절하게 안내해 드리겠습니다.
					</div>
				</div>















			</div>
			<!-- 인라인 -->
		</div>
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
				<td align="right">
					<c:if test="${dto.userId ==sessionScope.member.userId}">
					<button type="button" class="btn btn-default"
						onclick="updateBoard();">수정</button> </c:if>
					<c:if test="${dto.userId ==sessionScope.member.userId or 'admin'==sessionScope.member.userId}">
					<button type="button" class="btn btn-default"
						onclick="deleteBoard();">삭제</button></c:if>
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/board/board?${query}';">
							목록</button>
					</td>
			</tr>
		</table>
<div class="h-35"></div>
		<c:if test="${not (dto.userId eq 'admin')}">

			<table
				style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<c:if test="${not empty preReadDto}">
				<tr class="tb-row" style="border-top: 1px solid #eee;border-bottom: 1px solid #eee;">
					<td align="left" style="padding-left: 10px; font-weight: 800;" width="100"><i
						class="fas fa-caret-up" style="margin: 5px; color: orange;"></i> 이전글
					</td>
						<td><a
							href="<%=cp%>/board/article?${query}&boardNum=${preReadDto.boardNum}"
							style="color: #737373;">${preReadDto.subject}</a></td>
						<td width="150">${preReadDto.created}</td>
				</tr>
					</c:if>
					<c:if test="${not empty nextReadDto}">
				<tr class="tb-row" style="border-top: 1px solid #eee;border-bottom: 1px solid #eee;">
					<td align="left" style="padding-left: 10px;font-weight: 800;" width="100"><i
						class="fas fa-caret-down" style="margin: 5px;color: orange;"></i> 다음글
					</td>
						<td><a
							href="<%=cp%>/board/article?${query}&boardNum=${nextReadDto.boardNum}"
							style="color: #737373;">${nextReadDto.subject}</a></td>
						<td width="150">${nextReadDto.created}</td>
				</tr>
					</c:if>
			</table>
		</c:if>
		<c:if test="${dto.userId eq 'admin' and not empty noticeList}">

			<table id='noticeListTb'
				style="width: 100%; margin: 50px auto 10px; border-spacing: 0px; border-collapse: collapse; border-bottom: 2px dotted #000;">
				<tr style="border-bottom: 2px dotted black; border-top: 0;">
					<td colspan="3"><div class="noticeBox">
							<img alt="" src="<%=cp%>/resource/images/noticeIcon.png"
								width="20" style="display: inline-block; float: left;"> <span
								style="font-size: 20px; font-weight: 600; display: block;">공지
								목록</span>
						</div></td>
				</tr>
				<c:forEach var="notice" items="${noticeList}">
					<tr
						${dto.boardNum== notice.boardNum? "style='background
					:#f1f4ff'":""}
						onclick="javascript:location.href='<%=cp%>/board/article?${query}&boardNum=${notice.boardNum}'">
						<td colspan="2" style="text-align: left; padding-left: 20px;"><i
							class="fas fa-caret-right"></i> ${notice.subject}</td>
						<td width="170" style="text-align: right; padding-right: 13px;"><i>${notice.created}</i></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${dto.userId eq 'admin'}">
			<table style="width: 100%; border-spacing: 0px;">
				<tr height="45">
					<td width="300" align="left">
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/board/board?${query}';">
							목록</button>
					</td>

					<td align="right">
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/board/created';"
							style="float: right; margin-left: 6px;">
							<img alt="" src="<%=cp%>/resource/images/editIcon.png"
								style="height: 21px;"> 글쓰기
						</button>
				</tr>
			</table>
		</c:if>
	</div>

</div>
<script>
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
	
	function deleteBoard() {
			var q = "boardNum=${dto.boardNum}&${query}";
			var url = "<%=cp%>/board/delete?" + q;

			if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
					location.href=url;
			}
		}

		function updateBoard() {
			var q = "boardNum=${dto.boardNum}&page=${page}";
			var url = "<%=cp%>/board/update?" + q;

			location.href=url;
		}
		
		
</script>