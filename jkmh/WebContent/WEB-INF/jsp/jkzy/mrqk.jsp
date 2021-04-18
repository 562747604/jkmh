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
<link
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/js/plugins/jedate/skin/jedate.css"
	rel="stylesheet"
>
<style>
.a {
	height: 40px;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: pointer;
	background-color: #bef2ff;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}

.nav-tabs>li>a {
	color: #555;
	cursor: pointer;
	background-color: #c9c9c9;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}

table {
	display: table;
	border-collapse: separate;
}

.panel-heading {
	padding: 0px 15px;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd
}

.clearfix:after, .container:after, .tab-nav:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

/* ==========
	   Setup Page */
*, *:before, *:after {
	box-sizing: border-box;
}

body {
	font-family: 'Quicksand', sans-serif;
}

/* =================
	   Container Styling */
.container {
	position: relative;
	background: white;
	padding: 3em;
}

/* ===========
	   Tab Styling */
.tab-group {
	position: relative;
	border: 1px solid #eee;
	margin-top: 1em;
	border-radius: 0 0 10px 10px;
}

.tab-group section {
	opacity: 0;
	height: 0;
	padding: 0 1em;
	overflow: hidden;
	transition: opacity 0.4s ease, height 0.4s ease;
}

.tab-group section.active {
	opacity: 1;
	height: auto;
	overflow: visible;
}

.tab-nav {
	list-style: none;
	margin: -2.5em -1px 0 0;
	padding: 0;
	height: 2.5em;
	overflow: hidden;
}

.tab-nav li {
	display: inline;
}

.tab-nav li a {
	top: 1px;
	position: relative;
	display: block;
	float: left;
	border-radius: 10px 10px 0 0;
	background: #eee;
	line-height: 2em;
	padding: 0 0em;
	text-decoration: none;
	color: grey;
	margin-top: .1em;
	margin-right: 1px;
	transition: background .2s ease, line-height .2s ease, margin .2s ease;
}

.tab-nav li.active a {
	background: #6EB590;
	color: white;
	line-height: 2.5em;
	margin-top: 0;
}

.Bar, .Bars {
	position: relative;
	width: 100%;
	/* 宽度 */
	border: 1px solid #B1D632;
	padding: 1px;
}

.Bar div, .Bars div {
	display: block;
	color: #333333;
	height: 20px; /* 高度 */
	line-height: 20px; : 20 px; /* 高度 */
	color: #333333;
	height: 20px; /* 高度 */
	line-height: 20px;
	/* 必须和高度一致，文本才能垂直居中 */
}

.Bar div span, .Bars div span {
	position: absolute;
	/* 宽度 */
	text-align: right;
}
</style>
</head>
<body
	onload="load()"
	style="background-color:#bef2ff!important;"
>
	<form action="">
		<table style="width:100%;text-align:center;">
			<tr>
				<td
					colspan="5"
					style="border-top:none;border-bottom:none; vertical-align:top;"
				>
					<table style="width:100%;margin-left:auto;margin-right:auto;">
						<tr style="height:25px;line-height:25px;">
							<td
								style="width:350px;line-height:25px;text-align:left;vertical-align:top;"
							>
								<table
									style="width:100%;background-color:white;margin-right:10px;"
								>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;border:1px silver solid;height:25px;line-height: 25px;border-bottom:none;"
										><span
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										>日期</span></td>
									</tr>
									<tr>
										<td style="border:1px silver solid;height:350px;">
											<div class="form-group">
												<div
													class="input-group date form_datetime col-md-2"
													style="margin: 0px auto;"
												>
													<input
														id="rq"
														name="dataCon"
														class="datainp datep jedate4292"
														style="display:none;"
														type="text"
														placeholder=""
														<%if (request.getAttribute("date") != null) {%>
														value="<%=request.getAttribute("date")%>"
														<%}%>
														readonly=""
													>
													<div
														id="discls"
														style="float:left;margin-right:5px;"
													></div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;border:none;background-color: #bef2ff;"
										>&nbsp;</td>
									</tr>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;border:1px silver solid;height:25px;line-height: 25px;border-bottom:none;"
										><span
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										>每日数据分析</span></td>
									</tr>
									<!-- 												<tr> -->
									<!-- 													<td style="border:1px silver solid;border-bottom:none;"><table -->
									<!-- 															style="border:1px silver solid;width:80%;margin: 10px auto;text-align: center; " -->
									<!-- 														> -->
									<!-- 															<tr> -->
									<!-- 																<td -->
									<!-- 																	style="width: 60px;border:1px silver solid;border-right: none;border-bottom:none;" -->
									<!-- 																>名称</td> -->
									<!-- 																<td style="border:1px silver solid;border-bottom:none;">目标</td> -->
									<!-- 															</tr> -->
									<!-- 															<tr> -->
									<!-- 																<td style="border:1px silver solid;border-bottom:none;">饮食</td> -->
									<!-- 																<td -->
									<!-- 																	style="border:1px silver solid;border-left:none;border-bottom:none;" -->
									<!-- 																><a -->
									<!-- 																	href="#.html" -->
									<!-- 																	onclick="change()" -->
									<!-- 																>查看</a></td> -->
									<!-- 															</tr> -->
									<!-- 															<tr> -->
									<!-- 																<td style="border:1px silver solid;border-bottom:none;">运动</td> -->
									<!-- 																<td -->
									<!-- 																	style="border:1px silver solid;border-left:none;border-bottom:none;" -->
									<!-- 																><a -->
									<!-- 																	href="#.html" -->
									<!-- 																	onclick="change1()" -->
									<!-- 																>查看</a></td> -->
									<!-- 															</tr> -->
									<!-- 															<tr> -->
									<!-- 																<td style="border:1px silver solid;">睡眠</td> -->
									<!-- 																<td style="border:1px silver solid;border-left:none;"><a -->
									<!-- 																	href="#.html" -->
									<!-- 																	onclick="change2()" -->
									<!-- 																>查看</a></td> -->
									<!-- 															</tr> -->
									<!-- 														</table></td> -->
									<!-- 												</tr> -->
									<tr>
										<td style="border-top:none;border:1px silver solid;"><c:forEach
												var="MrData"
												items="${mrData}"
												varStatus="status"
											>
												<table
													style="width:80%;margin: 10px auto;text-align: left; "
												>
													<tr>
														<td><a
															href="#.html"
															onclick="change('${MrData.planId}','${MrData.name}','${MrData.unit}','${MrData.plan}')"
														>${MrData.name}</a><span style="margin-left:10px;">建议:${MrData.plan}${MrData.unit}</span>
														</td>
													</tr>
													<tr>
														<td><span style="color:red;">${MrData.warn}</span></td>
													</tr>
													<tr>
														<td>
															<div class="cent">
																<div
																	class="Bar"
																	style="border-style:none;background-color: #f1f1f1;"
																>
																	<div
																		style="width: ${MrData.bl};border-style:none;background-image: url(${ctx }/images/bar.jpg);"
																	>
																		<span style="">${MrData.reality}${MrData.unit}</span>
																	</div>
																</div>
															</div>
														</td>
													</tr>
												</table>
											</c:forEach></td>
									</tr>
								</table>
							</td>
							<td style="line-height:25px;text-align:left;vertical-align:top;">
								<table
									style="width:95%;background-color:white; margin-left:10px;"
								>
									<tr>
										<td colspan="2"
											style="font-size:20px;font-weight:bolder;border:1px silver solid;height:25px;line-height: 25px;border-bottom:none;"
										><span
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										>快速回复</span></td>
									</tr>
									<tr>
										<td colspan="2"
											style="border:1px silver solid;height:300px;border-bottom: none;text-align: center;"
										>
											<div
												class="form-group"
												style="margin: 20px auto 0px auto;"
											>
												<!-- 												<input -->
												<!-- 													id="hfxx" -->
												<!-- 													class="form-control" -->
												<!-- 													type="text" -->
												<!-- 													style="margin-left:10px;width:90%;" -->
												<!-- 													placeholder="请输入回复信息" -->
												<!-- 												/> -->
												<textarea
													rows="10"
													cols=""
													id="hfxx"
													class="form-control"
													style="width:94%;font-size:13px; height:260px;line-height: 25px;" onkeyup="zsxz()"
												></textarea>
											</div>
										</td>
									</tr>
									<tr>
									<td
											style="border:1px silver solid;height:50px;border-top:none;text-align: left;border-right:none;width:50%;"
										><lable id="lab"  style="margin-left:6%;">当前输入 0/200 字</lable><lable id="lab1"  style="color:red;"></lable></td>
										<td
											style="border:1px silver solid;height:50px;border-top:none;text-align: right;border-left:none;width:50%;"
										><input
											type="button"
											value="发送"
											style="margin-right:6%;"
											class="btn btn-outline btn-default"
											onclick="doFs()"
										/></td>
									</tr>
								</table>
								<table
									id="ys"
									style="width:95%;border:1px silver solid;background-color:white; margin-left:10px;margin-top:25px;"
								>
									<tr>
										<td
											colspan="2"
											style="font-size:20px;font-weight:bolder;border-bottom:1px silver solid;"
										><span
											id="titlestr"
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										><%=request.getAttribute("titleString") == null ? "无数据" : request.getAttribute("titleString")%></span></td>
									</tr>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;text-align: left;padding-left: 20px;"
										><c:forEach
												var="zyzbData"
												items="${zyzbData}"
												varStatus="status"
											>
												<input
													type="button"
													value='${zyzbData.name}'
													class="form-control"
													style="height:36px;width:80px;margin-right: 5px;margin-top:20px;"
													onclick="change2('${zyzbData.id}','${zyzbData.name}')"
												/>
											</c:forEach></td>
										<td style="text-align: right;"><select
											style="color:#999999;margin-top:20px;margin-right: 20px;"
											class="form-control"
											id="ts"
											onchange="change1()"
										>
												<option
													style="color:#999999!important;"
													value="7"
													selected="selected"
												>7天</option>
												<option
													style="color:#999999!important;"
													value="10"
												>10天</option>
												<option
													style="color:#999999!important;"
													value="30"
												>30天</option>
												<option
													style="color:#999999!important;"
													value="50"
												>50天</option>
												<option
													style="color:#999999!important;"
													value="100"
												>100天</option>
												<option
													style="color:#999999!important;"
													value="300"
												>300天</option>
										</select></td>
									</tr>
									<tr>
										<td colspan="2">
											<div
												class="wrapper wrapper-content animated fadeInRight"
												style="margin-top:0px;"
											>
												<div
													class="row"
													style="width:100%;"
												>
													<div class="col-sm-12">
														<div class="ibox float-e-margins">
															<!-- 															<div class="ibox-title"> -->
															<!-- 																<h5>最近一个月的情况</h5> -->
															<!-- 															</div> -->
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
									<tr>
										<td
											colspan="2"
											style="border-top:1px silver solid;"
										></td>
									</tr>
								</table>
								<table
									id="yd"
									style="width:95%;border:1px silver solid;background-color:white; margin-left:10px;display: none;margin-top:25px;"
								>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;border-bottom:1px silver solid;"
										><span
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										>运动</span></td>
									</tr>
									<tr>
										<td>
											<div
												class="wrapper wrapper-content animated fadeInRight"
												style="margin-top:30px;"
											>
												<div
													class="row"
													style="width:100%;"
												>
													<div class="col-sm-12">
														<div class="ibox float-e-margins">
															<div class="ibox-title">
																<h5>最近一个月的运动情况</h5>
															</div>
															<div class="ibox-content">
																<div class="flot-chart">
																	<div
																		class="flot-chart-content"
																		id="flot-line-chart-multi1"
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
								<table
									id="sm"
									style="width:95%;border:1px silver solid;background-color:white; margin-left:10px;display: none;margin-top:25px;"
								>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;border-bottom:1px silver solid;"
										><span
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										>睡眠</span></td>
									</tr>
									<tr>
										<td>
											<div
												class="wrapper wrapper-content animated fadeInRight"
												style="margin-top:30px;"
											>
												<div
													class="row"
													style="width:100%;"
												>
													<div class="col-sm-12">
														<div class="ibox float-e-margins">
															<div class="ibox-title">
																<h5>最近一个月的睡眠情况</h5>
															</div>
															<div class="ibox-content">
																<div class="flot-chart">
																	<div
																		class="flot-chart-content"
																		id="flot-line-chart-multi2"
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
				</td>
			</tr>
		</table>
		<!--添加弹窗开始 -->
		<div
			class="modal fade"
			id="addModel"
			tabindex="-1"
			role="dialog"
			aria-labelledby="myModalLabel"
		>
			<div
				class="modal-dialog"
				role="document"
			>
				<div
					class="modal-content"
					style="background-color:#f3f3f4;"
				>
					<div class="modal-header">
						<button
							type="button"
							class="close"
							data-dismiss="modal"
							aria-label="Close"
						>
							<span aria-hidden="true">×</span>
						</button>
						<span
							class="glyphicon glyphicon-align-center"
							style="color: Silver;
                        font-size: 25px;"
						>添加</span>
					</div>
					<div class="modal-body">
						<table style="width:100%;">
							<tr>
								<td style="width:40%;">
									<table style="width:95%;height:400px;">
										<tr>
											<td style="border:1px silver solid;height:30px;">理想指标</td>
										</tr>
										<tr>
											<td
												style="border:1px silver solid; vertical-align: top;padding-top: 10px;"
											>理想体重: <input
												id="a_tz"
												type="text"
												class="form-control"
												placeholder="请输入理想体重"
												style="width:130px;"
											/>
											</td>
										</tr>
									</table>
								</td>
								<td style="width:60%;border:1px silver solid;">
									<table style="width:100%;height:400px;">
										<tr>
											<td style="border-bottom:1px silver solid;height:30px;">计划</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>体重增加/减: <input
												id="a_zj"
												type="text"
												class="form-control"
												placeholder="请输入增/减体重"
												style="width:130px;"
											/>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 25px;height:30px;"
											>周期: <input
												id="a_zq"
												type="text"
												class="form-control"
												placeholder="请输入周期"
												style="width:120px;"
											/>周
											</td>
										</tr>
										<tr>
											<td
												style="vertical-align: top;padding: 10px 0px;height:30px;"
											>开始时间: <input
												id="a_kssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>结束时间: <input
												id="a_jssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-default"
							data-dismiss="modal"
						>
							<span
								class="glyphicon glyphicon-remove"
								aria-hidden="true"
							></span>关闭
						</button>
						<button
							type="button"
							class="btn btn-primary"
							onclick="doAdd()"
						>
							<span
								class="glyphicon glyphicon-floppy-disk"
								aria-hidden="true"
							></span>保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--添加弹窗结束 -->
		<!--修改弹窗开始 -->
		<div
			class="modal fade"
			id="editModel"
			tabindex="-1"
			role="dialog"
			aria-labelledby="myModalLabel"
		>
			<div
				class="modal-dialog"
				role="document"
			>
				<div
					class="modal-content"
					style="background-color:#f3f3f4;"
				>
					<div class="modal-header">
						<button
							type="button"
							class="close"
							data-dismiss="modal"
							aria-label="Close"
						>
							<span aria-hidden="true">×</span>
						</button>
						<span
							class="glyphicon glyphicon-align-center"
							style="color: Silver;
                        font-size: 25px;"
						>修改</span>
					</div>
					<div class="modal-body">
						<table style="width:100%;">
							<tr>
								<td style="width:40%;">
									<table style="width:95%;height:400px;">
										<tr>
											<td style="border:1px silver solid;height:30px;">理想指标</td>
										</tr>
										<tr>
											<td
												style="border:1px silver solid; vertical-align: top;padding-top: 10px;"
											>理想体重: <input
												id="e_tz"
												type="text"
												class="form-control"
												placeholder="请输入理想体重"
												style="width:130px;"
											/>
											</td>
										</tr>
									</table>
								</td>
								<td style="width:60%;border:1px silver solid;">
									<table style="width:100%;height:400px;">
										<tr>
											<td style="border-bottom:1px silver solid;height:30px;">计划</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>体重增加/减: <input
												id="e_zj"
												type="text"
												class="form-control"
												placeholder="请输入增/减体重"
												style="width:130px;"
											/>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 25px;height:30px;"
											>周期: <input
												id="e_zq"
												type="text"
												class="form-control"
												placeholder="请输入周期"
												style="width:120px;"
											/>周
											</td>
										</tr>
										<tr>
											<td
												style="vertical-align: top;padding: 10px 0px;height:30px;"
											>开始时间: <input
												id="e_kssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>结束时间: <input
												id="e_jssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-default"
							data-dismiss="modal"
						>
							<span
								class="glyphicon glyphicon-remove"
								aria-hidden="true"
							></span>关闭
						</button>
						<button
							type="button"
							class="btn btn-primary"
							onclick="doEdit()"
						>
							<span
								class="glyphicon glyphicon-floppy-disk"
								aria-hidden="true"
							></span>保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--修改弹窗结束 -->
		<input
			type="hidden"
			id="pid"
			value="<%=request.getAttribute("plantid")%>"
		> <input
			type="hidden"
			id="title"
			value="<%=request.getAttribute("title")%>"
		> <input
			type="hidden"
			id="plan"
			value="<%=request.getAttribute("plan")%>"
		> <input
			type="hidden"
			id="type"
			value="<%=request.getAttribute("type")%>"
		>
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/js/bootstrap-datetimepicker.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/jquery-tab.js"
		charset="utf8"
	></script>
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
		src="${ctx}/jiankang/js/plugins/jedate/jquery.jedate.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script type="text/javascript">
	var dw="";
	$("#rq").jeDate({
		 
		format:"YYYY-MM-DD",
		isinitVal:true,
		isClear:false,
		isDisplay:false,
	    fixedCell:"discls",
		isok:false,
	    minDate:"<%=request.getAttribute("ksrq")%>",
	    maxDate:"<%=request.getAttribute("dqrq")%>",
		festival: false, //显示节日
		 okfun:function(elem, val, date) {
			 his();
		 },
		 choosefun:function(val) {
			 his();
		 }
	});
	 
	function load()
	{ 
		 
		
	}
		function add() { //新增按钮方法
			$('#addModel').modal();
		}

		function edit(id) { //新增按钮方法
			showinput(id);
			showbut(id);
		}
		function save(id) {
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/jkzj/updatePromotionGoal",
				data : {
					id : id,
					value : $('#b1' + id).val()
				},
				success : function(data) {
					noRight("保存成功!");
					document.getElementById("b" + id).innerHTML = $('#b1' + id).val();
					resetsz(id);
				},
				error : function(data) {
					noRight("保存失败!");
				}
			});
		}
		function wc() {
			$.ajax({
				cache : false,
				type : "get",
				dataType : "Json",
				url : "${ctx}/jkzj/updateJkzjzt",
				data : {
					id : "${rotate.id}",
					time : Math.random()
				},
				success : function(data) {
					right("评估成功!");
					parent.gb();
				},
				error : function(data) {
					right("评估失败!");
				}
			});
		}
	
		function fc() {
			$.ajax({
				cache : false,
				type : "get",
				dataType : "Json",
				url : "${ctx}/jkzj/addFc",
				data : {
					id : "${rotate.id}",
					time : Math.random()
				},
				success : function(data) {
					var t = eval(data);
					right(data.msg);
				},
				error : function(data) {
					var t = eval(data);
					right(data.msg);
				}
			});
		}
		function gd(year, month, day) {
			return new Date(year, month - 1, day + 1).getTime();
		}
		$(function() {
			function e(e, o) {
				return "&yen;" + e.toFixed(o.tickDecimals)
			}
			function o(o) {
				$.plot($("#flot-line-chart-multi"), [ {
					//data : ([[ 1500768000000, 632.20 ],[ 1500854400000, 90.64 ],[ 1500940800000, 62.85 ],[ 1501027200000, 0 ]],[[ 1500768000000, 10 ],[ 1500854400000, 10],[ 1500940800000, 10 ],[ 1501027200000, 0] ]),
				data:t,
					label : "单位:"+'<%=request.getAttribute("dw") == null ? "" : request.getAttribute("dw")%>'
				},{
					data : t1,
					type:'dotted',
					label : '<%=request.getAttribute("lable1") == null ? "" : request.getAttribute("lable1")%>'
				},{
					data : t2,
					type:'dotted',
					label : '<%=request.getAttribute("lable2") == null ? "" : request.getAttribute("lable2")%>'
				}  ], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
				{
					xaxes : [ {
						mode : "time",
							ticks:<%=request.getAttribute("size")%>
					} ],
					yaxes : [ {
						min : 0,
						tickDecimals:2
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
			function o1(o) {
				$.plot($("#flot-line-chart-multi1"), [ {
					data : t,
					label : "运动量:"
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
			function o2(o) {
				$.plot($("#flot-line-chart-multi2"), [ {
					data : t,
					label : "睡眠时间:"
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
			var t1 = <%=request.getAttribute("qst1")%>;
			var t2 = <%=request.getAttribute("qst2")%>;
			o("right"), $("button").click(function() {
				o($(this).text())
			})
			o1("right"), $("button").click(function() {
				o1($(this).text())
			})
			o2("right"), $("button").click(function() {
				o2($(this).text())
			})
			$('.tab-group').tabify();
			t.setOption(n), window.onresize = t.resize;
		});

		$(".dial").knob();
		var options = {  
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
		    };  
		function change(planId,planname,unit,plan){
			var id='<%=request.getAttribute("id")%>';
			var days=document.getElementById("ts").value;
			document.getElementById("pid").value=planId;
			document.getElementById("title").value=planname;
			document.getElementById("plan").value=plan;
			document.getElementById("type").value="1";
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/jkzy/getHisData",
				data : {
					id:id,
					planId : planId,
					days:days,
					plan:plan,
					unit:unit,
					type:"1",
					time : Math.random()
				},
				success : function(data) {
					dw=unit;
					 document.getElementById("titlestr").innerHTML=planname+"情况("+days+"天)";
					  var t=JSON.parse(data.msg);
					  var t1=JSON.parse(data.m1);
					  var t2=JSON.parse(data.m2);
					  //  var dataset = [{data:t}];
					    if (t2=="")
						{
						$.plot($("#flot-line-chart-multi"), [ {
						data : t,
						label : "单位:"+dw
					},{
						data : t1,
						type:'dotted',
						label : (data.lable1 == "" ? "" : data.lable1)
					}], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
					{
						xaxes : [ {
							mode : "time",
							ticks:data.size
						} ],
						yaxes : [ {
							min : 0,
							tickDecimals:2
						}  ],
						legend : {
							position : "sw",
							noColums:2
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
					});
						}
						else
						{
						$.plot($("#flot-line-chart-multi"), [ {
						data : t,
						label : "单位:"+dw
					},{
						data : t1,
						type:'dotted',
						label :  (data.lable1 == "" ? "" : data.lable1)
					},{
						data : t2,
						type:'dotted',
						label :  (data.lable2 == "" ? "" : data.lable2)
					} ], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
					{
						xaxes : [ {
							mode : "time",
							ticks:data.size
						} ],
						yaxes : [ {
							min : 0,
							tickDecimals:2
						}  ],
						legend : {
							position : "sw",
							noColums:2
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
					});	
						}
					 //t.setOption(options), window.onresize = t.resize;
				}
			});			
		}
		function change2(planId,planname){
			var id='<%=request.getAttribute("id")%>';
			var days=document.getElementById("ts").value;
			document.getElementById("pid").value=planId;
			document.getElementById("title").value=planname;
			document.getElementById("type").value="2";
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/jkzy/getHisData",
				data : {
					id:id,
					planId : planId,
					days:days,
					plan:"",
					type:"2",
					unit:"",
					time : Math.random()
				},
				success : function(data) {
					dw=data.dw;
					 document.getElementById("titlestr").innerHTML=planname+"情况("+days+"天)";
					  var t=JSON.parse(data.msg);
					  var t1=JSON.parse(data.m1);
					    
						$.plot($("#flot-line-chart-multi"), [ {
						data : t,
						label : (data.lable1 == "" ? "" : data.lable1+'('+dw+')')
					},{
						data : t1,
						type:'dotted',
						label : (data.lable2 == "" ? "" : data.lable2+'('+dw+')')
					}], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
					{
						xaxes : [ {
							mode : "time",
							ticks:data.size
						} ],
						yaxes : [ {
							min : 0,
							tickDecimals:2
						}  ],
						legend : {
							position : "sw",
							noColums:2
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
					});
				}
			});			
		}
		function change1(){
			var id='<%=request.getAttribute("id")%>';
			var unit ='<%=request.getAttribute("dw")%>';
			var days=document.getElementById("ts").value;
			var planId=document.getElementById("pid").value;
			var plan=document.getElementById("plan").value;
			var title=document.getElementById("title").value;
			var type=document.getElementById("type").value;
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/jkzy/getHisData",
				data : {
					id:id,
					planId : planId,
					days:days,
					plan:plan,
					type:type,
					unit:unit,
					time : Math.random()
				},
				success : function(data) {
					 document.getElementById("titlestr").innerHTML=title+"情况("+days+"天)";
					  var t=JSON.parse(data.msg);
					  var t1=JSON.parse(data.m1);
					  var t2="";
					  if(data.m2!=""){
						  t2=JSON.parse(data.m2);
					  }
					  //  var dataset = [{data:t}];
					    if (t2=="")
						{
						$.plot($("#flot-line-chart-multi"), [ {
						data : t,
						label : (type== "1" ? "单位:"+dw  : (data.lable1 == "" ? "" : data.lable1+'('+dw+')'))
					},{
						data : t1,
						type:'dotted',
						label : (type== "1" ? data.lable1  : (data.lable2 == "" ? "" : data.lable2+'('+dw+')'))
					}], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
					{
						xaxes : [ {
							mode : "time",
							ticks:data.size
						} ],
						yaxes : [ {
							min : 0,
							tickDecimals:2
						}  ],
						legend : {
							position : "sw",
							noColums:2
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
					});
						}
						else
						{
						$.plot($("#flot-line-chart-multi"), [ {
						data : t,
						label : (type== "1" ? "单位:"+dw  : (data.lable1 == "" ? "" : data.lable1+'('+dw+')'))
					},{
						data : t1,
						type:'dotted',
						label : (type== "1" ?  (data.lable1 == "" ? "" : data.lable1)  : (data.lable1 == "" ? "" : data.lable1+'('+dw+')'))
					},{
						data : t2,
						type:'dotted',
						label : (type== "1" ?  (data.lable2 == "" ? "" : data.lable2)  : (data.lable2 == "" ? "" : data.lable2+'('+dw+')'))
					} ], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
					{
						xaxes : [ {
							mode : "time",
							ticks:data.size
						} ],
						yaxes : [ {
							min : 0,
							tickDecimals:2
						}  ],
						legend : {
							position : "sw",
							noColums:2
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
					});	
						}
					 //t.setOption(options), window.onresize = t.resize;
				}
			});		
		}
// 	function change(){
// 		document.getElementById("ys").style.display="table";
// 		document.getElementById("yd").style.display="none";
// 		document.getElementById("sm").style.display="none";
// 	}
// 	function change1(){
// 		document.getElementById("ys").style.display="none";
// 		document.getElementById("yd").style.display="table";
// 		document.getElementById("sm").style.display="none";
// 	}
// 	function change2(){
// 		document.getElementById("ys").style.display="none";
// 		document.getElementById("yd").style.display="none";
// 		document.getElementById("sm").style.display="table";
// 	}

	function his(){
		var id='<%=request.getAttribute("id")%>';
		location.href="${ctx}/jkzy/mrqk?id="+id+"&date="+document.getElementById("rq").value;
	}
	function doFs(){
		var id='<%=request.getAttribute("id")%>';
		var nr=document.getElementById("hfxx").value;
		if(nr.length>200){
			noRight("发送字数超出限制,请减少发送内容字数!");
		}else{
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "${ctx}/jkzy/insertXxfs1",
            data: {
            	jid:id,
                mc:"",
                nr:document.getElementById("hfxx").value,
                lx:"APP",
                time: Math.random()
            },
            success: function (data)
            {
            	noRight("发送成功!");
            	document.getElementById("hfxx").value="";
            	document.getElementById("lab").innerHTML="当前输入 0/200 字"
            	document.getElementById("lab1").innerHTML="";
            },
            error:function(data){
            	noRight("发送失败!");
            }
        });
		}
	}
	function zsxz(){
		var nr=document.getElementById("hfxx").value;
		if(nr.length<=200){
			document.getElementById("lab").innerHTML="当前输入 "+nr.length+"/200 字";
			document.getElementById("lab1").innerHTML="";
		}else{
			document.getElementById("lab").innerHTML="";
			document.getElementById("lab1").innerHTML="当前输入 "+nr.length+"/200 字,超出字数限制,无法发送";
		}	
	}
	</script>
	<script src="${ctx}/jiankang/js/plugins/echarts/echarts-all.js"></script>
</body>
</html>
