<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
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
	function clickLikeBtn() {
		var cs = document.getElementById("boardLikeIcon");
		if (cs.className == 'far fa-heart') {
			cs.className = 'fas fa-heart';
		} else {
			cs.className = 'far fa-heart';
		}
	}

	// http://www.libertypage.net/myblog/post/18/
</script>
<style type="text/css">
.tb-row span {
	display: inline-block;
	float: left;
	margin-right: 5px;
	color: #777777;
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

.panel-default {
	border-color: #ddd;
}

.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	/*     border-radius: 4px; */
	/*     -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05); */
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
}

.clearfix:before, .clearfix:after, .dl-horizontal dd:before,
	.dl-horizontal dd:after, .container:before, .container:after,
	.container-fluid:before, .container-fluid:after, .row:before, .row:after,
	.form-horizontal .form-group:before, .form-horizontal .form-group:after,
	.btn-toolbar:before, .btn-toolbar:after, .btn-group-vertical>.btn-group:before,
	.btn-group-vertical>.btn-group:after, .nav:before, .nav:after, .navbar:before,
	.navbar:after, .navbar-header:before, .navbar-header:after,
	.navbar-collapse:before, .navbar-collapse:after, .pager:before, .pager:after,
	.panel-body:before, .panel-body:after, .modal-footer:before,
	.modal-footer:after {
	display: table;
	content: " ";
}

.panel>.list-group, .panel>.panel-collapse>.list-group {
	margin-bottom: 0;
}

.list-group {
	padding-left: 0;
	margin-bottom: 20px;
}

ul, ol {
	margin-top: 0;
	margin-bottom: 10px;
}

.panel>.list-group:first-child .list-group-item:first-child, .panel>.panel-collapse>.list-group:first-child .list-group-item:first-child
	{
	border-top: 0;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.panel>.list-group .list-group-item, .panel>.panel-collapse>.list-group .list-group-item
	{
	border-width: 1px 0;
	border-radius: 0;
}

.list-group-item:first-child {
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
}

.note-title {
	padding: 10px 15px;
	background-color: #f2f2f2;
}

.list-group-item {
	position: relative;
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid #ddd;
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 16px;
	color: inherit;
}

.panel>.list-group .list-group-item, .panel>.panel-collapse>.list-group .list-group-item
	{
	border-width: 1px 0;
	border-radius: 0;
}

.panel-body {
	padding: 15px;
}

.content-body {
	/* position: relative; */
	border-right: 1px solid #ddd;
	width: 95%;
}

.form {
	margin-top: 20px;
}

fieldset {
	min-width: 0;
	padding: 0;
	margin: 0;
	border: 0;
}

.clearfix:after, .dl-horizontal dd:after, .container:after,
	.container-fluid:after, .row:after, .form-horizontal .form-group:after,
	.btn-toolbar:after, .btn-group-vertical>.btn-group:after, .nav:after,
	.navbar:after, .navbar-header:after, .navbar-collapse:after, .pager:after,
	.panel-body:after, .modal-footer:after {
	clear: both;
}

.note-form .panel-body {
	padding: 5px;
}
</style>
<!-- Small modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		\
		<div class="modal-content"
			style="padding: 15px; background: #fffff5; border: 3px navy dotted;">
			<h3 style="font-weight: 900; border-bottom: 1px solid;">다운로드</h3>
			<ul>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
			</ul>
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
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
				<td width="300" align="left">
					<button type="button" class="btn btn-default"
						onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">목록</button>
				</td>

				<td align="right"><c:if
						test="${sessionScope.member.userId==dto.userId}">
						<button type="button" class="btn btn-default"
							onclick="updateBoard();">수정</button>
					</c:if> <c:if
						test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
						<button type="button" class="btn btn-default"
							onclick="deleteBoard();">삭제</button>
					</c:if></td>
			</tr>
		</table>
		<div style="padding: 5px;">
			<table
				style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #000; border-bottom: 2px solid #000;">
				<tr class="tb-row" style="height: 30px;">
					<td colspan="3" align="left"
						style="padding-left: 5px; font-size: 13px; background: beige;"><span>이겨레</span><span>|</span><span>2019.
							12. 15. 20:47:43</span><span style="float: right;"><span>조회
								101회</span><span>|</span><span>댓글 4</span></span></td>
				</tr>
				<tr>
					<td colspan="3" style="padding-top: 15px;">
						<h3 style="margin: 10px 0 2px; font-size: 25px;">묻고 답하기의
							공지입니다.</h3>
					</td>
				</tr>

				<tr>
					<td colspan="3" style="padding: 20px 5px;" valign="top"
						height="200">내용입니드아아아 내용입니드아아아 내용입니드아아아 내용입니드아아아 내용입니드아아아
						내용입니드아아아</td>
				</tr>

				<tr class="tb-row">
					<td colspan="3" align="left"
						style="padding-left: 5px; color: blue;"><a
						onclick="modalOn();" style="cursor: pointer;"> 첨부된 파일 (0)</a></td>
				</tr>
			</table>
		</div>
		<div style="padding: 5px;">
			<div class="panel panel-default clearfix">
				<!-- List group -->
				<ul class="list-group">

					<li id="note-title" class="list-group-item note-title"
						style="background: beige;">
						<h3 class="panel-title">
							답글 <span id="note-count">2</span>
						</h3>
					</li>

					<li class="list-group-item note-item clearfix" id="note-1861368">
						<form action="/content/update/1861368" method="post"
							data-id="1861368" class="note-update-form">
							<input type="hidden" name="_method" value="PUT" id="_method">
							<div class="content-body panel-body pull-left">


								<div class="avatar avatar-medium clearfix ">
								<div style="height: 50px;
    float: left;
    width: 50px;"><i class="far fa-comment-dots" style="font-size: 35px;"></i></div>
									<div class="avatar-info">
										<a class="nickname" href="/user/info/75638" title="Eric Lee">Eric
											Lee</a>
										<div class="date-created">
											<span class="timeago" title="2019-12-16 22:20:55.0">2019-12-16
												22:20:55</span>
										</div>
									</div>
								</div>
								<fieldset class="form">
									<article id="note-text-1861368"
										class="list-group-item-text note-text">

										<p>둘다 합격했다는 전제하에.......</p>
										<p>가고 싶은데 가세요. 근데 두군데 다 합격???</p>

									</article>
								</fieldset>
							</div>

							<div class="content-function pull-right text-center">
								<div class="content-function-group">
									<button type="button" class="btn btnSendBoardLike btn-default" title="좋아요" style="padding: 6px 8px;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-bottom: 5px;" onclick="clickLikeBtn();"><i id="boardLikeIcon" class="far fa-heart" style="font-size: 20px;display: block;
    margin: 0 auto; color: orangered;"></i><span id="boardLikeCount" >${dto.boardLikeCount}0</span></button>
								</div>
							</div>


						</form>

						<form action="/content/delete/1861368" method="post"
							id="note-delete-form-1861368">
							<input type="hidden" name="_method" value="DELETE" id="_method">
						</form>
					</li>

					<li class="list-group-item note-item clearfix" id="note-1861374">
						<form action="/content/update/1861374" method="post"
							data-id="1861374" class="note-update-form">
							<input type="hidden" name="_method" value="PUT" id="_method">
							<div class="content-body panel-body pull-left">


								<div class="avatar avatar-medium clearfix ">
									<a href="/user/info/93467" class="avatar-photo"><img
										src="//www.gravatar.com/avatar/d15a7ecdd376eb13ffb08a9bceb4997e?d=identicon&amp;s=40"></a>
									<div class="avatar-info">
										<a class="nickname" href="/user/info/93467" title="정통토끼">정통토끼</a>
										<div class="activity">
											<span class="fa fa-flash"></span> 10
										</div>
										<div class="date-created">
											<span class="timeago" title="2019-12-16 22:32:13.0">2019-12-16
												22:32:13</span>
										</div>
									</div>
								</div>
								<fieldset class="form">
									<article id="note-text-1861374"
										class="list-group-item-text note-text">

										<p>kt는 최합이고 nc는 최종 기다리는중이라서요!</p>

									</article>
								</fieldset>
							</div>

							<div class="content-function pull-right text-center">
								<div class="content-function-group">
									<div class="note-evaluate-wrapper">
										<a href="javascript://" class="note-vote-btn" role="button"
											data-type="assent" data-eval="true" data-id="1861374"><i
											id="note-evaluate-assent-1861374"
											class="fa fa-angle-up note-evaluate-assent-assent"
											data-placement="left" data-toggle="tooltip" title=""
											data-original-title="추천"></i></a>
										<div id="content-vote-count-1861374"
											class="content-eval-count">0</div>
										<a href="javascript://" class="note-vote-btn" role="button"
											data-type="dissent" data-eval="true" data-id="1861374"><i
											id="note-evaluate-dissent-1861374"
											class="fa fa-angle-down note-evaluate-dissent-dissent"
											data-placement="left" data-toggle="tooltip" title=""
											data-original-title="반대"></i></a>
									</div>
								</div>
							</div>


						</form>

						<form action="/content/delete/1861374" method="post"
							id="note-delete-form-1861374">
							<input type="hidden" name="_method" value="DELETE" id="_method">
						</form>
					</li>

					<li class="list-group-item note-form clearfix">


						<div class="panel-body">
							<h5 class="" style="text-align: center;">
								<a href="/login/auth?redirectUrl=%2Farticle%2F661621"
									class="link">로그인</a>을 하시면 댓글을 등록할 수 있습니다.
							</h5>
						</div>

					</li>
				</ul>
			</div>


		</div>



		<table>
			<tr class="tb-row">
				<td align="left" style="padding-left: 5px;" width="100">이전글<i
					class="fas fa-caret-up" style="margin: 5px;"></i> :
				</td>
				<td><a
					href="<%=cp%>/bbs/article?${query}&num=${preReadDto.num}"
					style="color: #737373;">이전글 입니다.</a></td>
				<td width="90">2018-12-15</td>
			</tr>

			<tr class="tb-row">
				<td align="left" style="padding-left: 5px;" width="100">다음글<i
					class="fas fa-caret-down" style="margin: 5px;"></i> :
				</td>
				<td><a
					href="<%=cp%>/bbs/article?${query}&num=${preReadDto.num}"
					style="color: #737373;">다음글 입니다.</a></td>
				<td width="90">2018-12-14</td>
			</tr>
		</table>
		<table
			style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
				<td width="300" align="left">
					<button type="button" class="btn btn-default"
						onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">목록</button>
				</td>

				<td align="right"><span class="sociallink ml-1"> <a
						href="javascript:sendLinkFacebook()" title="페이스북으로 공유"> <img
							src="<%=cp%>/resource/images/commu/facebook.png" width=36
							alt="Facebook">
					</a>
				</span> <span class="sociallink ml-1"> <a
						href="javascript:sendLinkTwitter()" title="트위터로 공유"> <img
							src="<%=cp%>/resource/images/commu/twitter.png" width=36
							alt="Twitter">
					</a>
				</span> <span class="sociallink ml-1"> <a
						href="javascript:sendLinkNaver()" title="네이버로 공유"> <img
							src="<%=cp%>/resource/images/commu/naver.png" width=36
							alt="Naver">
					</a>
				</span> <span class="sociallink ml-1"> <a
						href="javascript:sendLinkKakao()" id="kakao-link-btn"
						title="카카오톡으로 공유"> <img
							src="<%=cp%>/resource/images/commu/kakaotalk.png" width=36
							alt="Kakaotalk">
					</a>
				</span></td>
			</tr>
		</table>



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