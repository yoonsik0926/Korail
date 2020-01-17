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
	
	var itemidx="${subItems}";
	
	if(itemidx=="" || itemidx==-1){
		$(".sub-items").hide();
		itemidx=-1;
	} else{
		$(".sub-items").show();
	}
	
	
});

$(function(){
	$(".book").click(function(){
		$(".sub-items").slideToggle();
		
	});
});



</script>



<div style="        box-shadow: 1px 1px 2px #333333;
    background: #ffffff;
    width: 100%;
    color: white;
    margin: 10px auto;
    padding: 15px 10px;
    display: block;
    border: 1px solid;
    border-radius: 5px;
">
<img alt="마이페이지로고" src="<%=cp%>/resource/images/IconMypage.png" style="    width: 35px;
    position: absolute;
    margin: 0 0 0 5px;">
<img alt="마이페이지" src="<%=cp%>/resource/images/TitleMypage.png" style="width: 70%;
    margin: 0px 0 0 50px;
    padding: 0;"></div>
<div class="list-group">
    <a href="<%=cp%>/member/pwd" class="list-group-item">정보 수정</a>
    <a href="<%=cp%>/bookmark/tour" class="list-group-item book">나의 북마크</a>
    <div class="sub-items">
		<a href="<%=cp%>/bookmark/tour" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관광 정보</a>
		<a href="<%=cp%>/bookmark/recommend" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여행 플랜</a>
		<a href="<%=cp%>/bookmark/commu" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;커뮤니티</a>
	</div>
    <a href="<%=cp%>/ticket/ticket" class="list-group-item">나의 승차권</a>
    <a href="<%=cp%>/stamp/stamp" class="list-group-item">전국 스탬프 지도</a>
    <a href="<%=cp%>/plan/plan" class="list-group-item">나의 여행 플랜</a>
    <a href="<%=cp%>/bbs/mybbs" class="list-group-item">내가 쓴 게시물</a>
</div> 
