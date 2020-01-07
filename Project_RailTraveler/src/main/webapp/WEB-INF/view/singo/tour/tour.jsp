<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="body-content-container">
     <div class="body-title">
         <h3>투어</h3>
     </div>
  </div>   
<div class="body-content-container">
		<div class="container"
			style="margin-top: 40px; width: 93%">
			<div class="row" style="width: 100%; margin: 10px auto;">
				<div class="col" style="font-size: 18px; font-weight: 600;">
					<ul class="nav nav-tabs">
						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="1st" onclick="fnMove('1');" >주요 정보</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="2st" onclick="fnMove('2');">후기/리뷰</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="3st" onclick="fnMove('3');">자유게시판</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="4st" onclick="fnMove('4');">사진 요약</a></li>
					</ul>
				</div>
			</div>
		</div>


</div>

