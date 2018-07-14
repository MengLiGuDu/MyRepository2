<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>app/css/bootstrap.min.css">
<script src="<%=basePath%>app/js/jquery.min.js"></script>                         
<script src="<%=basePath%>app/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>app/js/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="<%=basePath%>app/js/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>app/js/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>app/js/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>app/js/highcharts.js"></script> 

<style type="text/css">
	.box{
		border: 1px solid gray;
		width: 100%;
		height:400px;
	}
	.one{
		margin-top:80px;
		margin-right:90px;
	}
	.two{
		margin-top:80px;
		margin-left:90px;
	}
	.three{
		position:absolute;
		top:30px;
		left:85px;
		font-size:20px;
	}
	.fore{
		position:absolute;
		top:30px;
		right:85px;
		font-size:20px;
	}
</style>
</head>
<body>
	<div class="box">
		<div class="three" style="float:left;"><b>资产领用统计表</b></div>
		<div class="fore" style="float:right"><b>资产借用统计表</b></div>
		<div id="chart2" style="height:220px; width:480px;float: left;" class="two"></div>
	
		<div id="chart1" style="height:220px; width:480px; float:right;" class="one"></div>
	</div>
	<br>
	<br>
	<div id="container_1" style="width:500px; margin: 0 auto;background-color:#EEF3FA"></div>  
	
	
	
</body>
<script>
	$(document).ready(function(){
		var data=[[8,7,9,1,4,6,8,2,5]];//这里是折线点的数据，格式[x,y],这里只写了一组数据，默认为y轴上的数据，而x上的数据默认为：1，2，3，4；
	  	var plot1 = $.jqplot('chart1',data);//第一个参数为显示图表容器ID
	});
	
	$(document).ready(function(){
		var data=[[6,2,5,6,1,9,7,3,8]];//这里是折线点的数据，格式[x,y],这里只写了一组数据，默认为y轴上的数据，而x上的数据默认为：1，2，3，4；
	  	var plot1 = $.jqplot('chart2',data);//第一个参数为显示图表容器ID
	});
	
	
	$(function () { 
        $('#container_1').highcharts({ 
        chart: { 
            type: 'pie',
            backgroundColor:"#EEF3FA",
            x:-200,
            height:350, 
            marginLeft:-150
        },
        credits: {
            enabled: false   //右下角不显示LOGO  
        },
        title: {
            text: '',
        },  
        subtitle: {
            text: '',
        },  
        exporting: {//Highcharts 图表导出功能模块。  
            enabled: false  
        },  
        colors: ['#E2214E', '#F7B52B', '#0749C3', '#66FE17',  
                 '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],  
        legend: {  
            layout: 'vertical',  
            floating: true,  
            backgroundColor: '#EEF3FA',  
            align: 'right',  
            verticalAlign: 'top',  
            y:65,  
            x:-20,  
            itemMarginBottom :5,//图例的上下间距  
            maxHeight: 200,  
            symbolHeight:16,//高度  
            symbolWidth:14  
        },  
        plotOptions: {  
            pie: {  
                allowPointSelect: false, 
                cursor: 'pointer',  
                dataLabels: {  
                    enabled: false  
                },  
                showInLegend: true,  
                symbolWidth: 24,  
                point: {  
                    events: {  
                        legendItemClick: function (e) {  
                            return false; // 直接 return false 即可禁用图例点击事件  
                        }  
                    }  
                }  
            }  
        },  
        series: [{  
            data: [  
                ['可用'+'(10盘)' +'<br><span style="text-align:center;">50%</span>', 50.0],  
                ['待维修'+'(22盘)'+'<br><span style="text-align:center;">13%</span>',13],  
                ['报废'+'(28盘)'+'<br><span style="text-align:center;">12%</span>',12],  
                ['其他'+'(28盘)'+'<br><span style="text-align:center;">25%</span>', 25]  
            ]  
        }]  
    });  
});  
	
	
</script>
</html>