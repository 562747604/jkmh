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
	href="${ctx}/jiankang/js/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet"
>
</head>
<body class="gray-bg">
	<form action="">
		<div class="col-sm-12">
			<!-- Example Events -->
			<div class="example-wrap">
				<div
					class="btn-group hidden-xs"
					id="rsTabToolbar"
					role="group"
					style="height:30px; line-height:30px;"
				>
					<input
						id="b-edit"
						type="button"
						value="打印"
						class="btn btn-outline btn-default"
						style="margin-left:0px;"
						onclick="edit()"
					/> <input
						id="b-edit"
						type="button"
						value="导出"
						class="btn btn-outline btn-default"
						style="margin-left:5px;"
						onclick="edit()"
					/>
				</div>
				<table
					width="100%"
					border="0"
					cellpadding="0"
					cellspacing="0"
					style="line-height:30px;margin-top:10px;"
				>
					<tr>
						<td><i class="fa fa-table"></i> <lable class="pathtitle">报告管理
							>> 团体报告</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align:right;line-height:30px; vertical-align:middle;padding-bottom:5px;"
						><input
							id="month1"
							class="form-control"
							runat="server"
							type="text"
							style="width:150px;" placeholder="打印日期开始"
						/> <span
							class="input-group-addon"
							style="display:none;"
						><span class="glyphicon glyphicon-th"></span></span> - <input
							id="month2"
							class="form-control"
							runat="server"
							type="text"
							style="width:150px;" placeholder="打印日期结束"
						/> <span
							class="input-group-addon"
							style="display:none;"
						><span class="glyphicon glyphicon-th"></span></span> <input
							type="text"
							id="i_name"
							class="form-control"
							placeholder="请输入单位名称"
						/> <select
							class="form-control"
							id="s_ctype"
						>
								<option value="">报告状态</option>
								<option value="首钢">已打印</option>
								<option value="依云">未打印</option>
						</select> <input
							type="submit"
							value="检索"
							class="form-control"
						/> <input
							type="submit"
							value="重置"
							class="btn btn-outline btn-default"
						/> <input
							id="addbtn"
							type="button"
							value="筛选"
							class="btn btn-outline btn-default"
							onclick="sx('dmlglcheck.servlet?','dmkgl')"
						/></td>
					</tr>
				</table>
				<div class="example">
					<table
						id="rsTab"
						data-height="530"
						data-url="js/demo/bootstrap_table_test.json"
						data-mobile-responsive="true"
						data-click-to-select="true"
					>
					</table>
				</div>
			</div>
			<!-- End Example Events -->
		</div>
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
							<table style="width:100%;">
								<tr>
									<td style="text-align:right;"><label><input
											type="checkbox"
										>全选 </label></td>
								</tr>
								<tr>
									<td
										style="text-align:left;"
										id="sxtd"
									><input
										type="checkbox"
										name="sxck"
										value="id"
									>类型 <input
										type="checkbox"
										name="sxck"
										value="name"
										style="margin-left:20px;"
									>名称 <input
										type="checkbox"
										value="price"
										name="sxck"
										style="margin-left:20px;"
									>值</td>
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
				title : '单位名称',
				align:"center",
				sortable : true
			}, {
				field : 'name',
				title : '体检时间',
				align:"center",
				sortable : true
			}, {
				field : 'price',
				title : '打印状态',
				align:"center",
				sortable : true
			}, {
				field : 'id',
				title : '打印时间',
				align:"center",
				sortable : true
			} ]
		});
	
		$('#month1').datetimepicker({
			lang : "ch",
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
		$('#month2').datetimepicker({
			lang : "ch",
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
		function showDiv(title, url) {
			parent.showDiv(title, url);
		}
	</script>
</body>
</html>
