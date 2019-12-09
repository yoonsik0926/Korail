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
	<meta charset="UTF-8">
	<title>spring</title>
	<link rel="apple-touch-icon" sizes="76x76" href="<%=cp%>/resource/images/apple-icon.png">
	<link rel="icon" type="image/png" href="<%=cp%>/resource/images/favicon.png">
	<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
	<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">


	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />
	<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

		<link href="<%=cp%>/resource/css/main.css" rel="stylesheet" />
	<link href="<%=cp%>/resource/bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=cp%>/resource/bootstrap3/css/font-awesome.css" rel="stylesheet" />
    
    <link href="<%=cp%>/resource/css/demo.css" rel="stylesheet" /> 

    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
  	<script src="https://kit.fontawesome.com/9a196cb2bb.js" crossorigin="anonymous"></script>
  	<!-- Font Lobster -->
 	<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
 	
	<link href="<%=cp%>/resource/css/gsdk.css" rel="stylesheet" />
	
	<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
	<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="container">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>