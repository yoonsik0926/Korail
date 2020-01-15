<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript"
	src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
// 첨부파일 부분에 빈 부분이 있을 때 막기
$(function () {
	$("form input[name=upload]").change(function () {
		//빈 부분이 있을 때 막는 것
		if(! $(this).val()) return;
		
		var b = false;
		$("form input[name=upload]").each(function () {
			if(! $(this).val()){
				b=true;
				return;
			}
		});
		
		if(b) return false;
		
		//파일 첨부에 변화가 생겻을 경우, 추가해주는 부분
		var $tr = $(this).closest("tr.tb-row").clone(true);
		 $tr.find("input").val("");
		 $("#boardtb").append($tr);
	})
});

// 인서트 전 유효성 검사
    function check() {
        var f = document.qnaForm;
    	str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }
        
   		f.action="<%=cp%>/qna/${mode}";

        return true;
    }
    
function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

//리플 등록
function deleteFile(num) {
	console.log(num);
	var trcs = "#f"+num;
	var $tr = $(trcs);
	
	var url="<%=cp%>/qna/deleteFile";
	var query="qnaFileNum="+num;
	
	var fn = function(data){
		
		var state=data.state;
		if(state=="true") {
			alert("삭제완료!");
			$tr.remove();
		} else if(state=="false") {
			alert("파일을 삭제 하지 못했습니다.");
		}
	};
	
	ajaxJSON(url, "post", query, fn);
	
}
</script>
<style type="text/css">
.tb-row {
	text-align: left;
	height: 50px;
	border-bottom: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
}

.tb-title {
	text-align: center;
	background: #f7f9ff;
}

.tb-content {
	text-align: left;
	padding: 5px 1% 5px 10px;
}

.tb-created {
	width: 100%;
	margin: 0px auto 5px;
	border-spacing: 0px;
	border-collapse: collapse;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

input[type=text], input[type=file] {
	width: 100%;
	border: 1px solid #ccc;
	border-radius: 2px;
	border: 1px solid #ccc;
}
</style>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 동행구하기 - 글쓰기</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<form name="qnaForm" method="post" enctype="multipart/form-data"
			onsubmit="return submitContents(this);">
			<!-- 입력폼 리셋 기능 -->
			<div style="width: 100%; margin: 20px auto 5px; border-spacing: 0px;text-align: right;">
				<button type="reset" class="btn btn-default" style="padding: 6px 6px; border-radius: 5px;"
							onclick="resetContent(this);">
					<img alt="" src="<%=cp%>/resource/images/resetIcon1.png" style="width: 20px;">
				</button>		
			</div>
			<!-- 동행구하기 입력 폼 테이블 -->
			<table class="tb-created">
				<tbody id="boardtb">
				<c:if test="${mode=='reArticle'}">
					<tr class="tb-row" style="margin-bottom: 10px; ">
						<td width="100" class="tb-title">원글 번호</td>
						<td class="tb-content">${qnaNum}</td>
					</tr>
					<tr class="tb-row" style="margin-bottom: 10px; ">
						<td width="100" class="tb-title">원글 카테고리</td>
						<td class="tb-content">${categoryName}</td>
					</tr>
				</c:if>
				<c:if test="${sessionScope.member.userId!='admin' and mode!='reArticle' }">
				<tr class="tb-row">
					<td width="100" class="tb-title">분류</td>
					<td class="tb-content">
						<select name="category" class="boxTF" style="border-radius: 3px; width: 20%; height: 100%; border: 1px solid #ccc; margin-right: 10px;">
						<option value="all">전체</option>
							<optgroup label="플래너">
								<option value="plan">여행 계획</option>
							</optgroup>
							<optgroup label="관광정보">
								<option value="food">맛집</option>
								<option value="room">숙박</option>
								<option value="sight">명소</option>
							</optgroup>
							<optgroup label="기타">
								<option value="other">기타</option>
							</optgroup>
						</select>
  				 	</td>
				</tr>
				</c:if>
					<tr class="tb-row">
						<td width="100" class="tb-title">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td class="tb-content"><input type="text" name="subject"
							maxlength="100" class="boxTF" style="padding: 5px 5px;"
							value="${dto.subject}"></td>
					</tr>
					<tr class="tb-row">
						<td width="100" class="tb-title">작성자</td>
						<td class="tb-content">${sessionScope.member.userName}</td>
					</tr>

					<tr class="tb-row">
						<td width="100" class="tb-title" style="padding-top: 5px;"
							valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td valign="top" style="padding: 5px 1% 5px 10px;"><textarea
								name="content" rows="12" id="content" class="boxTA"
								style="width: 100%; height: 270px;">${dto.content}</textarea></td>
					</tr>
				<c:if test="${mode=='update'}">
				   <c:forEach var="vo" items="${listFile}">
						  <tr id="f${vo.qnaFileNum}" height="40" style="border-bottom: 1px solid #cccccc;"> 
						      <td class="tb-title" width="100" style="text-align: center;">첨부된파일</td>
						      <td style="padding-left:10px;">
						        <a href="javascript:deleteFile('${vo.qnaFileNum}');"><i class="far fa-trash-alt"></i></a> 
								${vo.originalFilename}
						      </td>
						  </tr>
				   </c:forEach>
				</c:if>	  
					<tr class="tb-row">
						<td width="100" class="tb-title">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
						<td class="tb-content"><input type="file" name="upload"
							class="boxTF" size="53"></td>
					</tr>

						
					
				</tbody>
			</table>
			<!-- 취소 및 글쓰기 버튼 -->
			<table class="tb-board"
				style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr>
					<td>
						<button type="button" class="btn btn-default"
							style="padding: 6px 20px;"
							onclick="javascript:location.href='<%=cp%>/qna/qna';">${mode=='update'?'수정취소':'등록취소'}</button>

						<button type="submit" class="btn btn-danger"
							style="margin-left: 5px;">
							<img alt="" src="<%=cp%>/resource/images/check-mark.png"
								style="width: 15px;"> ${mode=='update'?'수정완료':'작성완료'}
						</button> <c:if test="${mode=='update'}">
							<input type="hidden" name="qnaNum" value="${dto.qnaNum}">
							<input type="hidden" name="saveFilename"
								value="${dto.saveFilename}">
							<input type="hidden" name="originalFilename"
								value="${dto.originalFilename}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
						
						<c:if test="${mode=='reArticle'}">
							<input type="hidden" name="answer" value="${qnaNum}">
							<input type="hidden" name="category" value="${categoryNum}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true,
			fOnBeforeUnload : function() {
				//alert("아싸!");
			}
		}, //boolean
		fOnAppLoad : function() {
			//예제 코드
// 			oEditors.getById["content"].exec("PASTE_HTML",
// 					[ "로딩이 완료된 후에 본문에 삽입되는 text입니다." ]);

		},
		fCreator : "createSEditor2"
	});

	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [ sHTML ]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
	function resetContent(elClickedObj) {
		oEditors.getById["content"].exec("SET_IR", [ "" ]);
	}

	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.

		try {
			// elClickedObj.form.submit();
			return check();
		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '돋움';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
	
	

</script>