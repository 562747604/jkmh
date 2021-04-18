<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
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
					<td><i class="fa fa-table"></i> <lable class="pathtitle">报告管理
						>> 统计</lable></td>
				</tr>
				<tr>
					<td style="text-align:right;vertical-align:middle"><input
						id="month1"
						class="form-control"
						runat="server"
						type="text"
						name="dataCon"
						style="width:150px;"
						placeholder="打印时间结束"
						value="<%=request.getAttribute("start") == null ? "" : request.getAttribute("start")%>"
					/> <span
						class="input-group-addon"
						style="display:none;"
					><span class="glyphicon glyphicon-th"></span></span> - <input
						id="month2"
						class="form-control"
						runat="server"
						type="text"
						name="dataCon"
						style="width:150px;"
						value="<%=request.getAttribute("end") == null ? "" : request.getAttribute("end")%>"
						placeholder="打印时间结束"
					/> <span
						class="input-group-addon"
						style="display:none;"
					><span class="glyphicon glyphicon-th"></span></span><input
						type="submit"
						value="检索"
						onclick="sea()"
						class="btn btn-outline btn-default"
					/> <input
						type="submit"
						value="重置"
						class="btn btn-outline btn-default"
						style="margin-right:20px;"
						onclick="ref()"
					/></td>
				</tr>
				<tr>
					<td><input
						type="submit"
						value="导出"
						class="btn btn-outline btn-default"
						onclick="doOut()"
					/> <input
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
					/></td>
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
											<h5>柱状图</h5>
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
							<tr style="height:30px;line-height:30px;">
								<td
									style="text-align:center;border:1px silver solid;width: 50px;"
								>序号</td>
								<td
									style="text-align:center;border:1px silver solid;border-left:none;"
								>打印人</td>
								<td style="text-align:center;border:1px silver solid;">份数</td>
							</tr>
							<%
								String userString = "";
								String dataString = "";
								Result rs = (Result) request.getAttribute("rs");
								if (rs.getRowCount() == 0) {
									userString = "\"无\"";
									dataString = "{name:\"无\",type:\"bar\",data:[0]}";
							%>
							<tr style="height:30px;line-height:30px;">
								<td
									colspan="3"
									style="text-align:center;border:1px silver solid;border-top:none;"
								>无数据</td>
							</tr>
							<%
								} else {
									for (int h = 0; h < rs.getRowCount(); h++) {
										Map row = rs.getRows()[h];
							%>
							<tr style="height:30px;line-height:30px;">
								<td
									style="text-align:center;border:1px silver solid;border-top:none;"
								><%=h + 1%></td>
								<td
									style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
								><%=row.get("pname")%></td>
								<td
									style="text-align:center;border:1px silver solid;border-top:none;"
								><%=row.get("c")%>份</td>
							</tr>
							<%
								if (userString.equals("")) {
											userString = "\"" + row.get("pname") + "\"";
										} else {
											userString += ",\"" + row.get("pname") + "\"";
										}
										if (dataString.equals("")) {
											dataString = "{name:\"" + row.get("pname") + "\",type:\"bar\",data:[" + row.get("c") + "]}";
										} else {
											dataString += ",{name:\"" + row.get("pname") + "\",type:\"bar\",data:[" + row.get("c") + "]}";
										}
									}
								}
							%>
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
	$("input[name='dataCon']").datetimepicker({
		language: 'zh-CN',
		format : 'yyyy-mm-dd',
		autoclose : true,
		timepicker : false, //关闭时间选项
		startView : 2,
		minView : 3,
		todayHighlight : true
	});
	
		$(function() {
			var t = echarts.init(document.getElementById("echarts-bar-chart")),
				n = {
					title : {
						text : "打印份数统计"
					},
					tooltip : {
						trigger : "axis"
					},
					legend : {
						data : [ <%=userString%> ]
					},
					grid : {
						x : 30,
						x2 : 40,
						y2 : 24
					},
					calculable : !0,
					xAxis : [ {
						type : "category",
						data : [ " " ]
					}, ], //,data:["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
					yAxis : [ {
						type : "value"
					} ],
					series : [<%=dataString%>]
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
		function sea(){
			location.href="${ctx}/yyry/tj?start="+document.getElementById("month1").value+"&end="+document.getElementById("month2").value;
		}
		function ref(){
			location.href="${ctx}/yyry/tj";		
		}
		function doOut(){//导出方法
			var s="";		
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "doTj",
	            data: {
	            	keyword:s,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	            	location.href="${ctx}/"+t.filename;            	
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
