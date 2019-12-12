<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.btnLoc {
	border : none;
	width : 100%;
	height: 40px;
	background: #283164;
	border-radius: 4px;
	color: #fff;
}

.btnLoc:hover {
	border: #283164 1px solid;
	width : 100%;
	height : 40px;
	background : #fff;
	border-radius : 4px;
	color : #283164;
}

.btnTour {
	border : none;
	width : 200px;
	height: 40px;
	background: #283164;
	border-radius: 4px;
	color: #fff;
	margin-bottom: 35px;
}

.btnTour:hover {
	border : #283164 1px solid;
	width : 200px;
	height: 40px;
	background: #fff;
	border-radius: 4px;
	color: #283164;
}

#stationDetail {
	width: 80%;
	margin-bottom: 20px;
}


</style>

<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:400,800);
figure.snip1104 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

figure.snip1104 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}
 
figure.snip1104 img {
  position: relative;
  opacity: 0.4;
  width: 100%;
}
 
figure.snip1104 figcaption {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}
 
figure.snip1104 h4 {
  position: absolute;
  left: 40px;
  right: 40px;
  display: inline-block;
  background: #000000;
  -webkit-transform: skew(-10deg) rotate(-10deg) translate(0, -50%);
  transform: skew(-10deg) rotate(-10deg) translate(0, -50%);
  padding: 12px 5px;
  margin: 0;
  top: 50%;
  text-transform: uppercase;
  font-weight: 400;
}
 
figure.snip1104 h4 span {
  font-weight: 800;
}
 
figure.snip1104:before {
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  content: '';
  background: #ffffff;
  position: absolute;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  -webkit-transform: rotate(110deg) translateY(-50%);
  transform: rotate(110deg) translateY(-50%);
}
 
figure.snip1104 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}
 
figure.snip1104.blue {
  background: #123851;
}
 
figure.snip1104.blue h4 {
  background: #0a212f;
}
 
figure.snip1104.red {
  background: #581a14;
}
 
figure.snip1104.red h4 {
  background: #36100c;
}
 
figure.snip1104.yellow {
  background: #7f5006;
}
 
figure.snip1104.yellow h4 {
  background: #583804;
}
 
figure.snip1104:hover img,
figure.snip1104.hover img {
  opacity: 1;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
 
figure.snip1104:hover h4,
figure.snip1104.hover h4 {
  -webkit-transform: skew(-10deg) rotate(-10deg) translate(-150%, -50%);
  transform: skew(-10deg) rotate(-10deg) translate(-150%, -50%);
}
 
figure.snip1104:hover:before,
figure.snip1104.hover:before {
  -webkit-transform: rotate(110deg) translateY(-150%);
  transform: rotate(110deg) translateY(-150%);
}
</style>

<script type="text/javascript">
$("figure").mouseleave(
	    function() {
	      $(this).removeClass("hover");
	    }
	  );
</script>

<div class="body-content-container">
     <div class="body-title">
         <h3>역 소개 </h3>
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
		      <div class="modal-body" style="width: 700px;">
		      	<img src="<%=cp%>/resource/img/sudo.jpg" style="width: 80%; margin-bottom: 20px;">
		         <table id="stationDetail">
		         	<tr>
		         		<td style="width:20%;border-right:2px solid #939394; text-align:right;">주소&nbsp;&nbsp;</td>
						<td style="width:80%; text-align:left;">&nbsp;&nbsp;&nbsp;서울시 용산구 한강대로 405 KTX서울역 2층 여행상담센터</td>
		         	</tr>
		         	<tr>
		         		<td style="width:20%;border-right:2px solid #939394; text-align:right;">전화번호&nbsp;&nbsp;</td>
						<td style="width:80%; text-align:left;">&nbsp;&nbsp;&nbsp;02-3149-3333</td>
		         	</tr>
		         	<tr>
		         		<td style="width:20%;border-right:2px solid #939394; text-align:right;">역별 혜택&nbsp;&nbsp;</td>
						<td style="width:80%;text-align:left;">&nbsp;&nbsp;&nbsp;할인~</td>
		         	</tr>
		         </table>
		      </div>
		      <!-- Footer -->
		      <div class="modal-footer" style="text-align: center; margin-bottom: 20px;">
		        <button type="button" class="btnTour">관광정보 보러가기</button>
		      </div>
		    </div>
		  </div>
		</div>
		

     </div>
     
</div>

