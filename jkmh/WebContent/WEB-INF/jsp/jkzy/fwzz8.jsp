<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
.a {height:40px;
 }
 .nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: pointer;
	background-color: #bef2ff;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}
.nav-tabs>li>a
	{
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
</style>
</head>
<%
String id=(String)request.getAttribute("id");
String upid=(String)request.getAttribute("upid");
String nextid=(String)request.getAttribute("nextid");
String[] info=(String[])request.getAttribute("info");
%>
<body onload="load()" background-color="#27bcc2">
	<form action="">
		<table
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;height:800px; "
		>
			<tr>
				<td style="text-align:center;height:50px;line-height:50px; vertical-align:middle;width:200px;background-color:#27bac1;" >
					 
				</td>
				<td style="text-align:left;line-height:50px; vertical-align:middle;background-color:#27bac1;">
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
					onclick="wc()"
				/>
				</td>
			</tr>
			<tr>
				<td
					style="text-align:center; vertical-align:top;
						border-right:15px #27bac1 solid;border-left:20px #27bac1 solid;border-bottom:15px #27bac1 solid;"
				>
					<table style="width:200px;text-align:center;">
						<tr>
						 <td colspan="2"
					style="text-align:center;height:30px;line-height:30px; vertical-align:middle;width:200px;
						 "
			                           	>
					     <h2>基本信息</h2>
				       </td>
					   </tr>
						<tr>
							<td
								colspan="2"
								style="text-align:center;height:30px;line-height:30px; vertical-align:middle;"
							><a href="${ctx}/jkzy/fwzz8?id=<%=upid%>"><img
									src="${ctx}/images/jkpgyw/u756.png"
									style="height:30px;"
								></a> <img
								src="${ctx}/images/jkpgyw/u718.jpg"
								style="height:100px;"
							> <a href="${ctx}/jkzy/fwzz8?id=<%=nextid%>"><img
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
							><span><%=info[0] %></span></td>
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
							><span><%=info[1] %></span></td>
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
							><span><%=info[2] %></span></td>
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
							><span><%=info[3] %></span></td>
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
							><span><%=info[4] %></span></td>
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
							><span><%=info[5] %></span></td>
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
							><span><%=info[6] %></span></td>
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
				<td style="text-align:left;line-height:30px; vertical-align:top;background-color:#bef2ff;border-right:20px #27bac1 solid;border-bottom:15px #27bac1 solid;" > 
				<table style="width:100%;text-align:center;height:40px;background-color:#27bac1;">
						<tr style="height:40px;line-height:40px;">
							<td style="line-height:40px;height:40px;">
				       <div class="panel blank-panel" style="background-color:#27bac1;height:40px!important;line-height:40px;" >
                                    <div class="panel-heading" style="height:40px!important;">
                                        <div class="panel-options" style="height:40px!important;">
                                            <ul class="nav nav-tabs"style="height:40px!important;"  >
						<li  style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz1?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">评估报告</h2></a>
                        </li>
												<li style="height:40px!important;"><a
													href="${ctx}/jkzy/fwzz10?id=<%=request.getAttribute("id") %>"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">促进目标</h2>
												</a></li>
					    <li class="active" style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz8?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">方案指导</h2></a>
                        </li> 
						<li  style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz9?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">每日情况</h2></a>
                        </li> 	 
						<li  style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz5?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">设备上传</h2></a>
                        </li> 		 
						 <li  style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz6?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">回访追踪</h2></a>
                        </li> 	
							 
						 </ul>
                                        </div>
                                    </div>
						</div>
							  
							  </td>
						</tr>
						</table>
					<table style="width:100%;text-align:center;">
						<tr>
							<td
								colspan="6"
								style="border:1px silver solid;border-top:none;border-bottom:none; vertical-align:top;text-align: center;"
							>
								<table style="width:90%; margin: 20px auto;">
									<tr>
										<td style="width:200px;vertical-align: top;">
											<table
												style="width:90%;height:400px;background-color: white;"
											>
												<tr>
													<td
														style="border:1px silver solid;height:30px;text-align: left;"
													>理想指标</td>
												</tr>
												<tr>
													<td
														style="border:1px silver solid; vertical-align: top;padding-top: 10px;"
													><input
														type="button"
														value="饮食方案"
														class="form-control"
														style="height:30px;width:100px;margin-top:20px;" onclick="change('ysDiv')"
													/></br> <input
														type="button"
														value="运动方案"
														class="form-control"
														style="height:30px;width:100px;margin-top:20px;" onclick="change('ydDiv')"
													/></br> <input
														type="button"
														value="睡眠方案"
														class="form-control"
														style="height:30px;width:100px;margin-top:20px;" onclick="change('smDiv')"
													/></br></td>
												</tr>
											</table>
										</td>
										<td style=" vertical-align: top;">
											<table
												style="width:97%;margin:0px auto;display: table;"
												id="ysDiv"
											>
												<tr>
													<td
														style="text-align: center;border: none;vertical-align: top;background-color: white;"
													>
														<div
															class="col-sm-6"
															style="margin: 0px auto;width:100%;"
														>
															<div class="ibox float-e-margins">
																<div class="ibox-title">
																	<h5>营养摄入参考</h5>
																</div>
																<div class="ibox-content">
																	<div
																		class="echarts"
																		id="echarts-pie-chart"
																	></div>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td style="height:20px;">&nbsp;</td>
												</tr>
												<tr>
													<td
														style="text-align: left;border-right: none;height:400px;vertical-align: top;background-color: white;"
													>
														<div
															class="tab-group"
															style="margin-top: 30px;overflow-x: none;"
														>
															<section
																id="tab1"
																title="&nbsp;&nbsp;早餐&nbsp;&nbsp;"
															>
																<table
																	style="text-align: center;width:80%;margin: 20px auto;"
																>
																	<tr>
																		<td
																			colspan="3"
																			style="border:1px silver solid;text-align: right;"
																		></td>
																	</tr>
																	<tr>
																		<td
																			colspan="2"
																			style="border:1px silver solid;text-align: left;border-right:none;"
																		>菜谱</td>
																		<td
																			style="width:100px;text-align: center;border:1px silver solid;border-left:none;"
																		><a
																			href="#.html"
																			onclick="add()"
																		>增加</a></td>
																	</tr>
																	<tr>
																		<td
																			style="text-align: center;border:1px silver solid;"
																		>推荐食物</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>摄入热量</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>比例</td>
																	</tr>
																	<tr>
																		<td
																			style="text-align: center;border:1px silver solid;"
																		>${data.dietSolution.diet.breakfast.food }</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>${data.dietSolution.diet.breakfast.cal }</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>${data.dietSolution.diet.breakfast.ratio }</td>
																	</tr>
																</table>
															</section>
															<section
																id="tab2"
																title="&nbsp;&nbsp;中餐&nbsp;&nbsp;"
															>
																<table
																	style="text-align: center;width:80%;margin: 20px auto;"
																>
																	<tr>
																		<td
																			colspan="3"
																			style="border:1px silver solid;text-align: right;"
																		></td>
																	</tr>
																	<tr>
																		<td
																			colspan="2"
																			style="border:1px silver solid;text-align: left;border-right:none;"
																		>菜谱</td>
																		<td
																			style="width:100px;text-align: center;border:1px silver solid;border-left:none;"
																		><a
																			href="#.html"
																			onclick="add()"
																		>增加</a></td>
																	</tr>

																	<tr>
																		<td
																			style="text-align: center;border:1px silver solid;"
																		>推荐食物</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>摄入热量</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>比例</td>
																	</tr>
																	<tr>
																		<td
																			style="text-align: center;border:1px silver solid;"
																		>${data.dietSolution.diet.lunch.food }</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>${data.dietSolution.diet.lunch.cal }</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>${data.dietSolution.diet.lunch.ratio }</td>
																	</tr>





																</table>
															</section>
															<section
																id="tab3"
																title="&nbsp;&nbsp;晚餐&nbsp;&nbsp;"
															>
																<table
																	style="text-align: center;width:80%;margin: 20px auto;"
																>
																	<tr>
																		<td
																			colspan="3"
																			style="border:1px silver solid;text-align: right;"
																		></td>
																	</tr>
																	<tr>
																		<td
																			colspan="2"
																			style="border:1px silver solid;text-align: left;border-right:none;"
																		>菜谱</td>
																		<td
																			style="width:100px;text-align: center;border:1px silver solid;border-left:none;"
																		><a
																			href="#.html"
																			onclick="add()"
																		>增加</a></td>
																	</tr>
																	<tr>
																		<td
																			style="text-align: center;border:1px silver solid;"
																		>推荐食物</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>摄入热量</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>比例</td>
																	</tr>
																	<tr>
																		<td
																			style="text-align: center;border:1px silver solid;"
																		>${data.dietSolution.diet.dinner.food }</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>${data.dietSolution.diet.dinner.cal }</td>
																		<td
																			style="text-align: center;border:1px silver solid;border-left:none;"
																		>${data.dietSolution.diet.dinner.ratio }</td>
																	</tr>
																</table>
															</section>
														</div>
													</td>
												</tr>
											</table>
											<table
												style="width:97%;margin:0px auto;display: none;height:400px;"
												id="ydDiv"
											>
												<tr>
													<td
														style="text-align: center;border: none;vertical-align: top;background-color: white;"
													>
														<table
															style="text-align: center;width:80%;margin: 20px auto;"
														>
															<tr>
																<td
																	colspan="3"
																	style="border:1px silver solid;text-align: right;"
																>建议消耗能量：${data.sportSolution.reduced }kcal</td>
															</tr>
															<tr>
																<td
																	colspan="2"
																	style="border:1px silver solid;text-align: left;border-right:none;"
																>运动</td>
																<td
																	style="width:100px;text-align: center;border:1px silver solid;border-left:none;"
																><a
																	href="#.html"
																	onclick="add1()"
																></a></td>
															</tr>
															<tr>
																<td style="text-align: center;border:1px silver solid;">名称</td>
																<td
																	style="text-align: center;border:1px silver solid;border-left:none;"
																>推荐运动</td>
																<td
																	style="text-align: center;border:1px silver solid;border-left:none;"
																></td>
															</tr>
															
<c:forEach var="item" items="${data.sportSolution.list}" varStatus="status"> 
															
							<tr>
								<td style="text-align: center;border:1px silver solid;">${item.name}</td>
								<td
									style="text-align: center;border:1px silver solid;border-left:none;"
								>${item.time}</td>
								<td
									style="text-align: center;border:1px silver solid;border-left:none;"
								></td>
							</tr>
</c:forEach>
															
															
															
															
														</table>
													</td>
												</tr>
											</table>
											<table
												style="width:97%;margin:0px auto;display: none;height:400px;"
												id="smDiv"
											>
												<tr>
													<td
														style="text-align: center;border: none;vertical-align: top;background-color: white;"
													>
														<table
															style="text-align: center;width:80%;margin: 20px auto;"
														>
															<tr>
																<td
																	colspan="2"
																	style="border:1px silver solid;text-align: left;"
																>睡眠：${data.sleepSolution }</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!--新增弹窗开始 -->
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
						>菜谱</span>
					</div>
					<div class="modal-body">
						<table style="width: 300px;">
							<tr>
								<td
									style="border:1px silver solid;text-align: center;background-color: #e8e4e4;height:30px; line-height: 30px;"
								><span style="font-size: 20px;font-weight: bolder;">早餐</span></td>
								<td
									style="border:1px silver solid;text-align: center;height:30px; line-height: 30px;"
								><span style="font-size: 20px;font-weight: bolder;">午餐</span></td>
								<td
									style="border:1px silver solid;text-align: center;height:30px; line-height: 30px;"
								><span style="font-size: 20px;font-weight: bolder;">晚餐</span></td>
							</tr>
						</table>
						<table
							style="width: 100%;margin-top: 10px;background-color: white;text-align: center;height:30px; line-height: 30px;"
						>
							<tr>
								<td style="border:1px silver solid;width: 45%;"><span>食物</span></td>
								<td style="border:1px silver solid;width: 10%;"><span>操作</span></td>
								<td style="border:1px silver solid;width: 45%;"><span>已选</span></td>
							</tr>
							<tr>
								<td
									style="border:1px silver solid;height:300px;overflow: auto;vertical-align: top;"
								>
									<table style="width:90%;margin: 10px auto;">
										<tr>
											<td style="border:1px silver solid;width: 10%;"></td>
											<td style="border:1px silver solid;width: 45%;">名称</td>
											<td style="border:1px silver solid;width: 45%;">成份</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉</td>
										</tr>
									</table>
								</td>
								<td
									style="border:1px silver solid;text-align: center;vertical-align: middle;"
								><a href="#.html"><img
										alt=""
										src="${ctx}/images/fwjzz/u442.png"
										height="40"
									></a></br> </br> <a href="#.html"><img
										alt=""
										src="${ctx}/images/fwjzz/u444.png"
										height="40"
									></a></td>
								<td
									style="border:1px silver solid;height:300px;overflow: auto;vertical-align: top;"
								>
									<table style="width:90%;margin: 10px auto;">
										<tr>
											<td style="border:1px silver solid;width: 10%;"></td>
											<td style="border:1px silver solid;width: 45%;">名称</td>
											<td style="border:1px silver solid;width: 45%;">成份</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉 <input
												type="text"
												class="form-control"
												style="width:50px;"
											></td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉 <input
												type="text"
												class="form-control"
												style="width:50px;"
											></td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid; vertical-align: middle;">面粉
												<input
												type="text"
												class="form-control"
												style="width:50px;"
											>
											</td>
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
		<!--新增弹窗结束 -->
		<!--修改弹窗开始 -->
		<div
			class="modal fade"
			id="add1Model"
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
						>新增</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 项目</span> <select
									class="form-control"
									id="e_zj"
								>
									<option value="">慢跑</option>
									<option value="1">跳绳</option>
									<option value="2">骑车</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 时长</span> <input
									id=""
									type="text"
									class="form-control"
									placeholder="请输入时长"
								/>
							</div>
						</div>
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
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
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
	<script src="${ctx}/jiankang/js/plugins/echarts/echarts-all.js"></script>
	<script
		src="${ctx}/jiankang/js/prefixfree.min.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/jquery-tab.js"
		charset="utf8"
	></script>
	<script
		type="text/javascript"
		charset="utf8"
	>
		$(function() {
			$('.tab-group').tabify();
			function e(e, o) {
				return "&yen;" + e.toFixed(o.tickDecimals)
			}
			function o(o) {
				$.plot($("#flot-line-chart-multi"),
					[ {
						data : t,
						label : "油价 (&yen;)"
					} ], //,label:"油价 (&yen;)",{data:i,label:"美元/人民币汇率",yaxis:2}
					{
						xaxes : [ {
							mode : "time"
						} ],
						yaxes : [ {
							min : 0
						},
							{
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
			var t = [ [ gd(2006, 12, 31), 61.05 ], [ 11677788e5, 58.32 ], [ 11678652e5, 57.35 ], [ 11679516e5, 56.31 ], [ 11682108e5, 55.55 ], [ 11682972e5, 55.64 ], [ 11683836e5, 54.02 ], [ 116847e7, 51.88 ], [ 11685564e5, 52.99 ], [ 11688156e5, 52.99 ], [ 1168902e6, 51.21 ], [ 11689884e5, 52.24 ], [ 11690748e5, 50.48 ], [ 11691612e5, 51.99 ], [ 11694204e5, 51.13 ], [ 11695068e5, 55.04 ], [ 11695932e5, 55.37 ], [ 11696796e5, 54.23 ], [ 1169766e6, 55.42 ], [ 11700252e5, 54.01 ], [ 11701116e5, 56.97 ], [ 1170198e6, 58.14 ], [ 11702844e5, 58.14 ], [ 11703708e5, 59.02 ], [ 117063e7, 58.74 ], [ 11707164e5, 58.88 ], [ 11708028e5, 57.71 ], [ 11708892e5, 59.71 ], [ 11709756e5, 59.89 ], [ 11712348e5, 57.81 ], [ 11713212e5, 59.06 ], [ 11714076e5, 58 ], [ 1171494e6, 57.99 ], [ 11715804e5, 59.39 ], [ 11718396e5, 59.39 ], [ 1171926e6, 58.07 ], [ 11720124e5, 60.07 ], [ 11720988e5, 61.14 ], [ 11724444e5, 61.39 ], [ 11725308e5, 61.46 ], [ 11726172e5, 61.79 ], [ 11727036e5, 62 ], [ 117279e7, 60.07 ], [ 11731356e5, 60.69 ], [ 1173222e6, 61.82 ], [ 11733084e5, 60.05 ], [ 1173654e6, 58.91 ], [ 11737404e5, 57.93 ], [ 11738268e5, 58.16 ], [ 11739132e5, 57.55 ], [ 11739996e5, 57.11 ], [ 11742588e5, 56.59 ], [ 11743452e5, 59.61 ], [ 1174518e6, 61.69 ], [ 11746044e5, 62.28 ], [ 117486e7, 62.91 ], [ 11749464e5, 62.93 ], [ 11750328e5, 64.03 ], [ 11751192e5, 66.03 ], [ 11752056e5, 65.87 ], [ 11754648e5, 64.64 ], [ 11756376e5, 64.38 ], [ 1175724e6, 64.28 ], [ 11758104e5, 64.28 ], [ 11760696e5, 61.51 ], [ 1176156e6, 61.89 ], [ 11762424e5, 62.01 ], [ 11763288e5, 63.85 ], [ 11764152e5, 63.63 ], [ 11766744e5, 63.61 ], [ 11767608e5, 63.1 ], [ 11768472e5, 63.13 ], [ 11769336e5, 61.83 ], [ 117702e7, 63.38 ], [ 11772792e5, 64.58 ], [ 1177452e6, 65.84 ], [ 11775384e5, 65.06 ], [ 11776248e5, 66.46 ], [ 1177884e6, 64.4 ], [ 11780568e5, 63.68 ], [ 11781432e5, 63.19 ], [ 11782296e5, 61.93 ], [ 11784888e5, 61.47 ], [ 11785752e5, 61.55 ], [ 1178748e6, 61.81 ], [ 11788344e5, 62.37 ], [ 11790936e5, 62.46 ], [ 117918e7, 63.17 ], [ 11792664e5, 62.55 ], [ 11793528e5, 64.94 ], [ 11796984e5, 66.27 ], [ 11797848e5, 65.5 ], [ 11798712e5, 65.77 ], [ 11799576e5, 64.18 ], [ 1180044e6, 65.2 ], [ 11803896e5, 63.15 ], [ 1180476e6, 63.49 ], [ 11805624e5, 65.08 ], [ 1180908e6, 66.3 ] ];
			o("right"), $("button").click(function() {
				o($(this).text())
			})
		});
	
		$(".dial").knob();
		var l = echarts.init(document.getElementById("echarts-pie-chart")),
			u = {
				title : {
					text : "营养摄入参考",
					subtext : "",
					x : "center"
				},
				tooltip : {
					trigger : "item",
					formatter : "{a} <br/>{b} : ({d}%)"
				},
				legend : {
					orient : "vertical",
					x : "left",
					data : [ "碳水化合物 205g", "脂肪 57g", "蛋白质 39g" ]
				},
				calculable : !0,
				series : [ {
					name : "营养摄入",
					type : "pie",
					radius : "55%",
					center : [ "50%", "60%" ],
					data : [ {
						value : 205,
						name : "碳水化合物 205g"
					}, {
						value : 57,
						name : "脂肪 57g"
					}, {
						value : 39,
						name : "蛋白质 39g"
					} ]
				} ]
			};
		l.setOption(u), $(window).resize(l.resize);
	</script>
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
		function add() { //新增按钮方法
			$('#addModel').modal();
		}
		function add1() { //新增按钮方法
			$('#add1Model').modal();
		}
		function doAdd() { //新增保存方法
	
			$('#addModel').modal('hide');
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "/sys/insertDmkgl",
				data : {
					type : "add",
					ctype : document.getElementById("a_ctype").value,
					cname : document.getElementById("a_cname").value,
					cvalue : document.getElementById("a_cvalue").value,
					time : Math.random()
				},
				success : function(data) {
					right("新增成功!");
				},
				error : function(data) {
					right("新增失败!");
				}
			});
		}
		function change(str){
			if(str=="ysDiv"){
				document.getElementById("ysDiv").style.display="table";
				document.getElementById("ydDiv").style.display="none";
				document.getElementById("smDiv").style.display="none";
			}else if(str=="ydDiv"){
				document.getElementById("ysDiv").style.display="none";
				document.getElementById("ydDiv").style.display="table";
				document.getElementById("smDiv").style.display="none";
			}else if(str=="smDiv"){
				document.getElementById("ysDiv").style.display="none";
				document.getElementById("ydDiv").style.display="none";
				document.getElementById("smDiv").style.display="table";
			}
		}
		function wc(){
        	parent.gb();		
}
	</script>
</body>
</html>
