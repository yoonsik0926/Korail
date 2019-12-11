<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<%=cp%>/resource/img/apple-icon.png">
	<link rel="icon" type="image/png" href="<%=cp%>/resource/img/favicon.png">	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>내일로</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
	
	<link href="<%=cp%>/resource/css/main.css" rel="stylesheet" /> 
    <link href="<%=cp%>/resource/bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=cp%>/resource/css/demo.css" rel="stylesheet" /> 

    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
 	<!-- Font Lobster -->
 	<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/9a196cb2bb.js" crossorigin="anonymous"></script>
  
  
  <script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-3.4.1.min.js"></script>
  
	<link href="<%=cp%>/resource/css/gsdk.css" rel="stylesheet" />     
</head>


<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="container" style="margin: 0; padding: 0;">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

<%-- <script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script> --%>
<%-- <script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script> --%>

</body>
	<script src="<%=cp%>/resource/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/js/gsdk-checkbox.js"></script>
	<script src="<%=cp%>/resource/js/gsdk-radio.js"></script>
	<script src="<%=cp%>/resource/js/gsdk-bootstrapswitch.js"></script>
	<script src="<%=cp%>/resource/js/get-shit-done.js"></script>
	
    <script src="<%=cp%>/resource/js/custom.js"></script>
</html>