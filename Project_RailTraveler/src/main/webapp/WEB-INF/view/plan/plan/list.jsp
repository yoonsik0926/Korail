<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<html>
<head>
<style type="text/css">

</style>
<script type="text/javascript">
/* $(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });

	  $(".modalContent > button").click(function(){
	    modalLayer.fadeOut("slow");
	    modalLink.focus();
	  });		
	}); */
	

// $(document).on('click', '#abcd', function() {
// 	$("#myFullsizeModal").show();
// });

</script>
</head>
<div class="body-content-container">
     <div class="body-title">
         <h3>${title} </h3>
		<button type="button" class="btn btn-primary times" data-toggle="modal" data-target="#selectTime">
								<p>시간선택 및 세부일정 짜기</p>
							</button>
     </div>
</div>  
     

<!-- Modal -->
<div class="modal fade" id="selectTime" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
							      </div>
							      <div class="modal-body">
							        Modal 내용
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							      </div>
							    </div>
							  </div>
							</div>



     
     
     
     
     
     

</html>