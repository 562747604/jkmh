<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
>
<meta
	http-equiv="X-UA-Compatible"
	content="IE=edge,Chrome=1"
/>
<meta
	http-equiv="X-UA-Compatible"
	content="IE=9"
/>
<title>丁丁健康管理系统</title>
<meta
	content="width=device-width, initial-scale=1.0"
	name="viewport"
/>
<meta
	content=""
	name="description"
/>
<meta
	content=""
	name="author"
/>
<meta
	http-equiv="pragma"
	content="no-cache"
>
<meta
	http-equiv="cache-control"
	content="no-cache"
>
<meta
	http-equiv="expires"
	content="0"
>
<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<link
	rel="shortcut icon"
	href="${ctx}/images/favicon.ico"
>
<link
	href="${ctx}/jiankang/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/iCheck/custom.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/chosen/chosen.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/cropper/cropper.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/switchery/switchery.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/jasny/jasny-bootstrap.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/nouslider/jquery.nouislider.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/ionRangeSlider/ion.rangeSlider.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/clockpicker/clockpicker.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/animate.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/js/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet"
>
</head>
<body class="gray-bg">
	<div class="col-sm-12">
		<div class="example-wrap">
			<table
				width="100%"
				cellpadding="0"
				cellspacing="0"
				height="100%"
				style="line-height:30px;margin-top:10px;"
			>
				<tr>
					<td><i class="fa fa-table"></i> <lable class="pathtitle">健康评估
						>> 评估统计</lable></td>
				</tr>
				<tr>
					<td><input
						type="submit"
						value="图表"
						class="btn btn-outline btn-default"
						onclick="change('1')"
					/> <input
						type="submit"
						value="详细列表"
						class="btn btn-outline btn-default"
						style="margin-right:20px;"
						onclick="change1('1')"
					/> <%-- 					<input
							id="b-del"
							type="button"
							value="导出"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;<%=request.getAttribute("addBtn") %>"
							onclick="doOut()"
						/> --%></td>
				</tr>
				<tr>
					<td>
						<div
							id="div1"
							class="wrapper wrapper-content animated fadeInRight"
						>
							<div class="row">
								<div class="col-sm-12">
									<div class="ibox float-e-margins">
										<div class="ibox-content">
											<div
												class="echarts"
												id="echarts-bar-chart"
											></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<table
							id="div11"
							style="width:80%;margin-left:auto;margin-right:auto;display:none;margin-top:30px;background-color:white;"
						>
							<tr>
								<td style="text-align:center;">
									<div id="divT" style="overflow: auto;">
										<c:forEach
											var="cd"
											items="${chronicDiseases}"
											varStatus="status1"
										>
											<table
												style="width:80%;margin-left:auto;margin-right:auto;display:;margin-top:30px;background-color:white;"
											>
												<tr style="height:30px;line-height:30px;">
													<td
														style="text-align:center;border:1px silver solid;border-bottom:none;"
													>${cd.name}</td>
												</tr>
												<tr style="height:30px;line-height:30px;">
													<td style="text-align:center; ">
														<table
															style="width:100%;margin-left:auto;margin-right:auto;;margin-top:0px;background-color:white;"
														>
															<tr style="height:30px;line-height:30px;">
																<td style="text-align:center;border:1px silver solid;">风险等级</td>
																<td
																	style="text-align:center;border:1px silver solid;border-left:none;"
																>风险名称</td>
																<td
																	style="text-align:center;border:1px silver solid;border-left:none;"
																>数量</td>
																<td
																	style="text-align:center;border:1px silver solid;border-left:none;"
																>比例</td>
															</tr>
															<c:forEach
																var="data"
																items="${cd.data}"
																varStatus="status2"
															>
																<tr style="height:30px;line-height:30px;">
																	<td
																		style="text-align:center;border:1px silver solid;border-top:none;"
																	>${data.level }</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-top:none;"
																	>${data.name}</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																	>${data.count }</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																	>${data.rate }</td>
																</tr>
															</c:forEach>
														</table>
													</td>
												</tr>
												</table>
										</c:forEach>
									</div>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="${ctx}/jiankang/js/plugins/jsKnob/jquery.knob.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.tooltip.min.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.resize.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.pie.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/js/bootstrap-datetimepicker.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="utf8"
	></script>
	<script
		type="text/javascript"
		charset="utf8"
	>
	function gd(year, month, day) {
		return new Date(year, month - 1, day + 1).getTime();
	}
		 var data_js = JSON.parse(JSON.stringify(<%=request.getAttribute("statInfo")%>));
		 
		$(function() { 
			document.getElementById("divT").style.height=(window.screen.availHeight-360)+"px";
			var t = echarts.init(document.getElementById("echarts-bar-chart")), n = {

				    title : {
				        text: '评估统计',
				        subtext: ''
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['低风险','中风险','高风险']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: false},
				            dataView : {show: false, readOnly: false},
				            magicType : {show: false, type: ['line', 'bar']},
				            restore : {show: false},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            data : [<%=request.getAttribute("dataString")%>]
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            splitArea : {show : true}
				        }
				    ],
				    series : [
				        {
				            name:'低风险',
				            type:'bar',
				            data:[<%=request.getAttribute("dfx")%>],
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            },itemStyle: {
			                    normal: {
			          　　　　　　　　　　　　　　//好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，
			                                  color: function(params) {
			                                      // build a color map as your need.
			                                      var colorList = [
			                                        'green'];
			                                      return colorList[0]
			                                  }
			                                  }
			                              }
				        },
				        {
				            name:'中风险',
				            type:'bar',
				            data:[<%=request.getAttribute("zfx")%>],
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            },itemStyle: {
			                    normal: {
			          　　　　　　　　　　　　　　//好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，
			                                  color: function(params) {
			                                      // build a color map as your need.
			                                      var colorList = [
			                                        'yellow'];
			                                      return colorList[0]
			                                  }
			                                  }
			                              }
				        },
				        {
				            name:'高风险',
				            type:'bar',
				            data:[<%=request.getAttribute("gfx")%>],
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            },itemStyle: {
			                    normal: {
			          　　　　　　　　　　　　　　//好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，
			                                  color: function(params) {
			                                      // build a color map as your need.
			                                      var colorList = [
			                                        'red'];
			                                      return colorList[0]
			                                  }
			                                  }
			                              }
				        }
				    ]
				  
			};
			t.setOption(n), window.onresize = t.resize;
		});
		
		
		
		
		
		function change(num) {
			document.getElementById("div" + num).style.display = "inherit";
			document.getElementById("div" + num + "1").style.display = "none";
		}
		function change1(num) {
			document.getElementById("div" + num).style.display = "none";
			document.getElementById("div" + num + "1").style.display = "table";
		}
		function doOut(){//导出方法
			var s="";		
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "doYxtjExportExcel",
	            data: {
//	            	tblName:tblname,
//	            	keyword:s,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	            	location.href="${ctx}/"+t.filename; 
					echarts.refresh;
	            },
	            error:function(data){
	            	right("导出失败!");
	            }
	        });
		}	


	</script>
	<script src="${ctx}/jiankang/js/plugins/echarts/echarts-all.js"></script>
</body>
</html>
