<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	href="${ctx}/jiankang/css/plugins/iCheck/custom.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/chosen/chosen.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/cropper/cropper.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/switchery/switchery.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/jasny/jasny-bootstrap.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/nouslider/jquery.nouislider.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/ionRangeSlider/ion.rangeSlider.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/plugins/clockpicker/clockpicker.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/animate.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0"
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
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
	rel="stylesheet"
>
  <style>
 .a {height:40px;
 }
 .nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: pointer;
	background-color: #bef2ff;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}
.nav-tabs>li>a
	{
	color: #555;
	cursor: pointer;
	background-color: #c9c9c9;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}
table {
    display: table;
    border-collapse: separate;
}
.panel-heading {
    padding: 0px 15px;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd
}
        </style>
</head>
<%
String id=(String)request.getAttribute("id");
String upid=(String)request.getAttribute("upid");
String nextid=(String)request.getAttribute("nextid");
String[] info=(String[])request.getAttribute("info");
%>
<body onload="load()" background-color="#27bcc2">
	<form action="">
		<table
		id="tab"
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;height:655px; "
		>
			<tr>
			<td style="text-align:center;height:50px;line-height:50px; vertical-align:middle;width:200px;background-color:#27bac1;" >
					 
				</td>
				<td style="text-align:left;line-height:50px; vertical-align:middle;background-color:#27bac1;">
					<input
					type="button"
					value="预览"
					class="form-control"
					style="height:30px;width:55px;margin-left:20px;"
				/> <input
					type="button"
					value="完成"
					class="form-control"
					style="height:30px;width:55px;"
					onclick="wc()"
				/>
				</td>
			</tr>
			<tr>
					<td
					style="text-align:center; vertical-align:top;
						border-right:15px #27bac1 solid;border-left:20px #27bac1 solid;border-bottom:15px #27bac1 solid;"
				>
					<table style="width:200px;text-align:center;">
						<tr>
						 <td colspan="2"
					style="text-align:center;height:30px;line-height:30px; vertical-align:middle;width:200px;
						 "
			                           	>
					     <h2>基本信息</h2>
				       </td>
					   </tr>
						<tr>
							<td
								colspan="2"
								style="text-align:center;height:30px;line-height:30px; vertical-align:middle;"
							><a href="${ctx}/jkzy/pgbg?id=<%=upid%>"><img
									src="${ctx}/images/jkpgyw/u756.png"
									style="height:30px;"
								></a> <img
								src="${ctx}/images/jkpgyw/u718.jpg"
								style="height:100px;"
							> <a href="${ctx}/jkzy/pgbg?id=<%=nextid%>"><img
									src="${ctx}/images/jkpgyw/u758.png"
									style="height:30px;"
								></a></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:30px;line-height:30px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>档案号:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span><%=info[0] %></span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>姓 名:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span><%=info[1] %></span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>性别:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span><%=info[2] %></span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>年龄:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span><%=info[3] %></span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>单位:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span><%=info[4] %></span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>身份证:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span><%=info[5] %></span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>电话:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span><%=info[6] %></span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
					</table>
				</td>
				<td style="text-align:left;line-height:30px; vertical-align:top;background-color:#bef2ff;border-right:20px #27bac1 solid;border-bottom:15px #27bac1 solid;" > 
				<table style="width:100%;text-align:center;height:40px;background-color:#27bac1;">
						<tr style="height:40px;line-height:40px;">
							<td style="line-height:40px;height:40px;">
				       <div class="panel blank-panel" style="background-color:#27bac1;height:40px!important;line-height:40px;" >
                                    <div class="panel-heading" style="height:40px!important;">
                                        <div class="panel-options" style="height:40px!important;">
                                            <ul class="nav nav-tabs"style="height:40px!important;"  >
						<li  style="height:40px!important;"> <a href="${ctx}/jkzy/pgbg?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">评估报告</h2></a>
                        </li>
                        		<li   style="height:40px!important;"><a
													href="${ctx}/jkzy/cjmb?id=<%=request.getAttribute("id") %>"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">促进目标</h2>
												</a></li>
					    <li style="height:40px!important;"> <a href="${ctx}/jkzy/fazd?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">方案指导</h2></a>
                        </li> 
						<li  style="height:40px!important;"> <a href="${ctx}/jkzy/mrqk?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">每日情况</h2></a>
                        </li> 	 
						<li   style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz5?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">设备上传</h2></a>
                        </li> 		 
						 <li  style="height:40px!important;"> <a href="${ctx}/jkzy/fwzz6?id=<%=request.getAttribute("id") %>" style="height:40px!important;">
						<h2 style="margin-top: 0px;margin-bottom: 0px;">回访追踪</h2></a>
                        </li> 	
							 
						 </ul>
                                        </div>
                                    </div>
						</div>
							  
							  </td>
						</tr>
						</table>
					<table style="width:100%;text-align:center;">
						<tr>
							<td
								colspan="6"
								style="border:1px silver solid;border-top:none;border-bottom:none; vertical-align:top;"
							>
								<div class="example">
									<div
										class="btn-group hidden-xs"
										id="rsTabToolbar"
										role="group"
									>
										<input
											id="b-add"
											type="button"
											value="发送"
											class="form-control"
										 style="height:30px;width:55px;margin-left:20px;"
						/>
									</div>
									<table
										id="rsTab"
										data-height="530"
										data-url="js/demo/bootstrap_table_test.json"
										data-mobile-responsive="true"
										data-click-to-select="true"
										ondblclick="showZx()"
									"
					>
									</table>
								</div> <!-- End Example Events -->
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!--新增弹窗开始 -->
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
									style="padding-left: 5px; padding-right: 5px;background-color:f3f3f4;"
								>资讯短标题</span> <input
									id="a_jgdm"
									type="text"
									class="form-control"
									placeholder="请输入新的名称"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 摘要</span> <input
									id="e_bz"
									type="text"
									class="form-control"
									placeholder="请输入新的说明"
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
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="${ctx}/jiankang/js/plugins/jsKnob/jquery.knob.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/js/bootstrap-datetimepicker.js"
		charset="utf8"
	></script>
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
	<script type="text/javascript">
		$('#rsTab').bootstrapTable({
			url : '${ctx}/jiankang/data/data1.json', //请求后台的URL（*）
			method : 'get', //请求方式（*）
			toolbar : "#rsTabToolbar", //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : false, //是否启用排序
			sortOrder : "asc", //排序方式
			iconSize : "outline",
			//queryParams: oTableInit.queryParams, //传递参数（*）
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
			pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
			clickToSelect : true,
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
				title : '频道名称',
				align:"center",
				sortable : true
			}, {
				field : 'name',
				title : '资讯短标题',
				align:"center",
				sortable : true
			}, {
				field : 'price',
				title : '摘要',
				align:"center",
				sortable : true
			}, {
				field : 'price',
				title : '发布时间',
				align:"center",
				sortable : true
			} ]
		});
		function showZx() {//新增按钮方法
			$('#showModel').modal();
		}
		function load() {
			document.getElementById("tab").style.height=(document.body.clientHeight)+"px";
		}
		function wc(){
        	parent.gb();		
}
	</script>
</body>
</html>
