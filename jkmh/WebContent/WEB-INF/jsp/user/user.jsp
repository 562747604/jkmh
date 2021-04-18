<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ page import="com.alibaba.fastjson.*"%>
<%@ page import="org.soft.erp.domain.*"%>
<%@ page import="java.util.*"%>
<%@ taglib
	prefix="form"
	uri="http://www.springframework.org/tags/form"
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
	href="${ctx}/jiankang/js/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet"
>
</head>
<body
	class="gray-bg"
	onload="load()"
>
	<form action="">
		<div class="col-sm-12">
			<!-- Example Events -->
			<div class="example-wrap">
				<table
					width="100%"
					border="0"
					cellpadding="0"
					cellspacing="0"
					style="line-height: 30px; margin-top: 10px;"
				>
					<tr>
						<td><i class="fa fa-table"></i> <lable class="pathtitle">超级管理员
							>> 用户管理</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align: right; vertical-align: middle;"
						>
							<%
								String controls = "";
								String jsonString = (String) request.getAttribute("searchs");

								//System.out.println("*******jsonString*********" + jsonString + "***********");

								List<Kvs> listKvs = JSON.parseArray(jsonString, Kvs.class);
								for (Kvs kvs : listKvs) {
									//									System.out.println("kvs====" + kvs.getEnname() + kvs.getCnname() + kvs.getType());
									String enname = kvs.getEnname();
									String cnname = kvs.getCnname();
									String type = kvs.getType();
									if (type.equals("1")) {
										if (controls == "") {
											controls = kvs.getEnname() + "-1";
										} else {
											controls += "," + kvs.getEnname() + "-1";
										}
							%> <input
							id="<%=enname%>"
							type="text"
							class="form-control"
							placeholder="请输入<%=cnname%>"
						/> <%
 	} else if (type.equals("2")) {
 			if (controls == "") {
 				controls = kvs.getEnname() + "-2";
 			} else {
 				controls += "," + kvs.getEnname() + "-2";
 			}
 %> <input
							id="<%=enname%>1"
							name="dataCon"
							class="form-control"
							runat="server"
							type="text"
							placeholder="起始<%=cnname%>"
						/> <span
							class="input-group-addon"
							style="display:none;"
						><span class="glyphicon glyphicon-th"></span></span> - <input
							id="<%=enname%>2"
							name="dataCon"
							class="form-control"
							runat="server"
							type="text"
							placeholder="截止<%=cnname%>"
						/> <span
							class="input-group-addon"
							style="display:none;"
						><span class="glyphicon glyphicon-th"></span></span> <%
 	} else {
 			if (controls == "") {
 				controls = kvs.getEnname() + "-3";
 			} else {
 				controls += "," + kvs.getEnname() + "-3";
 			}
 			HashMap<String, String> map = kvs.getMap();
 			if (map != null) {
 				Iterator iter = map.entrySet().iterator();
 %> <select
							 style="color:#999999;" class="form-control"
						  onchange='selChange("<%=enname%>")' id="<%=enname%>"
						>
								<option style="color:#999999!important;" value="<%=enname%>"><%=cnname%></option>
								<%
									while (iter.hasNext()) {
													Map.Entry entry = (Map.Entry) iter.next();
													String key = (String) entry.getKey();
													String val = (String) entry.getValue();
													//													System.out.println("kv==  " + key + " " + val);
								%>
								<option  style="color:#000000!important;" value="<%=val%>"><%=val%></option>
								<%
									}
								%>
						</select> <%
 	}
 		}
 	}
 %> <input
							type="button"
							value="检索"
							class="btn btn-outline btn-default"
							onclick="search()"
						/> <input
							type="button"
							value="重置"
							class="btn btn-outline btn-default"
							onclick="reset()"
						/> <input
							id="addbtn"
							type="button"
							value="筛选"
							class="btn btn-outline btn-default"
							onclick="sx()"
						/>
						</td>
					</tr>
				</table>
				<div class="example">
					<div
						class="btn-group hidden-xs"
						id="rsTabToolbar"
						role="group"
					>
						<input
							id="b-add"
							type="button"
							value="新增"
							class="btn btn-outline btn-default"
							style="<%=request.getAttribute("addBtn") %>"
							onclick="add()"
						/> <input
							id="b-del"
							type="button"
							value="删除"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;<%=request.getAttribute("delBtn") %>"
							onclick="del('${ctx}/user/deleteUser','user')"
						/> <input
							id="b-del"
							type="button"
							value="导入"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;<%=request.getAttribute("drBtn") %>"
							onclick="dr()"
						/> <input
							id="b-del"
							type="button"
							value="导出"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;<%=request.getAttribute("dcBtn") %>"
							onclick="doOut('s_rbac_user')"
						/>
					</div>
					<table
						id="rsTab"
						data-mobile-responsive="true"
						data-click-to-select="true"
					>
					</table>
				</div>
			</div>
			<!-- End Example Events -->
		</div>
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
						>新增</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 个人账号</span> <input
									id="a_usercode"
									type="text"
									class="form-control"
									placeholder="请输入个人账号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 姓名</span> <input
									id="a_xm"
									type="text"
									class="form-control"
									placeholder="请输入新的姓名"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 密码</span> <input
									id="a_password"
									type="password"
									class="form-control"
									placeholder="请输入新的密码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div
								class="input-group date form_datetime col-md-2"
								style="text-align: center;"
							>
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 出生日期</span> <input
									id="a_csrq"
									name="dataCon"
									class="form-control"
									runat="server"
									type="text"
									style="width:455px;"
									placeholder="请输入出生日期"
								/> <span
									class="input-group-addon"
									style="display:none;"
								><span class="glyphicon glyphicon-th"></span></span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 身份证号</span> <input
									id="a_sfzh"
									type="text"
									class="form-control"
									placeholder="请输入新的身份证号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 19px; padding-right: 19px;background-color:f3f3f4;"
								> 手机号</span> <input
									id="a_sjh"
									type="text"
									class="form-control"
									placeholder="请输入新的手机号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 邮箱</span> <input
									id="a_yx"
									type="text"
									class="form-control"
									placeholder="请输入新的邮箱"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 职称</span> <input
									id="a_jobtitle"
									type="text"
									class="form-control"
									placeholder="请输入新的职称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 性别</span> <select style="color:#999999;"
									class="form-control single-line"
									id="a_xb"  onchange='selChange("a_xb")'
								>
									<option style="color:#999999!important;" value="">性别</option>
									<option style="color:#000000!important;" value="男">男</option>
									<option style="color:#000000!important;" value="女">女</option>
								</select>
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
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 个人账号</span> <input
									id="e_usercode"
									type="text"
									class="form-control"
									placeholder="请输入个人账号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 姓名</span> <input
									id="e_xm"
									type="text"
									class="form-control"
									placeholder="请输入新的姓名"
								/>
							</div>
						</div>
						 <div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 密码</span> <input
									id="e_password"
									type="password"
									class="form-control"
									placeholder="请输入新的密码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div
								class="input-group date form_datetime col-md-2"
								style="text-align: center;"
							>
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 出生日期</span> <input
									id="e_csrq"
									name="dataCon"
									class="form-control"
									runat="server"
									type="text"
									style="width:455px;"
									placeholder="请输入出生日期"
								/> <span
									class="input-group-addon"
									style="display:none;"
								><span class="glyphicon glyphicon-th"></span></span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 身份证号</span> <input
									id="e_sfzh"
									type="text"
									class="form-control"
									placeholder="请输入新的身份证号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 19px; padding-right: 19px;background-color:f3f3f4;"
								> 手机号</span> <input
									id="e_sjh"
									type="text"
									class="form-control"
									placeholder="请输入新的手机号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 邮箱</span> <input
									id="e_yx"
									type="text"
									class="form-control"
									placeholder="请输入新的邮箱"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 职称</span> <input
									id="e_jobtitle"
									type="text"
									class="form-control"
									placeholder="请输入新的职称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 性别</span> <select style="color:#999999;"
									class="form-control single-line"
									id="e_xb" onchange='selChange("e_xb")'
								>
									<option style="color:#999999!important;" value="">性别</option>
									<option style="color:#000000!important;" value="男">男</option>
									<option style="color:#000000!important;" value="女">女</option>
								</select>
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
		<!--查看弹窗开始 -->
		<div
			class="modal fade"
			id="showModel"
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
						>查看</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 个人账号</span> <input
									id="s_usercode"
									type="text"
									class="form-control"
									readonly="readonly"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 姓名</span> <input
									id="s_xm"
									type="text"
									class="form-control"
									readonly="readonly"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 出生日期</span> <input
									id="s_csrq"
									type="text"
									class="form-control"
									readonly="readonly"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 身份证号</span> <input
									id="s_sfzh"
									type="text"
									class="form-control"
									readonly="readonly"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 19px; padding-right: 19px;background-color:f3f3f4;"
								> 手机号</span> <input
									id="s_sjh"
									type="text"
									class="form-control"
									readonly="readonly"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 邮箱</span> <input
									id="s_yx"
									type="text"
									class="form-control"
									readonly="readonly"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 性别</span> <input
									id="s_xb"
									type="text"
									class="form-control"
									readonly="readonly"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 职称</span> <input
									id="s_jobtitle"
									type="text"
									class="form-control"
									readonly="readonly"
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
					</div>
				</div>
			</div>
		</div>
		<!--查看弹窗结束 -->
		<!--筛选弹窗开始 -->
		<div
			class="modal fade"
			id="sxModel"
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
					style="background-color: #f3f3f4;"
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
							style="color: Silver; font-size: 25px;"
						>筛选</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<table style="width: 100%;">
								<tr>
									<td
										style="text-align: left;"
										id="sxtd"
									>
										<%
											String suaixuanJson = (String) request.getAttribute("currentSearchColumnJson");
											//	System.out.println("--------suaixuanJson---------" + suaixuanJson + "-----------------");
											List<Sfield> listSuaixuan = JSON.parseArray(suaixuanJson, Sfield.class);

											for (Sfield sfield : listSuaixuan) {
												String enname = sfield.getEnname();
												String cnname = sfield.getChname();
												String kjtype = sfield.getKjtype() + "";
												String searchStatus = sfield.getSearchStatus() + "";
												if (searchStatus.equals("true")) {
										%> <input id="ck_<%=enname%>"
										type="checkbox"
										name="sxck"
										checked="checked"
										style="margin-left:10px;"
										value="<%=enname%>"
									><a href="#.html" onclick="ck('ck_<%=enname%>')"><%=cnname%></a> <%
 	} else {
 %> <input id="ck_<%=enname%>"
										type="checkbox"
										name="sxck"
										style="margin-left:10px;"
										value="<%=enname%>"
									><a href="#.html" onclick="ck('ck_<%=enname%>')"><%=cnname%></a> <%
 	}
 		//System.out.println("sfield====" + enname + cnname + kjtype + "searchStatus=" + searchStatus);
 	}
 %>
									</td>
								</tr>
							</table>
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
							onclick="doSx('updateSearchColumn','user')"
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
		<!--筛选弹窗结束 -->
		<!--权限弹窗开始 -->
		<div
			class="modal fade"
			id="roleModel"
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
						>权限</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div
								class="input-group"
								style=""
								id="qxdiv"
							></div>
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
							onclick="doRole()"
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
		<!--权限弹窗结束 -->
		<!--导入弹窗开始 -->
		<div
			class="modal fade"
			id="drModel"
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
						>导入</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
						<input
								id="copanyLogo"
								type="file"
								name="files"
								class="form-control"
								style="width:400px;"
							/>
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
							onclick="ajaxFileUpload()"
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
		<!--导入弹窗结束 -->
		<input
			type="hidden"
			id="eid"
		>
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
		<script src="${ctx}/js/ajaxfileupload.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/bootstrap-table.min.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/locale/bootstrap-table.js"
		charset="utf8"
	></script>
		<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"
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
	<script>
	var t="";
	function load(){
		t=sxstr('<%=controls%>');
	}
	$('#rsTab').bootstrapTable({
		url: 'selectUser', //请求后台的URL（*）
		method: 'get', //请求方式（*）
		contentType : "application/x-www-form-urlencoded",
		toolbar:"#rsTabToolbar", //工具按钮用哪个容器
		striped: true, //是否显示行间隔色
		cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination: true, //是否显示分页（*）
		sortable: true, //是否启用排序
		sortOrder: "desc", //排序方式
		iconSize:"outline",
		showRefresh:true,
		showToggle:true,
		//queryParams: oTableInit.queryParams, //传递参数（*）
		sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
		pageNumber: 1, //初始化加载第一页，默认第一页
		height:$(window).height()-70,
		pageSize:10, //每页的记录行数（*）
		
		 onColumnSwitch: 
			  function getvl(params) {
	            var vc= $('#exampleTableEvents').bootstrapTable('getVisibleColumns','');
						
				var strColumns="";
					//alert(arguments[0]+arguments[1]);
					$.post("updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=user",arguments[0]);
	        },
	        queryParams: 
				function queryParams(params) {
	        	load();
		        	return {
		            NAME:params.search, //开启自带查询后输入的值
		            ISDEL:0,
		            pageSize: this.pageSize, //分页条数
		            pageNumber: this.pageNumber, //当前页数
		            sortOrder: this.sortOrder, //当前页数
		            field: this.sortName,//当前页数
		            keyword:encodeURI(t),
		            fieldString:"user"
		        };
		    } //在这里你可以自己定义查询的参数
		    
	        , //查询参数
	        queryParamsType: 'limit', //类型
			pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
			clickToSelect: true,
			showColumns:true,
			icons:{refresh:"glyphicon-repeat",toggle:"glyphicon-list-alt",columns:"glyphicon-list"},
			showExport: true, //是否显示导出
			exportDataType: "basic", //basic', 'all', 'selected'.
			columns: [{
				checkbox: true
			}, {
				title :'序号',
				visible:true,
				align:"center",
				width:"50",
				formatter: function (value, row, index) {  
					  var pageNumber = $('#rsTab').bootstrapTable('getOptions').pageNumber;
				  	  var pageSize = $('#rsTab').bootstrapTable('getOptions').pageSize;
				  	  return (pageNumber-1) * pageSize+index+1;
				}
			}	, 
	        {
	            title: '操作',
	            align: 'center',
				  switchable:false,
					width:"80",
	            formatter:function(value,row,index){  
	            	var d = '<a href="#" mce_href="#" onclick="show(\''+ row.id +'\')"><img title="查看" src="${ctx}/images/prev.gif" /></a> '; 
	                 var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id +'\')"  style="<%=request.getAttribute("editBtn") %>"><img title="修改" src="${ctx}/images/update.gif" /></a> ';  
	                 var c = '<a href="#" mce_href="#" onclick="role(\''+ row.id +'\')"  style="<%=request.getAttribute("roleBtn") %>"><img title="角色" src="${ctx}/images/StatBar_admin.gif" /></a> ';  
	                 return d+e+c;  
			   } }	, 
			${fields}		
			]
		});		
	
	function add() {//新增按钮方法
		document.getElementById("a_usercode").value = "";
		document.getElementById("a_password").value = "";
		document.getElementById("a_xm").value = "";
		document.getElementById("a_sfzh").value = "";
		document.getElementById("a_sjh").value = "";
		document.getElementById("a_yx").value = "";
		document.getElementById("a_csrq").value = "";
		document.getElementById("a_xb").selectIndex = "-1";
		document.getElementById("a_jobtitle").value = "";
		$('#addModel').modal();
	}
	function doAdd() {//新增保存方法
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		 var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		 var myreg2 = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
		 if(document.getElementById("a_usercode").value==""){
			noRight("请输入登录名称!");return false;
		}else if(document.getElementById("a_password").value==""){
			noRight("请输入密码!");return false;
		}else if(document.getElementById("a_sjh").value==""){
			noRight("请输入手机号!");return false;
		}else if(document.getElementById("a_yx").value==""){
			noRight("请输入邮箱!");return false;
		}else if (!myreg.test(document.getElementById("a_sjh").value))
        {
			noRight("请输入有效的手机号");return false;
        }else if (!myreg1.test(document.getElementById("a_yx").value))
        {
        	noRight("请输入有效的邮箱");return false;
        }else if (!myreg2.test(document.getElementById("a_sfzh").value))
        {
        	noRight("请输入有效的身份证号");return false;
        }else if ( document.getElementById("a_jobtitle").value=="")
        {
        	noRight("请输入职称");return false;
        }
		if(!/^\w{4,20}$/.test(document.getElementById("a_password").value)){
			swal({
				title : "",
				text : "密码长度必须是6~20之间",
				type : "",
				showCancelButton : false,
				closeOnConfirm : false,
				showLoaderOnConfirm : true,
			});
			return false;
		}
		
		var	rt=$.ajax({
			cache : false,
			type : "post",
			dataType : "Json",
			async:false,
			url : "${ctx}/user/insertUser",
			data : {
				loginname : document.getElementById("a_usercode").value,
				password : document.getElementById("a_password").value,
				xm : document.getElementById("a_xm").value,
				sfzh : document.getElementById("a_sfzh").value,
				sjh : document.getElementById("a_sjh").value,
				yx : document.getElementById("a_yx").value,
				csrq : document.getElementById("a_csrq").value,
				xb : document.getElementById("a_xb").value,
				jobtitle : document.getElementById("a_jobtitle").value,
				time : Math.random()
			},
			success : function(data) {
				var t = eval(data);
				right(t.msg);
			},
			error : function(data) {
				var t = eval(data);
				noRight(t.msg);
			}
		});
	}
	function edit(id) {//修改按钮方法
		document.getElementById("eid").value=id;
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "editUser",
            data: {
                id: id,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
                document.getElementById("e_usercode").value = t.rows[0]["loginname"]==undefined?"":t.rows[0]["loginname"];
                document.getElementById("e_xm").value = t.rows[0]["xm"]==undefined?"":t.rows[0]["xm"];
                document.getElementById("e_sfzh").value = t.rows[0]["sfzh"]==undefined?"":t.rows[0]["sfzh"];
                document.getElementById("e_sjh").value = t.rows[0]["sjh"]==undefined?"":t.rows[0]["sjh"];
                document.getElementById("e_yx").value = t.rows[0]["yx"]==undefined?"":t.rows[0]["yx"];
                document.getElementById("e_csrq").value = t.rows[0]["csrq"]==undefined?"":t.rows[0]["csrq"];
                document.getElementById("e_xb").value = t.rows[0]["xb"]==undefined?"":t.rows[0]["xb"];
                document.getElementById("e_jobtitle").value = t.rows[0]["jobtitle"]==undefined?"":t.rows[0]["jobtitle"];
                selChange("e_xb");
    			$('#editModel').modal();
            }
        });
	}
	function doEdit(){//修改保存方法
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		 var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		 var myreg2 = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
			if(document.getElementById("e_usercode").value==""){
			noRight("请输入登录名称!");return false;
		}else if(document.getElementById("e_sjh").value==""){
			noRight("请输入手机号!");return false;
		}else if(document.getElementById("e_yx").value==""){
			noRight("请输入邮箱!");return false;
		}else if(document.getElementById("e_csrq").value==""){
			noRight("请选择出生日期!");return false;
		}else if (!myreg.test(document.getElementById("e_sjh").value))
        {
			noRight("请输入有效的手机号");return false;
        }else if (!myreg1.test(document.getElementById("e_yx").value))
        {
        	noRight("请输入有效的邮箱");return false;
        }else if (!myreg2.test(document.getElementById("e_sfzh").value))
        {
        	noRight("请输入有效的身份证号");return false;
        }
        else if (document.getElementById("e_jobtitle").value=="")
        {
        	noRight("请输入职称");return false;
        }
		if (document.getElementById("e_password").value!="")
		{
	if(!/^\w{4,20}$/.test(document.getElementById("e_password").value)){
		swal({
			title : "",
			text : "密码长度必须是6~20之间",
			type : "",
			showCancelButton : false,
			closeOnConfirm : false,
			showLoaderOnConfirm : true
		});
		return false;
	}
}
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "${ctx}/user/updateUser",
            data: {
                id: document.getElementById("eid").value,
                loginname : document.getElementById("e_usercode").value,
                password : document.getElementById("e_password").value,
				xm : document.getElementById("e_xm").value,
				sfzh : document.getElementById("e_sfzh").value,
				sjh : document.getElementById("e_sjh").value,
				yx : document.getElementById("e_yx").value,
				csrq : document.getElementById("e_csrq").value,
				xb : document.getElementById("e_xb").value,
				jobtitle : document.getElementById("e_jobtitle").value,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	right(t.msg);
            },
            error:function(data){
            	noRight(t.msg);
            }
        });
	}	
	function show(id){
		document.getElementById("eid").value=id;
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "editUser",
            data: {
                id: id,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
                document.getElementById("s_usercode").value = t.rows[0]["loginname"]==undefined?"":t.rows[0]["loginname"];
                document.getElementById("s_xm").value = t.rows[0]["xm"]==undefined?"":t.rows[0]["xm"];
                document.getElementById("s_sfzh").value = t.rows[0]["sfzh"]==undefined?"":t.rows[0]["sfzh"];
                document.getElementById("s_sjh").value = t.rows[0]["sjh"]==undefined?"":t.rows[0]["sjh"];
                document.getElementById("s_yx").value = t.rows[0]["yx"]==undefined?"":t.rows[0]["yx"];
                document.getElementById("s_csrq").value = t.rows[0]["csrq"]==undefined?"":t.rows[0]["csrq"];
                document.getElementById("s_xb").value = t.rows[0]["xb"]==undefined?"":t.rows[0]["xb"];
                document.getElementById("s_jobtitle").value = t.rows[0]["jobtitle"]==undefined?"":t.rows[0]["jobtitle"];
    			$('#showModel').modal();
            }
        });
	}
	$("input[name='dataCon']").datetimepicker({
		language: 'zh-CN',
		format : 'yyyy-mm-dd',
		autoclose : true,
		timepicker : false, //关闭时间选项
		startView : 2,
		minView : 3,
		todayHighlight : true
	});
	function role(id){
		document.getElementById("eid").value=id;
		var qxck=document.getElementsByName("qxck");
		for(var i=0;i<qxck.length;i++){
			qxck[i].checked="";
		}
		document.getElementById("qxdiv").innerHTML="";
		$.ajax({
           cache: false,
           type: "post",
           dataType: "Json",
           url: "editUserRole",
           data: {
               id: id,
               time: Math.random()
           },
           success: function (data)
           {
           	var t = eval(data);
					for(var i=0;i<t.rows.length;i++){
						if(t.rows[i].bz=="true"){
							document.getElementById("qxdiv").innerHTML+="<input type=\"checkbox\" name=\"qxck\" id=\""+t.rows[i].role_id+"\" value=\""+t.rows[i].role_id+"\" style=\"margin-left: 20px;\" checked=\"checked\"><label>"+t.rows[i].role_name+"</label>";
						}else{
							document.getElementById("qxdiv").innerHTML+="<input type=\"checkbox\" name=\"qxck\" id=\""+t.rows[i].role_id+"\" value=\""+t.rows[i].role_id+"\" style=\"margin-left: 20px;\"><label>"+t.rows[i].role_name+"</label>";
						}
					}
   			$('#roleModel').modal();
           }
	});
	}
	function doRole(){//修改保存方法
		var s="";
		var qxck=document.getElementsByName("qxck");
		for(var i=0;i<qxck.length;i++){
			if(qxck[i].checked==true){
				if(s==""){
					s=qxck[i].value;
				}else{
					s=s+","+qxck[i].value;
				}
			}			
		}
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "updateUser",
            data: {
                id: document.getElementById("eid").value,
                roles : s,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	right("设置成功!");
            },
            error:function(data){
            	right("设置失败!");
            }
        });
	}
	function doOut(tblname){//导出方法
		var s=" and (roles<>'jggly' and roles<>'admin' and roles<>'maxrole') or roles is null";
	
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "doExportExcel",
            data: {
            	tblName:tblname,
            	keyword:s,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	location.href="${ctx}/"+t.filename;            	
            	//right("导出成功!");
            },
            error:function(data){
            	right("导出失败!");
            }
        });
	}	
	function dr(){
		document.getElementById("copanyLogo").value="";
		$('#drModel').modal();
	}
	function doDr(){//导出方法
		var s="";
	
		$.ajaxFileUpload({
			secureuri: false, //是否需要安全协议，一般设置为false  
		    fileElementId: 'drName', //文件上传域的ID  
		    dataType: 'text', //返回值类型 一般设置为json       
            data: {
            	tblName:"s_rbac_user",
            	//filename:document.getElementById("drName").value,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	
            	//location.href="${ctx}/"+t.filename;            	
            	right("导入成功!");
            },
            error:function(data){
            	right("导入失败!");
            }
        });
	}	
    function ajaxFileUpload(){  
        //执行上传文件操作的函数  
        $.ajaxFileUpload({  
        url:'${ctx }/user/doImportExcel',  //上传机构id
        secureuri:false,                           //是否启用安全提交,默认为false   
        fileElementId:'copanyLogo',               //文件选择框的id属性  
        dataType:'json',                           //服务器返回的格式,选择json或者xml貌似有问题
        type:'post',
        success:function(data){            //服务器响应成功时的处理函数  
        	var t = eval(data);
        	if(parseInt(data.result)>0){
        	document.getElementById("copanyLogo").value="";
        	right("导入成功!"); 
        }else{
        	right("导入失败!");
        }
        },  
        error:function(data, status, e){ //服务器响应失败时的处理函数  
        	var t = eval(data);
        	right("导入报错!");
        }  
        });  
    }  
	</script>
</body>
</html>
