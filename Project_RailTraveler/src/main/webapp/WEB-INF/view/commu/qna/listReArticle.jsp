<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<link href="<%=cp%>/resource/css/modal.css" rel="stylesheet">
<script src="<%=cp%>/resource/js/commu.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<!-- List group -->
<ul class="list-group" style="margin: 20px 0; box-shadow: none;">

	<li id="note-title" class="list-group-item note-title"
		style="background: beige;">
		<h3 class="panel-title" style="float: left;">
			답글 <span id="note-count">${reArticleCount}</span>
		</h3>
		<h3 class="panel-title" style="float: right;">
			<a href="#">최신순<a href="#"></a> | <a href="#">추천순</a>
		</h3>
		<div style="clear: both;"></div>
	</li>
	<c:forEach var="reArticle" items="${listReArticle}">
		<li class="list-group-item note-item clearfix" id="note-1861368">
			<div style="padding: 5px 0 10px 10px;">
				<div
					style="color: red; font-size: 15px; text-shadow: 1px 1px yellow;">*
					채택 된 답변입니다 *</div>

			</div>
			<div class="content-body panel-body pull-left"
				style="padding: 0 15px; width: 92%">


				<div class="avatar avatar-medium clearfix ">
					<div style="height: 50px; float: left; width: 50px;">
						<i class="far fa-comment-dots" style="font-size: 35px;"></i>
					</div>
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

						${reArticle.content}</article>
				</fieldset>
			</div>

			<div class="content-function pull-right text-center"
				style="width: 60px;">
				<div class="content-function-group">
					<c:if
						test="${(empty reArticle.enable)and writer==sessionScope.member.userId}">
						<button type="button" class="btn btn-warning"
							onclick="updateEnable(${reArticle.qnaNum});"
							style="width: 60px; margin-bottom: 5px;">채택</button>
					</c:if>
					<button type="button" class="btn btn-default"
						onclick="clickReLikeBtn();"
						style="width: 60px; margin-bottom: 5px;">
						<i id="boardReLikeIcon" class="far fa-heart"
							style="font-size: 15px; margin: 0 auto; color: orangered;"></i>&nbsp;${reArticle.bookmarkCount}
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

			<div id="reply-div${reArticle.qnaNum}"></div>
		</li>
	</c:forEach>
	<c:if test="${not empty sessionScope.member.userId }">
		<li class="list-group-item note-form"
			style="padding: 5px 0 15px 0; text-align: center;">
			<button class="reBoardBtn"
				style="font-weight: 900; width: 20%; height: 45px; border-radius: 10px 0 10px 0; text-shadow: 1px 2px #ffffff59;"
				onclick="insertReArticle();">답글 쓰기</button>
		</li>
	</c:if>
	<c:if test="${empty sessionScope.member.userId }">
		<li class="list-group-item note-form clearfix">


			<div class="">
				<h5 class="" style="text-align: center;">
					<a href="<%=cp%>/member/login">로그인</a>을 하시면 답글을 등록할 수 있습니다.
				</h5>
			</div>

		</li>
	</c:if>
</ul>



