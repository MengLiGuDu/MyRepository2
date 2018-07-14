<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柱状图测试</title>
</head>
<style>
    html,body{
        margin:0;
        padding: 0;
    }
    .chartContainer{
        width:800px;
        height:600px;
        border:1px solid pink;
        box-sizing:border-box;
    }
</style>
<body>
	<!-- <div class="chartContainer" id="chart1"></div> -->
	<div id="second" style="width: 600px;height:400px;"></div>  
</body>
<script type="text/javascript">
//初始化echarts实例
/* var chart1=$("#chart1").get(0);//使用jquery，一定要加.get(0)，不然会找不到对象，和canvas的使用是一样的
var myChart1=echarts.init(chart1);
//对echarts做基础配置
var option={
    title:{
        text:"员工销量排行榜"
    },
    tooltip:{},
    legend:{
        data:["销量","1","2"]
    },
    //x轴的文本
    xAxis:{
        data:["张三","李四","王五","小白","小李","小兰"]
    },
    //y轴的文本
    yAxis:{},
    series:[{ name:"销量", type:"bar", data:[200,500,1000,1500,2000,1000]},
            { name:"1", type:"bar", data:[200,500,1000,1500,2000,1000]},
   		 { name:"2", type:"bar", data:[200,500,1000,1500,2000,1000]}
    ]
};

myChart1.setOption(option); */
 var domLong1 = document.getElementById("second");  
var myChartSecond1 = echarts.init(domLong);  
var app1 = {};  
option1 = null;  
option1 = {  
	color: ['#3398DB'],  
	tooltip : {  
		trigger: 'axis',  
		axisPointer : {            // 坐标轴指示器，坐标轴触发有效  
			type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'  
            }  
	},  
	grid: {  
		left: '3%',  
		right: '4%',  
            bottom: '3%',  
            containLabel: true  
	},  
	xAxis : [{type : 'category',data : [],  
		axisTick: {  
			alignWithLabel: true  
		}  
	}],  
	yAxis : [{  
		type : 'value'  
	}],  
	series : [{  
		name:'直接访问',  
		type:'bar',  
		barWidth: '60%',  
		data:[]  
	}]  
};  
if (option1 && typeof option1 === "object") {  
	myChartSecond1.setOption(option1, true);  
}  
//给柱形图赋值  
 var year1 = $("#year-search").val();  
	$.ajax({  
		type: "post",  
		url: "<%=PATH%>/colimnarDemo.action",  
		data : {"year":year1},  
		cache : false,   //禁用缓存  
		dataType: "json",  
		success: function(result) {  
			var linNames=[];  
			var linNums=[];  
			$.each(result,function(key,values){    
				linNames.push(values.name);  
				linNums.push(values.count);  
			});  
            //柱形图赋值  
		myChartSecond1.setOption({ //加载数据图表  
			xAxis: {data: linNames},  
			series: {  
                                // 根据名字对应到相应的系列  
				name: ['数量'],  
				 data: linNums  
                  }  
		});            
	},  
});  
</script>
</html>