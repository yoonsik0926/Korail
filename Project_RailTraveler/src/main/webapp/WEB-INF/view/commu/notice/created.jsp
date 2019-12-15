<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    function sendOk() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	f.action="<%=cp%>/notice/${mode}";

        f.submit();
    }
    function check() {
        var f = document.boardForm;
    	str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

   		f.action="<%=cp%>/주소";

        return true;
    }
</script>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 공지게시판</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
			<form name="boardForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 2px solid #000; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding: 0px 5px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF"  style="width: 100%;
    padding: 5px 5px;
    border: 0; " value="${dto.subject}">
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.member.userName}
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" rows="12" id="content" class="boxTA" style="width: 95%;  height: 270px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53" style="width: 95%; height: 25px;">
			       </td>
			  </tr>
			  
			  <c:if test="${mode=='update' }">
				  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
				      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
				      <td style="padding-left:10px;">
				          <c:if test="${not empty dto.saveFilename}">
				          		<a href="<%=cp%>/bbs/deleteFile?num=${dto.num}&page=${page}"><i class="far fa-trash-alt"></i></a>
				          </c:if>
						  ${dto.originalFilename}
				       </td>
				  </tr>
			  </c:if>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="submit" class="btn">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="num" value="${dto.num}">
			         	 <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
			         	 <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
</div>
