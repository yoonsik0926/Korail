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
<h3><span style="font-family: Webdings">2</span> 소개 </h3>
<div class="list-group">
    <a href="<%=cp%>/naeillo/info" class="list-group-item">내일로 소개</a>
    <a href="<%=cp%>/station/info" class="list-group-item">역 소개</a>
</div> 
