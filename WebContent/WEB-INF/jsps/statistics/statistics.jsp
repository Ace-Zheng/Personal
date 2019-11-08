<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon" />
        <link rel="stylesheet" href="${ctx}/public/css/font.css"> 
        <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
        <!-- 导入jquery插件 -->
		<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
		<script type="text/javascript" src="${ctx }/js/fkjava_timer.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/v-charts/lib/index.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/v-charts/lib/style.min.css">
		<script src="https://cdn.jsdelivr.net/npm/echarts-amap/dist/echarts-amap.min.js"></script> 
		<script src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
        <style type="text/css">
	   p{
	      font-family: "宋体","仿宋",sans-serif;
	      text-align: left;
	      font-size: 14px;
	   }
	</style>
      <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
       

<script type="text/javascript">
//使用ajax加载数据 
$.ajax({
    method:'post',
    url:'${ctx}/echartsData',
    dataType:'json',
    success:function(data){
        initChat(data);
    }
}); 
function initChat(data){
var myChart = echarts.init(document.getElementById('mainChart'));
    option = {
            title : {
                text: '员工男女比例统计',
                subtext: '内部数据',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: data
            },
            series : [
                {
                    name: '男女数量',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:data,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }       
                }
            ]
        },
                myChart.setOption(option);
};
</script> 

<script type="text/javascript">

//使用ajax加载数据 
$.ajax({
    method:'post',
    url:'${ctx}/echartsData1',
    dataType:'json',
    success:function(data){
        initChat1(data);
    }
}); 
function initChat1(data){
	var xA = [];
	var yA = [];
    //将获取到的json数据列表清洗数据后push到xA,yA两个坐标轴 数据列表中
    //注意，此处循环函数可以用于位置数量的数据，不必提前预知数据量大小
    for(var i=0;i<data.length;i++){
    	xA.push(data[i].name);
    	yA.push(data[i].value);
    }
	//通过 echarts.init 方法初始化一个 echarts 实例
var myChart = echarts.init(document.getElementById('mainChart1'));
	var option = {
			title: {
	            text: '各职位员工人数',
	            subtext: '内部数据',
	            x:'center'
	        },
	     /*    ['职员','java开发工程师','java高级开发工程师','架构师','经理','总经理','java中级开发工程师','系统管理员','主管'] */
	        tooltip: {},
	        legend: {
	        	orient: 'vertical',
	            data:data ,
	            left: 'left'
	        },
	       
	        itemStyle: {
	            normal: {
	                // 随机显示
	         color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);
	         }
	         },
	        },
	        grid: {
	            y2: 70
	        },
	        xAxis: {
	            data: xA,
	            axisLabel: {
	                interval: 0,
	                rotate: -25
	            }
	        },
	        yAxis: {},
	        series: [{
	            name: '员工人数',
	            type: 'bar',
	            data: yA
	        }]
	};
	 myChart.setOption(option);
	};
</script> 
</head>
<body>

<div style="width:100%;height:190%;margin-top:-30px; border:0;" class="main_tabbor">
 	<h1 align="center" style="color:  rgb(26,160,147); font-size:30px; margin-top:30px">数据统计报表</h1>
 	<hr>
 	
 	
 	<div   style="height:320px;width:320px;margin-top: 50px;margin-left:50px;">
    	 <div id="mainChart" style="border: 2px solid rosybrown; width:100%; height:100%;"></div>
	</div>

 	<div  style="height:320px;width:660px;margin-left:400px;margin-top:-320px;">
   		 <div id="mainChart1" style="border: 2px solid rosybrown; width:100%; height:100%;"></div> 
	</div>
	
	<div id="app1" style="width: 480px;height: 400px; border:2px solid rosybrown;margin-top:50px;margin-left:50px;">
     
     <ve-line :data="chartData" :settings="chartSettings"></ve-line>
   </div>
	<script>
	//使用ajax加载数据 
	$.ajax({
	    method:'post',
	    url:'${ctx}/echartsData2',
	    dataType:'json',
	    success:function(data){
	    	
	        initChat2(data);
	    }
	}); 
	function initChat2(data){
		var yA = [];
		var yB = [];
		var yC = [];
		var yD = [];
		var yE = [];
		
	    //将获取到的json数据列表清洗数据后push到xA,yA两个坐标轴 数据列表中
	    //注意，此处循环函数可以用于位置数量的数据，不必提前预知数据量大小
		 for(var i=0;i<data.length;i++){
	    	yA.push(data[i].searchengine);
	    	yB.push(data[i].allianceadvertising);
	    	yC.push(data[i].mailmarketing);
	    	yD.push(data[i].directaccess);
	    	yE.push(data[i].videoadvertising);
	     };
	    	new Vue({
	    		  el: '#app1',
	    		  data () {
	    		    this.chartSettings = {
	    		      title : '一周处理业务折线统计',  
	    		      metrics: ['邮件营销', '联盟广告', '视频广告','直接访问','搜索引擎'],
	    		      dimension: ['日期']
	    		    }
	    		    return {
	    		      chartData: {
	    		        columns: ['日期', '邮件营销', '联盟广告', '视频广告','直接访问','搜索引擎'],
	    		       
	    		        rows: [
	    		          { '日期': '星期一', '邮件营销': yA[0], '联盟广告': yB[0], '视频广告': yC[0],'直接访问':yD[0],'搜索引擎':yE[0]},
	    		          { '日期': '星期二', '邮件营销': yA[1], '联盟广告': yB[1], '视频广告': yC[1],'直接访问':yD[1],'搜索引擎':yE[1]},
	    		          { '日期': '星期三', '邮件营销': yA[2], '联盟广告': yB[2], '视频广告': yC[2],'直接访问':yD[2],'搜索引擎':yE[2]},
	    		          { '日期': '星期四', '邮件营销': yA[3], '联盟广告': yB[3], '视频广告': yC[3],'直接访问':yD[3],'搜索引擎':yE[3]},
	    		          { '日期': '星期五', '邮件营销': yA[4], '联盟广告': yB[4], '视频广告': yC[4],'直接访问':yD[4],'搜索引擎':yE[4]},
	    		          { '日期': '星期六', '邮件营销': yA[5], '联盟广告': yB[5], '视频广告': yC[5],'直接访问':yD[5],'搜索引擎':yE[5]},
	    		          { '日期': '星期日', '邮件营销': yA[6], '联盟广告': yB[6], '视频广告': yC[6],'直接访问':yD[6],'搜索引擎':yE[6]}
	    		        ]
	    		      }
	    		    }
	    		  }
	    		})
	    
	};
 
	</script>
	
	<div id="app" style="width: 500px;height: 400px; border:2px solid rosybrown;margin-top:-404px;margin-left:560px;margin-bottom: 15px;">
      地图模块  暂时禁用。求助开发者获取
    <ve-map :data="chartData"></ve-map>
   </div>
</div>	
</body> 

</html>