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
						<td><i class="fa fa-table"></i> <lable class="pathtitle">上级领导
							>> 用户分配</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align:right;vertical-align:middle;"
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
 %><select
							style="color:#999999;"
							class="form-control"
							id="sjd"
						>
								<option
									style="color:#999999!important;"
									value="1"
									selected="selected"
								>今天</option>
								<option
									style="color:#999999!important;"
									value="2"
								>昨天</option>
								<option
									style="color:#999999!important;"
									value="3"
								>本周</option>
								<option
									style="color:#999999!important;"
									value="4"
								>本月</option>
								<option
									style="color:#999999!important;"
									value="5"
								>本年</option>
								<option
									style="color:#999999!important;"
									value="6"
								>近一周</option>
								<option
									style="color:#999999!important;"
									value="7"
								>近一月</option>
								<option
									style="color:#999999!important;"
									value="8"
								>近一年</option>
								<option
									style="color:#999999!important;"
									value="0"
								>全部</option>
						</select> <select
							style="color:#999999;"
							class="form-control"
							id="shzt"
						>
								<option
									style="color:#999999!important;"
									value="0"
									selected="selected"
								>未分配</option>
								<option
									style="color:#999999!important;"
									value="1"
								>已选择</option>
								<option
									style="color:#999999!important;"
									value="2"
								>已审核</option>
						</select>   <input
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
					</tr>
				</table>
				<div class="example">
				<div
						class="btn-group hidden-xs"
						id="rsTabToolbar"
						role="group"
					>
						 <input
							id="b-edit"
							type="button"
							value="解锁"
							class="btn btn-outline btn-default"
							style="margin-left:0px;<%=request.getAttribute("jsBtn") %>"
							onclick="js1()"
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
						>分配</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 健康专家</span> <select style="color:#999999;"
									class="form-control"
									id="e_zj" onchange='selChange("e_zj")'
								>
									<option style="color:#999999!important;" value="">健康专家</option>
									<option style="color:#000000!important;" value="1">张三(5)</option>
									<option style="color:#000000!important;" value="2">李四(3)</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 健康专员</span> <select style="color:#999999;"
									class="form-control"
									id="e_zy" onchange='selChange("e_zy")'
								>
									<option style="color:#999999!important;" value="">健康专员</option>
									<option style="color:#000000!important;" value="1">张三(2)</option>
									<option style="color:#000000!important;" value="2">李四(3)</option>
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
									id="s_uname"
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
								>用户姓名</span> <input
									id="s_realname"
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
								> 接收时间</span> <input
									id="s_jtime"
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
								> 体检号</span> <input
									id="s_tjh"
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
								> 年龄</span> <input
									id="s_nl"
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
								> 单位</span> <input
									id="s_dw"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 婚姻</span> <input
									id="s_hy"
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
								> 阳性</span> <input
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
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 重大阳性</span> <input
									id="s_zdyx"
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
								> 专家姓名</span> <input
									id="s_zjname"
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
								> 专员姓名</span> <input
									id="s_zyname"
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
								>手机号</span> <input
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
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 用户状态</span> <input
									id="s_zt"
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
							onclick="doSx('${ctx}/sys/updateSearchColumn','yhfp')"
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
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/js/bootstrap-datetimepicker.js"
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
			url : 'selectYhfp', //请求后台的URL（*）
			method : 'get', //请求方式（*）
			toolbar : "#rsTabToolbar", //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : true, //是否启用排序
			sortOrder : "asc", //排序方式
			iconSize : "outline",
			showRefresh : true,
			showToggle : true,
			//queryParams: oTableInit.queryParams, //传递参数（*）
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			height:$(window).height()-70,
			pageSize:10, //每页的记录行数（*）

			 onColumnSwitch: 
				  function getvl(params) {
				 var vc= $('#exampleTableEvents').bootstrapTable('getVisibleColumns','');			
					var strColumns="";
					$.post("${ctx}/sys/updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=yhfp",arguments[0]);
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
			            fieldString:"yhfp",
						shzt:document.getElementById("shzt").value,
			            sjd:document.getElementById("sjd").value
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
		            	var e="";
		            	var f="";
		            	if(row.zjshzt=="已审核"){
		            		e=""
		            	}else if(row.zjshzt=="已选择"){
		            		e="<a href=\"#\" mce_href=\"#\" onclick=\"js('"+ row.id +"')\" style=\"<%=request.getAttribute("jsBtn") %>\"><img title=\"解锁\" src=\"${ctx}/images/top_exit.gif\" /></a>";
		            	}else{
		            		 e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id +'\')"style="<%=request.getAttribute("fpBtn") %>"><img title="分配" src="${ctx}/images/update.gif" /></a> ';  
		            	}		             
		                 return d+e;  
				   } }		, 
				${fields}	
				]
			});		

		function edit(id) {//修改按钮方法
			document.getElementById("eid").value=id;
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/jggly/getPerson",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("e_zj").innerHTML = t.zj;
	                document.getElementById("e_zy").innerHTML = t.zy;
	                selChange("e_zy");
	                selChange("e_zj");
				    $('#editModel').modal();
	            }
	        });
		}
		function doEdit(){//修改保存方法
			var  e_zj=document.getElementById("e_zj");
			var  e_zy=document.getElementById("e_zy");
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/jggly/updateRyfp",
	            data: {
	                id: document.getElementById("eid").value,
					zjid :  e_zj.options[e_zj.selectedIndex].value,
					zjname : e_zj.options[e_zj.selectedIndex].text.split('(')[0],
					zyid : e_zy.options[e_zy.selectedIndex].value,
					zyname : e_zy.options[e_zy.selectedIndex].text.split('(')[0],
					zjshzt:"已选择",
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
	            url: "editRyfp",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("s_jtime").value = t.rows[0]["jtime"]==undefined?"":t.rows[0]["jtime"];
	                document.getElementById("s_zt").value = t.rows[0]["zt"]==undefined?"":t.rows[0]["zt"];
	                document.getElementById("s_uname").value = t.rows[0]["uname"]==undefined?"":t.rows[0]["uname"];
	                document.getElementById("s_realname").value = t.rows[0]["realname"]==undefined?"":t.rows[0]["realname"];
	                document.getElementById("s_mobile").value = t.rows[0]["mobile"]==undefined?"":t.rows[0]["mobile"];
	                document.getElementById("s_tjh").value = t.rows[0]["tjh"]==undefined?"":t.rows[0]["tjh"];
	                document.getElementById("s_xb").value = t.rows[0]["xb"]==undefined?"":t.rows[0]["xb"];
	                document.getElementById("s_nl").value = t.rows[0]["nl"]==undefined?"":t.rows[0]["nl"];
	                document.getElementById("s_dw").value = t.rows[0]["dw"]==undefined?"":t.rows[0]["dw"];
	                document.getElementById("s_sfzh").value = t.rows[0]["sfzh"]==undefined?"":t.rows[0]["sfzh"];
	                document.getElementById("s_email").value = t.rows[0]["email"]==undefined?"":t.rows[0]["email"];
	                document.getElementById("s_csrq").value = t.rows[0]["csrq"]==undefined?"":t.rows[0]["csrq"];
	                document.getElementById("s_hy").value = t.rows[0]["hy"]==undefined?"":t.rows[0]["hy"];
	                document.getElementById("s_yx").value = t.rows[0]["yx"]==undefined?"":t.rows[0]["yx"];
	                document.getElementById("s_zdyx").value = t.rows[0]["zdyx"]==undefined?"":t.rows[0]["zdyx"];
	                document.getElementById("s_zjname").value = t.rows[0]["zjname"]==undefined?"":t.rows[0]["zjname"];
	                document.getElementById("s_zyname").value = t.rows[0]["zyname"]==undefined?"":t.rows[0]["zyname"];
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
		function js1(){
			var ids="";
			var row=$.map($("#rsTab").bootstrapTable('getSelections'),function(row){
				return row ;
				});
			for(var i=0;i<row.length;i++){
				if(row[i].zjshzt!="已审核"){
				if(ids==""){
					ids=row[i].id;
				}else{
					ids=ids+","+row[i].id;
				}
				}
			}

			if(ids==""){
				right("请选择要解锁且未审核的数据!");
				return false;
			}
			
			$.ajax({
                cache: false,
                type: "get",
                dataType: "Json",
                url: "${ctx}/jkzj/delJkzj",
                data: {
                    id: ids,
                    time: Math.random()
                },
                success: function (data)
                {
                	right("解锁成功!");
                },
                error:function(data){
                	right("解锁失败!");
                }
            });
		}
		function js(id){
			$.ajax({
                cache: false,
                type: "get",
                dataType: "Json",
                url: "${ctx}/jkzj/delJkzj",
                data: {
                    id: id,
                    time: Math.random()
                },
                success: function (data)
                {
                	right("解锁成功!");
                },
                error:function(data){
                	right("解锁失败!");
                }
            });
		}
	</script>
</body>
</html>
