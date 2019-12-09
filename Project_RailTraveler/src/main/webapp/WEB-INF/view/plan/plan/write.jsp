<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<%=cp%>/resource/img/apple-icon.png">
	<link rel="icon" type="image/png" href="<%=cp%>/resource/img/favicon.png">	
	
	<title>다시넣을게</title>
	
    <link href="<%=cp%>/resource/bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=cp%>/resource/css/demo.css" rel="stylesheet" /> 

    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
  <script src="https://kit.fontawesome.com/9a196cb2bb.js" crossorigin="anonymous"></script>
  
  
  <script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-3.4.1.min.js"></script>
  
<style type="text/css">
*{
	margin: 0;
	padding: 0;	
}

.container {
	padding: 0;
}

#searchStation {
	border: 1px solid green;
	height: 20%;
}

#mapControllerLeft_left {
	margin: 15px;
}

#searchStation #selectTripDay {
	width: 100px;
	height: 100px;
	cursor:pointer;
	border:1px solid black;
	background:#fff;
	border-radius:2px;
	text-align:center;
	padding-top:5px;
	padding-bottom:5px;
}
</style>
</head>

<body>
<div class="main" style="height: 100%;">
	<div class="container tim-container">
     <div id="mapControllerLeft" style="width: 25%; height:100%; float: left; margin-top: 0px; margin-left: 0px; background: rgb(255, 255, 255); border-right: 1px solid;">
  		<div id="searchStation">
  			<div id="mapControllerLeft_left">
	  			<div style="float: left;">
	  				<a href="#"><img src="<%=cp%>/resource/images/logoWhite_planner.png"></a>
	  				<div style="margin-top:20px; padding-right: 30px;">
						<input type="date" style="width: 250px;">
					</div>
				</div>
				<div style="float: left;">
	  				<div id="selectTripDay"></div>
	  			</div>
  			</div>
  		</div>
     </div>
     <div id="map_container" style="float: left; width: 75%; overflow: hidden; position: relative;">
     	카카오 지도 api 부분
     </div>
	</div>
</div>
</body>
</html>