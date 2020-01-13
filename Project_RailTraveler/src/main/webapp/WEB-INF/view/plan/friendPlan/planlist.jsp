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
		
		var url = "<%=cp%>/bookmark/bookmark?group=" + tab;
			location.href = url;
		});
	});
	
var cnt =1;

function test(ob){

  if(cnt%2==1){
	  ob.className = "fas fa-heart"; 
  }else{
	  ob.className = "far fa-heart";
  }

	cnt++;	

}
</script>

<style type="text/css">
.img-button {
	background: transparent;
	border: none;
	width: 30px;
	height: 30px;
	cursor: pointer;
}

</style>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 친구의 여행 플랜</span>
		</h3>
	</div>

	<div style="width: 100%;">
		<div style="margin-bottom: 10px; height: 80px;">
			<form name="searchForm" action="<%=cp%>/notice/list" method="post"
				style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
				<select name="condition" class="boxTF"
					style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
					<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
					<option value="subject"
						${condition=="subject"?"selected='selected'":""}>제목</option>
					<option value="content"
						${condition=="content"?"selected='selected'":""}>내용</option>
					<option value="userName"
						${condition=="userName"?"selected='selected'":""}>경유역</option>
					<option value="userName"
						${condition=="userName"?"selected='selected'":""}>여행일자</option>
						
				</select> <input type="text" name="keyword" value="${keyword}" class="boxTF"
					style="display: inline-block; height: 100%; width: 58%;"> <img
					src="<%=cp%>/resource/images/magnifying-glass.png" class=""
					onclick="searchList()"
					style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
			</form>
		</div>

		<div style="margin-top: 10px;">

			<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px">
				<div class="thumbnail" onclick="javascript:location.href='<%=cp%>/friendPlan/detail'">
					<img style="height: 200px; width: 300px" src="<%=cp%>/resource/img/friendPlan.PNG">
					<div class="caption">
						<div style="margin-top: 10px">
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 40px;">
									<td style="font-size: 18px; font-weight: 900; width: 80%;" colspan="2">겨울 느낌 뿜뿜 여행</td>
								</tr>
							</table>
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-pen" style="color: #e190f1;"></i>&nbsp;작성자: </td>
									<td style=" text-align: left;" colspan="2">이유진</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700; width:35%;"><i class="fas fa-calendar-alt" style="color: #bea2f5;"></i>&nbsp;여행 일자: </td>
									<td style=" text-align: left;" colspan="2">2019-12-16 ~ 2019-12-20</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-subway" style="color: #8abefa;"></i>&nbsp;경유역: </td>
									<td style=" text-align: left;" colspan="2">강릉역  서울역  용산역  춘천역  대전역</td>
								</tr>
<!-- 								<tr style="height: 30px;">
									<td style="text-align: right;" colspan="2">
										<button type="button" class="btn btn-default" style="margin-top: 5px;">자세히</button>
									</td>
								</tr> -->
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px">
				<div class="thumbnail" onclick="javascript:location.href='<%=cp%>/friendPlan/detail'">
					<img style="height: 200px; width: 300px" src="<%=cp%>/resource/img/friendPlan.PNG">
					<div class="caption">
						<div style="margin-top: 10px">
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 40px;">
									<td style="font-size: 18px; font-weight: 900; width: 80%;" colspan="2">겨울 느낌 뿜뿜 여행</td>
								</tr>
							</table>
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-pen" style="color: #e190f1;"></i>&nbsp;작성자: </td>
									<td style=" text-align: left;" colspan="2">이유진</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700; width:35%;"><i class="fas fa-calendar-alt" style="color: #bea2f5;"></i>&nbsp;여행 일자: </td>
									<td style=" text-align: left;" colspan="2">2019-12-16 ~ 2019-12-20</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-subway" style="color: #8abefa;"></i>&nbsp;경유역: </td>
									<td style=" text-align: left;" colspan="2">강릉역  서울역  용산역  춘천역  대전역</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px">
				<div class="thumbnail" onclick="javascript:location.href='<%=cp%>/friendPlan/detail'">
					<img style="height: 200px; width: 300px" src="<%=cp%>/resource/img/friendPlan.PNG">
					<div class="caption">
						<div style="margin-top: 10px">
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 40px;">
									<td style="font-size: 18px; font-weight: 900; width: 80%;" colspan="2">겨울 느낌 뿜뿜 여행</td>
								</tr>
							</table>
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-pen" style="color: #e190f1;"></i>&nbsp;작성자: </td>
									<td style=" text-align: left;" colspan="2">이유진</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700; width:35%;"><i class="fas fa-calendar-alt" style="color: #bea2f5;"></i>&nbsp;여행 일자: </td>
									<td style=" text-align: left;" colspan="2">2019-12-16 ~ 2019-12-20</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-subway" style="color: #8abefa;"></i>&nbsp;경유역: </td>
									<td style=" text-align: left;" colspan="2">강릉역  서울역  용산역  춘천역  대전역</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-4" style="max-width: 25%; min-height: 200px">
				<div class="thumbnail" onclick="javascript:location.href='<%=cp%>/friendPlan/detail'">
					<img style="height: 200px; width: 300px" src="<%=cp%>/resource/img/friendPlan.PNG">
					<div class="caption">
						<div style="margin-top: 10px">
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 40px;">
									<td style="font-size: 18px; font-weight: 900; width: 80%;" colspan="2">겨울 느낌 뿜뿜 여행</td>
								</tr>
							</table>
							<table style="width:100%; margin-top:10px;">
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-pen" style="color: #e190f1;"></i>&nbsp;작성자: </td>
									<td style=" text-align: left;" colspan="2">이유진</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700; width:35%;"><i class="fas fa-calendar-alt" style="color: #bea2f5;"></i>&nbsp;여행 일자: </td>
									<td style=" text-align: left;" colspan="2">2019-12-16 ~ 2019-12-20</td>
								</tr>
								<tr style="height: 30px;">
									<td style="font-weight: 700;"><i class="fas fa-subway" style="color: #8abefa;"></i>&nbsp;경유역: </td>
									<td style=" text-align: left;" colspan="2">강릉역  서울역  용산역  춘천역  대전역</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>


			<nav style="text-align: center;">
				<ul class="pagination">
					<li class="disabled"><span> <span aria-hidden="true">&laquo;</span>
					</span></li>
					<li class="active"><span>1 <span class="sr-only">(current)</span></span>
					</li>
					<li><span>2</span></li>
					<li><span>3</span></li>
					<li class="disabled"><span> <span aria-hidden="true">&raquo;</span>
					</span></li>
				</ul>
			</nav>



		</div>

	</div>
</div>

