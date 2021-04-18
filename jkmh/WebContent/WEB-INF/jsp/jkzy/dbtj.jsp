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
							>> 每日统计</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align: right; vertical-align: middle;"
						><select
							style="color:#999999;"
							class="form-control"
							id="xm" 
						>
								<option
									style="color:#999999!important;"
									value=""  
								>项目</option>
								<option
									style="color:#999999!important;"
									value="1" selected="selected"
								>热量摄入</option>
								<option
									style="color:#999999!important;"
									value="2"
								>运动消耗</option>
								<option
									style="color:#999999!important;"
									value="3"
								>睡眠</option>
						</select> <select
							style="color:#999999;"
							class="form-control"
							id="ts" 
						>
								<option
									style="color:#999999!important;"
									value=""
								>天数</option>
								<option
									style="color:#999999!important;"
									value="1"  selected="selected"
								>1天</option>
								<option
									style="color:#999999!important;"
									value="3"
								>3天</option>
								<option
									style="color:#999999!important;"
									value="7"
								>7天</option>
								<option
									style="color:#999999!important;"
									value="10"
								>10天</option>
								<option
									style="color:#999999!important;"
									value="30"
								>30天</option>
								<option
									style="color:#999999!important;"
									value="50"
								>50天</option>
								<option
									style="color:#999999!important;"
									value="100"
								>100天</option>
								<option
									style="color:#999999!important;"
									value="300"
								>300天</option>
						</select> <select
							style="color:#999999;"
							class="form-control"
							id="zx" 
						>
								<option
									style="color:#999999!important;"
									value=""  
								>达标率百分比最小值</option>
								<option
									style="color:#999999!important;"
									value="0"  selected="selected"
								>0%</option>
								<option
									style="color:#999999!important;"
									value="0.1"
								>10%</option>
								<option
									style="color:#999999!important;"
									value="0.2"
								>20%</option>
								<option
									style="color:#999999!important;"
									value="0.3"
								>30%</option>
								<option
									style="color:#999999!important;"
									value="0.4"
								>40%</option>
								<option
									style="color:#999999!important;"
									value="0.5"
								>50%</option>
								<option
									style="color:#999999!important;"
									value="0.6"
								>60%</option>
								<option
									style="color:#999999!important;"
									value="0.7"
								>70%</option>
								<option
									style="color:#999999!important;"
									value="0.8"
								>80%</option>
								<option
									style="color:#999999!important;"
									value="0.9"
								>90%</option>
								<option
									style="color:#999999!important;"
									value="1"
								>100%</option>
						</select> <select
							style="color:#999999;"
							class="form-control"
							id="zd" 
						>
								<option
									style="color:#999999!important;"
									value=""  selected="selected"
								>达标率百分比最大值</option>
								<option
									style="color:#999999!important;"
									value="0"
								>0%</option>
								<option
									style="color:#999999!important;"
									value="0.1"
								>10%</option>
								<option
									style="color:#999999!important;"
									value="0.2"
								>20%</option>
								<option
									style="color:#999999!important;"
									value="0.3"
								>30%</option>
								<option
									style="color:#999999!important;"
									value="0.4"
								>40%</option>
								<option
									style="color:#999999!important;"
									value="0.5"
								>50%</option>
								<option
									style="color:#999999!important;"
									value="0.6"
								>60%</option>
								<option
									style="color:#999999!important;"
									value="0.7"
								>70%</option>
								<option
									style="color:#999999!important;"
									value="0.8"
								>80%</option>
								<option
									style="color:#999999!important;"
									value="0.9"
								>90%</option>
								<option
									style="color:#999999!important;"
									value="1" 
								>100%</option>
						</select> <input
							type="button"
							value="检索"
							class="btn btn-outline btn-default"
							onclick="search1()"
						/> <input
							type="button"
							value="重置"
							class="btn btn-outline btn-default"
							onclick="reset()"
						/></td>
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
			url : 'selectDbtj', //请求后台的URL（*）
			method : 'get', //请求方式（*）
			toolbar : "#rsTabToolbar", //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : false, //是否启用排序
			sortOrder : "asc", //排序方式
			iconSize : "outline",
			showRefresh : false,
			showToggle : false,
			//queryParams: oTableInit.queryParams, //传递参数（*）
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			height:$(window).height()-70,
			pageSize:10, //每页的记录行数（*）

			 onColumnSwitch: 
				  function getvl(params) {
				 var vc= $('#exampleTableEvents').bootstrapTable('getVisibleColumns','');			
					var strColumns="";
					$.post("${ctx}/sys/updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=dbtj",arguments[0]);
		        },
		        queryParams: 
					function queryParams(params) {
			        	return {
			            NAME:params.search, //开启自带查询后输入的值
			            ISDEL:0,
			            pageSize: this.pageSize, //分页条数
			            pageNumber: this.pageNumber, //当前页数
			            sortOrder: this.sortOrder, //当前页数
			            field: this.sortName,//当前页数
			           	itemid:document.getElementById("xm").value,
			           	days:document.getElementById("ts").value,
			            min:document.getElementById("zx").value,
			           	max:document.getElementById("zd").value
			        };
			    } //在这里你可以自己定义查询的参数
			    
		        , //查询参数
		        queryParamsType: 'limit', //类型
				pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
				clickToSelect: true,
				showColumns:true,
			
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
				},{
						field : 'name',
						title : '日期',
						align:"center",
						sortable : false
					},  {
				field : 'count',
				title : '达标人数(人)',
				align:"center",
				sortable : false
			}]
		});
		
		function search1(){
			var itemid=document.getElementById("xm").value;
			var days=document.getElementById("ts").value;
			var min=document.getElementById("zx").value;
			var max=document.getElementById("zd").value;
			if(itemid==""){
				right("请选择要统计的项目");
			}
			if(days==""){
				right("请选择要统计的天数");
			}
			if(min==""&&max==""){
				right("请选择性达标率百分比最小值或达标率百分比最大值");
			}
			$('#rsTab').bootstrapTable('refresh');
		}
	</script>
</body>
</html>
