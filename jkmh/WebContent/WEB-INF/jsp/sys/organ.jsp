<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ page import="com.alibaba.fastjson.*"%>
<%@ page import="org.soft.erp.domain.*"%>
<%@page import="org.soft.erp.domain.jggly.User"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
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
	href="${ctx}/jiankang/js/plugins/datetimepicker/css/bootstrap-datetimepicker.css"
	rel="stylesheet"
>
</head>
<body
	class="gray-bg"
	onload="load()"
>
	<%
		User u = (User) session.getAttribute("user_session");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS ");
	%>
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
						<td><i class="fa fa-table"></i> <lable class="pathtitle">租户管理
							>> 机构管理</lable></td>
					</tr>
					<tr>
						<form>
							<td
								class="font3"
								style="text-align: right;vertical-align: middle;"
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
								id="<%=enname%>" onchange='selChange("<%=enname%>")'
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
								type="button"
								value="筛选"
								class="btn btn-outline btn-default"
								onclick="sx()"
							/>
							</td>
						</form>
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
							onclick="add()"
						/> <input
							id="b-del"
							type="button"
							value="删除"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;"
							onclick="del('${ctx}/sys/deleteOrgan','organ')"
						/>
<input
							id="b-del"
							type="button"
							value="同步"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;"
							onclick="tb()"
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
						>新增</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 19px; padding-right: 19px; background-color: f3f3f4;"
								> 机构ID</span> <input
									id="a_companyId"
									type="text"
									class="form-control"
									placeholder="请输入新的机构ID"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 机构代码</span> <input
									id="a_jcode"
									type="text"
									class="form-control"
									placeholder="请输入新的机构代码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 机构编码</span> <input
									id="a_jgbm"
									type="text"
									class="form-control"
									placeholder="请输入新的机构编码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 机构名称</span> <input
									id="a_companyName"
									type="text"
									class="form-control"
									placeholder="请输入新的机构名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 5px; padding-right: 5px; background-color: f3f3f4;"
								> 机构短名称</span> <input
									id="a_companySName"
									type="text"
									class="form-control"
									placeholder="请输入新的机构短名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 地址</span> <input
									id="a_address"
									type="text"
									class="form-control"
									placeholder="请输入新的地址"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 电话</span> <input
									id="a_mobile"
									type="text"
									class="form-control"
									placeholder="请输入新的电话"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 邮编</span> <input
									id="a_postcode"
									type="text"
									class="form-control"
									placeholder="请输入新的邮编"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 邮箱</span> <input
									id="a_email"
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
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 评估审核</span> <select
									class="form-control single-line"
									id="a_pgsh"
								>
									<option value="自动">自动</option>
									<option value="人工" selected="selected">人工</option>
								</select>
							</div>
						</div>	
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 服务审核</span> <select
									class="form-control single-line"
									id="a_fwsh"
								>
									<option value="自动">自动</option>
									<option value="人工" selected="selected">人工</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 备注</span>
								<textarea
									class="form-control"
									id="a_remark"
									rows="5"
									placeholder="请输入新的备注"
								></textarea>
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
						>修改</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 机构编码</span> <input
									id="e_jgbm"
									type="text"
									class="form-control"
									placeholder="请输入新的机构编码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 机构名称</span> <input
									id="e_companyName"
									type="text"
									class="form-control"
									placeholder="请输入新的机构名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 5px; padding-right: 5px; background-color: f3f3f4;"
								> 机构短名称</span> <input
									id="e_companySName"
									type="text"
									class="form-control"
									placeholder="请输入新的机构短名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 地址</span> <input
									id="e_address"
									type="text"
									class="form-control"
									placeholder="请输入新的地址"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 电话</span> <input
									id="e_mobile"
									type="text"
									class="form-control"
									placeholder="请输入新的电话"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 邮编</span> <input
									id="e_postcode"
									type="text"
									class="form-control"
									placeholder="请输入新的邮编"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 邮箱</span> <input
									id="e_email"
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
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 评估审核</span> <select
									class="form-control single-line"
									id="e_pgsh"
								>
									<option value="自动">自动</option>
									<option value="人工">人工</option>
								</select>
							</div>
						</div>	
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 服务审核</span> <select
									class="form-control single-line"
									id="e_fwsh"
								>
									<option value="自动">自动</option>
									<option value="人工">人工</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 备注</span>
								<textarea
									class="form-control"
									id="e_remark"
									rows="5"
									placeholder="请输入新的备注"
								></textarea>
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
						>查看</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 19px; padding-right: 19px; background-color: f3f3f4;"
								> 机构ID</span> <input
									id="s_companyId"
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
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 机构编码</span> <input
									id="s_jgbm"
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
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 机构名称</span> <input
									id="s_companyName"
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
									style="font-weight: bolder; padding-left:5px; padding-right: 5px; background-color: f3f3f4;"
								> 机构短名称</span> <input
									id="s_companySName"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 地址</span> <input
									id="s_address"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 电话</span> <input
									id="s_mobile"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 邮编</span> <input
									id="s_postcode"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 邮箱</span> <input
									id="s_email"
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
								> 评估审核</span> <input
									id="s_pgsh"
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
								> 服务审核</span> <input
									id="s_fwsh"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 备注</span>
								<textarea
									class="form-control"
									id="s_remark"
									rows="5"
									readonly="readonly"
								></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
							<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 大LOGO</span>
							<img id="s_logo" src=""  width="220" height="100">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
							<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 小LOGO</span>
							<img id="s_logo1" src=""  width="70" height="99">
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
							onclick="doSx('updateSearchColumn','organ')"
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
		<input
			type="hidden"
			id="eid"
		>
	</form>
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
					>导入LOGO</span>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group">
							<input
								type="hidden"
								name="flag" class="form-control"
								value="2"
							> <input
								id="copanyLogo"
								type="file"
								name="files"
								class="form-control"
								style="width:400px;"
							/><input
								type="button"
								id="button1"
								name="button1"
								style="margin-left: 10px;"
								value="上传大LOGO"
								class="btn btn-outline btn-default"
								onclick="ajaxFileUpload()"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<input
								type="hidden"
								name="flag" class="form-control"
								value="2"
							> <input
								id="copanyLogo1"
								type="file"
								name="files"
								class="form-control"
								style="width:400px;"
							/><input
								type="button"
								id="button2"
								name="button2"
								style="margin-left: 10px;"
								value="上传小LOGO"
								class="btn btn-outline btn-default"
								onclick="ajaxFileUpload1()"
							/>
						</div>
					</div>
					<div class="form-group">
						<div
							class="input-group"
							id="result"
						></div>
					</div>
					<input
						type="hidden"
						id="drId1"
					>
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
	<!--导入弹窗结束 -->
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
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
	<script type="text/javascript">
	var t="";
	function load(){
		t=sxstr('<%=controls%>');		
	}
	$('#rsTab').bootstrapTable({
		url: 'selectOrgan', //请求后台的URL（*）
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
				$.post("updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=organ",arguments[0]);
	        },
	        queryParams: 
				function queryParams(params) {
	        	load();
		        	return {
		            NAME:params.search, //开启自带查询后输入的值
		            ISDEL:0,
		            pageSize:  this.pageSize, //分页条数
		            pageNumber: this.pageNumber, //当前页数
		            sortOrder: this.sortOrder, //当前页数
		            field: this.sortName,//当前页数
		            keyword:encodeURI(t),
		            fieldString:"organ"
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
			}, 
	        {
	            title: '操作',
	            align: 'center',
				  switchable:false,
					width:"80",
	            formatter:function(value,row,index){  
	            	var d = '<a href="#" mce_href="#" onclick="show(\''+ row.id +'\')"><img title="查看" src="${ctx}/images/prev.gif" /></a> '; 
	                 var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id +'\')"><img title="修改" src="${ctx}/images/update.gif" /></a> '; 
	                 var f = '<a href="#" mce_href="#" onclick="up(\''+ row.jcode +'\')"><img title="上传" src="${ctx}/images/StatBar_admin.gif" width="15" height="15" onerror="nofind();"/></a> ';  
	              return d+e+f;  
			   } }	, 
			${fields}		
			]
		});		
	
	function nofind(){

		var img=event.srcElement;

		img.src="${ctx}/images/StatBar_admin.gif";

		img.onerror=null; 控制不要一直跳动

		}
	
	
	function edit(id) {//修改按钮方法
		document.getElementById("eid").value=id;
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "editOrgan",
            data: {
                id: id,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
                document.getElementById("e_companyName").value = t.rows[0]["companyName"]==undefined?"":t.rows[0]["companyName"];
                document.getElementById("e_companySName").value = t.rows[0]["companySName"]==undefined?"":t.rows[0]["companySName"];
                document.getElementById("e_address").value = t.rows[0]["address"]==undefined?"":t.rows[0]["address"];
                document.getElementById("e_mobile").value = t.rows[0]["mobile"]==undefined?"":t.rows[0]["mobile"];
                document.getElementById("e_postcode").value = t.rows[0]["postcode"]==undefined?"":t.rows[0]["postcode"];
                document.getElementById("e_email").value = t.rows[0]["email"]==undefined?"":t.rows[0]["email"];
                document.getElementById("e_remark").value = t.rows[0]["remark"]==undefined?"":t.rows[0]["remark"];
                document.getElementById("e_jgbm").value = t.rows[0]["jgbm"]==undefined?"":t.rows[0]["jgbm"];
                document.getElementById("e_pgsh").value = t.rows[0]["pgsh"]==undefined?"":t.rows[0]["pgsh"];
                document.getElementById("e_fwsh").value = t.rows[0]["fwsh"]==undefined?"":t.rows[0]["fwsh"];
    			$('#editModel').modal();
            }
        });
	}
	function doEdit(){//修改保存方法
		 var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		 if(document.getElementById("e_companyName").value==""){
			noRight("请输入机构名称!");return false;
		}else if(document.getElementById("e_companySName").value==""){
			noRight("请输入机构短名称!");return false;
		}else if(document.getElementById("e_jgbm").value==""){
			noRight("请输入机构编码!");return false;
		}else if (!myreg1.test(document.getElementById("e_email").value))
        {
        	noRight("请输入有效的邮箱");return false;
        }
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "${ctx}/sys/updateOrgan",
            data: {
                id: document.getElementById("eid").value,
                companyName:document.getElementById("e_companyName").value,
                companySName:document.getElementById("e_companySName").value,
            	address:document.getElementById("e_address").value,
            	mobile:document.getElementById("e_mobile").value,
            	postcode:document.getElementById("e_postcode").value,
            	remark:document.getElementById("e_remark").value,
            	email:document.getElementById("e_email").value,
            	jgbm:document.getElementById("e_jgbm").value,
            	pgsh:document.getElementById("e_pgsh").value,
            	fwsh:document.getElementById("e_fwsh").value,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	right(t.msg);
            },
            error:function(data){
            	var t = eval(data);
            	noRight(t.msg);
            }
        });
	}		
	
		function add() {//新增按钮方法
			document.getElementById("a_companyName").value="";
			document.getElementById("a_companySName").value="";
			document.getElementById("a_address").value="";
			document.getElementById("a_mobile").value="";
			document.getElementById("a_postcode").value="";
			document.getElementById("a_email").value="";
			document.getElementById("a_remark").value="";
			document.getElementById("a_jgbm").value="";
			document.getElementById("a_companyId").value="";
			document.getElementById("a_jcode").value="";
			$('#addModel').modal();
		}
		function doAdd(){//新增保存方法		
			var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if(document.getElementById("a_companyId").value==""){
				noRight("请输入机构ID!");return false;
			}else if(document.getElementById("a_companyName").value==""){
				noRight("请输入机构名称!");return false;
			}else if(document.getElementById("a_companySName").value==""){
				noRight("请输入机构短名称!");return false;
			}else if(document.getElementById("a_jgbm").value==""){
				noRight("请输入机构编码!");return false;
			}else if (!myreg1.test(document.getElementById("a_email").value))
	        {
	        	noRight("请输入有效的邮箱");return false;
	        }
			var creator="<%=u.getLoginname()%>";
		    var createDate="<%=sdf.format(new Date())%>"; 
			$('#addModel').modal('hide');	
			$.ajax({
                cache: false,
                type: "post",
                dataType: "Json",
                url: "${ctx}/sys/insertOrgan",
                data: {
                	companyName:document.getElementById("a_companyName").value,
                	companySName:document.getElementById("a_companySName").value,
                	address:document.getElementById("a_address").value,
                	mobile:document.getElementById("a_mobile").value,
                	postcode:document.getElementById("a_postcode").value,
                	remark:document.getElementById("a_remark").value,
                	email:document.getElementById("a_email").value,
                	jcode:document.getElementById("a_jcode").value,
                	companyId:document.getElementById("a_companyId").value,
                	pgsh:document.getElementById("a_pgsh").value,
                	fwsh:document.getElementById("a_fwsh").value,
                	jgbm:document.getElementById("a_jgbm").value,
                	creator:creator,
                	createDate:createDate,
                    time: Math.random()
                },
                success: function (data)
                {
	            	var t = eval(data);
	            	right(t.msg);
                },
                error:function(data){
	            	var t = eval(data);
	            	noRight(t.msg);
                }
            });
		}
		function show(id){
			document.getElementById("eid").value=id;
			var url='<%=session.getAttribute("url")%>';
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "editOrgan",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("s_companyName").value = t.rows[0]["companyName"]==undefined?"":t.rows[0]["companyName"];
	                document.getElementById("s_companySName").value = t.rows[0]["companySName"]==undefined?"":t.rows[0]["companySName"];
	                document.getElementById("s_address").value = t.rows[0]["address"]==undefined?"":t.rows[0]["address"];
	                document.getElementById("s_mobile").value = t.rows[0]["mobile"]==undefined?"":t.rows[0]["mobile"];
	                document.getElementById("s_postcode").value = t.rows[0]["postcode"]==undefined?"":t.rows[0]["postcode"];
	                document.getElementById("s_email").value = t.rows[0]["email"]==undefined?"":t.rows[0]["email"];
	                document.getElementById("s_remark").value = t.rows[0]["remark"]==undefined?"":t.rows[0]["remark"];
	                document.getElementById("s_jgbm").value = t.rows[0]["jgbm"]==undefined?"":t.rows[0]["jgbm"];
	                document.getElementById("s_companyId").value = t.rows[0]["companyId"]==undefined?"":t.rows[0]["companyId"];
	                document.getElementById("s_logo").src = t.rows[0]["jcode"]==undefined?"":(url+"images/logo/"+t.rows[0]["jcode"]+"_b.png");
	                document.getElementById("s_logo1").src = t.rows[0]["jcode"]==undefined?"":(url+"images/logo/"+t.rows[0]["jcode"]+"_b1.png");
	                document.getElementById("s_pgsh").value = t.rows[0]["pgsh"]==undefined?"":t.rows[0]["pgsh"];
	                document.getElementById("s_fwsh").value = t.rows[0]["fwsh"]==undefined?"":t.rows[0]["fwsh"];
	                $('#showModel').modal();
	            }
	        });
		}
		function up(id){
			document.getElementById("copanyLogo").value="";
			document.getElementById("copanyLogo1").value="";
			document.getElementById("result").innerHTML="";
			document.getElementById("drId1").value=id;
			$('#drModel').modal();
		}
		function tb(){
			swal({
				title : "",
				text : "确认要同机构信息么?",
				type : "",
				showCancelButton : true,
				closeOnConfirm : false,
				showLoaderOnConfirm : true,
			}, function() {	
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/sys/tbOrgan",
	            data: {
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                right("同步成功");
	            },
                error:function(data){
	            	var t = eval(data);
	            	right("同步失败");
                }
	        });
			})
		}
	</script>
	<script
		type="text/javascript"
		src="${ctx }/js/ajaxfileupload.js"
	></script>
	<script type="text/javascript">  
    function ajaxFileUpload(){  
    	document.getElementById("result").innerHTML="";
        //执行上传文件操作的函数  
        $.ajaxFileUpload({  
        url:'${ctx }/common/addLogo?title='+document.getElementById("drId1").value+'_b&companyId='+document.getElementById("drId1").value,  //上传机构id
        secureuri:false,                           //是否启用安全提交,默认为false   
        fileElementId:'copanyLogo',               //文件选择框的id属性  
        dataType:'json',                           //服务器返回的格式,选择json或者xml貌似有问题
        type:'post',
        success:function(data){            //服务器响应成功时的处理函数  
        	$('#result').html("图片上传成功<br/>");   
        	document.getElementById("copanyLogo").value="";
			document.getElementById("copanyLogo1").value="";
        },  
        error:function(data, status, e){ //服务器响应失败时的处理函数  
            $('#result').html('图片上传失败，请重试！！');  
        }  
        });  
    }  
    function ajaxFileUpload1(){  
    	document.getElementById("result").innerHTML="";
        //执行上传文件操作的函数  
        $.ajaxFileUpload({  
        url:'${ctx }/common/addLogo1?title='+document.getElementById("drId1").value+'_b1&companyId='+document.getElementById("drId1").value,  //上传机构id
        secureuri:false,                           //是否启用安全提交,默认为false   
        fileElementId:'copanyLogo1',               //文件选择框的id属性  
        dataType:'json',                           //服务器返回的格式,选择json或者xml貌似有问题
        type:'post',
        success:function(data){            //服务器响应成功时的处理函数  
        	$('#result').html("图片上传成功<br/>");   
        	document.getElementById("copanyLogo").value="";
			document.getElementById("copanyLogo1").value="";
        },  
        error:function(data, status, e){ //服务器响应失败时的处理函数  
            $('#result').html('图片上传失败，请重试！！');  
        }  
        });  
    } 

	$("input[name ='dataCon']").datetimepicker({
		language: 'zh-CN',
		format : 'yyyy-mm-dd',
		autoclose : true,
		timepicker : false, //关闭时间选项
		startView : 2,
		minView : 3,
		todayHighlight : true
	});
</script>
</body>
</html>
