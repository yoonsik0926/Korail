<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(! idx) idx=0;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>
<%-- <h3><img alt="커뮤니티" src="<%=cp%>/resource/images/iconcommu1.png" style="width: 100%; --%>
<!--     margin: 10px 0px;"></h3> -->
<div style="        box-shadow: 1px 1px 2px #333333;
    background: #ffffff;
    width: 100%;
    color: white;
    margin: 10px auto;
    padding: 20px 10px;
    display: block;
    border: 1px solid;
    border-radius: 5px;
">
<img alt="커뮤니티로고" src="<%=cp%>/resource/images/commuIcon.png" style="    width: 28px;
    position: absolute;
    margin: 0 0 0 5px;">
<img alt="커뮤니티" src="<%=cp%>/resource/images/commuTitle.png" style="width: 78%;
    margin: 0px 0 0 41px;
    padding: 0;"></div>
<div class="list-group">
    <a href="<%=cp%>/notice/notice" class="list-group-item">공지게시판</a>
    <a href="<%=cp%>/qna/qna" class="list-group-item">묻고 답하기</a>
    <a href="<%=cp%>/board/board" class="list-group-item">자유게시판</a>
    <a href="<%=cp%>/friend/friend" class="list-group-item">동행 구하기</a>
</div> 
