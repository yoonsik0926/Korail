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
<h3><span style="font-family: Webdings">2</span> 관광정보 </h3>
<div class="list-group">
    <a href="<%=cp%>/tour/sudo" class="list-group-item">수도권</a>
    <a href="<%=cp%>/tour/gangwon" class="list-group-item">강원권</a>
    <a href="<%=cp%>/tour/chungcheong" class="list-group-item">충청권</a>
    <a href="<%=cp%>/tour/jeonla" class="list-group-item">전라권</a>
    <a href="<%=cp%>/tour/gyeongsang" class="list-group-item">경상권</a>
</div> 
