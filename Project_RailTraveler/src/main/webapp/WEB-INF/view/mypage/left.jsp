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
<h3><span style="font-family: Webdings">2</span> 마이페이지</h3>
<div class="list-group">
    <a href="<%=cp%>/member/update" class="list-group-item">정보 수정</a>
    <a href="<%=cp%>/singo/qna" class="list-group-item" >나의 북마크</a>
    <a href="<%=cp%>/singo/board" class="list-group-item">나의 승차권</a>
    <a href="<%=cp%>/plan/planlist" class="list-group-item">나의 여행 플랜</a>
    <a href="<%=cp%>/singo/friend" class="list-group-item" disabled="disabled">내가 쓴 게시물</a>
</div> 
