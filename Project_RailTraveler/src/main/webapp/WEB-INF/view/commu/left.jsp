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
<h3><span style="font-family: Webdings">2</span> 커뮤니티 </h3>
<div class="list-group">
    <a href="<%=cp%>/notice/notice" class="list-group-item">공지사항</a>
    <a href="<%=cp%>/qna/qna" class="list-group-item">묻고 답하기</a>
    <a href="<%=cp%>/board/board" class="list-group-item">자유게시판</a>
    <a href="<%=cp%>/friend/friend" class="list-group-item">동행 구하기</a>
</div> 
