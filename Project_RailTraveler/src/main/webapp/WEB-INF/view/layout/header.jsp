<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
System.out.print(cp);
%>

<div id="navbar-full">
    <div id="navbar">
    <!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->
        <nav class="navbar navbar-ct-blue navbar-transparent navbar-fixed-top" role="navigation">
          <div class="alert alert-success hidden">
            <div class="container">
                <b>Lorem ipsum</b> dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
            </div>
          </div>
          
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <ul class="nav navbar-nav side navbar-right side-toggle" style="float: right;">
               <li class="active"><a href="<%=cp%>/ticket/pay"><i class="fas fa-ticket-alt"></i>&nbsp;&nbsp;티켓 발권하기</a>
<!--                <li class="bar">ㅣ</li> -->
             <a href="http://info.korail.com/mbs/www/subview.jsp?id=www_020110010000"><i class="far fa-map"></i>&nbsp;&nbsp;기차노선도</a>
<!--                <li class="bar">ㅣ</li> -->
              <a href="http://www.letskorail.com/ebizcom/cs/guide/guide/guide11.do"><i class="far fa-clock"></i>&nbsp;&nbsp;열차시간표</a></li>
              
              </ul>
              <a class="navbar-brand" href="<%=cp%>">
			<img id="logoImg" alt="" src="<%=cp%>/resource/img/logo-title.png">
			</a>
            </div>
        
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="max-height: 300px;">
             <div>
              <ul class="nav navbar-nav">
                <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">소개<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="<%=cp%>/naeillo/info">내일로 소개</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=cp%>/station/info">역 소개</a></li>
                      </ul>
                </li>
                <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">관광정보 <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="<%=cp%>/tour/sudo">수도권</a></li>
                        <li><a href="<%=cp%>/tour/gangwon">강원권</a></li>
                        <li><a href="<%=cp%>/tour/chungcheong">충청권</a></li>
                        <li><a href="<%=cp%>/tour/jeonla">전라권</a></li>
                        <li><a href="<%=cp%>/tour/gyeongsang">경상권</a></li>
                      </ul>
                </li>
                <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">커뮤니티 <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="<%=cp%>/notice/notice">공지사항</a></li>
                        <li><a href="<%=cp%>/qna/qna">묻고답하기</a></li>
                        <li><a href="<%=cp%>/board/board">자유게시판</a></li>
                        <li><a href="<%=cp%>/friend/friend">동행구하기</a></li>
                      </ul>
                </li>
                <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">플래너 <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="<%=cp%>/plan/write">나의 여행 플랜</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=cp%>/plan/planlist">친구의 여행 플랜</a></li>
                        <li><a href="<%=cp%>/plan/recommand">추천 코스</a></li>
                      </ul>
                </li>
                <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">이벤트 <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="<%=cp%>/event/current">진행중인 이벤트</a></li>
                        <li><a href="<%=cp%>/event/last">지난 이벤트</a></li>
                      </ul>
                </li>
                
                <c:if test="${sessionScope.member.userId=='admin'}">
               	 <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">신고 목록 <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="<%=cp%>/singo/plan">플래너</a></li>
                        <li><a href="<%=cp%>/singo/qna">묻고 답하기</a></li>
                        <li><a href="<%=cp%>/singo/board">자유게시판</a></li>
                        <li><a href="<%=cp%>/singo/friend">동행 구하기</a></li>
                      </ul>
                	</li>
                </c:if>
                
              </ul>
             
              <ul class="nav navbar-nav navbar-right">
               <c:if test="${not empty sessionScope.member}">
                    <li class="dropdown">
                      <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown" style="FONT-SIZE: 30px;
    FONT-FAMILY: Gungsuh,궁서;
    COLOR: #fff;
    text-shadow: 0 0 20px #fefcc9, 10px -10px 30px #feec85, -20px -20px 40px #ffae34, 20px -40px 50px #ec760c, -20px -60px 60px #cd4606, 0 -80px 70px #973716, 10px -90px 80px #451b0e;
                      ">${sessionScope.member.userName}<b class="caret"></b></a>
                      <c:if test="${sessionScope.member.userId!='admin'}">
	                      <ul class="dropdown-menu">
	                        <li><a href="<%=cp%>/member/pwd">정보 수정</a></li>
	                        <li><a href="<%=cp%>/bookmark/bookmark">나의 북마크</a></li>
	                        <li><a href="<%=cp%>/ticket/ticket">나의 승차권</a></li>
	                        <li><a href="<%=cp%>/stamp/stamp">전국 스탬프 지도</a></li>
	                        <li><a href="<%=cp%>/plan/plan">나의 여행 플랜</a></li>
	                        <li><a href="<%=cp%>/bbs/mybbs">내가 쓴 게시물</a></li>
	                      </ul>
                      </c:if>
                	</li>
                	<li><button onclick="javascript:location.href='<%=cp%>/member/logout';" class="loginbtn btn-round btn-default">로그아웃</button></li>
                	</c:if>
                	<c:if test="${empty sessionScope.member}">
                    <li><a href="<%=cp%>/member/member">회원가입</a></li>
                    
                    <li><button onclick="javascript:location.href='<%=cp%>/member/login';" class="loginbtn btn-round btn-default">로그인</button></li>
                </c:if>
               </ul>
              <ul class="nav navbar-nav side navbar-right">
               <li class="active"><a href="<%=cp%>/ticket/pay"><i class="fas fa-ticket-alt"></i>&nbsp;&nbsp;티켓 발권하기</a>
<!--                <li class="bar">ㅣ</li> -->
             <a href="http://info.korail.com/mbs/www/subview.jsp?id=www_020110010000"><i class="far fa-map"></i>&nbsp;&nbsp;기차노선도</a>
<!--                <li class="bar">ㅣ</li> -->
              <a href="http://www.letskorail.com/ebizcom/cs/guide/guide/guide11.do"><i class="far fa-clock"></i>&nbsp;&nbsp;열차시간표</a></li>
              
              </ul>
              
              </div>
              
              
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
        <div class="blurred-container">
            <div class="img-src" style="background-image: url('<%=cp%>/resource/img/main2.jpg')"></div>
        </div>
    </div><!--  end navbar -->

</div> <!-- end menu-dropdown -->
