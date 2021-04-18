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
							>> 结论词管理</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align:right;line-height:30px; vertical-align:middle;padding-bottom:5px;"
						><input
							type="text"
							id="i_cname"
							class="form-control"
							placeholder="请输入名称"
						/> <input
							type="submit"
							value="检索"
							class="form-control"
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
							style="<%=request.getAttribute("addBtn") %>"
							onclick="add()"
						/> <input
							id="b-del"
							type="button"
							value="删除"
							class="btn btn-outline btn-default"
							style="margin-left:5px;<%=request.getAttribute("addBtn") %>"
							onclick="del('dmlglcheck.servlet?','dmkgl')"
						/>
					</div>
					<table
						id="rsTab"
						data-height="510"
						data-url="js/demo/bootstrap_table_test.json"
						data-mobile-responsive="true"
						data-click-to-select="true"
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
								>名称</th>
								<th
									data-field="name"
									data-halign="center"
									data-align="center"
								>内容</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>备注</th>
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								>名称</span> <input
									id="a_mc"
									type="text"
									class="form-control input-lg"
									placeholder="请输入名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								>内容</span> <input
									id="a_nr"
									type="text"
									class="form-control input-lg"
									placeholder="请输入新的内容"
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
									class="form-control input-lg"
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
									class="form-control input-lg"
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
									class="form-control input-lg"
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
									class="form-control input-lg"
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
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
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
				title : '名称',
				sortable : true
			}, {
				field : 'name',
				title : '内容',
				sortable : true
			}, {
				field : 'id',
				title : '备注',
				sortable : true
			}]
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
			document.getElementById("a_mc").value = "";
			document.getElementById("a_nr").value = "";
			document.getElementById("a_bz").value = "";
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
			var index = $('#rsTab').find('tr.success').data('index');//获得选中的
			if (index == undefined) {
				right("请选择要修改的数据!");
				return false;
			}
			$('#editModel').modal('hide');
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
					var t = eval(data);
					right(t.msg);
				},
				error : function(data) {
					var t = eval(data);
					noRight(t.msg);
				}
			});
		}
	</script>
</body>
</html>
