<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

<link rel="stylesheet"
	href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css">
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
		 $("#friendtb").append($tr);
	})
});

// 인서트 전 유효성 검사
    function check() {
        var f = document.friendForm;
    	str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }
		f.datepicker1.name='sDate';
		f.datepicker2.name='eDate';
   		f.action="<%=cp%>/friend/${mode}";

        return true;
    }
    
    //데이트 피커 등록 - 시작일이 오늘보다 작을 수 없도록
    $(function() {	// "mm"+'월'+"dd"+'일'+'('+"D"+')'
		$("#datepicker1").datepicker({
			dateFormat:"yy"+"-"+"mm"+"-"+"dd",
			altField:"#sDate",
			showAnim: "slide" ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능    
            ,minDate: "0M"
		});
		$("#datepicker2").datepicker({
			dateFormat:"yy"+"-"+"mm"+"-"+"dd",
			altField:"#eDate",
			showAnim: "slide"
				,minDate: "0M",changeYear: true //콤보박스에서 년 선택 가능
	            ,changeMonth: true //콤보박스에서 월 선택 가능    
		});
		
		 $('#datepicker1').datepicker();
		    $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val());
		    $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
		        $("#datepicker2").datepicker( "option", "minDate", selectedDate );
		    });
		 $('#datepicker2').datepicker();
		    $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
		    $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
		        $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
		    });
    });

    //입력폼 리셋 기능
    function resetDate() {
    	$('#sDate').val('');
    	 $('#eDate').val('');
    	 $('#datepicker1').val('');
    	 $('#datepicker2').val('');
	}
// 	deleteFile('${vo.friendFileNum}');
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
	
	var url="<%=cp%>/friend/deleteFile";
	var query="friendFileNum="+num;
	
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
$(function () {
	
	$(".btnSendReply").click(function(){
		var friendNum="${dto.friendNum}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			alert("내용을 입력해주세요");
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		var url="<%=cp%>/friend/insertReply";
		var query="friendNum="+friendNum+"&content="+content+"&answer=0&content="+content;
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
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
			<span style="padding: 10px 0px; display: block;"> 동행 구하기 - 글쓰기</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<form name="friendForm" method="post" enctype="multipart/form-data"
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
				<tbody id="friendtb">
					<tr class="tb-row">
						<td width="100" class="tb-title">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td class="tb-content"><input type="text" name="subject"
							maxlength="100" class="boxTF" style="padding: 5px 5px;"
							value="${dto.subject}"></td>
					</tr>
					<!-- 공지글은 기간을 입력하지 않음 -->
					 <c:if test="${sessionScope.member.userId!='admin'}">	
					<tr class="tb-row daysTr">
						<td width="100" class="tb-title">기간</td>
						<td class="tb-content">
							<div
								style="background-color: white; width: 20%; border: 1px solid #bbb; border-radius: 3px; float: left; height: 30px; padding: 5px 5px 10px;">
								<i class="far fa-calendar-alt" style="font-size: 14px;"></i> <input
									type="text" id="datepicker1" placeholder="출발 날짜"
									style="border: none; width: 80%; font-size: 14px;">
							</div>
							<div
								style="background-color: white; width: 20%; float: left; border-radius: 3px; border: 1px solid #bbb; margin-left: 10px; height: 30px; padding: 5px 5px 10px;">
								<i class="far fa-calendar-alt" style="font-size: 14px;"></i> <input
									type="text" id="datepicker2" placeholder="종료날짜"
									style="border: none; width: 80%; font-size: 14px;">
							</div>
							<div style="float: left;">
								<button type="button" class="btn btn-default"
									onclick="resetDate();"
									style="height: 30px; padding: 0px 10px; margin-left: 10px;">초기화</button>
							</div>
						</td>
					</tr>
					</c:if>
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
		  <tr id="f${vo.friendFileNum}" height="40" style="border-bottom: 1px solid #cccccc;"> 
		      <td class="tb-title" width="100" style="text-align: center;">첨부된파일</td>
		      <td style="padding-left:10px;">
		        <a href="javascript:deleteFile('${vo.friendFileNum}');"><i class="far fa-trash-alt"></i></a> 
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
							onclick="javascript:location.href='<%=cp%>/friend/friend';">${mode=='update'?'수정취소':'등록취소'}</button>

						<button type="submit" class="btn btn-danger"
							style="margin-left: 5px;">
							<img alt="" src="<%=cp%>/resource/images/check-mark.png"
								style="width: 15px;"> ${mode=='update'?'수정완료':'작성완료'}
						</button> <c:if test="${mode=='update'}">
							<input type="hidden" name="friendNum" value="${dto.friendNum}">
							<input type="hidden" name="saveFilename"
								value="${dto.saveFilename}">
							<input type="hidden" name="originalFilename"
								value="${dto.originalFilename}">
							<input type="hidden" name="page" value="${page}">
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