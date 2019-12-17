<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/info.css" type="text/css">


<script type="text/javascript">
$("figure").mouseleave(
	    function() {
	      $(this).removeClass("hover");
	    }
	  );

</script>

<div class="body-content-container">
    <div class="page-three-title mt40">
		<h3 class="fs26">
		<span style="padding: 10px 0px; display: block;"> 역 소개</span>
		</h3>
	</div>
	
     <div class="body-main">
		<div class="chooseLoc" style="display: inline-block; width: 100%; margin-bottom: 40px;">
			<div style="display: inline; width:16%; float: left; margin: 0 10px;">
				<button class="btnLoc" type="button" onclick="">수도권</button></div>
			<div style="display: inline;  width:16%; float: left; margin: 0 10px;">
				<button class="btnLoc" type="button" onclick="">강원권</button></div>
			<div style="display: inline; width:16%;  float: left; margin: 0 10px;">
				<button class="btnLoc" type="button" onclick="">충청권</button></div>
			<div style="display: inline; width:16%;  float: left; margin: 0 10px;">
				<button class="btnLoc" type="button" onclick="">전라권</button></div>
			<div style="display: inline; width:16%;  float: left; margin: 0 10px;">
				<button class="btnLoc" type="button" onclick="">경상권</button></div>
		</div>
		

		<!-- 버튼 누를 때마다 디비에서 역 정보 받아와서 리스트 변화하도록 -->
		<div class="displaySta" style="display: inline-block; width: 100%; margin-bottom: 40px;">
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104 red">
				  <img src="<%=cp%>/resource/img/sudo.jpg" style="width: 100%;"/>
				  <figcaption>
				    <h4><span> 서울역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104 blue">
					<img src="<%=cp%>/resource/img/sudo.jpg" />
				  <figcaption>
				    <h4>  <span> 광명역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104">
					<img src="<%=cp%>/resource/img/sudo.jpg" />
				  <figcaption>
				    <h4><span> 용산역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
		</div>


		<div class="displaySta" style="display: inline-block; width: 100%; margin-bottom: 40px;">
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104 red">
				  <img src="<%=cp%>/resource/img/sudo.jpg" style="width: 100%;"/>
				  <figcaption>
				    <h4><span> 서울역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104 blue">
					<img src="<%=cp%>/resource/img/sudo.jpg" />
				  <figcaption>
				    <h4>  <span> 광명역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104">
					<img src="<%=cp%>/resource/img/sudo.jpg" />
				  <figcaption>
				    <h4><span> 용산역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
		</div>
		
		<div class="displaySta" style="display: inline-block; width: 100%; margin-bottom: 40px;">
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104 red">
				  <img src="<%=cp%>/resource/img/sudo.jpg" style="width: 100%;"/>
				  <figcaption>
				    <h4><span> 서울역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104 blue">
					<img src="<%=cp%>/resource/img/sudo.jpg" />
				  <figcaption>
				    <h4>  <span> 광명역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
			<div style="display: inline; width:28%; float: left; margin: 0 10px;">	
				<figure class="snip1104">
					<img src="<%=cp%>/resource/img/sudo.jpg" />
				  <figcaption>
				    <h4><span> 용산역</span></h4>
				  </figcaption>
				  <a data-target="#layerpop" data-toggle="modal"></a>
				</figure>
			</div>
		</div>
		
		
		<!-- 모달 -->
		<div class="modal fade" id="layerpop">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- header -->
		      <div class="modal-header">
		        <!-- 닫기(x) 버튼 -->
		        <button type="button" class="close" data-dismiss="modal">×</button>
		        <!-- header title -->
		        <h4 class="modal-title" style="text-align: center;font-weight: 900;margin-top: 20px;">서울역</h4>
		      </div>
		      <!-- body -->
		      <div class="modal-body" style="text-align: center;">
		      	<img src="<%=cp%>/resource/img/sudo.jpg" style="width: 90%; margin-bottom: 20px;">
		      	<div style="width: 90%; margin: 0 auto; line-height: 2.5;">
					<div style="text-align: left;">
						<span style="font-size: 18px; font-weight: 800;">
							<i class="fas fa-map-marker-alt" style="color:#e82b2b; font-size: 23px;"></i>&nbsp;&nbsp;위치&nbsp;&nbsp;</span>
						<span style="font-size: 15px; color: #636363;">서울시 용산구 한강대로 405 KTX서울역 2층 여행상담센터</span>
					</div>
				
					<div style="text-align: left;">
						<span style="font-size: 18px; font-weight: 800;">
							<i class="fas fa-phone-volume" style="color: #368416; font-size: 23px;"></i>&nbsp;&nbsp;전화번호&nbsp;&nbsp;</span>
						<span style="font-size: 15px; color: #636363;">02-3149-3333</span>
					</div>
					
					<div style="text-align: left;">
						<span style="font-size: 18px; font-weight: 800;">
							<i class="fas fa-gift" style="color: #1c549a; font-size: 23px;"></i>&nbsp;&nbsp;혜택&nbsp;&nbsp;</span>
						<span style="font-size: 15px; color: #636363;">
							<ul>
								<li>역 방문 사은품 증정</li>
								<li>숙박 10% 할인 쿠폰 증정</li>
								<li>닭갈비 5% 할인 </li>
							</ul>
						</span>
					</div>
		        </div>

		      </div>
		      
		      
		      <!-- Footer -->
		      <div class="modal-footer" style="text-align: center; margin: 20px 0;">
		        <button type="button" class="btnTour">관광정보 보러가기</button>
		      </div>
		    </div>
		  </div>
		</div>
		

     </div>
     
</div>

