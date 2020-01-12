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
<meta property="og:url"
	content="http://172.16.100.193:8080/Project_RailTraveler/notice/article?page=1&noticeNum=52" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Your Website Title" />
<meta property="og:description" content="Your description" />
<meta property="og:image"
	content="http://www.rail-ro.com/kor/images/content/pass-1-new.png" />

<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v5.0"></script>
<div class="fb-share-button"
	data-href="http://172.16.100.193:8080/Project_RailTraveler/notice/article?page=1&amp;noticeNum=52"
	data-layout="button_count" data-size="large">
	<a target="_blank"
		href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2F172.16.100.193%3A8080%2FProject_RailTraveler%2Fnotice%2Farticle%3Fpage%3D1%26noticeNum%3D52&amp;src=sdkpreparse"
		class="fb-xfbml-parse-ignore">공유하기</a>
</div>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="<%=cp%>/resource/css/modal.css" rel="stylesheet">
<script src="<%=cp%>/resource/js/commu.js"></script>
<script type="text/javascript">

function deleteNotice() {
	var q="noticeNum=${dto.noticeNum}&${query}";
	var url="<%=cp%>/notice/delete?"+q;
	
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
<%-- 		var url="<%=cp%>/notice/delete?num="+num+"&${query}"; --%>
		location.href=url;
	}
}
function updateNotice() {
	var q="noticeNum=${dto.noticeNum}&${query}";
	var url="<%=cp%>/notice/update?"+q;
	
	location.href=url;
}

function modalOn() {
	$('#myModal').modal('toggle');
}

// http://www.libertypage.net/myblog/post/18/
</script>
<style type="text/css">
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

#fileDownTb {
	width: 100%;
	margin: 0px auto 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
}
</style>

<div id="snsModal" role="dialog" tabindex="-1"
	aria-labelledby="mySmallModalLabel" aria-hidden="true"
	data-backdrop="true" data-keyboard="true"
	class="modal1 modal_post_social" style="display: none;">
	<div class="modal-dialog"
		style="width: 315px; position: absolute; right: 37%; top: 25%;">
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
					 <a href="<%=cp%>/notice/download?noticeFileNum=${file.noticeFileNum}">${file.noticeFileNum}
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
							href="<%=cp%>/notice/zipDownload?noticeNum=${dto.noticeNum}" style="    width: 100%;
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
			<span style="padding: 10px 0px; display: block;"> 공지게시판</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-bottom: 10px;"></div>

		<div class="list-btn-nor2 upper-list" style="padding-bottom: 8px;">
			<div class="fl">
			<c:if test="${not empty preReadDto}">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/notice/article?${query}&noticeNum=${preReadDto.noticeNum}';">
					이전글</button></c:if>
					<c:if test="${not empty nextReadDto}">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/notice/article?${query}&noticeNum=${nextReadDto.noticeNum}';">
					다음글</button></c:if>
			</div>
			<div class="fr">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/notice/notice?${query}';">
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
										href="https://cafe.naver.com/ArticleList.nhn?search.clubid=11672934&amp;search.menuid=3&amp;search.boardtype=L&amp;userDisplay="
										onclick="targetChangeForMacSafari('/ArticleList.nhn?search.clubid=11672934&amp;search.menuid=3&amp;search.boardtype=L&amp;userDisplay=');return false;"
										class="m-tcol-c">공지게시판</a></td>
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
									<td nowrap="" class="m-tcol-c filter-30">|</td>

									<td class="edit _rosRestrict" onclick="updateNotice();"><a
										id="modifyFormLink" href="#" class="m-tcol-c">수정</a></td>
</c:if>
<c:if test="${dto.userId ==sessionScope.member.userId or 'admin'==sessionScope.member.userId}">
									<td nowrap="" class="m-tcol-c filter-30">|</td>
									<td class="delete _rosRestrict" onclick="deleteNotice();"><a
										 class="m-tcol-c">삭제</a></td>
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
						<table role="presentation">
							<tbody>
								<tr>
									<td class="m-tcol-c b nick">
										<table role="presentation" cellspacing="0">
											<tbody>
												<tr>
													<td class="pc2w"><img alt=""
														src="<%=cp%>/resource/images/commu/profileImg.png"
														width="30"></td>
													<td class="p-nick"><a href="#" class="m-tcol-c b"
														onclick="ui(event, 'rufl95',3,'겨링','11672934','me', 'false', 'true', 'ite', 'false', '3'); return false;">${dto.userName}
														
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
											href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=cp %>/notice/article?friendNum=${dto.noticeNum }" target="_top"
											class="m-tcol-c url-txt"><%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=cp %>/notice/article?friendNum=${dto.noticeNum }</a></span>
											
										<span><a href="#" onclick="return false;"
											class="_copyUrl url-btn" data-clipboard-action="copy"
											data-clipboard-target="#linkUrl"><img
												src="https://cafe.pstatic.net/cafe4/btn-copy-add.gif"
												width="41" height="15" alt="주소복사" class="copy" onclick="copy_trackback(); return false;"
></a></span>
												
												</td></tr>
								<tr>
									<td id="sendPost_653777" class="m-tcol-c" align="right"></td>
								</tr>
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
									<td><span class="b m-tcol-c reply ">조회수 </span><span
										class="b m-tcol-c reply">${dto.hitCount}</span></td>
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
										style="font-size: 20px; display: block; margin: 0 auto; color: #555555; cursor: pointer;"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="cb"></div>

				</div>

			</div>
			<!-- 인라인 -->
		</div>
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
				<td align="right">
					<c:if test="${dto.userId ==sessionScope.member.userId}">
					<button type="button" class="btn btn-default"
						onclick="updateNotice();">수정</button> </c:if>
					<c:if test="${dto.userId ==sessionScope.member.userId or 'admin'==sessionScope.member.userId}">
					<button type="button" class="btn btn-default"
						onclick="deleteNotice();">삭제</button></c:if>
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/notice/notice?${query}';">
							목록</button>
					</td>
			</tr>
		</table>
<div class="h-35"></div>
		
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
						${dto.noticeNum== notice.noticeNum? "style='background
					:#f1f4ff'":""}
						onclick="javascript:location.href='<%=cp%>/notice/article?${query}&noticeNum=${notice.noticeNum}'">
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
							onclick="javascript:location.href='<%=cp%>/notice/notice?${query}';">
							목록</button>
					</td>

					<td align="right">
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/notice/created';"
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
function sendLinkKakao(){
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '{{ post.title }}',
        description: '{{ post.content }}',
        imageUrl: '{{ post.content }}',
        link: {
          mobileWebUrl: '{{ request.build_absolute_uri }}',
          webUrl: '{{ request.build_absolute_uri }}'
        }
      },
      buttons: [       
        {
          title: '링크 열기',
          link: {
            mobileWebUrl: '{{ request.build_absolute_uri }}',
            webUrl: '{{ request.build_absolute_uri }}'
          }
        }
      ]
    }); 
}
</script>