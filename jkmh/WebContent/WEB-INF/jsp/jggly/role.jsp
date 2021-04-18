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
						<td><i class="fa fa-table"></i> <lable class="pathtitle">系统管理
							>> 角色管理</lable></td>
					</tr>
					<tr>
						<form>
							<td
								class="font3"
								style="text-align: right;  vertical-align: middle; "
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
							><span class="Jcxmphicon Jcxmphicon-th"></span></span> - <input
								id="<%=enname%>2"
								name="dataCon"
								class="form-control"
								runat="server"
								type="text"
								placeholder="截止<%=cnname%>"
							/> <span
								class="input-group-addon"
								style="display:none;"
							><span class="Jcxmphicon Jcxmphicon-th"></span></span> <%
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
								style="color:#999999;"
								class="form-control"
								id="<%=enname%>"
								onchange='selChange("<%=enname%>")'
							>
									<option
										style="color:#999999!important;"
										value="<%=enname%>"
									><%=cnname%></option>
									<%
										while (iter.hasNext()) {
														Map.Entry entry = (Map.Entry) iter.next();
														String key = (String) entry.getKey();
														String val = (String) entry.getValue();
														//													System.out.println("kv==  " + key + " " + val);
									%>
									<option
										style="color:#000000!important;"
										value="<%=val%>"
									><%=val%></option>
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
							style="<%=request.getAttribute("addBtn") %>"
							onclick="add()"
						/> <input
							id="b-del"
							type="button"
							value="删除"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;<%=request.getAttribute("delBtn") %>"
							onclick="del('${ctx}/jggly/deletRole','role')"
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
								> 角色代码</span> <input
									id="a_role_id"
									type="text"
									class="form-control"
									placeholder="请输入角色代码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 角色名称</span> <input
									id="a_role_name"
									type="text"
									class="form-control"
									placeholder="请输入新的角色名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								>备注</span> <input
									id="a_bz"
									type="text"
									class="form-control"
									placeholder="请输入新的备注"
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
							class="Jcxmphicon Jcxmphicon-align-center"
							style="color: Silver; font-size: 25px;"
						>修改</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 角色代码</span> <input
									id="e_role_id"
									type="text"
									class="form-control"
									placeholder="请输入角色代码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 角色名称</span> <input
									id="e_role_name"
									type="text"
									class="form-control"
									placeholder="请输入新的角色名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								>备注</span> <input
									id="e_bz"
									type="text"
									class="form-control"
									placeholder="请输入新的备注"
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
								class="Jcxmphicon Jcxmphicon-remove"
								aria-hidden="true"
							></span>关闭
						</button>
						<button
							type="button"
							class="btn btn-primary"
							onclick="doEdit()"
						>
							<span
								class="Jcxmphicon Jcxmphicon-floppy-disk"
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
							class="Jcxmphicon Jcxmphicon-align-center"
							style="color: Silver; font-size: 25px;"
						>查看</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 角色代码</span> <input
									id="s_role_id"
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
								> 角色名称</span> <input
									id="s_role_name"
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
								>备注</span> <input
									id="s_bz"
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
								class="Jcxmphicon Jcxmphicon-remove"
								aria-hidden="true"
							></span>关闭
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--查看弹窗结束 -->
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
						<div
							class="form-group"
							style="height:400px; overflow-y:auto;"
						>
							<div
								class="input-group"
								style=""
							>
								<table
									style="width:500px;"
									border="1"
								>
									<tr>
										<td
											style="text-align:center;background-color:silver;width:250px;"
										><label>模块名称 </label></td>
										<td
											style="text-align:center;background-color:silver;width:150px;"
										><label>菜单 </label> <input
											type="checkbox"
											id="CbtnTile"
											onchange="checkTile()"
										></td>
										<td
											style="text-align:center;background-color:silver;width:100px;"
										><label>功能 </label> <input
											type="checkbox"
											id="Cbtn"
											onchange="checkAll()"
										></td>
									</tr>
									<tr>
										<td
											rowspan="25"
											style="text-align:center;"
										><label>系统管理</label></td>
										<td style="text-align:center;"><label>首页</label> <input
											type="checkbox"
											name="qxck"
											id="05-00"
											value="05-00"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									
									<tr>
										<td
											rowspan="3"
											style="text-align:center;"
										><label>机构管理</label> <input
											type="checkbox"
											name="qxck"
											id="05-09"
											value="05-09"
										></td>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="05-09-001"
											value="05-09-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>上传</label> <input
											type="checkbox"
											name="qxck"
											id="05-09-002"
											value="05-09-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>同步</label> <input
											type="checkbox"
											name="qxck"
											id="05-09-003"
											value="05-09-003"
										></td>
									</tr>
									<tr>
										<td
											rowspan="5"
											style="text-align:center;"
										><label>角色管理</label> <input
											type="checkbox"
											name="qxck"
											id="05-01"
											value="05-01"
										></td>
										<td style="text-align:center;"><label>增加</label> <input
											type="checkbox"
											name="qxck"
											id="05-01-001"
											value="05-01-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="05-01-002"
											value="05-01-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="05-01-003"
											value="05-01-003"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>权限</label> <input
											type="checkbox"
											name="qxck"
											id="05-01-004"
											value="05-01-004"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>字段</label> <input
											type="checkbox"
											name="qxck"
											id="05-01-005"
											value="05-01-005"
										></td>
									</tr>
									<tr>
										<td
											rowspan="6"
											style="text-align:center;"
										><label>用户管理</label> <input
											type="checkbox"
											name="qxck"
											id="05-02"
											value="05-02"
										></td>
										<td style="text-align:center;"><label>增加</label> <input
											type="checkbox"
											name="qxck"
											id="05-02-001"
											value="05-02-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="05-02-002"
											value="05-02-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="05-02-003"
											value="05-02-003"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>导入</label> <input
											type="checkbox"
											name="qxck"
											id="05-02-004"
											value="05-02-004"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>导出</label> <input
											type="checkbox"
											name="qxck"
											id="05-02-005"
											value="05-02-005"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>角色</label> <input
											type="checkbox"
											name="qxck"
											id="05-02-006"
											value="05-02-006"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>充值统计</label> <input
											type="checkbox"
											name="qxck"
											id="05-03"
											value="05-03"
										></td>
										<td style="text-align:center;"><label>充值</label> <input
											type="checkbox"
											name="qxck"
											id="05-03-001"
											value="05-03-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>消息发送统计</label> <input
											type="checkbox"
											name="qxck"
											id="05-04"
											value="05-04"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>评估分配</label> <input
											type="checkbox"
											name="qxck"
											id="05-05"
											value="05-05"
										></td>
										<td style="text-align:center;"><label>分配</label> <input
											type="checkbox"
											name="qxck"
											id="05-05-001"
											value="05-05-001"
										></td>
									</tr>
									<tr>
										<td
											rowspan="3"
											style="text-align:center;"
										><label>收费项目管理</label> <input
											type="checkbox"
											name="qxck"
											id="05-06"
											value="05-06"
										></td>
										<td style="text-align:center;"><label>增加</label> <input
											type="checkbox"
											name="qxck"
											id="05-06-001"
											value="05-06-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="05-06-002"
											value="05-06-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="05-06-003"
											value="05-06-003"
										></td>
									</tr>
									<tr>
										<td
											rowspan="3"
											style="text-align:center;"
										><label>结论词管理</label> <input
											type="checkbox"
											name="qxck"
											id="05-07"
											value="05-07"
										></td>
										<td style="text-align:center;"><label>增加</label> <input
											type="checkbox"
											name="qxck"
											id="05-07-001"
											value="05-07-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="05-07-002"
											value="05-07-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="05-07-003"
											value="05-07-003"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>日志管理</label> <input
											type="checkbox"
											name="qxck"
											id="05-08"
											value="05-08"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									<tr>
										<td
											rowspan="7"
											style="text-align:center;"
										><label>健康评估</label></td>
										<td style="text-align:center;"><label>首页</label> <input
											type="checkbox"
											name="qxck"
											id="01-01"
											value="01-01"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									<tr>
										<td
											rowspan="2"
											style="text-align:center;"
										><label>评估业务</label> <input
											type="checkbox"
											name="qxck"
											id="01-02"
											value="01-02"
										></td>
										<td style="text-align:center;"><label>锁定</label> <input
											type="checkbox"
											name="qxck"
											id="01-02-001"
											value="01-02-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>解锁</label> <input
											type="checkbox"
											name="qxck"
											id="01-02-002"
											value="01-02-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>评估统计</label> <input
											type="checkbox"
											name="qxck"
											id="01-03"
											value="01-03"
										></td>
										<td style="text-align:center;">&nbsp; <!-- 										<label>阳性</label> <input -->
											<!-- 											type="checkbox" --> <!-- 											name="qxck" -->
											<!-- 											id="01-03-001" --> <!-- 											value="01-03-001" -->
											<!-- 										> -->
										</td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>我的评估</label> <input
											type="checkbox"
											name="qxck"
											id="01-04"
											value="01-04"
										></td>
										<td style="text-align:center;"><label>审核</label> <input
											type="checkbox"
											name="qxck"
											id="01-04-001"
											value="01-04-001"
										></td>
									</tr>
									<tr>
										<td
											rowspan="2"
											style="text-align:center;"
										><label>复查管理</label> <input
											type="checkbox"
											name="qxck"
											id="01-05"
											value="01-05"
										></td>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="01-05-001"
											value="01-05-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>发送</label> <input
											type="checkbox"
											name="qxck"
											id="01-05-002"
											value="01-05-002"
										></td>
									</tr>
									<tr>
										<td
											rowspan="6"
											style="text-align:center;"
										><label>健康服务</label></td>
										<td style="text-align:center;"><label>首页</label> <input
											type="checkbox"
											name="qxck"
											id="02-01"
											value="02-01"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									<tr>
										<td
											rowspan="2"
											style="text-align:center;"
										><label>促进服务</label> <input
											type="checkbox"
											name="qxck"
											id="02-02"
											value="02-02"
										></td>
										<td style="text-align:center;"><label>锁定</label> <input
											type="checkbox"
											name="qxck"
											id="02-02-001"
											value="02-02-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>解锁</label> <input
											type="checkbox"
											name="qxck"
											id="02-02-002"
											value="02-02-002"
										></td>
									</tr>
									<tr>
										<td
											rowspan="1"
											style="text-align:center;"
										><label>服务统计</label> <input
											type="checkbox"
											name="qxck"
											id="02-03"
											value="02-03"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>我的服务</label> <input
											type="checkbox"
											name="qxck"
											id="02-04"
											value="02-04"
										></td>
										<td style="text-align:center;"><label>服务</label> <input
											type="checkbox"
											name="qxck"
											id="02-04-001"
											value="02-04-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>达标统计</label> <input
											type="checkbox"
											name="qxck"
											id="02-05"
											value="02-05"
										></td>
										<td style="text-align:center;">&nbsp;</td>
									</tr>
									<tr>
										<td
											rowspan="10"
											style="text-align:center;"
										><label>报告管理</label></td>
										<td style="text-align:center;"><label>首页</label> <input
											type="checkbox"
											name="qxck"
											id="03-01"
											value="03-01"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									<tr>
										<td
											rowspan="3"
											style="text-align:center;"
										><label>消息主题</label> <input
											type="checkbox"
											name="qxck"
											id="03-02"
											value="03-02"
										></td>
										<td style="text-align:center;"><label>增加</label> <input
											type="checkbox"
											name="qxck"
											id="03-02-001"
											value="03-02-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="03-02-002"
											value="03-02-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="03-02-003"
											value="03-02-003"
										></td>
									</tr>
									<tr>
										<td
											rowspan="2"
											style="text-align:center;"
										><label>报告管理</label> <input
											type="checkbox"
											name="qxck"
											id="03-03"
											value="03-03"
										></td>
										<td style="text-align:center;"><label>打印</label> <input
											type="checkbox"
											name="qxck"
											id="03-03-001"
											value="03-03-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>导出</label> <input
											type="checkbox"
											name="qxck"
											id="03-03-002"
											value="03-03-002"
										></td>
									</tr>
									<tr>
										<td
											rowspan="2"
											style="text-align:center;"
										><label>领取管理</label> <input
											type="checkbox"
											name="qxck"
											id="03-04"
											value="03-04"
										></td>
										<td style="text-align:center;"><label>打印</label> <input
											type="checkbox"
											name="qxck"
											id="03-04-001"
											value="03-04-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>导出</label> <input
											type="checkbox"
											name="qxck"
											id="03-04-002"
											value="03-04-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>消息管理</label> <input
											type="checkbox"
											name="qxck"
											id="03-05"
											value="03-05"
										></td>
										<td style="text-align:center;"><label>发送</label> <input
											type="checkbox"
											name="qxck"
											id="03-05-001"
											value="03-05-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>统计</label> <input
											type="checkbox"
											name="qxck"
											id="03-06"
											value="03-06"
										></td>
										<td style="text-align:center;"><label>导出</label> <input
											type="checkbox"
											name="qxck"
											id="03-06-001"
											value="03-06-001"
										></td>
									</tr>
									<tr>
										<td
											rowspan="13"
											style="text-align:center;"
										><label>营销管理</label></td>
										<td style="text-align:center;"><label>首页</label> <input
											type="checkbox"
											name="qxck"
											id="04-01"
											value="04-01"
										></td>
										<td style="text-align:center;"></td>
									</tr>
									<tr>
										<td
											rowspan="3"
											style="text-align:center;"
										><label>主题管理</label> <input
											type="checkbox"
											name="qxck"
											id="04-02"
											value="04-02"
										></td>
										<td style="text-align:center;"><label>增加</label> <input
											type="checkbox"
											name="qxck"
											id="04-02-001"
											value="04-02-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="04-02-002"
											value="04-02-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="04-02-003"
											value="04-02-003"
										></td>
									</tr>
									<tr>
										<td
											rowspan="4"
											style="text-align:center;"
										><label>群组管理</label> <input
											type="checkbox"
											name="qxck"
											id="04-03"
											value="04-03"
										></td>
										<td style="text-align:center;"><label>增加</label> <input
											type="checkbox"
											name="qxck"
											id="04-03-001"
											value="04-03-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>修改</label> <input
											type="checkbox"
											name="qxck"
											id="04-03-002"
											value="04-03-002"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>删除</label> <input
											type="checkbox"
											name="qxck"
											id="04-03-003"
											value="04-03-003"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>配置</label> <input
											type="checkbox"
											name="qxck"
											id="04-03-004"
											value="04-03-004"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>复查提醒</label> <input
											type="checkbox"
											name="qxck"
											id="04-04"
											value="04-04"
										></td>
										<td style="text-align:center;"><label>发送</label> <input
											type="checkbox"
											name="qxck"
											id="04-04-001"
											value="04-04-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>体检营销</label> <input
											type="checkbox"
											name="qxck"
											id="04-05"
											value="04-05"
										></td>
										<td style="text-align:center;"><label>新增</label> <input
											type="checkbox"
											name="qxck"
											id="04-05-001"
											value="04-05-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>待发统计</label> <input
											type="checkbox"
											name="qxck"
											id="04-06"
											value="04-06"
										></td>
										<td style="text-align:center;"><label>取消</label> <input
											type="checkbox"
											name="qxck"
											id="04-06-001"
											value="04-06-001"
										></td>
									</tr>
									<tr>
										<td
											rowspan="2"
											style="text-align:center;"
										><label>统计</label> <input
											type="checkbox"
											name="qxck"
											id="04-07"
											value="04-07"
										></td>
										<td style="text-align:center;"><label>导出</label> <input
											type="checkbox"
											name="qxck"
											id="04-07-001"
											value="04-07-001"
										></td>
									</tr>
									<tr>
										<td style="text-align:center;"><label>重发</label> <input
											type="checkbox"
											name="qxck"
											id="04-07-002"
											value="04-07-002"
										></td>
									</tr>
								</table>
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
							onclick="doSx('${ctx}/sys/updateSearchColumn','role')"
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
		<!--字段弹窗开始 -->
		<div
			class="modal fade"
			id="fieldModel"
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
						>显示字段</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<table style="width: 100%;">
								<tr>
									<td style="text-align: left;"><select
										style="color:#999999;width:100%;"
										class="form-control"
										id="fieldSel"
										onchange='fieldSelChange()'
									>
									</select></td>
								</tr>
								<tr>
									<td
										style="text-align: left;"
										id="zdtd"
									></td>
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
							onclick="doField()"
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
		<!--字段弹窗结束 -->
		<input
			type="hidden"
			id="eid"
		>
	</form>
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
	<script>
	var t="";
	function load(){
		t=sxstr('<%=controls%>');
	}
	$('#rsTab').bootstrapTable({
		url: 'selectRole', //请求后台的URL（*）
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
				$.post("${ctx}/sys/updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=role",arguments[0]);
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
		            fieldString:"role"
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
					width:"100",
	            formatter:function(value,row,index){  
	            	var d = '<a href="#" mce_href="#" onclick="show(\''+ row.id +'\')"><img title="查看" src="${ctx}/images/prev.gif" /></a> '; 
	                 var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id +'\')"  style="<%=request.getAttribute("editBtn") %>"><img title="修改" src="${ctx}/images/update.gif" /></a> ';  
	                 var c = '<a href="#" mce_href="#" onclick="role(\''+ row.id +'\')"  style="<%=request.getAttribute("roleBtn") %>"><img title="权限" src="${ctx}/images/StatBar_admin.gif" /></a> '; 
	                 var a = '<a href="#" mce_href="#" onclick="field(\''+ row.id +'\')"  style="<%=request.getAttribute("fieldBtn") %>"><img title="字段" src="${ctx}/images/top_home.gif" /></a> ';  
	                 return d+e+c+a;  
			   } }	, 
			${fields}			
			]
		});			
	
	function edit(id) {//修改按钮方法
		document.getElementById("eid").value=id;
		$.ajax({
           cache: false,
           type: "post",
           dataType: "Json",
           url: "${ctx}/jggly/editRole",
           data: {
               type: "edit",
               id: id,
               time: Math.random()
           },
           success: function (data)
           {
           	var t = eval(data);
            document.getElementById("e_role_id").value = t.rows[0]["role_id"]==undefined?"":t.rows[0]["role_id"];
            document.getElementById("e_role_name").value = t.rows[0]["role_name"]==undefined?"":t.rows[0]["role_name"];
            document.getElementById("e_bz").value = t.rows[0]["bz"]==undefined?"":t.rows[0]["bz"];
   			$('#editModel').modal();
           }
       });
	}
	function doEdit(){//修改保存方法
		if(document.getElementById("e_role_id").value==""){
			noRight("请输入角色代码!");return false;
		}else if(document.getElementById("e_role_name").value==""){
			noRight("请输入角色名称!");return false;
		}
		$.ajax({
           cache: false,
           type: "post",
           dataType: "Json",
           url: "${ctx}/jggly/updateRole",
           data: {
               type: "edit",
               id: document.getElementById("eid").value,
               role_id:document.getElementById("e_role_id").value,
               role_name:document.getElementById("e_role_name").value,
               bz:document.getElementById("e_bz").value,
               time: Math.random()
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
	
		function add() {//新增按钮方法
			document.getElementById("a_role_id").value = "";
			document.getElementById("a_role_name").value = "";
			document.getElementById("a_bz").value = "";
			$('#addModel').modal();
		}
		function doAdd(){//新增保存方法		
			if(document.getElementById("a_role_id").value==""){
				noRight("请输入角色代码!");return false;
			}else if(document.getElementById("a_role_name").value==""){
				noRight("请输入角色名称!");return false;
			}
			$.ajax({
               cache: false,
               type: "post",
               dataType: "Json",
               url: "insertRole",
               data: {
            	   role_id:document.getElementById("a_role_id").value,
                   role_name:document.getElementById("a_role_name").value,
                   bz:document.getElementById("a_bz").value,
                   time: Math.random()
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
		function show(id){
			document.getElementById("eid").value=id;
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "editRole",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("s_role_id").value = t.rows[0]["role_id"]==undefined?"":t.rows[0]["role_id"];
	                document.getElementById("s_role_name").value = t.rows[0]["role_name"]==undefined?"":t.rows[0]["role_name"];
	                document.getElementById("s_bz").value = t.rows[0]["bz"]==undefined?"":t.rows[0]["bz"];
	                $('#showModel').modal();
	            }
	        });
		}
		function role(id){
			document.getElementById("eid").value=id;
			var qxck=document.getElementsByName("qxck");
			for(var i=0;i<qxck.length;i++){
				qxck[i].checked="";
			}
			$.ajax({
	           cache: false,
	           type: "post",
	           dataType: "Json",
	           url: "${ctx}/jggly/editRole",
	           data: {
	               id: id,
	               time: Math.random()
	           },
	           success: function (data)
	           {
	           	var t = eval(data);
	           	if(t.rows[0]["menu_power"]!=null){
		             var qx = t.rows[0]["menu_power"].split(',');
						for(var i=0;i<qx.length;i++){
							if(document.getElementById(qx[i])!=undefined){
								document.getElementById(qx[i]).checked="checked";
							}
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
			//alert(s);
			$.ajax({
	           cache: false,
	           type: "post",
	           dataType: "Json",
	           url: "${ctx}/jggly/updateRole",
	           data: {
	               id: document.getElementById("eid").value,
	               menu_power:s,
	               time: Math.random()
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
		$("input[name='dataCon']").datetimepicker({
			language: 'zh-CN',
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
		function checkAll(){
			var chkother = document.getElementsByName("qxck");
			if(document.getElementById("Cbtn").checked==true){
				for (var i = 0; i < chkother.length; i++){
					chkother[i].checked=true;
				}		
			}else{
				for (var i = 0; i < chkother.length; i++){
					chkother[i].checked=false;
				}
			}
		}
		function checkTile(){
			var chkother = document.getElementsByName("qxck");
			if(document.getElementById("CbtnTile").checked==true){
				for (var i = 0; i < chkother.length; i++){
					if(chkother[i].id.length==5){
						chkother[i].checked=true;
					}				
				}		
			}else{
				for (var i = 0; i < chkother.length; i++){
					if(chkother[i].id.length==5){
						chkother[i].checked=false;
					}			
				}
			}
		}
		function field(id){
			document.getElementById("fieldSel").selectedIndex = "-1";
			document.getElementById("zdtd").innerHTML = "";
			document.getElementById("eid").value=id;
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/jggly/getTbl",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("fieldSel").innerHTML = t.dx;
				    $('#fieldModel').modal();
	            }
	        });
		}
		function fieldSelChange(){
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/jggly/getField",
	            data: {
	            	rid: document.getElementById("eid").value,
	                mid: document.getElementById("fieldSel").value,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("zdtd").innerHTML = t.dx;
	            }
	        });
		}
		function doField(){
			var f="";
			var inp=document.getElementsByName("fieldInp");
			for(var i=0;i<inp.length;i++){
				if(inp[i].value!=""){
					if(f==""){
						f=inp[i].id+","+inp[i].value;
					}else{
						f+="|"+inp[i].id+","+inp[i].value;
					}
				}
			}
			if(f==""){
				noRight("至少要选择一项要显示的数据!");
			}
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/jggly/saveField",
	            data: {
	                rid: document.getElementById("eid").value,
	                mid: document.getElementById("fieldSel").value,
	                field:f,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	            	noRight("保存成功!");
	            }
	        });
		}
	</script>
</body>
</html>
