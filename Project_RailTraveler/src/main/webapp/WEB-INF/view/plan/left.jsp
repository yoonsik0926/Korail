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
<div style="box-shadow: 1px 1px 2px #333333;
    background: #ffffff;
    width: 100%;
    color: white;
    margin: 10px auto;
    padding: 16px 0px;
    display: block;
    border: 1px solid;
    border-radius: 5px;
">
<img alt="여행계획로고" src="<%=cp%>/resource/images/IconPlan.png" style="width: 32px;
    position: absolute;
    margin: 0px 0 0 35px;">
<img alt="여행계획" src="<%=cp%>/resource/images/TitlePlan.png" style="width: 40%;
    margin: 0px 0 0 80px;
    padding: 0;"></div>
<div class="list-group">
    <a href="<%=cp%>/plan/write" class="list-group-item">나의 여행 플랜</a>
    <a href="<%=cp%>/friendPlan/planlist" class="list-group-item">친구의 여행 플랜</a>
    <a href="<%=cp%>/plan/recommand" class="list-group-item">추천 코스</a>
</div> 
