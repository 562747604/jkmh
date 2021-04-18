<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
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
	href="${ctx}/jiankang/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/bootstrap-table/bootstrap-table.css"
	rel="stylesheet"
/>
<link
	href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/animate.min.css"
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
</style>
</head>

<body
	onload="load()"
	background-color="#27bcc2"
>
	<form action="">
		<table
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;height:850px; "
		>
			<tr>
				<td
					style="text-align:center;height:50px;line-height:50px; vertical-align:middle;width:200px;background-color:#27bac1;"
				></td>
				<td
					style="text-align:left;line-height:50px; vertical-align:middle;background-color:#27bac1;"
				><input
					type="button"
					value="预览"
					class="form-control"
					style="height:30px;width:55px;margin-left:20px;"
				/> <input
					type="button"
					value="完成"
					class="form-control"
					style="height:30px;width:55px;"
				/></td>
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
							><a href="${ctx}/jkzy/pgbg?id=${rotate.previd}"><img
									src="${ctx}/images/jkpgyw/u756.png"
									style="height:30px;"
								></a> <img
								src="${ctx}/images/jkpgyw/u718.jpg"
								style="height:100px;"
							> <a href="${ctx}/jkzy/pgbg?id=${rotate.nextid}"><img
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
							><span>${rotate.ryfp.tjh }</span></td>
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
							><span>${rotate.ryfp.realname }</span></td>
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
							><span>${rotate.ryfp.xb }</span></td>
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
							><span>${rotate.ryfp.nl }</span></td>
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
							><span>${rotate.ryfp.fCompanyName }</span></td>
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
							><span>${rotate.ryfp.sfzh }</span></td>
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
							><span>${rotate.ryfp.mobile }</span></td>
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
					style="text-align:left;line-height:30px; vertical-align:top;background-color:#bef2ff;border-right:20px #27bac1 solid;border-bottom:15px #27bac1 solid;"
				>
					<table
						style="width:100%;text-align:center;height:40px;background-color:#27bac1;"
					>
						<tr style="height:40px;line-height:40px;">
							<td style="line-height:40px;height:40px;">
								<div
									class="panel blank-panel"
									style="background-color:#27bac1;height:40px!important;line-height:40px;"
								>
									<div
										class="panel-heading"
										style="height:40px!important;"
									>
										<div
											class="panel-options"
											style="height:40px!important;"
										>
											<ul
												class="nav nav-tabs"
												style="height:40px!important;"
											>
												<li
													class="active"
													style="height:40px!important;"
												><a
													href="${ctx}/jkzy/pgbg?id=${rotate.id}"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">评估报告</h2>
												</a></li>
												<li style="height:40px!important;"><a
													href="${ctx}/jkzy/cjmb?id=${rotate.id}"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">促进目标</h2>
												</a></li>
												<li style="height:40px!important;"><a
													href="${ctx}/jkzy/fazd?id=${rotate.id}"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">方案指导</h2>
												</a></li>
												<li style="height:40px!important;"><a
													href="${ctx}/jkzy/mrqk?id=${rotate.id}"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">每日情况</h2>
												</a></li>
												<li style="height:40px!important;"><a
													href="${ctx}/jkzy/fwzz5?id=${rotate.id}"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">设备上传</h2>
												</a></li>
												<li style="height:40px!important;"><a
													href="${ctx}/jkzy/fwzz6?id=${rotate.id}"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">回访追踪</h2>
												</a></li>

											</ul>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="fm"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: right;height: 30px;line-height: 30px;"><u><label
												style="font-weight: bold;"
											>编号:</label> <span id="a_bh">${rotate.ryfp.tjh }</span></u></td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 400px;line-height: 30px;"
										><span style="font-size:30px; font-weight: bold;">成人健康手册</span></br>
											<span>（体检报告）</span></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 30px;line-height: 30px;">
											<table
												style="width: 400px;margin: 0px auto;border:none;"
												border=1
											>
												<tr>
													<td
														style="height:50px;width:100px; text-align: center;border:none;"
													><label style="font-size:20px; font-weight: bold;">姓&nbsp;&nbsp;&nbsp;&nbsp;名</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;"
													>${rotate.ryfp.realname }</td>
												</tr>
												<tr>
													<td
														style="height:70px;width:100px; text-align: center;border:none;"
													><label style="font-size:20px; font-weight: bold;">性&nbsp;&nbsp;&nbsp;&nbsp;别</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;"
													>${rotate.ryfp.xb }</td>
												</tr>
												<tr>
													<td
														style="height:70px;width:100px; text-align: center;border:none;"
													><label style="font-size:20px; font-weight: bold;">身份证号</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;"
													>${rotate.ryfp.sfzh }</td>
												</tr>
												<tr>
													<td
														style="height:70px;width:100px; text-align: center;border:none;"
													><label style="font-size:20px; font-weight: bold;">联系方式</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;"
													>${rotate.ryfp.mobile }</td>
												</tr>
												<tr>
													<td
														style="height:70px;width:100px; text-align: center;border:none;"
													><label style="font-size:20px; font-weight: bold;">体检日期</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;"
													>${rotate.ryfp.fCreatedTime }</td>
												</tr>
												<tr>
													<td
														style="height:70px;width:100px; text-align: center;border:none;"
													><label style="font-size:20px; font-weight: bold;">工作单位</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;"
													>${rotate.ryfp.dw }</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="qy"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 100px;"
										><span style="font-size:30px; font-weight: bold;">前 言</span></td>
									</tr>
									<tr>
										<td style="text-align: left;line-height: 40px;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亲爱的朋友，欢迎您来到</span><u style="padding: 0px 20px;">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("jgname") %>&nbsp;&nbsp;&nbsp;&nbsp;</u><span>健康管理中心，我们由衷的为您献上最真诚的感恩与祝福，并为您提供您所需要的健康照护和服务。
												</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这本健康手册为您提供了健康照护和服务的相关内容：</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.为您提供了您选择的健康体检项目检查结果，
												并协助您进行生活习惯及健康状况评估，使您能够获得健康风险因子的资讯。</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.为您提供了健康体检记录表，协助您记录自己的健康状况，以便帮助您能够幸福、平安、快乐的度过自己的一生。</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.为您提供了您应该知道的相关健康保健讯息，帮助您更好的适应因年龄的变化、家庭的变化以及生活环境的变化对身心的影响。</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.
												这份体检报告收集了您选择的健康体检项目和流行病学调查的部分相关数据，它仅反映了您目前的身体状况和部分生活方式，仅供参考。如有不解的问题，请选择健康咨询。
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请您仔细阅读，以便帮助您了解人在其一生中如何关怀自己的生命，照顾好自己的健康，选择积极的生活态度。</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当您接受这本健康手册的同时，您就接受了对健康生活的追求，踏入了健康生存的旅程。
										</span></td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 30px;"
										>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="ml"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">目录</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#fm"
										>1:封面...................................................................................................................................1</a></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#qy"
										>2:前言...................................................................................................................................2</a></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#ml"
										>3:目录...................................................................................................................................3</a></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#jl"
										>4:健康体检评估与结论..........................................................................................................4</a></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#zb"
										>5:重要指标............................................................................................................................5</a></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#mx"
										>6:慢病风险评估.....................................................................................................................6</a></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#zd"
										>7:指导方案............................................................................................................................7</a></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#js"
										>8:寄语...................................................................................................................................8</a></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="jl"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">健康体检评估与结论</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;">
											<table
												style="width:90%;border:1px silver solid;margin:20px auto;font-size: 20px;"
											>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: right;"
													><span>健康级别</span></td>
													<td style="border-bottom:1px silver solid;">${healthAssess.healthLevel }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: right;"
													><span>健康状态</span></td>
													<td style="border-bottom:1px silver solid;">${healthAssess.healthState }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: right;"
													><span>疾病易感性</span></td>
													<td style="border-bottom:1px silver solid;">${healthAssess.illnessDesc }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: right;"
													><span>体检结论</span></td>
													<td style="border-bottom:1px silver solid;">${healthAssess.examConclusion }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: right;"
													><span>流行病学调查</span></td>
													<td style="border-bottom:1px silver solid;">
														<!-- 流行病学调查 --> <c:forEach
															var="epidemicSurvey"
															items="${epidemicSurvey}"
															varStatus="status"
														>   
${epidemicSurvey.id}：${epidemicSurvey.value}												
</c:forEach>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="zb"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">重要指标</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;">
											<table
												style="width:90%;border:1px silver solid;margin:20px auto;font-size: 20px;text-align: center;"
											>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
													><span>名称</span></td>
													<td
														style="border-bottom:1px silver solid;border-right:1px silver solid;"
													>描述</td>
													<td
														style="border-bottom:1px silver solid;border-right:1px silver solid;"
													>范围</td>
													<td
														style="border-bottom:1px silver solid;border-right:1px silver solid;"
													>结果列表</td>
												</tr>
												<c:forEach
													var="indexs"
													items="${indexs}"
													varStatus="status"
												>
													<tr style="height:40px;line-height:40px;">
														<td
															style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
														><span>${indexs.name }</span></td>
														<td
															style="border-bottom:1px silver solid;border-right:1px silver solid;"
														>${indexs.desc }</td>
														<td
															style="border-bottom:1px silver solid;border-right:1px silver solid;"
														>${indexs.range }</td>
														<td
															style="border-bottom:1px silver solid;border-right:1px silver solid;"
														><c:forEach
																var="value"
																items="${indexs.values}"
															>   
		${value }
</c:forEach></td>
													</tr>
												</c:forEach>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="mx"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">慢病风险评估</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;">
											<c:forEach
												var="diseases"
												items="${diseases}"
												varStatus="status"
											>
												<table
													style="border:1px silver solid;width:90%;margin-left:auto;margin-right:auto;background-color:white;margin-top:20px;"
												>
													<tr style="height:25px;line-height:25px;">
														<td
															style="width:800px;border-bottom:1px silver solid;height:25px;line-height:25px;text-align:left;"
														><span
															style="font-size:16px; font-weight:bolder;margin-left:10px;"
														>+ ${diseases.name } 评级：${diseases.evalGrade }
																建议：${diseases.suggest } 评分：${diseases.score } </span></td>
														<td style="border-bottom:1px silver solid;">&nbsp;</td>
														<td style="width:50px;border-bottom:1px silver solid;"><a
															href="#.html"
															onclick="s_show('grs${diseases.indexs}')"
														><img
																src="${ctx}/images/jkpgyw/u31.png"
																style="height:20px;"
															></a></td>
													</tr>
													<tr
														id="grs${diseases.indexs}"
														style="display:table-row;min-height:350px; vertical-align:top;"
													>
														<td colspan="3">
															<table
																id="div111"
																style="width:80%;margin-left:auto;margin-right:auto;margin-top:30px;"
															>
																<tr style="height:30px;line-height:30px;">
																	<td style="text-align:center;border:1px silver solid;">名称</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;"
																	>名称</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;"
																	>结果</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;"
																	>范围</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;"
																	>历史指标</td>
																</tr>
																<c:forEach
																	var="diseases_indexs"
																	items="${diseases.indexs}"
																>
																	<tr style="height:30px;line-height:30px;">
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;"
																		>${diseases_indexs.id }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		>${diseases_indexs.name }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		>${diseases_indexs.value }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		>${diseases_indexs.range }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		><c:forEach
																				var="historys"
																				items="${diseases_indexs.historys}"
																			>   
								
								${historys.order } ： ${historys.value } <br />
																			</c:forEach></td>
																	</tr>
																</c:forEach>
															</table>
															<table
																id="div11"
																style="width:100%;"
															>
																<tr style="height:40px;line-height:40px;">
																	<td style="text-align:center;"><span>
																			根据您提供的相关信息及临床检查的结果，我们评估您糖尿病的易感性为_</span><span
																		style="color:red;"
																	>中风险</span></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</c:forEach>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="zd"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">指导方案</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 40px;line-height: 40px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${assessReport.guide}</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:1200px;text-align:center;margin: 40px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							><a
								name="js"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');height:1060px;"
							>
								<table style="width:800px;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 100px;"
										><span style="font-size:30px; font-weight: bold;">寄语——我和你</span></td>
									</tr>
									<tr>
										<td style="text-align: left;line-height: 40px;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亲爱的朋友：</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的眼睛和耳朵，是为了认识您，倾听您；</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的脚，是为了走进您；</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的手，是为了帮助您，牵引您；</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的脑子，是为了造福您；</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的心，是为了体贴您关爱您。</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;说真的，若没有您，我们还能成为我们吗？</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;祝您在人生的旅途中一路平安！健康长寿！</br>
												</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;健康是一种意识，也是一种习惯，更是一种自然状态。</br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;健康是一种顺应，也是一种和谐，更是一种合一状态。</br></span>
											<span style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;云方健康设计室</br>
												</br>
										</span> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人的一生中最重要的事情——就是能够认识到健康是一个人最重要的事情，并努力去照
												顾好自己的身体。</br>
										</span> <span style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亚当
												. 杰克森</span></br> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每个人不仅有治疗自己的能力，更能够创造源源不断的健康。现在你需要做的是，了解自然的法则，并且坚持你将为自己的身体状况负责的信念。没有其他人可以为你的健康负责，包括医生、父母、老师、心理医生等。当你接受这种责任的时候，就是你开始战胜疾病的时刻，也是你开始创造出源源不断的健康的时刻。</br>
												健康就是精力、力量，是生活的趣味，生命的喜悦。
										</span></br> <span style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亚当
												. 杰克森</span></br></td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 30px;"
										>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					</form> <script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script> <script
						src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"
					></script> <script src="${ctx}/jiankang/js/sweetalert.min.js"></script> <script
						src="${ctx}/jiankang/js/public.js"
					></script> <script type="text/javascript">
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
					</script>
</body>
</html>
