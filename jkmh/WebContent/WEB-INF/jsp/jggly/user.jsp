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
<body class="gray-bg">
	<form action="">
		<div class="col-sm-12">
			<!-- Example Events -->
			<div class="example-wrap">
				<table
					width="100%"
					border="0"
					cellpadding="0"
					cellspacing="0"
					style="line-height:30px;margin-top:10px;"
				>
					<tr>
						<td><i class="fa fa-table"></i> <lable class="pathtitle">系统管理
							>> 用户管理</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align:right;line-height:30px; vertical-align:middle;padding-bottom:5px;"
						><type
								="submit"
							value="检索"
								class="btn btn-outline btn-default"
								style="height:30px;width:55px;"
							/></td>
					</tr>
				</table>
				<div class="example">
					<div
						class="btn-group hidden-xs"
						id="rsTabToolbar"
						role="group"
						style="height:30px; line-height:30px;"
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
							style="margin-left:5px;"
							onclick="del('dmlglcheck.servlet?','dmkgl')"
						/>
					</div>
					<table
						id="rsTab"
						data-height="510"
						data-url="js/demo/bootstrap_table_test.json"
						data-mobile-responsive="true"
						data-click-to-select="true"
						ondblclick="qx()"
					>
						<thead>
							<tr>
								<th
									data-field="state"
									data-checkbox="true"
									data-halign="center"
									data-align="center"
								></th>
								<th
									data-field="id"
									data-halign="center"
									data-align="center"
								>个人账号</th>
								<th
									data-field="name"
									data-halign="center"
									data-align="center"
								>姓名</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>性别</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>身份证号</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>手机号</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>邮箱</th>
							</tr>
						</thead>
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
									style="font-weight: bolder; padding-left: 19px; padding-right: 19px;background-color:f3f3f4;"
								> 个人账号</span> <input
									id="a_usercode"
									type="text"
									class="form-control input"
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
									class="form-control input"
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
									class="form-control input"
									placeholder="请输入新的密码"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 再次输入</span> <input
									id="a_password1"
									type="password"
									class="form-control input"
									placeholder="请再次输入新的密码"
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
									id="month"
									class="form-control input"
									runat="server"
									type="text"
									style="width:400px;"
									onchange="load()"
								/> <span class="input-group-addon"><span
									class="glyphicon glyphicon-th"
								></span></span>
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
									class="form-control input"
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
									class="form-control input"
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
									class="form-control input"
									placeholder="请输入新的邮箱"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 性别</span> <select
									class="form-control single-line"
									id="a_xb"
								>
									<option value="">性别</option>
									<option value="男">男</option>
									<option value="女">女</option>
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 类型</span> <input
									id="e_ctype"
									type="text"
									class="form-control input"
									placeholder="请输入类型"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 名称</span> <input
									id="e_cname"
									type="text"
									class="form-control input"
									placeholder="请输入新的名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 33px; padding-right: 33px;background-color:f3f3f4;"
								> 值</span> <input
									id="e_cvalue"
									type="text"
									class="form-control input"
									placeholder="请输入新的值"
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
		<!--权限弹窗开始 -->
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
						>筛选</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<table
								style="width:500px;"
								border="1"
							>
								<tr>
									<td
										style="text-align:center;width:50px;background-color:silver;"
									><label>序号 </label></td>
									<td style="text-align:center;background-color:silver;"><label>角色
									</label></td>
									<td
										style="text-align:center;width:100px;background-color:silver;"
									><label>操作</label></td>
								</tr>
								<tr>
									<td style="text-align:center;"><label>1 </label></td>
									<td style="text-align:center;"><label>系统管理</label></td>
									<td
										style="text-align:center;"
										id="sxtd"
									><input
										type="checkbox"
										name="sxck"
										value="02"
									></td>
								</tr>
								<tr>
									<td style="text-align:center;"><label>2</label></td>
									<td style="text-align:center;"><label>健康专家</label></td>
									<td
										style="text-align:center;"
										id="sxtd"
									><input
										type="checkbox"
										name="sxck"
										value="02-01"
									>
								</tr>
								<tr>
									<td style="text-align:center;"><label>3</label></td>
									<td style="text-align:center;"><label>健康专员</label></td>
									<td
										style="text-align:center;"
										id="sxtd"
									><input
										type="checkbox"
										name="sxck"
										value="02-01"
									>
								</tr>
								<tr>
									<td style="text-align:center;"><label>4</label></td>
									<td style="text-align:center;"><label>营销人员</label></td>
									<td
										style="text-align:center;"
										id="sxtd"
									><input
										type="checkbox"
										name="sxck"
										value="02-01"
									>
								</tr>
								<tr>
									<td style="text-align:center;"><label>5</label></td>
									<td style="text-align:center;"><label>运营人员</label></td>
									<td
										style="text-align:center;"
										id="sxtd"
									><input
										type="checkbox"
										name="sxck"
										value="02-01"
									>
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
							onclick="doSx('dmlglcheck.servlet?','dmkgl')"
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
	<script>
		$('#rsTab').bootstrapTable({
			url : '../../jiankang/data/data1.json', //请求后台的URL（*）
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
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
			pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
			clickToSelect : true,
			showColumns : true,
			icons : {
				refresh : "glyphicon-repeat",
				toggle : "glyphicon-list-alt",
				columns : "glyphicon-list"
			},
			showExport : true, //是否显示导出
			exportDataType : "basic", //basic', 'all', 'selected'.
			columns : [ {
				checkbox : true
			}, {
				title :'序号',
				visible:true,
				align:"center",
				width:"50",
				formatter: function (value, row, index) {  
		                   return index+1;  
				}
			}, {
				field : 'id',
				title : '个人账号',
				sortable : true
			}, {
				field : 'name',
				title : '姓名',
				sortable : true
			}, {
				field : 'price',
				title : '身份证号',
				sortable : true
			}, {
				field : 'id',
				title : '手机号',
				sortable : true
			}, {
				field : 'name',
				title : '邮箱',
				sortable : true
			}, {
				field : 'price',
				title : '性别',
				sortable : true
			}, {
				field : 'price',
				title : '出生日期',
				sortable : true
			} ]
		});

		$('.form_datetime').datetimepicker({
			lang : "ch",
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
		function add() {//新增按钮方法
			document.getElementById("a_usercode").value = "";
			document.getElementById("a_xm").value = "";
			document.getElementById("a_password").value = "";
			$('#addModel').modal();
		}
		function doAdd() {//新增保存方法
			$('#addModel').modal('hide');
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "code_c.ashx",
				data : {
					type : "add",
					ctype : document.getElementById("e_ctype").value,
					cname : document.getElementById("e_cname").value,
					cvalue : document.getElementById("e_cvalue").value,
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
		function edit() {//修改按钮方法
			var index = $('#rsTab').find('tr.success').data('index');//获得选中的
			if (index == undefined) {
				right("请选择要修改的数据!");
				return false;
			}
			$
					.ajax({
						cache : false,
						type : "post",
						dataType : "Json",
						url : "code_c.ashx",
						data : {
							type : "edit",
							id : id,
							time : Math.random()
						},
						success : function(data) {
							var t = eval(data);
							document.getElementById("e_ctype").value = data.rows[0]["ctype"];
							document.getElementById("e_cname").value = data.rows[0]["cname"];
							document.getElementById("e_cvalue").value = data.rows[0]["cvalue"];
							$('#editModel').modal();
						}
					});
		}
		function doEdit() {//修改保存方法
			if(document.getElementById("a_usercode").value==""){
				noRight("请输入登录名称!");return false;
			}else if(document.getElementById("a_password").value==""){
				noRight("请输入密码!");return false;
			}else if(document.getElementById("a_sjh").value==""){
				noRight("请输入手机号!");return false;
			}else if(document.getElementById("a_yx").value==""){
				noRight("请输入邮箱!");return false;
			}
			if (document.getElementById("a_password").value!="")
			{
		if(!/^\w{4,20}$/.test(document.getElementById("a_password").value)){
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
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/sys/insertGlygl",
				data : {
					loginname : document.getElementById("a_usercode").value,
					password : document.getElementById("a_password").value,
					xm : document.getElementById("a_xm").value,
					sfzh : document.getElementById("a_sfzh").value,
					sjh : document.getElementById("a_sjh").value,
					yx : document.getElementById("a_yx").value,
					csrq : document.getElementById("a_csrq").value,
					xb : document.getElementById("a_xb").value,
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
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "code_c.ashx",
				data : {
					type : "edit",
					id : id,
					ctype : document.getElementById("e_ctype").value,
					cname : document.getElementById("e_cname").value,
					cvalue : document.getElementById("e_cvalue").value,
					time : Math.random()
				},
				success : function(data) {
					right("修改成功!");
				},
				error : function(data) {
					right("修改失败!");
				}
			});
		}
		function qx() {//修改按钮方法
			$('#sxModel').modal();
			$
					.ajax({
						cache : false,
						type : "post",
						dataType : "Json",
						url : "code_c.ashx",
						data : {
							type : "edit",
							id : id,
							time : Math.random()
						},
						success : function(data) {
							var t = eval(data);
							document.getElementById("e_ctype").value = data.rows[0]["ctype"];
							document.getElementById("e_cname").value = data.rows[0]["cname"];
							document.getElementById("e_cvalue").value = data.rows[0]["cvalue"];
							$('#sxModel').modal();
						}
					});
		}
	</script>
</body>
</html>
