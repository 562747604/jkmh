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
<body>
	<form action="">
		<table
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;height:800px; "
		>
			<tr>
				<td
					style="text-align:center;height:30px;line-height:30px; vertical-align:middle;width:200px;
						border-right:5px #3a3a79 solid;"
				>
					<h2>基本信息</h2>
				</td>
				<td style="text-align:left;line-height:30px; vertical-align:middle;">
					<input
					type="button"
					value="预览"
					class="form-control"
					style="height:30px;width:55px;margin-left:20px;"
				/> <input
					type="button"
					value="完成"
					class="form-control"
					style="height:30px;width:55px;"
				/>
				</td>
			</tr>
			<tr>
				<td
					style="text-align:center; vertical-align:top;
						border-right:5px #3a3a79 solid;"
				>
					<table style="width:200px;text-align:center;">
						<tr>
							<td
								colspan="2"
								style="text-align:center;height:30px;line-height:30px; vertical-align:middle;"
							><a><img
									src="${ctx}/images/jkpgyw/u756.png"
									style="height:30px;"
								></a> <img
								src="${ctx}/images/jkpgyw/u718.jpg"
								style="height:100px;"
							> <a><img
									src="${ctx}/images/jkpgyw/u758.png"
									style="height:30px;"
								></a></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:30px;line-height:30px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>档案号:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>201612280001</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>姓 名:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>张三</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>性别:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>男</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>年龄:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>34</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>单位:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>中石油</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>身份证:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>12312312412411</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>电话:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>123425252312</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
					</table>
				</td>
				<td
					style="text-align:left;line-height:30px; vertical-align:top;background-color:#bef2ff;"
				>
					<table style="width:100%;text-align:center;height:530px;">
						<tr style="height:30px;line-height:30px;">
							<td style="border-bottom:1px silver solid;"><a
								href="${ctx}/jkzy/pgbg"
							><h2>评估报告</h2></a></td>
							<td style="border-bottom:1px silver solid;"><a
								href="${ctx}/jkzy/fwzz2"
							><h2>饮食方案</h2></a></td>
							<td style="border:1px silver solid;border-bottom:none;"><a
								href="${ctx}/jkzy/fwzz3"
							><h2>运动方案</h2></a></td>
							<td style="border-bottom:1px silver solid;"><a
								href="${ctx}/jkzy/fwzz4"
							><h2>睡眠方案</h2></a></td>
							<td style="border-bottom:1px silver solid;"><a
								href="${ctx}/jkzy/fwzz5"
							><h2>设备上传</h2></a></td>
							<td style="border-bottom:1px silver solid;"><a
								href="${ctx}/jkzy/fwzz6"
							><h2>回访追踪</h2></a></td>

						</tr>
						<tr>
							<td
								colspan="7"
								style="border:1px silver solid;border-top:none;border-bottom:none; vertical-align:top;"
							>
								<table
									style="width:98%;border:1px silver solid;margin:0px auto;background-color: white;"
								>
									<tr>
										<td
											style="text-align: left;border:1px silver solid;border-right: none;"
										><span style="margin-left:20px;">+食谱推荐</span></td>
										<td
											style="text-align: right;border:1px silver solid;border-left: none;"
										><a
											href="#.html"
											style="margin-right:20px;"
											onclick="showDiv()"
										>修改</a></td>
									</tr>
									<tr>
										<td>
											<table
												id="div1"
												style="margin:20px auto;height:255px;"
											>
												<tr>
													<td
														style="width:200px;background-color:silver;border: 5px white solid;"
														rowspan="2"
													><span>平均每天活动量</span></br> <span
														style="font-weight: bolder;font-size: 20px;"
													>6900</span><span>步</span></td>
													<td
														style="width:100px;background-color: silver;border: 5px white solid;"
														rowspan="2"
													><span>根据感觉判断:自我感觉轻松,略微出汗.</span></td>
													<td
														style="width:200px;background-color: silver;border: 5px white solid;"
														rowspan="3"
													><span>推荐项目:网球(一般).跑步(慢)</span></td>
													<td
														style="width:200px;background-color: silver;border: 5px white solid;"
														rowspan="1"
													><span>运动场所:公园,校园</span></td>
												</tr>
												<tr>
													<td
														style="width:200px;background-color: silver;border: 5px white solid;"
														rowspan="1"
													><span>推荐运动时间:下午3~4点</span></td>
												</tr>
												<tr>
													<td
														style="width:200px;background-color: silver;border: 5px white solid;"
														colspan="2"
													><span>根据心率控制:一般控制心率在100~130次/分</span></td>
													<td
														style="width:200px;background-color: silver;border: 5px white solid;"
														rowspan="1"
													><span>您每周可以休息5次,中间可以休息1~2次</span></td>
												</tr>
											</table>
											<table
												id="div2"
												style="margin:20px auto;height:200px;display: none;"
											>
												<tr>
													<td
														style="background-color: silver;border: 5px white solid;width: 200px;text-align: right;"
													><span
														class="i"
														style="font-weight: bolder;"
													> 平均每天推荐活动量</span></td>
													<td
														style="background-color: silver;border: 5px white solid;text-align: left;width: 500px;"
													><input
														id="a_ctype"
														type="text"
														class="form-control"
														placeholder="请输入平均每天推荐活动量"
														style="width:400px;"
													/></td>
												</tr>
												<tr>
													<td
														style="background-color: silver;border: 5px white solid;width: 200px;text-align: right;"
													><span
														class="i"
														style="font-weight: bolder;"
													> 根据感觉判断</span></td>
													<td
														style="background-color: silver;border: 5px white solid;text-align: left;width: 500px;"
													><input
														id="a_ctype"
														type="text"
														class="form-control"
														placeholder="请输入根据感觉判断"
														style="width:400px;"
													/></td>
												</tr>
												<tr>
													<td
														style="background-color: silver;border: 5px white solid;width: 200px;text-align: right;"
													><span
														class="i"
														style="font-weight: bolder;"
													> 根据心率控制</span></td>
													<td
														style="background-color: silver;border: 5px white solid;text-align: left;width: 500px;"
													><input
														id="a_ctype"
														type="text"
														class="form-control"
														placeholder="请输入根据心率控制"
														style="width:400px;"
													/></td>
												</tr>
												<tr>
													<td
														style="background-color: silver;border: 5px white solid;width: 200px;text-align: right;"
													><span
														class="i"
														style="font-weight: bolder;"
													> 推荐项目</span></td>
													<td
														style="background-color: silver;border: 5px white solid;text-align: left;width: 500px;"
													><input
														id="a_ctype"
														type="text"
														class="form-control"
														placeholder="请输入推荐项目"
														style="width:400px;"
													/></td>
												</tr>
												<tr>
													<td
														style="background-color: silver;border: 5px white solid;width: 200px;text-align: right;"
													><span
														class="i"
														style="font-weight: bolder;"
													> 运动场所</span></td>
													<td
														style="background-color: silver;border: 5px white solid;text-align: left;width: 500px;"
													><input
														id="a_ctype"
														type="text"
														class="form-control"
														placeholder="请输入运动场所"
														style="width:400px;"
													/></td>
												</tr>
												<tr>
													<td
														style="background-color: silver;border: 5px white solid;width: 200px;text-align: right;"
													><span
														class="i"
														style="font-weight: bolder;"
													> 推荐运动时间</span></td>
													<td
														style="background-color: silver;border: 5px white solid;text-align: left;width: 500px;"
													><input
														id="a_ctype"
														type="text"
														class="form-control"
														placeholder="请输入推荐运动时间"
														style="width:400px;"
													/></td>
												</tr>
												<tr>
													<td
														style="background-color: silver;border: 5px white solid;width: 200px;text-align: right;"
													><span
														class="i"
														style="font-weight: bolder;"
													> 建议</span></td>
													<td
														style="background-color: silver;border: 5px white solid;text-align: left;width: 500px;"
													><input
														id="a_ctype"
														type="text"
														class="form-control"
														placeholder="请输入建议"
														style="width:400px;"
													/></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
								<div
									class="wrapper wrapper-content animated fadeInRight"
									style="margin-top:30px;"
								>
									<div class="row">
										<div class="col-sm-12">
											<div class="ibox float-e-margins">
												<div class="ibox-title">
													<h5>最近一个月的评估报告情况</h5>
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
				</td>
			</tr>
		</table>
	</form>
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
	<script type="text/javascript">
		function e_show(name) {
			document.getElementById("i_" + name).style.display = "none";
			document.getElementById("t_" + name).style.display = "inline";
			document.getElementById("bs_" + name).style.display = "inline";
			document.getElementById("bc_" + name).style.display = "inline";
		}
		function e_noshow(name) {
			document.getElementById("i_" + name).style.display = "inline";
			document.getElementById("t_" + name).style.display = "none";
			document.getElementById("bs_" + name).style.display = "none";
			document.getElementById("bc_" + name).style.display = "none";
		}
		function s_show(name) {
			if (document.getElementById(name).style.display == "table-row") {
				document.getElementById(name).style.display = "none";
			} else {
				document.getElementById(name).style.display = "table-row";
			}
		}
		function showDiv() {
			if (document.getElementById("div1").style.display == "table") {
				document.getElementById("div1").style.display = "none";
				document.getElementById("div2").style.display = "table";
			} else {
				document.getElementById("div1").style.display = "table";
				document.getElementById("div2").style.display = "none";
			}
		}
	</script>
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
					label : "油价 (&yen;)"
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
			var t = [ [ gd(2006, 12, 31), 61.05 ], [ 11677788e5, 58.32 ],
				[ 11678652e5, 57.35 ], [ 11679516e5, 56.31 ],
				[ 11682108e5, 55.55 ], [ 11682972e5, 55.64 ],
				[ 11683836e5, 54.02 ], [ 116847e7, 51.88 ],
				[ 11685564e5, 52.99 ], [ 11688156e5, 52.99 ],
				[ 1168902e6, 51.21 ], [ 11689884e5, 52.24 ],
				[ 11690748e5, 50.48 ], [ 11691612e5, 51.99 ],
				[ 11694204e5, 51.13 ], [ 11695068e5, 55.04 ],
				[ 11695932e5, 55.37 ], [ 11696796e5, 54.23 ],
				[ 1169766e6, 55.42 ], [ 11700252e5, 54.01 ],
				[ 11701116e5, 56.97 ], [ 1170198e6, 58.14 ],
				[ 11702844e5, 58.14 ], [ 11703708e5, 59.02 ],
				[ 117063e7, 58.74 ], [ 11707164e5, 58.88 ],
				[ 11708028e5, 57.71 ], [ 11708892e5, 59.71 ],
				[ 11709756e5, 59.89 ], [ 11712348e5, 57.81 ],
				[ 11713212e5, 59.06 ], [ 11714076e5, 58 ],
				[ 1171494e6, 57.99 ], [ 11715804e5, 59.39 ],
				[ 11718396e5, 59.39 ], [ 1171926e6, 58.07 ],
				[ 11720124e5, 60.07 ], [ 11720988e5, 61.14 ],
				[ 11724444e5, 61.39 ], [ 11725308e5, 61.46 ],
				[ 11726172e5, 61.79 ], [ 11727036e5, 62 ],
				[ 117279e7, 60.07 ], [ 11731356e5, 60.69 ],
				[ 1173222e6, 61.82 ], [ 11733084e5, 60.05 ],
				[ 1173654e6, 58.91 ], [ 11737404e5, 57.93 ],
				[ 11738268e5, 58.16 ], [ 11739132e5, 57.55 ],
				[ 11739996e5, 57.11 ], [ 11742588e5, 56.59 ],
				[ 11743452e5, 59.61 ], [ 1174518e6, 61.69 ],
				[ 11746044e5, 62.28 ], [ 117486e7, 62.91 ],
				[ 11749464e5, 62.93 ], [ 11750328e5, 64.03 ],
				[ 11751192e5, 66.03 ], [ 11752056e5, 65.87 ],
				[ 11754648e5, 64.64 ], [ 11756376e5, 64.38 ],
				[ 1175724e6, 64.28 ], [ 11758104e5, 64.28 ],
				[ 11760696e5, 61.51 ], [ 1176156e6, 61.89 ],
				[ 11762424e5, 62.01 ], [ 11763288e5, 63.85 ],
				[ 11764152e5, 63.63 ], [ 11766744e5, 63.61 ],
				[ 11767608e5, 63.1 ], [ 11768472e5, 63.13 ],
				[ 11769336e5, 61.83 ], [ 117702e7, 63.38 ],
				[ 11772792e5, 64.58 ], [ 1177452e6, 65.84 ],
				[ 11775384e5, 65.06 ], [ 11776248e5, 66.46 ],
				[ 1177884e6, 64.4 ], [ 11780568e5, 63.68 ],
				[ 11781432e5, 63.19 ], [ 11782296e5, 61.93 ],
				[ 11784888e5, 61.47 ], [ 11785752e5, 61.55 ],
				[ 1178748e6, 61.81 ], [ 11788344e5, 62.37 ],
				[ 11790936e5, 62.46 ], [ 117918e7, 63.17 ],
				[ 11792664e5, 62.55 ], [ 11793528e5, 64.94 ],
				[ 11796984e5, 66.27 ], [ 11797848e5, 65.5 ],
				[ 11798712e5, 65.77 ], [ 11799576e5, 64.18 ],
				[ 1180044e6, 65.2 ], [ 11803896e5, 63.15 ],
				[ 1180476e6, 63.49 ], [ 11805624e5, 65.08 ],
				[ 1180908e6, 66.3 ] ];
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
