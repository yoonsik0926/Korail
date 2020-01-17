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
    padding: 18px 0px;
    display: block;
    border: 1px solid;
    border-radius: 5px;
">
<img alt="여행계획로고" src="<%=cp%>/resource/images/Iconevent.png" style="width: 28px;
    position: absolute;
    margin: 0px 0 0 35px;">
<img alt="여행계획" src="<%=cp%>/resource/images/Titleevent.png" style="width: 46%;
    margin: 0px 0 0 80px;
    padding: 0;"></div>
<div class="list-group">
    <a href="<%=cp%>/event/current" class="list-group-item" >진행중인 이벤트</a>
    <a href="<%=cp%>/event/last" class="list-group-item" >지난 이벤트</a>
    <a href="<%=cp%>/event/announce" class="list-group-item" >당첨자 발표</a>
</div> 
