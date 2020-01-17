<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<!--티켓별 매출-->

<figure style="display:none;" class="highcharts-figure">
   
    <table id="datatable">
        <thead>
            <tr>
                <th></th>
                <th>2019년</th>
                <th>2020년</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>3일권</th>
                <td>3</td>
                <td>4</td>
            </tr>
            <tr>
                <th>5일권</th>
                <td>2</td>
                <td>0</td>
            </tr>
            <tr>
                <th>7일권</th>
                <td>5</td>
                <td>11</td>
            </tr>
            <tr>
                <th>3일권(2인)</th>
                <td>1</td>
                <td>1</td>
            </tr>
            <tr>
                <th>5일권(2인)</th>
                <td>2</td>
                <td>4</td>
            </tr>
            
                        <tr>
                <th>7일권(2인)</th>
                <td>2</td>
                <td>4</td>
            </tr>
        </tbody>
    </table>
</figure>

<script>
function menuSelect(ob) {
	var cnt;
	if(ob=='monthSearch'){
		Highcharts.chart('container1', {
		    data: {
		        table: 'datatable'
		    },
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '전년 대비 티켓별 총액 현황'
		    },
		    yAxis: {
		        allowDecimals: false,
		        title: {
		            text: 'Units'
		        }
		    },
		    tooltip: {
		        formatter: function () {
		            return '<b>' + this.series.name + '</b><br/>' +
		                this.point.y + ' ' + this.point.name.toLowerCase();
		        }
		    }
		});
	}else{
		$('#monthSearch').css("display","none");	
		$('#ticketSearch').css("display","");
	}
	
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



function salelistPage(page) {
	var condition;
	var keyword;
	var url = "<%=cp%>/ticket/saleList";
	var query = "pageNo="+page+"&condition="+condition+"&keyword="+keyword;
	
	var ob = $("#condition");
	if(ob){
		 condition = ob.val();	
		 keyword = $('#keyword').val();
		if(keyword)
			query = "pageNo="+page+"&condition="+condition+"&keyword="+keyword;
	}
	var selector = "#ajaxsaleList";
	ajaxHTML(url, "get", query, selector);
}






function searchSaleList() {

	salelistPage(1);
}
</script>

<script type="text/javascript">

$(function () {
	salelistPage(1);
});

$(function(){
	var url ="<%=cp%>/ticket/maingraph";
	$.getJSON(url,function(data){
		//console.log(data);
		
		$("#container1").highcharts({
			chart: {
		        type: 'column',
		        options3d: {
		            enabled: true,
		            alpha: 10,
		            beta: 25,
		            depth: 70
		        }
		    },
		    title: {
		        text: '올해의 Rail Traveler '
		    },
		    subtitle: {
		        text: 'Keep buring!'
		    },
		    plotOptions: {
		        column: {
		            depth: 30
		        }
		    },
		    xAxis: {
		        categories: Highcharts.getOptions().lang.shortMonths,
		        labels: {
		            skew3d: true,
		            style: {
		                fontSize: '14px'
		            }
		        }
		    },
		    yAxis: {
		        title: {
		            text: 'WON'
		        },

		    },
		    series : data.series
		});
		
	});
});
</script>

<body>
	<div class="container tim-container"
		style="max-width: 1600px; padding-top: 30px; margin: 0px auto;">


		<div class="body-content-container">
			<div class="container"
				style="margin: 20px auto; margin-bottom: 50px; width: 100%">

				<div id="ticketForm" class="sir_lbo"
					style="padding: 0; margin: 0; font-size: 1.025em; display: block">
			<div id="container1" style="float:left; width: 45%">
			
			</div>
			
			
			
			
			<div id="ajaxsaleList" style="float:right; width: 55%"> </div>
						
						
						
						

				</div>

			</div>


		</div>
	</div>
</body>
</html>