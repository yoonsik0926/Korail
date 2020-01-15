<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
 
<style type="text/css">

.tit-heading {position:relative; height:51px; margin-top:30px; border-bottom:3px solid #241d1e;}
.tit-evt {background:none; color:#333333; font-size:14px; text-align:justify; height:38px; line-height:38px; margin:0;}

.sect-eventlist li{ float:left; color:#333333; letter-spacing:-1px;}
.sect-eventlist li a{ display:block;}
.sect-eventlist li img{ display:block; width:240px; height:200px;}
.sect-eventlist li p{ display:block; width:100%;white-space:nowrap; text-overflow:ellipsis; overflow:hidden;}
.sect-eventlist li .date{ display:block; color:#717171; font-size:14px; letter-spacing:0px; }
.sect-eventlist li .date span{ display:inline-block; margin-right:5px; font-weight:300;}

.sect-eventlist .box-contents{ margin-top:10px; line-height:1.6;}
.sect-eventlist .box-contents p{ white-space:nowrap;}

.type-section .type-list-event .type-list div{ float:left; position:relative; width:163px; text-align:center;}
.type-section .type-list-event .type-list .list:after { display:block; position:absolute; top:14px; right:0; content:''; width:1px; height:22px; background:#ddd; }
.type-section .type-list-event .type-list div a{display:block; height:49px; line-height:49px; color:#777; font-size:16px;}
.type-section .type-list-event .type-list div a h3 {font-size:16px; font-weight:normal}
.type-section .type-list-event .type-list div.active a h3, .type-section .type-list-event .type-list div a:hover h3{ display:block; position:relative; padding-bottom:17px; color: #1429a0; }
.type-section .type-list-event .type-list div.active a h3:after, .type-section .type-list-event .type-list div a:hover h3:after { content: ''; position:absolute; left:0; bottom:0; width:100%; height:3px; background-color:#1429a0; }

.search-section{ width: calc(25% - 12px); max-width: 348px;}
.search-section .section-container{ background:#f3f3f3;}
.search-section .input-area{position:relative; width:100%; margin:0 auto; padding-right:50px; background:#e7e7e7; -webkit-box-sizing:border-box; box-sizing:border-box;}
.search-section .input-area input{width:100%; height:51px; line-height:51px; padding-left:20px; border:0 none; background:transparent; font-size:14px; -webkit-box-sizing:border-box; box-sizing:border-box; }
.search-section .input-area .btn-event-search{position:absolute; right:15px; top:50%; width:23px; height:22px; margin-top:-11px; background-image:url(/Project_RailTraveler/resource/img/search.jpg); background-repeat:no-repeat;}

.sect-eventlist li{ 
    width: 300px;
    margin: 10px 30px 20px 10px;
    padding: 10px;
    padding-bottom: 30px;}

ul {
   list-style: none;
   }
   
.evt-name {
	font-weight: bold;
	font-size: 14px;
	color: #2275C4;
}

.listcount {
 font-size: 15px;
 display: inline-block;
}

.carousel {
	background: white;
}

.carousel-cell {
	width: 25%;
	height: 300px;
	margin-right: 10px;
	/* margin-top: 22.5px; */
	margin-bottom: 22.5px;
	background: #ED2;
	border-radius: 5px;
	counter-increment: carousel-cell;
}

.carousel-cell.is-selected {
	background: #ED2;
}

/* cell number */
.carousel-cell:before {
	display: block;
	text-align: center;
	line-height: 200px;
	font-size: 80px;
	color: white;
}

.fPlan {
	width: 100%;
	height: 300px;
	margin-right: 10px;
	margin-bottom: 22.5px;
	border-radius: 5px;
}

.sample_image  img {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.sample_image:hover img {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}   

</style>

<link rel="stylesheet" href="<%=cp%>/resource/css/flickity.min.css">
<script src="<%=cp%>/resource/js/flickity.pkgd.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script>
    
    function deleteEvent(eventNum) {
    	if(confirm("위 이벤트를 삭제 하시겠습니까 ?")) {
    		var url="<%=cp%>/event/delete?eventNum="+eventNum+"&${query}";
    		location.href=url;
    	}
    }
    
    $(function(){
    	var order="${order}";
    	$(".type-list .list").each(function(){
    		var o = $(this).attr("data-order");
    		if(o==order) {
    			$(this).addClass("active");
    			return true;
    		}
    	});
    });
    
    $(function(){
    	$(".type-list .list").click(function(){
    		if($(this).hasClass("active")) {
    			return false;
    		}
    		
    		var o = $(this).attr("data-order");
    		var url = "<%=cp%>/event/${mode}?order="+o;
    		location.href=url;
    	});
    });
    
    function searchList() {
    	var f = document.searchForm;
    	f.submit();
    }
    
    function article(eventNum) {
	
    	var url="${articleUrl}&eventNum="+eventNum;
    	location.href=url;
    }    
    
</script>
          
     <!-- 여기서부터 body -->
     
      <div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	<h3> ${mode=="current"?"추천 이벤트":"종료 이벤트"} </h3>
	 </div>    
     
     <c:if test="${mode=='current' }">
     <div class="recommend" style="width: 100%; height: 50% !important;">
		<div class="carousel" data-flickity='{"groupCells": true }'
			style="height: 350px;">
						
			<c:forEach var="vo" items="${rankEvent}">
			<div class="carousel-cell sample_image">
				<img class="fPlan" src="<%=cp%>/uploads/event/${vo.imageFilename}"
				                  
	                    onclick="javascript:article('${vo.eventNum}');"/>
			</div>	
			</c:forEach>
		</div>
		</div>
          
     <div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	<h3> 이벤트 모음 </h3>
	 </div>
     </c:if>
	 	 	 	  
	 <div class="type-section">
                        <div class="type-list-event" style="float: left; border: 1px solid grey; height: 55px;">
                            <div class="type-list">
                            	              
                               	<div class="list" data-order="0"><a><h3>등록순</h3></a></div>
								
								<div class="list" data-order="1"><a><h3>마감순</h3></a></div>
					       </div>
                        </div>
                    </div>
                                       
                    <!-- type-section -->
                    <div class="search-section" style="float: right">
                    	<form name="searchForm" action="<%=cp%>/event/${mode}" method="post"
							style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
							<select name="condition" class="boxTF"
								style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
								<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
								<option value="name"
									${condition=="name"?"selected='selected'":""}>제목</option>
								<option value="content"
									${condition=="content"?"selected='selected'":""}>내용</option>
								<option value="sdate"
									${condition=="sdate"?"selected='selected'":""}>시작일</option>
								<option value="edate"
									${condition=="edate"?"selected='selected'":""}>종료일</option>	
							</select> <input type="text" name="keyword" value="${keyword}"
								class="boxTF"
								style="display: inline-block; height: 100%; width: 58%;">
							<img
								src="<%=cp%>/resource/images/magnifying-glass.png" class=""
								onclick="searchList()"
								style="padding: 6px; cursor:pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
						</form>
                     </div>
                
		    <div class="sect-eventlist" style="width: 1200px; margin: auto; padding-top: 100px; padding-left: 100px;
		    		display: block; min-height: 350px; width: 100%">
		    		
		    		<div style="padding-left: 60px">
		    			<p class="listcount">전체이벤트가 </p>
		    			<p class="listcount" style="color: red; font-weight:bold;">${dataCount}건</p>
		    			<p class="listcount">이 있습니다.</p>
		    		</div>
		    		
    	    	<ul>
				  <c:forEach var="dto" items="${list}">
    	         	<li>
	                   	<div class="box-image">
	                        
	                            <span class="thumb-image" style="cursor:pointer">
	                              <img src="<%=cp%>/uploads/event/${dto.imageFilename}"
	                              
	                              onclick="javascript:article('${dto.eventNum}');"/>
	                            </span>
	                    </div>
	                 <div class="box-contents">
                           <p class="evt-name">${dto.name}</p>
                            
	                        <p class="date">
	                            <span>기간: </span>${dto.sdate} ~ ${dto.edate}
	                        </p>
	                     <c:if test="${sessionScope.member.userId=='admin'}">
		                     <table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
		                     	<tr height="45">
								    <td width="300" align="left" >
								        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/event/update?eventNum=${dto.eventNum}&page=${page}';">수정</button>
								        <button type="button" class="btn" onclick="deleteEvent('${dto.eventNum}');">삭제</button>
								    </td>
								</tr>
							</table>
						 </c:if>
					  </div>	
				   </li>
                 </c:forEach> 
              </ul>	
    	   </div>
    
    <table style="width: 100%; margin-bottom: 30px; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        ${dataCount==0?"등록된 이벤트가 없습니다.":paging}
			</td>
		   </tr>
	</table>
       
    <table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="center" width="100">
		      <c:if test="${sessionScope.member.userId=='admin'}">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/event/created';">등록하기</button>
		      </c:if>
		      </td>
		   </tr>
	</table>