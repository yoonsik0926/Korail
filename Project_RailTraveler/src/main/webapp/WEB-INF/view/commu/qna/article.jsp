<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
function sendLinkFacebook(){
    var facebook_share_url = "https://www.facebook.com/sharer/sharer.php?u={{ request.build_absolute_uri }}";
    window.open(facebook_share_url,
                'Share on Facebook',
                'scrollbars=no, width=500, height=500');
}  
function sendLinkTwitter(){
    var twitter_share_text="{{ post.title }}";
    var twitter_share_url="{{ request.build_absolute_uri }}";
    window.open("https://twitter.com/share?text="+twitter_share_text+"&url="+twitter_share_url,
                'Share on Twitter',
                'scrollbars=no, width=500, height=500');
}
function sendLinkNaver(){
    var raw_url = "{{ request.build_absolute_uri }}";
    var raw_title = "{{ post.title }}"
    var naver_root_url = "http://share.naver.com/web/shareView.nhn?url="
    var naver_share_url = naver_root_url+encodeURI(raw_url)+"&title="+encodeURI(raw_title);
    window.open(naver_share_url,
                'Share on Naver',
                'scrollbars=no, width=500, height=500');    
}
$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
    
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
});
function modalOn() {
	$('#myModal').modal('toggle');
}
function clickLikeBtn() {
	var cs = document.getElementById("boardLikeIcon");
	if(cs.className=='far fa-heart'){
		cs.className='fas fa-heart';
	}else{
		cs.className='far fa-heart';
	}
}


// http://www.libertypage.net/myblog/post/18/
</script>
<style type="text/css">

.tb-row span{
	display: inline-block;
	float: left;
	margin-right: 5px;
	color: #b2b2b2;
}
.tb-row{
height: 35px;
}

#boardLikeCount{
    width: 41px;
    font-size: 13px;
    display: block;
    color: #888888;
    margin: 0 auto;
}
a#MOVE_TOP_BTN {
   padding: 7px 0;
    position: fixed;
    right: 3%;
    bottom: 100px;
    display: none;
    z-index: 999;
    width: 60px;
    height: 60px;
    border-radius: 50px;
    text-align: center;
    background: gray;
    color: white;
}
.modal-content ul{
padding: 0;
    list-style: none;
}
.modal-content li{
    padding: 10px 5px;
       margin-bottom: 1px;
}
.modal-content a{
 color:black;
}
.modal-content a:hover{
font-weight: bold;
    color: #0b0bf1;
}
.btnSendBoardLike:active, .btnSendBoardLike:hover
 {
	background: none;
}
</style>
<!-- Small modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">\
    <div class="modal-content" style="padding: 15px;
    background: #fffff5;
    border: 3px navy dotted;">
   <h3 style="    font-weight: 900;
    border-bottom: 1px solid;">다운로드</h3>
      <ul>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	<li style=" padding: 5px;"><a href="#"><span><i class="far fa-arrow-alt-circle-down"></i> 2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
      	</ul>
    </div>
  </div>
</div>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 묻고 답하기</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-bottom:10px;"></div>
			<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left"> <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">목록 <span>></span> 맛집 </button>
			    </td>
			
			    <td align="right"><c:if test="${sessionScope.member.userId==dto.userId}">				    
			          <button type="button" class="btn btn-default" onclick="updateBoard();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn btn-default" onclick="deleteBoard();">삭제</button>
			       </c:if>
			       </td>
			</tr>
			</table>
			<table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;
			    border-top: 2px solid #000;
    border-bottom: 2px solid #000;">
    <thead>
			<tr>
			    <td colspan="3" style="    padding-top: 15px;">
			    	<h3 style="margin: 10px 0 2px;
    font-size: 25px;">묻고답하기 게시물입니당</h3>
			    </td>
			</tr>
			
			<tr class="tb-row" style="    height: 30px;">
			    <td colspan="3" align="left" style="padding-left: 5px; font-size: 13px;">
			    <span>이겨레</span><span>|</span><span>2019. 12. 15. 20:47:43</span><span>|</span><span>조회 101회</span><span>|</span><span>댓글 4</span>
			    </td>
			</tr>
			<tr>
			  <td colspan="3" style="padding: 20px 5px;" valign="top" height="200">
			      내용입니드아아아
			       내용입니드아아아
			        내용입니드아아아
			         내용입니드아아아
			          내용입니드아아아
			           내용입니드아아아
			   </td>
			</tr>
			
			<tr class="tb-row" style="border-bottom: 0;">
				<td colspan="3" height="40" align="center">
					<button type="button" class="btn btnSendBoardLike btn-default" title="좋아요" style="padding: 6px 8px;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-bottom: 5px;" onclick="clickLikeBtn();"><i id="boardLikeIcon" class="far fa-heart" style="font-size: 20px;display: block;
    margin: 0 auto; color: orangered;"></i><span id="boardLikeCount" >${dto.boardLikeCount}0</span></button>
				</td>
			</tr>
			<tr class="tb-row">
			    <td colspan="3" align="left" style="padding-left: 5px; color:blue;">
			     <a onclick="modalOn();" style="cursor: pointer;"> 첨부된 파일 (0)</a>
			    </td>
			</tr>
			</thead>
			<tbody>
			<tr height='30'> 
				 <td align='left' colspan="3">
				 	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding: 5px 0px 0px;' colspan="3">
					<textarea class='boxTA' style='width: 89%;
    height: 50px;
    float: left;
    resize: none;
    overflow-y: scroll;'></textarea> <button type='button' class='btn btnSendReply btn-default' data-num='10' style='margin-left: 1%;
    width: 10%;
    height: 50px;
    padding: 10px 1px;
    float: left;'>등록</button>
			    
			    </td>
			</tr>
			</tbody>
			<tfoot>
			
			
			
			
			
			<tr height='35' style="border-bottom:1px solid #cccccc;">
	       <td width='80' style=''>
	           <span><b>관리자</b></span>
	        </td>
	        <td>내용이 이렇게 적히는거죠??????????????????????????</td>
	       <td width='250' style='align='right'>
	           <span>2019-12-16 18:03:22</span> |
	                <span class="deleteReply" style="cursor: pointer;" data-replyNum='0' data-pageNo='0'>삭제</span>
	           		<span class="notifyReply">신고</span>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
	              2019-12-16 18:03:22
	        </td>
	    </tr>
	    
	    <tr>
	        <td style='padding:7px 5px;'>
	            <button type='button' class='btn btnReplyAnswerLayout' data-replyNum='0'>답글 <span id="answerCount$0">1</span></button>
	        </td>
	        <td style='padding:7px 5px;' align='right'>
                <button type='button' class='btn btnSendReplyLike' data-replyNum='0' data-replyLike='1' title="좋아요"><i class="far fa-hand-point-up"></i> <span>3</span></button>
                <button type='button' class='btn btnSendReplyLike' data-replyNum='0' data-replyLike='0' title="싫어요"><i class="far fa-hand-point-down"></i> <span>0</span></button>	        
	        </td>
	    </tr>
			
			
			
			</tfoot>
			</table>
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left"> <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">목록</button>
			    </td>
			
			    <td align="right">
			          <span class="sociallink ml-1">
  <a href="javascript:sendLinkFacebook()" title="페이스북으로 공유">
    <img src="<%=cp%>/resource/images/commu/facebook.png" width=36 alt="Facebook">
  </a>
</span>
<span class="sociallink ml-1">
  <a href="javascript:sendLinkTwitter()" title="트위터로 공유">
    <img src="<%=cp%>/resource/images/commu/twitter.png" width=36 alt="Twitter">
  </a>
</span>
<span class="sociallink ml-1">
  <a href="javascript:sendLinkNaver()" title="네이버로 공유">
    <img src="<%=cp%>/resource/images/commu/naver.png" width=36 alt="Naver">
  </a>
</span>
<span class="sociallink ml-1">
  <a href="javascript:sendLinkKakao()" id="kakao-link-btn" title="카카오톡으로 공유">
    <img src="<%=cp%>/resource/images/commu/kakaotalk.png" width=36 alt="Kakaotalk">
  </a>
</span>
			          <button type="button" class="btn btn-danger" onclick="deleteBoard();"><i class="far fa-bell" style="color: white"></i>신고</button>
			    </td>
			</tr>
			</table>
    </div>
    
    <div>
		<table style='width: 100%; margin: 15px auto 10px; border-spacing: 0px;'>
			<tr height='30'> 
				 <td align='left' >
				 	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding: 5px 0px 0px;'>
					<textarea class='boxTA' style='width: 89%;
    height: 50px;
    float: left;
    resize: none;
    overflow-y: scroll;'></textarea> <button type='button' class='btn btnSendReply btn-default' data-num='10' style='margin-left: 1%;
    width: 10%;
    height: 50px;
    padding: 10px 1px;
    float: left;'>등록</button>
			    
			    </td>
			</tr>
		</table>
		     <a id="MOVE_TOP_BTN" href="#"><i class="fas fa-chevron-up"></i><br>TOP</a>
		<div id="listReply">
		
<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
	<thead id='listReplyHeader'>
		<tr height='35'>
		    <td colspan='2'>
		       <div style='clear: both;'>
		           <div style='float: left;'><span style='color: #3EA9CD; font-weight: bold;'>댓글 1개</span> <span>[댓글 목록, 1/1 페이지]</span></div>
		           <div style='float: right; text-align: right;'></div>
		       </div>
		    </td>
		</tr>
	</thead>
	
	<tbody id='listReplyBody'>
	    <tr height='35' style='background: #eeeeee;'>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <span><b>관리자</b></span>
	        </td>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
	           <span>2019-12-16 18:03:22</span> |
	                <span class="deleteReply" style="cursor: pointer;" data-replyNum='0' data-pageNo='0'>삭제</span>
	           		<span class="notifyReply">신고</span>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
	              2019-12-16 18:03:22
	        </td>
	    </tr>
	    
	    <tr>
	        <td style='padding:7px 5px;'>
	            <button type='button' class='btn btnReplyAnswerLayout' data-replyNum='0'>답글 <span id="answerCount$0">1</span></button>
	        </td>
	        <td style='padding:7px 5px;' align='right'>
                <button type='button' class='btn btnSendReplyLike' data-replyNum='0' data-replyLike='1' title="좋아요"><i class="far fa-hand-point-up"></i> <span>3</span></button>
                <button type='button' class='btn btnSendReplyLike' data-replyNum='0' data-replyLike='0' title="싫어요"><i class="far fa-hand-point-down"></i> <span>0</span></button>	        
	        </td>
	    </tr>
	
	    <tr class='replyAnswer' style='display: none;'>
	        <td colspan='2'>
	            <div id='listReplyAnswer$0' class='answerList' style='border-top: 1px solid #cccccc;'>
	             <div class='answer' style='padding: 0px 10px;'>
        <div style='clear:both; padding: 10px 0px;'>
            <div style='float: left; width: 5%;'>└</div>
            <div style='float: left; width:95%;'>
                <div style='float: left;'><b>관리자</b></div>
                <div style='float: right;'>
                    <span>2019-12-16 18:03:22</span> |
                    	<span class='deleteReplyAnswer' style='cursor: pointer;' data-replyNum='0' data-answer='0'>삭제</span>
                    	<span class="notifyReply">신고</span>
                </div>
            </div>
        </div>
        <div style='clear:both; padding: 5px 5px 5px 5%; border-bottom: 1px solid #ccc;'>
            1빠~~~ ^^
        </div>
    </div>	
	            </div>
	            <div style='clear: both; padding: 10px 10px;'>
	                <div style='float: left; width: 5%;'>└</div>
	                <div style='float: left; width:95%'>
	                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea>
	                 </div>
	            </div>
	             <div style='padding: 0px 13px 10px 10px; text-align: right;'>
	                <button type='button' class='btn btnSendReplyAnswer' data-replyNum='0'>답글 등록</button>
	            </div>
	        
	        </td>
	    </tr>
	</tbody>
	
	<tfoot id='listReplyFooter'>
		<tr height='40' align="left">
            <td colspan='2' >
            <button type="button" class="btn btn-default" onclick="javascript:location.href='/Project_RailTraveler/bbs/list?';">목록</button>
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
            </td>
           </tr>
	</tfoot>
</table>
		
		
		</div>
    
    <div style="
    margin-bottom: 5px;
">

			    </div>
    </div>
    
</div>
<script>
Kakao.init('43fed4f22c437dfe99e213d8555c56e0');
function sendLinkKakao(){
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '{{ post.title }}',
        description: '{{ post.content }}',
        imageUrl: '{{ post.content }}',
        link: {
          mobileWebUrl: '{{ request.build_absolute_uri }}',
          webUrl: '{{ request.build_absolute_uri }}'
        }
      },
      buttons: [       
        {
          title: '링크 열기',
          link: {
            mobileWebUrl: '{{ request.build_absolute_uri }}',
            webUrl: '{{ request.build_absolute_uri }}'
          }
        }
      ]
    }); 
}
</script>