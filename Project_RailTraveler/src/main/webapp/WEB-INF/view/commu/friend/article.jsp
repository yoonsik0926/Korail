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
	/* function sendLinkFacebook() {
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
	}); */
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
	function clickReLikeBtn() {
		var cs = document.getElementById("boardReLikeIcon");
		if (cs.className == 'far fa-heart') {
			cs.className = 'fas fa-heart';
		} else {
			cs.className = 'far fa-heart';
		}
	}

	/* function snsShare() {
		$('#snsModal').modal('show');
		$("body").css({"padding-right": "0px"}).removeClass("modal-open");
		$(".modal-backdrop").remove();
	}
	function declare() {
		$('#declarationModal').modal('show');
		$("body").css({"padding-right": "0px"}).removeClass("modal-open");
		$(".modal-backdrop").remove();
	} */

	// http://www.libertypage.net/myblog/post/18/
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
/* SNS 공유하기 모달 */
/* 
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
	background:
		url(//vendor-cdn.imweb.me/images/site/social_icon3.png?487487)
		no-repeat;
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
}
*/
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
</style>
<div id="snsModal" role="dialog" tabindex="-1"
	aria-labelledby="mySmallModalLabel" aria-hidden="true"
	data-backdrop="true" data-keyboard="true" class="modal1 modal_post_social" style="display: none;">
	<div class="modal-dialog" style="    width: 315px;
    position: absolute;
    right: 37%;
    top: 25%;">
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
<!-- Small modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
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
						onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">
						목록</button>
				</td>

				<td align="right"><c:if
						test="${sessionScope.member.userId==dto.userId}">
						<button type="button" class="btn btn-default"
							onclick="updateBoard();">수정</button>
					</c:if> <c:if
						test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
						<button type="button" class="btn btn-default"
							onclick="deleteBoard();">삭제</button>
					</c:if>
					<button type="button" class="btn btn-danger"
						onclick="declare();">
						<i class="far fa-bell" style="color: white"></i>신고
					</button>
					<div id="declarationModal" role="dialog" tabindex="-1"
	aria-labelledby="mySmallModalLabel" aria-hidden="true"
	data-backdrop="true" data-keyboard="true" class="modal1 modal_post_social" style="display: none;">
	<div class="modal-dialog" style="    width: 35%;
    position: absolute;
    right: 30%;
    top: 25%;">
		<div class="modal-content" style="background: aliceblue;
    text-align: center;
    border: 10px solid;
">
			<div class="text-basic">
				<div>
					<h2>신고하기</h2>
					<div style="    padding: 10px 20px;">
					<span>*신고 사유*</span>
					<textarea
							class='boxTA'
							style='width: 100%;
    height: 150px;
    resize: none;
    border-radius: 7px;'></textarea>
							<button type='button' class='btn btnSendReply btn-default'
								data-num='10'
								style='width: 100%;
    height: 60px;
    margin-top: 20px;
    font-size: 20px;
    padding: 0px 0px;'>등록</button>
					</div>
				</div>
				<div id="copy_complete" class="text-center"></div>
			</div>
		</div>
	</div>
</div>
					</td>
			</tr>
		</table>
		<table
			style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #000; border-bottom: 2px solid #000;">
			<thead>
				<tr>
					<td colspan="3" style="padding-top: 15px;">
						<h3 style="margin: 10px 0 2px; font-size: 25px;">
							동행구하기 게시물입니당 <span style="float: right;"> <i
								class="fa fa-heart" style="width: 22px;"></i>&nbsp;5 <i
								class="fas fa-comments"></i> 5

							</span>
						</h3>
					</td>
				</tr>

				<tr class="tb-row" style="height: 30px;">
					<td colspan="3" align="left"
						style="padding-left: 5px; font-size: 13px;"><span>이겨레</span><span>|</span><span>2019.
							12. 15. 20:47:43</span><span>|</span><span>조회 101회</span><span>|</span><span>댓글
							4</span></td>
				</tr>
				<tr>
					<td colspan="3" style="padding: 20px 5px;" valign="top"
						height="200">그 머냐 그 12월 29일에 서울 가시는분/?!!? 당일치기로 청계천+홍대
						돌아다니려구요~ 여자분 환영

						<h3>밑에 제 여행 계획표 첨부합니다~</h3>
					</td>
				</tr>

				<tr class="tb-row" style="border-bottom: 0;">
					<td colspan="3" height="40" align="center">
						<button type="button" class="btn btnSendBoardLike btn-default"
							title="좋아요"
							style="padding: 6px 8px; width: 60px; height: 60px; border-radius: 50%; margin-bottom: 5px;"
							onclick="clickLikeBtn();">
							<i id="boardLikeIcon" class="far fa-heart"
								style="font-size: 20px; display: block; margin: 0 auto; color: orangered;"></i><span
								id="boardLikeCount">${dto.boardLikeCount}3</span>
						</button>
						<button type="button" class="btn btnSendBoardLike btn-default"
							title="공유하기"
							style="padding: 6px 8px; width: 60px; height: 60px; border-radius: 50%; margin-bottom: 5px;"
							onclick="snsShare();">
							<i class="far fa-share-square"
								style="font-size: 20px; display: block; margin: 0 auto; color: #555555;"></i><span
								id="boardLikeCount">공유</span>
						</button>
					</td>
				</tr>
				<tr class="tb-row">
					<td colspan="3" align="left"
						style="padding-left: 5px; color: blue;"><a
						onclick="modalOn();" style="cursor: pointer;"> 첨부된 파일 (0)</a></td>
				</tr>
			</thead>
			<tbody class="reTbody">
				<tr height='30'>
					<td align='left' colspan="3" style="background: beige;"><span
						style='font-weight: bold;'>댓글 (3)</span></td>
				</tr>
				<tr height='35'
					style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td colspan="3">
						<div style="float: left;">
							<div style="clear: both;">
									<div>
										<b>작성자</b>
									</div>
								<div style="clear: both;">
									<span>내용이 이렇게 적히는거죠??????????????????????????</span>
								</div>
								
							</div>
							<div style="clear: both;">
							<button class="btn btn-default">
										<i class="fas fa-reply" style="transform: rotate(180deg);"></i>
									</button>
									<button class="btn btn-default">
										<i class="fas fa-times"></i>
									</button>
									<button class="btn btn-danger"
										style="width: 25px; height: 25px; padding: 0px; border-radius: 5px;">
										<i class="far fa-bell" style="color: white"></i>
									</button>
								</div>
						</div>
						<div style="float: right; text-align: right;">
							<div>2019-12-16 18:03:22</div>
						</div>
					</td>
				</tr>
				<tr height='35'
					style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td colspan="3">
						<div style="float: left;margin-right: 10px;">
							<i class="fas fa-reply" style="transform: rotate(180deg);"></i>&nbsp;
						</div>
						<div style="float: left;">
							<div style="clear: both;">
									<div>
										<b>작성자</b>
									</div>
								<div style="clear: both;">
									<span>내용이 이렇게 적히는거죠??????????????????????????</span>
								</div>
								
							</div>
							<div style="clear: both;">
							
									<button class="btn btn-default">
										<i class="fas fa-times"></i>
									</button>
									<button class="btn btn-danger"
										style="width: 25px; height: 25px; padding: 0px; border-radius: 5px;">
										<i class="far fa-bell" style="color: white"></i>
									</button>
								</div>
						</div>
						<div style="float: right; text-align: right;">
							<div>2019-12-16 18:03:22</div>
						</div>
					</td>
				</tr>
				<tr height='35'
					style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td colspan="3">
						<div style="float: left;margin-right: 10px;">
							<i class="fas fa-reply" style="transform: rotate(180deg);"></i>&nbsp;
						</div>
						<div>비밀글입니다.</div>
<!-- 						<div style="float: left;"> -->
<!-- 							<div style="clear: both;"> -->
<!-- 									<div> -->
<!-- 										<b>작성자</b> -->
<!-- 									</div> -->
<!-- 								<div style="clear: both;"> -->
<!-- 									<span>내용이 이렇게 적히는거죠??????????????????????????</span> -->
<!-- 								</div> -->
								
<!-- 							</div> -->
<!-- 							<div style="clear: both;"> -->
<!-- 									<button class="btn btn-default"> -->
<!-- 										<i class="fas fa-times"></i> -->
<!-- 									</button> -->
<!-- 									<button class="btn btn-danger" -->
<!-- 										style="width: 25px; height: 25px; padding: 0px; border-radius: 5px;"> -->
<!-- 										<i class="far fa-bell" style="color: white"></i> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 						</div> -->
<!-- 						<div style="float: right; text-align: right;"> -->
<!-- 							<div>2019-12-16 18:03:22</div> -->
<!-- 						</div> -->
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td style='padding: 15px 20px;' colspan="3"><textarea
							class='boxTA'
							style='width: 92%; height: 50px; float: left; resize: none; overflow-y: scroll;'></textarea>
						<div
							style='padding: 0 10px;
    width: 8%; height: 50px; float: left; font-size: 15px;'>
							<input type="checkbox" name="ss"><label
								style="margin: 0 0 0px 3px;">비밀글</label>
							<button type='button' class='btn btnSendReply btn-default'
								data-num='10'
								style='width: 100%; height: 29px; padding: 2px 1px;'>등록</button>

						</div></td>
				</tr>





			</tfoot>
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