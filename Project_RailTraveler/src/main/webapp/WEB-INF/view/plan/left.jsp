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
<h3><span style="font-family: Webdings">2</span> 플래너 </h3>
<div class="list-group">
    <a href="<%=cp%>/plan/write" class="list-group-item">나의 여행 플랜</a>
    <a href="<%=cp%>/friendPlan/planlist" class="list-group-item">친구의 여행 플랜</a>
    <a href="<%=cp%>/plan/recommand" class="list-group-item">추천 코스</a>
</div> 
