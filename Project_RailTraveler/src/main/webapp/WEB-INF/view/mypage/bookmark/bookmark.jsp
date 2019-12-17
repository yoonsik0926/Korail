<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css"
	type="text/css">


<script type="text/javascript">
$(function(){
	$("#tab-${group}").addClass("active");
	
	$("ul.tabs li").click(function(){
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		var url = "<%=cp%>
	/bookmark/bookmark?group=" + tab;
			location.href = url;
		});
	});
</script>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 나의 북마크</span>
		</h3>
	</div>

	<div>
		<div style="clear: both;">
			<ul class="tabs">
				<li id="tab-${vo.categoryNum}" data-tab="${vo.categoryNum}">
					관광정보</li>
				<li id="tab-${vo.categoryNum}" data-tab="${vo.categoryNum}">
					커뮤니티</li>
				<li id="tab-${vo.categoryNum}" data-tab="${vo.categoryNum}">여행
					플랜</li>
			</ul>
		</div>

		<div style="width: 100%;">
			<div style="margin-bottom: 10px;">
				<form name="searchForm" action="<%=cp%>/notice/list" method="post"
					style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
					<select name="condition" class="boxTF"
						style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
						<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
						<option value="subject"
							${condition=="subject"?"selected='selected'":""}>이름</option>
						<option value="content"
							${condition=="content"?"selected='selected'":""}>내용</option>
						<option value="userName"
							${condition=="userName"?"selected='selected'":""}>역이름</option>
						<option value="created"
							${condition=="created"?"selected='selected'":""}>카테고리명</option>
					</select> <input type="text" name="keyword" value="${keyword}" class="boxTF"
						style="display: inline-block; height: 100%; width: 58%;"> <img
						src="<%=cp%>/resource/images/magnifying-glass.png" class=""
						onclick="searchList()"
						style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
				</form>
			</div>
			
			<div>
				<div class="col-sm-6 col-md-4"
					style="max-width: 25%; min-height: 300px">
					<div class="thumbnail">
						<img style="height: 200px; width: 300px"
							src="<%=cp%>/resource/images/tour/samplehotel.jpg">

						<div class="caption">
							<h3>강릉펜션</h3>
							<p>...</p>
							<p align="right">
								<button class="btn">알아보기</button>
							</p>
						</div>
					</div>
				</div>
			</div>

		</div>





	</div>
</div>
