<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
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
	$(".btnSendFriendLike").click(function(){
		var cs = document.getElementById("boardLikeIcon");
		if( cs.className =="far fa-heart"){
			if(! confirm("북마크 하시겠습니까 ? ")) {
				return false;
			}
			
			var url="<%=cp%>/friend/insertFriendBookmark";
			var friendNum="${dto.friendNum}";
			var query = {friendNum:friendNum};
			
			var fn = function(data){
				var state=data.state;
				if(state=="true") {
					var count = data.bookmarkCount;
					$("#friendbookmarkCount").text(count);
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
			
			var url="<%=cp%>/friend/deleteFriendBookmark";
			var friendNum="${dto.friendNum}";
			var query = {friendNum:friendNum};
			
			var fn = function(data){
				var state=data.state;
				if(state=="true") {
					var count = data.bookmarkCount;
					$("#friendbookmarkCount").text(count);
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
	function deleteFriend() {
		var q="friendNum=${dto.friendNum}&${query}";
		var url="<%=cp%>/friend/delete?"+q;
		
		if(confirm("게시물을 삭제 하시겠습니까 ?")) {
	<%-- 		var url="<%=cp%>/notice/delete?num="+num+"&${query}"; --%>
			location.href=url;
		}
	}

	//모집완료 처리 변경
	function updateEnable(friendNum) {
		var q="friendNum="+friendNum+"&${query}";
// 		console.log(q);
		var url="<%=cp%>/friend/updateEnable?"+q;
		
		location.href=url;
	}
	
// *********
// 댓글 처리 관련
// *********

// 리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		var friendNum="${dto.friendNum}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="<%=cp%>/friend/insertReply";
		var query="friendNum="+friendNum+"&content="+content+"&answer=0&content="+content;
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "<%=cp%>/friend/listReply";
	var query = "friendNum=${dto.friendNum}&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}
	
</script>
<style type="text/css">
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

.reBoardBtn:hover {
	background-color: #283164
}

.reBoardBtn:active {
	background-color: black;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
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
/* .modal1 {
    z-index: 9999;
    background: #8080807a;
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
} */
#noticeListTb td, #noticeListTb th {
	height: 40px;
}

#noticeListTb tr {
	font-weight: 600;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
}
</style>

<!-- SNS 공유하기 모달 -->
<div id="snsModal" role="dialog" tabindex="-1"
	aria-labelledby="mySmallModalLabel" aria-hidden="true"
	data-backdrop="true" data-keyboard="true"
	class="modal1 modal_post_social" style="display: none;">
	<div class="modal-dialog"
		style="width: 315px; position: absolute; right: 37%; top: 48%;">
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

<!-- 신고하기 모달 -->
<div id="declarationModal" role="dialog" tabindex="-1"
	aria-labelledby="mySmallModalLabel" aria-hidden="true"
	data-backdrop="true" data-keyboard="true"
	class="modal1 modal_post_social" style="display: none;">
	<div class="modal-dialog"
		style="width: 35%; position: absolute; right: 30%; top: 25%;">
		<div class="modal-content"
			style="background: aliceblue; text-align: center; border: 10px solid;">
			<div class="text-basic">
				<div>
					<h2>신고하기</h2>
					<div style="padding: 10px 20px;">
						<span>*신고 사유*</span>
						<textarea class='boxTA'
							style='width: 100%; height: 150px; resize: none; border-radius: 7px;'></textarea>
						<button type='button' class='btn btnSendReply btn-default'
							data-num='10'
							style='width: 100%; height: 60px; margin-top: 20px; font-size: 20px; padding: 0px 0px;'>등록</button>
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
				<table id="fileDownTb">
					<tr>
						<th>다운</th>
						<th>파일명</th>
						<th>파일크기</th>
					</tr>
					<c:forEach var="file" items="${files}">
						<a href="#"><span><i
								class="far fa-arrow-alt-circle-down"></i>
								${file.originalFilename}</span></a>(<fmt:formatNumber
							value="${file.fileSize/1024}" pattern="0.00" />KByte)
				</c:forEach>
					<tr>
						<td><a
							href="<%=cp%>/friend/zipDownload?friendNum=${dto.friendNum}">
								zip 파일로 받기</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 동행 구하기</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-bottom: 10px;"></div>

		<div class="list-btn-nor2 upper-list">
			<div class="fl">
				<div class="btn2"
					onclick="goPrev();clickcr(this,'art.prev','','',event);">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c"><img
							src="https://cafe.pstatic.net/cafe4/ico-btn-pre_.gif" width="6"
							height="5" alt="">이전글</a>
					</p>
				</div>
				<div class="btn2"
					onclick="goNext();clickcr(this,'art.next','','',event);">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c"><img
							src="https://cafe.pstatic.net/cafe4/ico-btn-net_.gif" width="6"
							height="5" alt="">다음글</a>
					</p>
				</div>

			</div>
			<div class="fr">
				<div class="btn2" onclick="goList();">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c">목록</a>
					</p>
				</div>
			</div>
		</div>
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
				<td width="300" align="left">
					<button type="button" class="btn btn-default"
						onclick="javascript:location.href='<%=cp%>/friend/friend?${query}';">
						목록</button>
				</td>

				<td align="right"><c:if test="${dto.notice!=1}">
						<c:if test="${dto.enable==1}">
							<button type="button" class="btn btn-default"
								style="background: #aaa; color: white;" disabled='disabled'>모집완료</button>
						</c:if>
						<c:if test="${dto.enable!=1}">
							<button type="button" class="btn btn-default"
								onclick="updateEnable(${dto.friendNum});"
								style="background: #f97509; color: white;"
								${dto.userId==sessionScope.member.userId?"":"disabled='disabled'"}>모집중</button>
						</c:if>
					</c:if>
					<button type="button" class="btn btn-default"
						onclick="updateBoard();">수정</button> <%-- 					<c:if --%> <%-- 						test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}"> --%>
					<button type="button" class="btn btn-default"
						onclick="deleteFriend();">삭제</button> <%-- 					</c:if> --%> <c:if
						test="${dto.notice!=1}">
						<button type="button" class="btn btn-danger" onclick="declare();">
							<i class="far fa-bell" style="color: white"></i>신고
						</button>
					</c:if></td>
			</tr>
		</table>

		<table
			style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #000; border-bottom: 2px solid #000;">
			<tr>
				<td colspan="3" style="padding-top: 15px;">
					<h3 style="margin: 10px 0 2px; font-size: 25px;">
						<c:if test="${dto.notice==1}">
							<img alt="" src="<%=cp%>/resource/images/noticeIcon.png"
								width="20" style="display: inline-block; float: left;">
						</c:if>
						${dto.subject} <span style="float: right;"> <i
							class="fas fa-comments"></i> ${dto.replyCount}

						</span>
					</h3>
				</td>
			</tr>

			<tr class="tb-row" style="height: 30px;">
				<td colspan="3" align="left"
					style="padding-left: 5px; font-size: 13px;"><span>${dto.userName}</span><span>|</span><span>${dto.created}</span><span>|</span><span>조회
						${dto.hitCount}회</span><span>|</span><span>댓글 4</span></td>
			</tr>
			<c:if test="${dto.notice==0}">
				<tr class="tb-row" style="height: 30px;">
					<td colspan="3" align="left"
						style="padding-left: 5px; font-size: 13px; color: bbb;">기간 :
						${dto.sDate} ~ ${dto.eDate}</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="3" style="padding: 20px 5px;" valign="top" height="200">${dto.content}</td>
			</tr>

			<tr class="tb-row" style="border-bottom: 0;">
				<td colspan="3" height="40" align="center"><c:if
						test="${dto.notice==0}">
						<button type="button" class="btn btnSendFriendLike btn-default"
							title="북마크"
							style="padding: 6px 8px; width: 60px; height: 60px; border-radius: 50%; margin-bottom: 5px;">

							<i id="boardLikeIcon"
								${dto.myBookMark==0? "class='far fa-heart'": "class='fas fa-heart'"}
								style="font-size: 20px; display: block; margin: 0 auto; color: orangered;"></i><span
								id="friendbookmarkCount"
								style="width: 41px; font-size: 13px; display: block; color: #888888; margin: 0 auto;">${dto.bookmarkCount}</span>
						</button>
					</c:if>
					<button type="button" class="btn btnSendBoardLike btn-default"
						title="공유하기"
						style="padding: 6px 8px; width: 60px; height: 60px; border-radius: 50%; margin-bottom: 5px;"
						onclick="snsShare();">
						<i class="far fa-share-square"
							style="font-size: 20px; display: block; margin: 0 auto; color: #555555;"></i><span
							id="boardLikeCount">공유</span>
					</button></td>
			</tr>
			<tr class="tb-row">
				<td colspan="3" align="left" style="padding-left: 5px; color: blue;"><c:if
						test="${not empty files}">
						<a onclick="modalOn();" style="cursor: pointer;"> 첨부된 파일
							(${dto.fileCount})</a>
					</c:if></td>
			</tr>
		</table>
		<c:if test="${dto.notice!=1}">
			<div id="listReply"></div>

			<table
				style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;">

				<tr class="tb-row" style="border-top: 1px solid #cccccc;">
					<td align="left" style="padding-left: 5px;" width="100">이전글<i
						class="fas fa-caret-up" style="margin: 5px;"></i> :
					</td>
					<c:if test="${empty preReadDto}">
						<td colspan="2"><span style="color: #bbb;">이전글이 존재하지
								않습니다.</span></td>
					</c:if>
					<c:if test="${not empty preReadDto}">
						<td><a
							href="<%=cp%>/friend/article?${query}&friendNum=${preReadDto.friendNum}"
							style="color: #737373;">${preReadDto.subject}</a></td>
						<td width="170">${preReadDto.created}</td>
					</c:if>
				</tr>
				<tr class="tb-row">
					<td align="left" style="padding-left: 5px;" width="100">다음글<i
						class="fas fa-caret-up" style="margin: 5px;"></i> :
					</td>
					<c:if test="${empty nextReadDto}">
						<td colspan="2"><span style="color: #bbb;">다음글이 존재하지
								않습니다.</span></td>
					</c:if>
					<c:if test="${not empty nextReadDto}">
						<td><a
							href="<%=cp%>/friend/article?${query}&friendNum=${nextReadDto.friendNum}"
							style="color: #737373;">${nextReadDto.subject}</a></td>
						<td width="170">${nextReadDto.created}</td>
					</c:if>
				</tr>
			</table>
		</c:if>
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
				<td width="300" align="left">
					<button type="button" class="btn btn-default"
						onclick="javascript:location.href='<%=cp%>/friend/friend?${query}';">
						목록</button>
				</td>

				<td align="right"><c:if test="${dto.notice!=1}">
						<c:if test="${dto.enable==1}">
							<button type="button" class="btn btn-default"
								style="background: #aaa; color: white;" disabled='disabled'>모집완료</button>
						</c:if>
						<c:if test="${dto.enable!=1}">
							<button type="button" class="btn btn-default"
								onclick="updateEnable(${dto.friendNum});"
								style="background: #f97509; color: white;"
								${dto.userId==sessionScope.member.userId?"":"disabled='disabled'"}>모집중</button>
						</c:if>
					</c:if>
					<button type="button" class="btn btn-default"
						onclick="updateBoard();">수정</button> <%-- 					<c:if --%> <%-- 						test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}"> --%>
					<button type="button" class="btn btn-default"
						onclick="deleteFriend();">삭제</button> <%-- 					</c:if> --%> <c:if
						test="${dto.notice!=1}">
						<button type="button" class="btn btn-danger" onclick="declare();">
							<i class="far fa-bell" style="color: white"></i>신고
						</button>
					</c:if></td>
			</tr>
		</table>

		<c:if test="${dto.notice==1 and not empty noticeList}">

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
						${dto.friendNum== notice.friendNum? "style='background
					:#f1f4ff'":""}
						onclick="javascript:location.href='<%=cp%>/friend/article?${query}&friendNum=${notice.friendNum}'">
						<td colspan="2" style="text-align: left; padding-left: 20px;"><i
							class="fas fa-caret-right"></i> ${notice.subject}</td>
						<td width="170" style="text-align: right; padding-right: 13px;"><i>${notice.created}</i></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${dto.notice==1}">
			<table style="width: 100%; border-spacing: 0px;">
				<tr height="45">
					<td width="300" align="left">
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/friend/friend?${query}';">
							목록</button>
					</td>

					<td align="right">
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/friend/created';"
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
</script>