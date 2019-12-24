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
.sect-eventlist li .thumb-image{ width:240px; height:200px;}
.sect-eventlist li img{ display:block;width:300px; height:auto;}
.sect-eventlist li em{ display:inline-block; font-size:15px; font-weight:500;}
.sect-eventlist li strong{ display:block; width:100%; font-size:14px; font-weight:500;white-space:nowrap; text-overflow:ellipsis; overflow:hidden;}
.sect-eventlist li p{ display:block; width:100%;white-space:nowrap; text-overflow:ellipsis; overflow:hidden;}
.sect-eventlist li .date{ display:block; color:#717171; font-size:14px; letter-spacing:0px; }
.sect-eventlist li .date span{ display:inline-block; margin-right:5px; font-weight:300;}

.sect-eventlist li{ 
    width: 300px;
    margin: 10px 30px 20px 10px;
    padding: 10px;
    padding-bottom: 30px;}
.sect-eventlist .box-contents{ margin-top:10px; line-height:1.6;}
.sect-eventlist .box-contents p{ white-space:nowrap;}

ul{
   list-style:none;
   }
   
.type-section .type-list-event:after { content:''; display:block; clear:both; }
.type-section .type-list-event .type-list { float:left; position:relative; width:100%; } 
.type-section .type-list-event .type-list:after{clear:both; display:block; content:""}
.type-section .type-list-event .type-list div:last-child:after { display:none; }


.type-section .type-list-event .type-list div{ float:left; position:relative; width:163px; text-align:center;}
.type-section .type-list-event .type-list .list:after { display:block; position:absolute; top:14px; right:0; content:''; width:1px; height:22px; background:#ddd; }
.type-section .type-list-event .type-list div a{display:block; height:49px; line-height:49px; color:#777; font-size:16px;}
.type-section .type-list-event .type-list div.active a span, .type-section .type-list-event .type-list div a:hover span{ display:block; position:relative; padding-bottom:0; color: #1429a0; }
.type-section .type-list-event .type-list div.active a span:after, .type-section .type-list-event .type-list div a:hover span:after { content: ''; position:absolute; left:0; bottom:0; width:100%; height:3px; background-color:#1429a0; }

.type-section .type-list-event .type-list div a h3 {font-size:16px; font-weight:normal}
.type-section .type-list-event .type-list div.active a h3, .type-section .type-list-event .type-list div a:hover h3{ display:block; position:relative; padding-bottom:17px; color: #1429a0; }
.type-section .type-list-event .type-list div.active a h3:after, .type-section .type-list-event .type-list div a:hover h3:after { content: ''; position:absolute; left:0; bottom:0; width:100%; height:3px; background-color:#1429a0; }


.search-section{ width: calc(25% - 12px); max-width: 348px;}
.search-section .section-container{ background:#f3f3f3;}
.search-section .input-area{position:relative; width:100%; margin:0 auto; padding-right:50px; background:#e7e7e7; -webkit-box-sizing:border-box; box-sizing:border-box;}
.search-section .input-area input{width:100%; height:51px; line-height:51px; padding-left:20px; border:0 none; background:transparent; font-size:14px; -webkit-box-sizing:border-box; box-sizing:border-box; }
.search-section .input-area .btn-event-search{position:absolute; right:15px; top:50%; width:23px; height:22px; margin-top:-11px; background-image:url(/Project_RailTraveler/resource/img/search.jpg); background-repeat:no-repeat;}

.modal {
          text-align: center;
        }
        @@media screen and (min-width: 768px) {
          .modal:before {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 100%;
          }
        }
        .modal-dialog {
          display: inline-block;
          text-align: left;
          vertical-align: middle;
          width: 55%; 
		  height: 55%; 
        } 

</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
    $(document).ready(function(){
      $('.bxslider').bxSlider({
    	 auto:true,
      	 speed:500,
      	 pause:5000,
      	 slideWidth: 800,
      	 mode:'horizontal',
      	 autoControls:true,
      	 pager:true,
      	 captions:true,
    	  
      });
    });
    
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
    		var url = "<%=cp%>/event/current?order="+o;
    		location.href=url;
    	});
    });
    
</script>


          
     <!-- 여기서부터 body -->
     
      <div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	<h3> 베스트 이벤트 </h3>
	 </div>    
     
     <div style="margin-left: 180px;">
     	<ul class="bxslider">
     		<li><a href="#"><img src="/Project_RailTraveler/resource/img/event1.jpg"></a></li>
     		<li><a href="#"><img src="/Project_RailTraveler/resource/img/event2.png"></a></li>
     		<li><a href="#"><img src="/Project_RailTraveler/resource/img/event3.png"></a></li>
     	</ul>
     </div>	
          
     <div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	<h3> 이벤트 모음 </h3>
	 </div>
	 	 	 	  
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
                         <div class="input-area">
                             <div class="keyword">
                                 <input type="text" placeholder="검색" maxlength="100" id="search_word" title="검색하고 싶은 이벤트 키워드를 입력하세요.">
                             </div>
                             <button type="submit" title="검색" class="btn-event-search" onclick="#"><span class="blind"></span></button>
                         </div>
                     </div>
                                
			 <div class="sect-eventlist highlight" style=" display: block; padding-top: 150px;
		    width: 100%; min-height: 350px; ">
		    		    
		    <div style="width: 1200px; margin: 0 auto; ">
    	    	
    	    	<ul>

    	         <c:forEach var="dto" items="${list}">
    	         	<li>
                    <div class="box-image">
                        
                            <span class="thumb-image">
                            <a data-target="#layerpop" data-toggle="modal">
                                <img src="/Project_RailTraveler/resource/img/aaa.jpg"/>
                             </a>   
                            </span>
                    </div>
                    <div class="box-contents">
                        <a data-target="#layerpop" data-toggle="modal">
                            <em class="txt-lightblue">${dto.name}</em>
                            <p>${dto.content}</p>
                        </a>   
                        <p class="date">
                            <span>기간: </span>${dto.sdate} ~ ${dto.edate}
                        </p>
                     <c:if test="${sessionScope.member.userId=='admin'}">
                     <table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
                     	<tr height="45">
						    <td width="300" align="left" >
						        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/event/update';">수정</button>
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
    </div>
    
    <table style="width: 100%; margin-bottom: 30px; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        ${dataCount==0?"등록된 게시물이 없습니다.":paging}
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
    	
	<div class="modal fade" id="layerpop">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- header -->
		      <div class="modal-header">
		        <!-- 닫기(x) 버튼 -->
		        <button type="button" class="close" data-dismiss="modal">×</button>
		        <!-- header title -->
		        <h4 class="modal-title" style="text-align: center;font-weight: 900;margin-top: 20px;">이벤트1</h4>
		      </div>
		      <!-- body -->
		      <div class="modal-body" style="text-align: center;">
		      	<img src="<%=cp%>/resource/img/aaa.jpg" style="width: 90%; margin-bottom: 20px;">
		      	<div style="width: 90%; margin: 0 auto; line-height: 2.5;">
					<div style="text-align: left;">
						<span style="font-size: 18px; font-weight: 800;">
							<i class="fas fa-map-marker-alt" style="color:#e82b2b; font-size: 23px;"></i>&nbsp;&nbsp;내용&nbsp;&nbsp;</span>
						<span style="font-size: 15px; color: #636363;">이벤트 설명1</span>
					</div>
									
					</div>
		       	  </div>

		        </div>
		      </div>
		            
		      <!-- Footer -->
		      <div class="modal-footer" style="text-align: center; margin: 20px 0;">
		      	<c:if test="${sessionScope.member.userId!='admin'}">
		        	<button type="button" class="btnTour">이벤트정보 보러가기</button>
		        </c:if>
		     		        
		      </div>
		    </div>
		