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
<div style=" box-shadow: 1px 1px 2px #333333;
    background: #ffffff;
    width: 100%;
    color: white;
    margin: 10px auto;
    padding: 20px 13px;
    display: block;
    border: 1px solid;
    border-radius: 5px;
">
<img alt="소개로고" src="<%=cp%>/resource/images/IconInfo.png" style="    width: 24px;
    position: absolute;
    margin: 0 0 0 2px;">
<img alt="소개니티" src="<%=cp%>/resource/images/TitleInfo.png" style="    width: 85%;
    margin: 0px 0 0 33px;
    padding: 0;"></div>
<div class="list-group">
    <a href="<%=cp%>/naeillo/info" class="list-group-item">내일로 소개</a>
    <a href="<%=cp%>/station/info" class="list-group-item">역 소개</a>
</div> 
