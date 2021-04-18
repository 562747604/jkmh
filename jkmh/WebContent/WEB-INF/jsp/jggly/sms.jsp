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
							>> 短信发送统计</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align:right;line-height:30px; vertical-align:middle;padding-bottom:5px;"
						><input
							type="text"
							id="i_cname"
							class="form-control"
							placeholder="请输入体检号、姓名"
							style="width:200px;"
						/><span style="margin:0px 5px;">发送日期</span> <input
							id="month1"
							class="form-control input-lg"
							runat="server"
							type="text"
							style="width:100px;"
						/> <span
							class="input-group-addon"
							style="display:none;"
						><span class="glyphicon glyphicon-th"></span></span> - <input
							id="month2"
							class="form-control input-lg"
							runat="server"
							type="text"
							style="width:100px;"
						/> <span
							class="input-group-addon"
							style="display:none;"
						><span class="glyphicon glyphicon-th"></span></span> <select
							class="form-control single-line"
							id="s_ctype"
							style="width:100px;"
						>
								<option value="">单位</option>
								<option value="首钢">首钢</option>
								<option value="依云">依云</option>
						</select> <select
							class="form-control single-line"
							id="s_ctype"
							style="width:100px;"
						>
								<option value="">状态</option>
								<option value="完成">成功</option>
								<option value="未完成">失败</option>
						</select>  <input
							type="submit"
							value="检索"
							class="form-control"
							style="height:30px;width:55px;"
						/></td>
					</tr>
				</table>
				<div class="example">
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
								>体检号</th>
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
								>年龄</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>手机号</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>状态</th>
								<th
									data-field="price"
									data-halign="center"
									data-align="center"
								>发送时间</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<!-- End Example Events -->
		</div>	
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
				title : '体检号',
				sortable : true
			}, {
				field : 'name',
				title : '姓名',
				sortable : true
			}, {
				field : 'id',
				title : '性别',
				sortable : true
			}, {
				field : 'id',
				title : '年龄',
				sortable : true
			}, {
				field : 'id',
				title : '手机号',
				sortable : true
			}, {
				field : 'id',
				title : '状态',
				sortable : true
			}, {
				field : 'id',
				title : '发送时间',
				sortable : true
			}]
		});
		$('#rsTab').on('click-row.bs.table', function(e, row, element) {
			$('.success').removeClass('success');//去除之前选中的行的，选中样式
			$(element).addClass('success');//添加当前选中的 success样式用于区别
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
	</script>
</body>
</html>
