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

.sect-eventlist{}
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
   
.type-section .type-list-pc:after { content:''; display:block; clear:both; }
.type-section .type-list-pc .type-list { float:left; position:relative; width:100%; } 
.type-section .type-list-pc .type-list:after{clear:both; display:block; content:""}
.type-section .type-list-pc .type-list div:last-child:after { display:none; }

.type-section .type-list-pc .type-list.btn:before, .type-section .type-list-pc .type-list.btn:after { position:absolute; top:0; display:block; content:''; width: 49px; height: 49px; font-size: 0; line-height: 0; border-right:1px solid #ddd; z-index:999; background:#fff url('/comLocal/sec/next/img/event/arrow_disabled.jpg') no-repeat center center; }
.type-section .type-list-pc .type-list.btn:before { left:0; }
.type-section .type-list-pc .type-list.btn:after { right:0; -webkit-transform: rotate(180deg); transform: rotate(180deg); }
.type-section .type-list-pc .type-list div{ float:left; position:relative; width:163px; text-align:center;}
.type-section .type-list-pc .type-list .list:after { display:block; position:absolute; top:14px; right:0; content:''; width:1px; height:22px; background:#ddd; }
.type-section .type-list-pc .type-list div a{display:block; height:49px; line-height:49px; color:#777; font-size:16px;}
.type-section .type-list-pc .type-list div.active a span, .type-section .type-list-pc .type-list div a:hover span{ display:block; position:relative; padding-bottom:0; color: #1429a0; }
.type-section .type-list-pc .type-list div.active a span:after, .type-section .type-list-pc .type-list div a:hover span:after { content: ''; position:absolute; left:0; bottom:0; width:100%; height:3px; background-color:#1429a0; }

.type-section .type-list-pc .type-list div a h3 {font-size:16px; font-weight:normal}
.type-section .type-list-pc .type-list div.active a h3, .type-section .type-list-pc .type-list div a:hover h3{ display:block; position:relative; padding-bottom:0; color: #1429a0; }
.type-section .type-list-pc .type-list div.active a h3:after, .type-section .type-list-pc .type-list div a:hover h3:after { content: ''; position:absolute; left:0; bottom:0; width:100%; height:3px; background-color:#1429a0; }


.search-section{ width: calc(25% - 12px); max-width: 348px;}
.search-section .section-container{ background:#f3f3f3;}
.search-section .input-area{position:relative; width:100%; margin:0 auto; padding-right:50px; background:#e7e7e7; -webkit-box-sizing:border-box; box-sizing:border-box;}
.search-section .input-area input{width:100%; height:51px; line-height:51px; padding-left:20px; border:0 none; background:transparent; font-size:14px; -webkit-box-sizing:border-box; box-sizing:border-box; }
.search-section .input-area .btn-event-search{position:absolute; right:15px; top:50%; width:23px; height:22px; margin-top:-11px; background-image:url(/Project_RailTraveler/resource/img/search.jpg); background-repeat:no-repeat;}

   
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
</script>

<div class="body-content-container">
          
     <!-- 여기서부터 body -->
     
      <div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	<h3> 이번달의 이벤트 </h3>
	 </div>    
     
     <div style="margin-left: 150px;">
     	<ul class="bxslider">
     		<li><a href="#"><img src="/Project_RailTraveler/resource/img/jun.jpg"></a></li>
     		<li><a href="#"><img src="/Project_RailTraveler/resource/img/jun.jpg"></a></li>
     		<li><a href="#"><img src="/Project_RailTraveler/resource/img/jun.jpg"></a></li>
     	</ul>
     </div>	
          
     <div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	<h3> 이벤트 모음 </h3>
	 </div>
	 
	 <div class="type-section">
                        <div class="type-list-pc">
                            <div class="type-list">
                            	
                               <div class="active list"><h3>정렬</h3></div>
                               	
								<div class="list"><a href="javascript:eventList('1');" onclick=""><h3>최신순</h3></a></div>
								
								<div class="list"><a href="javascript:eventList('2');" onclick=""><h3>마감순</h3></a></div>
							</div>
                        </div>
                    </div>
                    <!-- type-section -->
                    <div class="search-section">
                         <div class="input-area">
                             <div class="keyword">
                                 <input type="text" placeholder="검색" maxlength="100" id="search_word" title="검색하고 싶은 이벤트 키워드를 입력하세요.">
                             </div>
                             <button type="submit" title="검색" class="btn-event-search" onclick=""><span class="blind"></span></button>
                         </div>
                     </div>
                    <!-- search-section -->
                </div>
            
	 <div class="sect-eventlist highlight" style=" display: block;
    width: 100%;
    min-height: 350px;">
    <div style="width: 1200px; margin: 0 auto;">
    	    	
    	<ul>
    	         <li>
                    <div class="box-image">
                        <a href="detail-viewe656.html?idx=20435">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="detail-viewe656.html?idx=20435">
                            <em class="txt-lightblue">이벤트1</em>
                            <p>이벤트 설명1</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.19 ~ 2019.12.15
                        </p>
                    </div>
                </li>
            
                <li>
                    <div class="box-image">
                        <a href="#">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="#">
                            <em class="txt-lightblue">이벤트2</em>
                            <p>이벤트 설명2</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.20 ~ 2019.12.31
                           
                        </p>
                    </div>
                </li>
            
                <li>
                    <div class="box-image">
                        <a href="#">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view653d.html?idx=20412">
                            <em class="txt-lightblue">이벤트3</em>
                            <p>이벤트 설명3</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.14 ~ 2019.12.20
                        </p>
                    </div>
                </li>
                <li>
                    <div class="box-image">
                        <a href="#">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view653d.html?idx=20412">
                            <em class="txt-lightblue">이벤트4</em>
                            <p>이벤트 설명4</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.14 ~ 2019.12.20
                        </p>
                    </div>
                </li>
                   
                <li>
                    <div class="box-image">
                        <a href="#">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view653d.html?idx=20412">
                            <em class="txt-lightblue">이벤트5</em>
                            <p>이벤트 설명5</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.14 ~ 2019.12.20
                        </p>
                    </div>
                </li>
                 <li>
                    <div class="box-image">
                        <a href="#">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view653d.html?idx=20412">
                            <em class="txt-lightblue">이벤트6</em>
                            <p>이벤트 설명6</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.14 ~ 2019.12.20
                        </p>
                    </div>
                </li>
                 <li>
                    <div class="box-image">
                        <a href="#">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view653d.html?idx=20412">
                            <em class="txt-lightblue">이벤트7</em>
                            <p>이벤트 설명7</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.14 ~ 2019.12.20
                        </p>
                    </div>
                </li>
                 <li>
                    <div class="box-image">
                        <a href="#">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/jun.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="detail-view653d.html?idx=20412">
                            <em class="txt-lightblue">이벤트8</em>
                            <p>이벤트 설명8</p>
                        </a>
                        <p class="date">
                            <span>기간: </span>2019.11.14 ~ 2019.12.20
                        </p>
                    </div>
                </li>
                         
    		</ul>
    	</div>
	</div>
</div>