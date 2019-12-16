<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">

</style>

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
    <a href="<%=cp%>/member/pwd" class="list-group-item">정보 수정</a>
    <a href="<%=cp%>/bookmark/bookmark" class="list-group-item">나의 북마크</a>
	<a href="<%=cp%>/bookmark/tour" class="list-group-item">  ㄴ관광 정보</a>
	<a href="<%=cp%>/bookmark/recommend" class="list-group-item">  ㄴ여행 플랜</a>
	<a href="<%=cp%>/bookmark/commu" class="list-group-item">  ㄴ커뮤니티</a>
    <a href="<%=cp%>/ticket/ticket" class="list-group-item">나의 승차권</a>
    <a href="<%=cp%>/stamp/stamp" class="list-group-item">전국 스탬프 지도</a>
    <a href="<%=cp%>/plan/plan" class="list-group-item">나의 여행 플랜</a>
    <a href="<%=cp%>/bbs/mybbs" class="list-group-item">내가 쓴 게시물</a>
</div> 
