<%@page import="org.soft.erp.domain.jkzy.Hfjl"%>
<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ page import="com.alibaba.fastjson.*"%>
<%@ page import="org.soft.erp.domain.*"%>
<%@page import="org.soft.erp.domain.jggly.User"%>
<%@page import="org.soft.erp.util.common.ErpConstants"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
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
	href="${ctx}/jiankang/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/bootstrap-table/bootstrap-table.css"
	rel="stylesheet"
/>
<link
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
	rel="stylesheet"
>
  <style>
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
        </style>
</head>
<%
	String id = (String) request.getAttribute("id");
	String upid = (String) request.getAttribute("upid");
	String nextid = (String) request.getAttribute("nextid");
	String[] info = (String[]) request.getAttribute("info");
	User user = (User) session.getAttribute(ErpConstants.USER_SESSION);
	final SimpleDateFormat myFmt2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	final Date now = new Date();
%>
<body onload="load()" background-color="#27bcc2">
	<form action="">
		<table
			id="tab"
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;height:655px; "
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
							><a href="${ctx}/jkzy/fwzz6?id=<%=upid%>"><img
									src="${ctx}/images/jkpgyw/u756.png"
									style="height:30px;"
								></a> <img
								src="${ctx}/images/jkpgyw/u718.jpg"
								style="height:100px;"
							> <a href="${ctx}/jkzy/fwzz6?id=<%=nextid%>"><img
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
							><span><%=info[0]%></span></td>
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
							><span><%=info[1]%></span></td>
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
							><span><%=info[2]%></span></td>
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
							><span><%=info[3]%></span></td>
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
							><span><%=info[4]%></span></td>
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
							><span><%=info[5]%></span></td>
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
							><span><%=info[6]%></span></td>
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
						<li  style="height:40px!important;"> <a href="${ctx}/jkzy/pgbg?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">评估报告</h2></a>
                        </li>
												<li style="height:40px!important;"><a
													href="${ctx}/jkzy/cjmb?id=<%=request.getAttribute("id") %>"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">促进目标</h2>
												</a></li>
					    <li style="height:40px!important;"> <a href="${ctx}/jkzy/fazd?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">方案指导</h2></a>
                        </li> 
						<li  style="height:40px!important;"> <a href="${ctx}/jkzy/mrqk?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">每日情况</h2></a>
                        </li> 	 
						<li   style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz5?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">设备上传</h2></a>
                        </li> 		 
						 <li class="active" style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz6?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
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
								style="border:1px silver solid;border-top:none;border-bottom:none; vertical-align:top;"
							>
								<table style="width:100%;text-align: center;">
									<tr>
										<td style="width:250px;vertical-align: top;">
											<table
												style="width:200px;background-color: white;margin:20px;line-height: 30px;border:1px silver solid;"
											>
												<tr>
													<td style="text-align: left;padding-left: 20px;">日期</td>
													<td style="text-align: right;padding-right: 20px;"><a
														href="#.html"
														onclick="change()"
													>新增</a></td>
												</tr>
												<tr>
													<td
														colspan="2"
														style=""
													><input
														id="month1"
														class="form-control"
														runat="server"
														type="text"
														style="width:100px;margin: 10px auto;"
													/> <span
														class="input-group-addon"
														style="display:none;"
													><span class="glyphicon glyphicon-th"></span></span> <input
														type="button"
														value="检索"
														class="form-control"
														style="height:35px;width:55px;"
														onclick="searchHfjl()"
													/></td>
												</tr>
												<tr>
													<td
														colspan="2"
														style="text-align: center;"
													>
														<table
															style="width: 80%; text-align: center;margin: 10px auto;"
														>
															<tr>
																<td
																	style="background-color: silver;border:1px silver solid;"
																>回访人</td>
																<td
																	style="background-color: silver;border:1px silver solid;"
																>时间</td>
															</tr>
														</table>
														<table
															id="hftbl"
															style="width: 80%; text-align: center;margin: 10px auto;"
														>
															<%
																List<Hfjl> hfjl = (List<Hfjl>) request.getAttribute("hfjl");
																for (int i = 0; i < hfjl.size(); i++) {
															%>
															<tr>
																<td style="border:1px silver solid;"><%=hfjl.get(i).getYname()%></td>
																<td style="border:1px silver solid;"><%=myFmt2.format(hfjl.get(i).getHtime())%></td>
															</tr>
															<%
																}
															%>
														</table>
													</td>
												</tr>
											</table>
										</td>
										<td style="vertical-align: top;">
											<table
												id="div1"
												style="background-color: white;margin:20px ;line-height: 30px;"
											>
												<tr>
													<td
														id="td1"
														style="border:1px silver solid; text-align: center;width:100px;border-bottom: none;"
													><a
														href="#.html"
														onclick="change1()"
													>回访内容</a></td>
													<td
														id="td2"
														style="border-bottom:1px silver solid;text-align: center;width:100px;"
													><a
														href="#.html"
														onclick="change()"
													>发送内容</a></td>
													<td
														style="border-bottom:1px silver solid;text-align: left;padding-left: 20px;"
													>&nbsp;</td>
												</tr>
												<tr>
													<td
														colspan="3"
														style="border:1px silver solid; text-align: left;padding-left: 20px;border-top:none; vertical-align: top;line-height: 20px;"
													>
														<table
															id="tab1"
															style="width: 100%;margin-top: 20px; "
														>
															<tr>
																<td style="vertical-align: top;"><span>内容:</span></td>
																<td><textarea
																		class="form-control"
																		rows="7"
																		cols="100"
																		id="a_nr"
																		style="margin-right: 20px;width:auto;"
																	></textarea></td>
															</tr>
															<tr>
																<td style="vertical-align: top;"><span>建议:</span></td>
																<td><textarea
																		class="form-control"
																		rows="7"
																		cols="100"
																		id="a_jy"
																		style="margin-right: 20px;width:auto;margin-top: 5px;"
																	></textarea></td>
															</tr>
															<tr>
																<td
																	colspan="2"
																	style="text-align: right;height: 30px; line-height: 30px;padding-right: 20px;"
																><span>回访人:<%=user.getXm()%></span><span
																	style="margin-left: 20px;"
																>回访时间:<%=myFmt2.format(now)%></span></td>
															</tr>
															<tr>
																<td
																	colspan="2"
																	style="text-align: right;height: 30px; line-height: 30px;padding-right: 20px;padding-bottom: 20px;"
																><input
																	type="button"
																	value="保存"
																	class="form-control"
																	style="height:30px;width:55px;"
																	onclick="bc()"
																/></td>
															</tr>
														</table>
														<table
															id="tab2"
															style="width: 100%;margin-top: 20px; display: none;"
														>
															<tr>
																<td style="vertical-align: top;"><span>标题:</span></td>
																<td style="padding-right: 20px;padding-bottom: 5px;"><input
																	type="text"
																	id="a_bt"
																	class="form-control"
																	placeholder="请输入标题"
																	style="width:100%;"
																/></td>
															</tr>
															<tr>
																<td style="vertical-align: top;"><span>内容:</span></td>
																<td><textarea
																		class="form-control"
																		rows="10"
																		cols="100"
																		id="a_nr1"
																		style="margin-right: 20px;width:auto;"
																	></textarea></td>
															</tr>
															<tr>
																<td style="vertical-align: top;"><span>方式:</span></td>
																<td><select
																	class="form-control"
																	id="a_lx"
																	style="margin-top: 5px;"
																>
																		<option value="">方式</option>
																		<option value="短信">短信</option>
																		<option value="邮件">邮件</option>
																		<option value="APP">APP</option>
																</select></td>
															</tr>
															<tr>
																<td
																	colspan="2"
																	style="text-align: right;height: 30px; line-height: 30px;padding-right: 20px;"
																><span>回访人:<%=user.getXm()%></span><span
																	style="margin-left: 20px;"
																>回访时间:<%=myFmt2.format(now)%></span></td>
															</tr>
															<tr>
																<td
																	colspan="2"
																	style="text-align: right;height: 30px; line-height: 30px;padding-right: 20px;padding-bottom: 20px;"
																><input
																	type="button"
																	value="发送"
																	class="form-control"
																	style="height:30px;width:55px;"
																	onclick="fs()"
																/></td>
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
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="${ctx}/jiankang/js/plugins/jsKnob/jquery.knob.js"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/js/bootstrap-datetimepicker.js"
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
		$('#month1').datetimepicker({
			language: 'zh-CN',
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
	
		function change() {
			document.getElementById("td1").style.border = "none";
			document.getElementById("td1").style.borderBottom = "1px silver solid";
			document.getElementById("td2").style.border = "1px silver solid";
			document.getElementById("td2").style.borderBottom = "none";
			document.getElementById("tab1").style.display = "none";
			document.getElementById("tab2").style.display = "table";
		}
		function change1() {
			document.getElementById("td2").style.border = "none";
			document.getElementById("td2").style.borderBottom = "1px silver solid";
			document.getElementById("td1").style.border = "1px silver solid";
			document.getElementById("td1").style.borderBottom = "none";
			document.getElementById("tab1").style.display = "table";
			document.getElementById("tab2").style.display = "none";
		}
		function load() {
			document.getElementById("tab").style.height = (document.body.clientHeight) + "px";
		}
		function wc() {
			parent.gb();
		}
		function bc(){//新增保存方法
			$.ajax({
                cache: false,
                type: "post",
                dataType: "Json",
                url: "${ctx}/jkzy/insertHfjl",
                data: {
                    hid:'<%=request.getAttribute("id")%>',
                    nr:document.getElementById("a_nr").value,
                    jy:document.getElementById("a_jy").value,
                    time: Math.random()
                },
                success: function (data)
                {
                	right("保存成功!");
                	document.getElementById("a_nr").value="";
                	document.getElementById("a_jy").value="";
                },
                error:function(data){
                	right("保存失败!");
                }
            });
		}
		function fs(){//新增保存方法
			$.ajax({
                cache: false,
                type: "post",
                dataType: "Json",
                url: "${ctx}/jkzy/insertXxfs",
                data: {
                    jid:'<%=request.getAttribute("id")%>',
                    mc:document.getElementById("a_bt").value,
                    nr:document.getElementById("a_nr1").value,
                    lx:document.getElementById("a_lx").value,
                    time: Math.random()
                },
                success: function (data)
                {
                	right("发送成功!");
                	document.getElementById("a_bt").value="";
                	document.getElementById("a_nr1").value="";
                },
                error:function(data){
                	right("发送失败!");
                }
            });
		}		
		function searchHfjl(){
			$.ajax({
                cache: false,
                type: "post",
                dataType: "Json",
                url: "${ctx}/jkzy/searchHfjl",
                data: {
                    hid:'<%=request.getAttribute("id")%>',
                    htime:document.getElementById("month1").value,
                    time: Math.random()
                },
                success: function (data)
                {
                	var t = eval(data);
                	document.getElementById("hftbl").innerHTML=t.msg;
                },
                error:function(data){
                	document.getElementById("hftbl").innerHTML=t.msg;
                }
            });
		}
	</script>
</body>
</html>
