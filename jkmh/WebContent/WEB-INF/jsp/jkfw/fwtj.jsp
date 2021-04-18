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
	<div
		class="col-sm-12"
		style="width:100%;"
	>
		<div class="example-wrap">
			<table
				width="100%"
				cellpadding="0"
				cellspacing="0"
				height="100%"
				style="line-height:30px;margin-top:10px;"
			>
				<!-- <tr>
					<td><i class="fa fa-table"></i> <lable class="pathtitle">健康服务
						>> 服务统计</lable></td>
				</tr> -->
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
										<div class="ibox-title">
											<h5>${bt}</h5>
										</div>
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
									<div
										id="divT"
										style="overflow: auto;"
									>
										<table
											style="width:80%;margin-left:auto;margin-right:auto;display:;margin-top:30px;background-color:white;"
										>
											<tr style="height:30px;line-height:30px;">
												<td
													style="text-align:center;border:1px silver solid;border-bottom:none;"
												>${bt}</td>
											</tr>
											<tr style="height:30px;line-height:30px;">
												<td style="text-align:center;">
													<table
														style="width:100%;margin-left:auto;margin-right:auto;;margin-top:0px;background-color:white;"
													>
														<tr style="height:30px;line-height:30px;">
															<td style="text-align:center;border:1px silver solid;">${lm1}</td>
															<td
																style="text-align:center;border:1px silver solid;border-left:none;"
															>${lm2}</td>
														</tr>
														<c:forEach
															var="data"
															items="${tjlist}"
															varStatus="status2"
														>
															<tr style="height:30px;line-height:30px;">
																<td
																	style="text-align:center;border:1px silver solid;border-top:none;"
																>${data.name }</td>
																<c:if test="${lx==1}">
																	<td
																		style="text-align:center;border:1px silver solid;border-top:none;"
																	>${data.count.intValue()}</td>
																</c:if>
																<c:if test="${lx==2}">
																	<td
																		style="text-align:center;border:1px silver solid;border-top:none;"
																	>${data.count*100}%</td>
																</c:if>
															</tr>
														</c:forEach>
													</table>
												</td>
											</tr>
											</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
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

		 var data_js = JSON.parse(JSON.stringify(<%=request.getAttribute("statInfo")%>));
		 <c:if  test="${lx==1}"> 
		$(function() { 
			document.getElementById("divT").style.height=(window.screen.availHeight-360)+"px";
			var t = echarts.init(document.getElementById("echarts-bar-chart")), n = {

				    title : {
				        text: '',
				        subtext: ''
				    },
				    tooltip : {
				        trigger: 'axis'
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
				        	 axisLabel: {
				    			 interval: 0
				               
				            },
				            axisTick: {
				                show: false
				            },
				            axisLine: {
				                show: false
				            },
				            z: 10,
				        	 data:<%=request.getAttribute("qst1")%>
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
				            type:'bar',
				          
				            itemStyle: {  
		                        normal: {  
		                            label: {  
		                                show: true,//是否展示  
		                                textStyle: {  
		                                    fontWeight:'bolder',  
		                                    fontSize : '12',  
		                                    fontFamily : '微软雅黑',  
		                                } },
		                                color: function(params) {
		                                    // build a color map as your need.
		                                    var colorList = [
		                                      '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
		                                       '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
		                                       '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0',
		                                       '#DAA04B','#CBB579','#FCC001','#FEEE5A','#AAA0C0'
		                                    ];
		                                    return colorList[params.dataIndex]
		                                
		                            }  
		                        }  
				            },
				            data:<%=request.getAttribute("qst")%> 
				        }
				    ]
				  
			};
			t.setOption(n), window.onresize = t.resize;
		});
		
		 </c:if> 
		 <c:if test="${lx==2}">
		 function gd(year, month, day) {
				return new Date(year, month - 1, day + 1).getTime();
			}
		 var json= <%=request.getAttribute("qst")%>;// [[gd(2017,8,1),0.5],[gd(2017,8,2),0.6],[gd(2017,8,3),0.7],[gd(2017,8,4),0.8]];
		$(function() {
			document.getElementById("divT").style.height=(window.screen.availHeight-360)+"px";
			function e(e, o) {
				return "&yen;" + e.toFixed(o.tickDecimals)
			}
			function o(o) {
				$.plot($("#echarts-bar-chart"), [ {
					data :json,
					label : '${lm2}'
				} ], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
				{
					xaxes : [ {
						   mode: "time",
						   timeformat : "%0m月%0d",
					} ],
					yaxes : [ {
						min : 0
						
					}, {
						alignTicksWithAxis : "right" == o ? 1 : null,
						position : o,
						tickFormatter : e
					} ],
					legend : {
						position : "sw"
					},
					colors : [ "#1ab394" ],
					grid : {
						color : "#999999",
						hoverable : !0,
						clickable : !0,
						tickColor : "#D4D4D4",
						borderWidth : 0,
						hoverable : !0
					},
					tooltip : !0,
					tooltipOpts : {
						content : "上传日期： %x 为 %y%",
						xDateFormat : "%y-%0m-%0d",
						onHover : function() {
						}
					}
				})
			}
			o("right"), $("button").click(function() {
				o($(this).text())
			})
		});

		 </c:if> 
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
