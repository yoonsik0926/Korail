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

ul {
   list-style:none;
   }
   

.sect-evt-entlist ul {border-width: 1px 0; border-style: solid; border-color:#b8b6aa;}
.sect-evt-entlist li {height:91px; border-top:1px solid #d6d4ca;}
.sect-evt-entlist li:first-child {border-top:0 none;}
.sect-evt-entlist li div {float:left;}
.sect-evt-entlist li em {display:inline-block; font-weight:500;}
.sect-evt-entlist li strong {display:block; overflow: hidden; text-overflow:ellipsis; white-space: nowrap;}
.sect-evt-entlist .box-image {margin-right:20px; margin-top:4px;}
.sect-evt-entlist .box-image .thumb-image img {width:100px; height:83px}
.sect-evt-entlist .box-image img {height:100%;}
.sect-evt-entlist .box-contents {position:relative; width:1000px; margin-top:26px;line-height: 1.6;}
.sect-evt-entlist .box-contents a {display:inline-block; margin-right:80px;}
.sect-evt-entlist .box-contents .date {position:absolute; top:14px; right:12px}

.tit-evt + h4 {
    margin: 30px 0;
    font-size: 16px;
}
h1, h2, h3, h4, h5, h6 {
    font-weight: 500;
}

.sect-evt-entlist .box-contents .date {
    position: absolute;
    top: 14px;
    right: 12px;
}
.sect-evt-entlist li em {
    display: inline-block;
    font-weight: 500;
}
em {
    font-style: normal;
}
   
</style>

<div class="body-content-container">
     <div class="body-title">
         <h3></h3>
     </div>
     
     <!-- 여기서부터 body -->
     
          
     <div class="tit-heading tit-evt" style="margin-bottom: 30px;">
    	    	
    	<h3> EVENT </h3>
    	 
    	<button type="button" class="btn btn-default"
						onclick="#"
						style="float: right; margin-left:6px;"><img alt="" src="/Project_RailTraveler/resource/images/editIcon.png" style=" height: 21px;">등록</button> 
    	    	    	
    	<form name="searchForm" action="#" method="post"
						style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
						<select name="condition" class="boxTF" style="border-radius: 3px;width: 30%;height: 100%;border-left: 0;">
							<option value="all" >모두</option>
							<option value="subject"
								>제목</option>
							<option value="content"
								>내용</option>
							<option value="userName"
								>작성자</option>
							<option value="created"
								>등록일</option>
						</select> <input type="text" name="keyword" value=""
							class="boxTF" style="display: inline-block;height: 100%; width: 58%;">
						<input type="image" src="/Project_RailTraveler/resource/images/magnifying-glass.png"
							class="" onclick="searchList()"
							style="padding: 6px;     opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
					</form>
					
	 </div>
    		 
	 <h4>종료된 이벤트</h4>
	 	 
	 
	 <div class="sect-evt-entlist">
    <ul>
        
                <li>
                    <div class="box-image">
                        <a href="/culture-event/event/detail-view.aspx?idx=20415">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/aaa.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="">
                            <em class="txt-lightblue">이벤트 제목1</em>
                            <strong>이벤트 설명1</strong>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2019.11.14 ~ 2019.12.15
                        </em>
                    </div>
                </li>
            
                <li>
                    <div class="box-image">
                        <a href="">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/aaa.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="">
                            <em class="txt-lightblue">이벤트 제목2</em>
                            <strong>이벤트 설명2</strong>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2019.12.14 ~ 2019.12.14
                        </em>
                    </div>
                </li>
            
                <li>
                    <div class="box-image">
                        <a href="">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/aaa.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="">
                            <em class="txt-lightblue">이벤트 제목3</em>
                            <strong>이벤트 설명3</strong>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2019.06.07 ~ 2019.12.14
                        </em>
                    </div>
                </li>
                
                <li>
                    <div class="box-image">
                        <a href="">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/aaa.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="">
                            <em class="txt-lightblue">이벤트 제목3</em>
                            <strong>이벤트 설명3</strong>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2019.06.07 ~ 2019.12.14
                        </em>
                    </div>
                </li>
                
                <li>
                    <div class="box-image">
                        <a href="">
                            <span class="thumb-image">
                                <img src="/Project_RailTraveler/resource/img/aaa.jpg"/>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="">
                            <em class="txt-lightblue">이벤트 제목3</em>
                            <strong>이벤트 설명3</strong>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2019.06.07 ~ 2019.12.14
                        </em>
                    </div>
                </li>
       
    </ul>
    		
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