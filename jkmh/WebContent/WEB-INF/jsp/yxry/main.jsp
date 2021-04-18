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
					<td><i class="fa fa-table"></i> <lable class="pathtitle">营销管理
						>> 首页</lable></td>
				</tr>
				<tr>
					<td style="text-align:left;">
						<table
							style="width:58%;border:1px silver solid;height:150px;float:left;margin:auto;"
						>
							<tr>
								<td colspan="3"><span style="margin-left:20px;">最近一个月情况</span></td>
							</tr>
							<tr>
								<td style="text-align:center;"><div
										class="m-r-md inline"
										style=" background-color:silver;height:50px;line-height:50px;padding:0px 30px;"
									>营销APP数量:<%=request.getAttribute("hasDx") %>条</div></td>
								<td style="text-align:center;"><div
										class="m-r-md inline"
										style=" background-color:silver;height:50px;line-height:50px;padding:0px 30px;"
									>营销短信数量:<%=request.getAttribute("yxdx") %>条</div></td>
								<td style="text-align:center;"><div
										class="m-r-md inline"
										style=" background-color:silver;height:50px;line-height:50px;padding:0px 30px;"
									>营销邮件数量:<%=request.getAttribute("sumyj") %>份</div></td>
							</tr>
						</table>
						<table
							style="width:40%;border:1px silver solid;height:150px;margin-left:2%;float:left;"
						>
							<tr>
								<td colspan="2"><span style="margin-left:20px;">特别关心</span></td>
							</tr>
							<tr>
								<td style="text-align:center;"><div
										class="m-r-md inline"
										style=" background-color:silver;height:50px;line-height:50px;padding:0px 30px;"
									>营销<%=request.getAttribute("yxry") %>人</div></td>
								<td style="text-align:center;"><div
										class="m-r-md inline"
										style=" background-color:silver;height:50px;line-height:50px;padding:0px 30px;"
									><%=request.getAttribute("sumDx") %>条短信剩余</div></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<div
							class="wrapper wrapper-content animated fadeInRight"
							style="margin-top:30px; "
						>
							<div
								class="row"
								style="width:100%;"
							>
								<div class="col-sm-12">
									<div class="ibox float-e-margins">
										<div class="ibox-title">
											<h5>最近一个月的营销短信发送情况</h5>
										</div>
										<div class="ibox-content">
											<div class="flot-chart">
												<div
													class="flot-chart-content"
													id="flot-line-chart-multi"
												></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
		type="text/javascript"
		charset="utf8"
	>
		function gd(year, month, day) {
			return new Date(year, month - 1, day + 1).getTime();
		}
		$(function() {
			function e(e, o) {
				return "&yen;" + e.toFixed(o.tickDecimals)
			}
			function o(o) {
				$.plot($("#flot-line-chart-multi"), [ {
					data : t,
					label : "发送数"
				} ], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
					{
						xaxes : [ {
							mode : "time"
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
							content : "%s %x 为 %y",
							xDateFormat : "%y-%0m-%0d",
							onHover : function() {}
						}
					})
			}
			var t = <%=request.getAttribute("qst")%>;
			o("right"), $("button").click(function() {
				o($(this).text())
			})
		});
	
		$(".dial").knob();
	
		$(function() {
			t.setOption(n), window.onresize = t.resize;
		});
	</script>
	<script src="${ctx}/jiankang/js/plugins/echarts/echarts-all.js"></script>
</body>
</html>
