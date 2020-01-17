<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
.none{
display: none;
}
</style>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	console.log("idx="+idx);
	if(! idx) idx=0;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
function show() {
	$(".sub-item").css("display","block");
}


function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
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


//페이징 처리 및 조건별 리스트 불러오는 에이작스
function modallistPage(page) {
			
	var url = "<%=cp%>/tour/myBookMark";
	var query = "pageNo="+page;
	var selector = "#MyBookMarkList";

		
	ajaxHTML(url, "get", query, selector);
	
	if(page ==1){
		$("#likeListModal").modal('show');
	}

}


function myBookMarkList() {	

	modallistPage(1);	
 }
 


</script>

<script>

	function deleteLikeList() {		

		var deleteList = "";

		$("input[name=choice]:checked").each(function() {

		if(deleteList == ""){

			deleteList = $(this).val();

		} else {

			deleteList = deleteList + "," + $(this).val();

		}

		});
		
		if(deleteList ==""){
			alert("삭제하실 북마크를 먼저 선택해주세요");
			return;
		}
			
		var url = "<%=cp%>/tour2/deleteMyBookMark";
		var query = "deleteList="+deleteList;
		var fn = function(data) {
			
			modallistPage(1);
		};	
		
		ajaxJSON(url, "get", query, fn);
		
		
	}
	




</script>





<!--Modal: modalPush-->
<div id="myBookMark">

<div class="modal fade  bd-example-modal-sm" id="likeListModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document" style="width: 800px; height:750px;   ">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center" style="padding:7px 7px; margin:0px 0px;height:50px; ">
        <p class="heading" style="font-size:25px;font-weight: 700">Rail Traveler</p>
      </div>

      <!--Body-->
      <div class="modal-body" id="MyBookMarkList" style="padding: 5px 2px; overflow-y: hidden; height: 410px">
        	
      </div>

      <!--Footer-->
      <div class="modal-footer flex-center" style="margin-top: 5px;">
     	 <a type="button" class="btn  btn-info " onclick="deleteLikeList();" >삭제</a>
        <a type="button" class="btn  btn-info waves-effect" data-dismiss="modal" onclick="window.location.reload()">확인</a>
      </div>
    </div>
  </div>
</div>

 </div>
<!--Modal: modalPush-->









<%-- <h3><img alt="커뮤니티" src="<%=cp%>/resource/images/iconcommu1.png" style="width: 100%; --%>
<!--     margin: 10px 0px;"></h3> -->
<div style="        box-shadow: 1px 1px 2px #333333;
    background: #ffffff;
    width: 100%;
    color: white;
    margin: 10px auto;
    padding: 20px 10px;
    display: block;
    border: 1px solid;
    border-radius: 5px;
">
<img alt="로고" src="<%=cp%>/resource/images/IconAdmin.png" style="    width: 28px;
    position: absolute;
    margin: 0 0 0 5px;">
<img alt="관리자 항목" src="<%=cp%>/resource/images/TitleAdmin.png" style="width: 78%;
    margin: 0px 0 0 41px;
    padding: 0;"></div>
<div class="list-group">
    <a href="<%=cp%>/member/totalList" class="list-group-item" onclick="show(this);">유저 관리</a>
    <a href="<%=cp%>/singo/singo" class="list-group-item">신고 목록</a>
    <a href="<%=cp%>/ticket/sale" class="list-group-item">매출관리</a>    

</div> 



