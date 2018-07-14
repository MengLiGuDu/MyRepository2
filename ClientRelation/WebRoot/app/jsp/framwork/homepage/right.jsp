<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/app/jsp/link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<style>
	.bd{
		border:1px solid red;
	}
	.box1{
		position: absolute;
		width: 1050px;
		height: 350px;
	}
	.box2{
		position: absolute;
		width: 500px;
		height: 350px;
		margin-left: 1100px;
	}
	.box3{
		position: absolute;
		width: 1050px;
		height: 350px;
		margin-top: 360px;
		
	}
	.box4{
		position: absolute;
		width: 500px;
		height: 350px;
		margin-top: 360px;
		margin-left: 1100px; 
	}
</style>
</head>
<body>
	 <div class="box1" id="box1"></div>
	 <div class="box2" id="box2"></div>
	 <div class="box3" id="box3"></div>
	 <div class="box4" id="box4"></div>
</body>
<script type="text/javascript">
var myChart3 = echarts.init(document.getElementById('box3'));
var option3 = {
    tooltip: {
//        show: false //不显示提示标签
        formatter: '{b}', //提示标签格式
        backgroundColor:"#ff7f50",//提示标签背景颜色
        textStyle:{color:"#fff"} //提示标签字体颜色
    },
    series: [{
        type: 'map',
        mapType: 'china',
        label: {
            normal: {
                show: true,//显示省份标签
                textStyle:{color:"#c71585"}//省份标签字体颜色
            },    
            emphasis: {//对应的鼠标悬浮效果
                show: true,
                textStyle:{color:"#800080"}
            } 
        },
        itemStyle: {
            normal: {
                borderWidth: .5,//区域边框宽度
                borderColor: '#009fe8',//区域边框颜色
                areaColor:"#ffefd5",//区域颜色
            },
            emphasis: {
                borderWidth: .5,
                borderColor: '#4b0082',
                areaColor:"#ffdead",
            }
        },
        data:[
            {name:'福建', selected:true}//福建为选中状态
        ]
    }],
};
myChart3.setOption(option3);





var dom = document.getElementById("box2");  
var myChart = echarts.init(dom);  
var app = {};  
option = null;  
option = {  
     title : { text: '销售额',subtext: '百分比',x:'center'},  
     tooltip : { trigger: 'item', formatter: "{a} <br/>{b} : {c} %" }, 
     legend: {orient : 'vertical',x : 'left',  data:[] },  
     toolbox: {  show : true, },
     calculable : true,
     series : [{name:'',type:'pie',radius : '55%',
                   center: ['50%', '60%'],
                   data:[]
      }]  
};

if (option && typeof option === "object") {  
    myChart.setOption(option, true);  
}  

var year = $("#year-search").val();  
$.ajax({  
    type: "post",  
    url: "<%=PATH%>/gardenDemo.action",  
    data : {"year":year},  
    cache : false,    //禁用缓存  
    dataType: "json",  
    success: function(result) {  
         var names=[];//定义两个数组  
           var nums=[];  
           $.each(result,function(key,values){
        	 names.push(values.name);
             var obj = new Object();  
             obj.name = values.name;  
             obj.value = values.count;  
             nums.push(obj);   
          });  
		myChart.setOption({  //加载数据图表  
			legend: {data: names},
			series: {  // 根据名字对应到相应的系列
			name: ['数量'],data: nums}      
		});  
    }, 
});

var dom4 = document.getElementById("box4");  
var myChart4 = echarts.init(dom4);  
var app4 = {};  
option4 = null;  
option4 = {  
     title : { text: '销售额',subtext: '百分比',x:'center'},  
     tooltip : { trigger: 'item', formatter: "{a} <br/>{b} : {c} %" }, 
     legend: {orient : 'vertical',x : 'left',  data:[] },  
     toolbox: {  show : true, },
     calculable : true,
     series : [{name:'',type:'pie',radius : '55%',
    			 radius : [20, 110],
    			 roseType : 'radius',
                   center: ['50%', '60%'], 
                   data:[]
      }]  
};

if (option4 && typeof option4 === "object") {  
    myChart4.setOption(option4, true);  
}  

var year4 = $("#year-search").val();  
$.ajax({  
    type: "post",  
    url: "<%=PATH%>/gardenDemoTwo.action",  
    data : {"year":year4},  
    cache : false,    //禁用缓存  
    dataType: "json",  
    success: function(result) {  
         var names4=[];//定义两个数组  
           var nums4=[];  
           $.each(result,function(key,values){
        	 names4.push(values.name);
             var obj = new Object();  
             obj.name = values.name;  
             obj.value = values.count;  
             nums4.push(obj);   
          });  
		myChart4.setOption({  //加载数据图表  
			legend: {data: names4},
			series: {  // 根据名字对应到相应的系列
			name: ['种类'],data: nums4}      
		});  
    }, 
});

var domLong1 = document.getElementById("box1");  
var myChartSecond1 = echarts.init(domLong1);  
var app1 = {};  
option1 = null;  
option1 = {  
	color: ['#3398DB'],  
	tooltip : {  
		trigger: 'axis',  
		axisPointer : {type : 'shadow'}  
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