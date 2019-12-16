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
			    <td width="300" align="left"> <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">목록</button>
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
			<tr>
			    <td colspan="3" style="    padding-top: 15px;">
			    	<h3 style="margin: 10px 0 2px;
    font-size: 25px;">공지게시판의 공지입니다.</h3>
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
			
			<tr class="tb-row">
			    <td colspan="3" align="left" style="padding-left: 5px; color:blue;">
			     <a onclick="modalOn();" style="cursor: pointer;"> 첨부된 파일 (0)</a>
			    </td>
			</tr>
			</table>
			<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
		<tr height='35' style="background: #ccc;">
		    <td colspan='3'>
		           <div style='float: left;'>댓글 1개</div>
		    </td>
		</tr>
	    <tr height='35'>
	       <td width='20%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <span><b>관리자</b></span>
	        </td>
	        <td width='60%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <span>내용입니다다다다다다ㅏ</span>
	        </td>
	       <td width='20%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
	           <span>2019-12-16 18:03:22</span> |
	                <span class="deleteReply" style="cursor: pointer;" data-replyNum='0' data-pageNo='0'>삭제</span>
	           		<span class="notifyReply">신고</span>
	        </td>
	    </tr>
	    </table>
			
			
			
			<table>
			<tr class="tb-row">
			    <td align="left" style="padding-left: 5px;" width="100">
			       이전글<i class="fas fa-caret-up" style="    margin: 5px;"></i> : 
			    </td>
			    <td>
			    <a href="<%=cp%>/bbs/article?${query}&num=${preReadDto.num}" style="color:#737373;">이전글 입니다.</a>
			    </td>
			    <td  width="90">
			    2018-12-15
			    </td>
			</tr>
			
			<tr class="tb-row">
			   <td align="left" style="padding-left: 5px;" width="100">
			       다음글<i class="fas fa-caret-down" style="    margin: 5px;"></i> : 
			    </td>
			    <td>
			    <a href="<%=cp%>/bbs/article?${query}&num=${preReadDto.num}" style="color:#737373;">다음글 입니다.</a>
			    </td>
			    <td  width="90">
			    2018-12-14
			    </td>
			</tr>
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
			    </td>
			</tr>
			</table>
			
			
			
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