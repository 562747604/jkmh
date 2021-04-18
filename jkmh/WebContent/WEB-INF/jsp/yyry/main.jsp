<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>丁丁健康管理系统</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<link rel="shortcut icon" href="${ctx}/images/favicon.ico">
<link href="${ctx}/jiankang/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/chosen/chosen.css"
	rel="stylesheet">
<link
	href="${ctx}/jiankang/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/cropper/cropper.min.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/switchery/switchery.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/jasny/jasny-bootstrap.min.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/nouslider/jquery.nouislider.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link
	href="${ctx}/jiankang/css/plugins/ionRangeSlider/ion.rangeSlider.css"
	rel="stylesheet">
<link
	href="${ctx}/jiankang/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css"
	rel="stylesheet">
<link
	href="${ctx}/jiankang/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/clockpicker/clockpicker.css"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="col-sm-12">
		<div class="example-wrap">
			<table width="100%" cellpadding="0" cellspacing="0" height="100%"
				style="line-height:30px;margin-top:10px;">
				<tr><td colspan="3"><i class="fa fa-table"></i> <lable class="pathtitle">报告管理  >> 首页</lable></td></tr>
				<tr>
					<td>
						<div class="text-center" style="display: block;margin-top:10px;">
							<div class="m-r-md inline">
								<p>我的打印</p>
								<input type="text" value="<%=request.getAttribute("dysum") %>" class="dial m-r"
									data-hbval="<%=request.getAttribute("dysum") %>/<%=request.getAttribute("shsum") %>" data-size="16" readonly="true" id="qu"
									name="qu" data-fgColor="#1AB394" data-max="<%=request.getAttribute("shsum") %>"
									data-width="150" data-height="150" />
							</div>
						</div>
					</td>
					<td>
						<div class="text-center" style="display: block;margin-top:10px;">
							<div class="m-r-md inline">
								<p>我的领取</p>
								<input type="text" value="<%=request.getAttribute("lqsum") %>" class="dial m-r"
									data-hbval="<%=request.getAttribute("lqsum") %>/<%=request.getAttribute("shsum1") %>" data-size="16" readonly="true" id="qu"
									name="qu" data-fgColor="#1AB394" data-max="<%=request.getAttribute("shsum1") %>"
									data-width="150" data-height="150" />
							</div>
						</div>
					</td>
					<td>
						<div class="text-center" style="display: block;margin-top:10px;">
							<div class="m-r-md inline">
								<p>我的发送</p>
								<input type="text" value="<%=request.getAttribute("fssum") %>" class="dial m-r"
									data-hbval="<%=request.getAttribute("fssum") %>/<%=request.getAttribute("shsum2") %>" data-size="16" readonly="true" id="qu"
									name="qu" data-fgColor="#1AB394" data-max="<%=request.getAttribute("shsum2") %>"
									data-width="150" data-height="150" />
							</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="wrapper wrapper-content animated fadeInRight" style="margin-top:30px;">
							<div class="row" style="width:100%;">
								<div class="col-sm-12">
									<div class="ibox float-e-margins">
										<div class="ibox-title">
											<h5>最近一个月的报告打印情况</h5>
										</div>
										<div class="ibox-content">
											<div class="flot-chart">
												<div class="flot-chart-content" id="flot-line-chart-multi"></div>
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
		src="${ctx}/jiankang/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
	<script src="${ctx}/jiankang/js/plugins/flot/jquery.flot.js"
		type="text/javascript" charset="utf8"></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.tooltip.min.js"
		type="text/javascript" charset="utf8"></script>
	<script src="${ctx}/jiankang/js/plugins/flot/jquery.flot.resize.js"
		type="text/javascript" charset="utf8"></script>
	<script src="${ctx}/jiankang/js/plugins/flot/jquery.flot.pie.js"
		type="text/javascript" charset="utf8"></script>
	<script type="text/javascript" charset="utf8">
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
					label : "打印数:"
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
						onHover : function() {
						}
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
