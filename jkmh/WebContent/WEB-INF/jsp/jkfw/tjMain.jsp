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
	uri="http://www.springframework.org/tags/form"%>
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
<body class="gray-bg" onload="load()">
	<form action="">
		<div class="col-sm-12">
			<!-- Example Events -->
			<div class="example-wrap">
				<%-- <div
					class="btn-group hidden-xs"
					id="rsTabToolbar"
					role="group"
				>
				<input
							id="b-add"
							type="button"
							value="预览"
							class="btn btn-outline btn-default"
							onclick="jksc()"
						/> <input
						id="b-edit"
						type="button"
						value="导出"
						class="btn btn-outline btn-default"
							style="margin-left: 5px;<%=request.getAttribute("dcBtn") %>"
						onclick="doOut('s_tuser')"
					/>
				</div> --%>
				<table
					width="100%"
					border="0"
					cellpadding="0"
					cellspacing="0"
					style="line-height: 30px; margin-top: 10px;"
				>
					<tr>
						<td><i class="fa fa-table"></i> <lable class="pathtitle">健康服务
							>> 服务统计</lable></td>
					</tr>
				</table>
				<div class="example">
					<table
						id="rsTab"
						data-mobile-responsive="true"
					>
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
	<script>
		$('#rsTab').bootstrapTable({
			url : '${ctx}/jkzy/tjList', //请求后台的URL（*）
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
			height:$(window).height()-40,
			pageSize:10, //每页的记录行数（*）

			 onColumnSwitch: 
				  function getvl(params) {
				  },
		        queryParams: 
					function queryParams(params) {
			        	return {
			            NAME:params.search, //开启自带查询后输入的值
			            ISDEL:0,
			            pageSize: this.pageSize, //分页条数
			            pageNumber: this.pageNumber, //当前页数
			            sortOrder: this.sortOrder, //当前页数
			            field: this.sortName//当前页数
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
		            	var d = '<a href="#" mce_href="#" onclick="showDiv(\''+ row.title +'\',\'${ctx}/jkzy/fwtj?id='+ row.id +'\')"><img title="查看" src="${ctx}/images/prev.gif" /></a> '; 
	 					 return d;  
				   } }, {
				field : 'title',
				title : '统计名称',
				align:"center",
				sortable : true
			},{
				field : 'sm',
				title : '说明',
				align:"center",
				sortable : true
			}]
		});
		function showDiv(title, url) {
			parent.showDiv(title, url);
		}
	</script>
</body>
</html>
