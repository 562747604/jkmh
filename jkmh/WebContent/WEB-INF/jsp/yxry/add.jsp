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
<style type="text/css">
.clearfix:after, .container:after, .tab-nav:after
	{
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

/* ==========
	   Setup Page */
*, *:before, *:after {
	box-sizing: border-box;
}

body {
	font-family: 'Quicksand', sans-serif;
}

/* =================
	   Container Styling */
.container {
	position: relative;
	background: white;
	padding: 3em;
}

/* ===========
	   Tab Styling */
.tab-group {
	position: relative;
	border: 1px solid #eee;
	margin-top: 1em;
	border-radius: 0 0 10px 10px;
}

.tab-group section {
	opacity: 0;
	height: 0;
	padding: 0 1em;
	overflow: hidden;
	transition: opacity 0.4s ease, height 0.4s ease;
}

.tab-group section.active {
	opacity: 1;
	height: auto;
	overflow: visible;
}

.tab-nav {
	list-style: none;
	margin: -2.5em -1px 0 0;
	padding: 0;
	height: 2.5em;
	overflow: hidden;
}

.tab-nav li {
	display: inline;
}

.tab-nav li a {
	top: 1px;
	position: relative;
	display: block;
	float: left;
	border-radius: 10px 10px 0 0;
	background: #eee;
	line-height: 2em;
	padding: 0 0em;
	text-decoration: none;
	color: grey;
	margin-top: .1em;
	margin-right: 1px;
	transition: background .2s ease, line-height .2s ease, margin .2s ease;
}

.tab-nav li.active a {
	background: #6EB590;
	color: white;
	line-height: 2.5em;
	margin-top: 0;
}
</style>
</head>
<body style="background-color:#ffffff;">
	<form action="">
		<table
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;"
		>
			<tr>
				<td
					style="text-align:left;line-height:30px; vertical-align:top;background-color:#ffffff;"
				>
					<table
						style="width:100%;text-align:center;height:730px;margin-top:10px;"
					>
						<tr style="div1">
							<td style="text-align:left;vertical-align:top;">
								<div id="di1"
									class="tab-group"
									style="margin-top: 30px;overflow-x: none;"
								>
									<section
										id="tab1"
										title="&nbsp;&nbsp;列表&nbsp;&nbsp;"
									>
										<div
											class="btn-group hidden-xs"
											id="rsTabToolbar"
											role="group"
										>
											<input
												id="b-del"
												type="button"
												value="删除"
												class="btn btn-outline btn-default"
												style="margin-left:5px;"
												onclick="delUser()"
											/>
										</div>
										<table
											id="rstab"
											data-height="730"
											data-mobile-responsive="true"
											data-click-to-select="true"
										>
										</table>
									</section>
									<section
										id="tab2"
										title="&nbsp;&nbsp;加人员&nbsp;&nbsp;"
									>
										<table
											border="0"
											cellpadding="0"
											cellspacing="0"
											style="margin:10px auto;width:100%;"
										>
											<tr>
											<td><div
											class="btn-group hidden-xs"
											id="rsTabToolbar1"
											role="group" style="text-align: left;"
										>
											<input
												id="b-del"
												type="button"
												value="添加"
												class="btn btn-outline btn-default"
												style="margin-left:5px;"
												onclick="addUser()"
											/>
										</div></td>
												<td
													class="font3"
													style="text-align:right; vertical-align:middle;"
												><input
													type="text"
													id="i_name"
													class="form-control"
													placeholder="请输入姓名,身份证号"
												/> <select
													class="form-control"
													id="s_dw"
												>
														<option value="">单位</option>
														<%=request.getAttribute("dw") %>
												</select> <input
													id="month1"
													class="form-control"
													runat="server"
													type="text"
													style="width:120px;"
							name="dataCon"
													placeholder="起始时间"
												/> <span
													class="input-group-addon"
													style="display:none;"
												><span class="glyphicon glyphicon-th"></span></span> - <input
													id="month2"
													class="form-control"
													runat="server"
													type="text"
													style="width:120px;"
							name="dataCon"
													placeholder="截止时间"
												/> <span
													class="input-group-addon"
													style="display:none;"
												><span class="glyphicon glyphicon-th"></span></span> <select
													class="form-control"
													id="s_xb"
												>
														<option value="">性别</option>
														<option value="男">男</option>
														<option value="女">女</option>
												</select> <input
													type="button"
													value="检索"
													class="btn btn-outline btn-default"
													onclick="search1()"
												/> <input
													type="button"
													value="重置"
													class="btn btn-outline btn-default"
													onclick="rest()"
												/></td>
											</tr>
										</table>
										<table
											id="rstab1"
											data-height="675"
											data-mobile-responsive="true"
											data-click-to-select="true"
										>
										</table>
									</section>
								</div>
								<table
									id="div11"
									style="display:none;margin-left:auto;margin-right:auto;margin-top:0px;background-color:white;"
								>
									<tr style="height:30px;line-height:30px;">
										<td style="text-align:center;"><textarea
												rows="10"
												cols="200"
											></textarea></td>
									</tr>
									<tr style="height:30px;line-height:30px;">
										<td style="text-align:left;"><span
											style="margin:0px 5px;font-size:15px;font-weight:bolder;"
										>处理人:张三</span><span
											style="margin:0px 5px;font-size:15px;font-weight:bolder;"
										>处理时间:2017-04-08</span></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
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
		src="${ctx}/jiankang/js/prefixfree.min.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/jquery-tab.js"
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
		$('#rstab').bootstrapTable({
			url : '${ctx}/yxry/selectGroup?id=<%=request.getAttribute("id")%>', //请求后台的URL（*）
			method : 'get', //请求方式（*）
			toolbar : "#rsTabToolbar", //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : true, //是否启用排序
			sortOrder : "asc", //排序方式
			iconSize : "outline",
			showRefresh : false,
			showToggle : false,
			//queryParams: oTableInit.queryParams, //传递参数（*）
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
		        queryParams: 
					function queryParams(params) {
				        	return {
				            NAME:params.search, //开启自带查询后输入的值
				            ISDEL:0,
				            pageSize: this.pageSize, //分页条数
				            pageNumber: this.pageNumber, //当前页数
				            sortOrder: this.sortOrder, //当前页数
				            field: this.sortName,//当前页数
				            fieldString:"ryfp"
			        };
			    } //在这里你可以自己定义查询的参数
			    
		        , //查询参数
		        queryParamsType: 'limit', //类型
				pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
				clickToSelect: true,
				showColumns:false,
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
					var pageNumber = $('#rstab').bootstrapTable('getOptions').pageNumber;
				  	  var pageSize = $('#rstab').bootstrapTable('getOptions').pageSize;
				  	  return (pageNumber-1) * pageSize+index+1;
				}
			}, 
			${fields} ]
		});
		$("input[name='dataCon']").datetimepicker({
			language: 'zh-CN',
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
		$('#rstab1').bootstrapTable({
			url : '${ctx}/yxry/selectNotGroup?id=<%=request.getAttribute("id")%>', //请求后台的URL（*）
			method : 'get', //请求方式（*）
			toolbar : "rsTabToolbar1", //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : true, //是否启用排序
			sortOrder : "asc", //排序方式
			iconSize : "outline",
			showRefresh : false,
			showToggle : false,
			//queryParams: oTableInit.queryParams, //传递参数（*）
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
		        queryParams: 
					function queryParams(params) {
			        	return {
			        		NAME:params.search, 
			            ISDEL:0,
			            pageSize: this.pageSize, //分页条数
			            pageNumber: this.pageNumber, //当前页数
			            sortOrder: this.sortOrder, //当前页数
			            field: this.sortName,//当前页数
			            keyword:encodeURI(t),
			            fieldString:"ryfp"
			        };
			    } //在这里你可以自己定义查询的参数
			    
		        , //查询参数
		        queryParamsType: 'limit', //类型
				pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
				clickToSelect: true,
				showColumns:false,
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
					var pageNumber = $('#rstab1').bootstrapTable('getOptions').pageNumber;
				  	  var pageSize = $('#rstab1').bootstrapTable('getOptions').pageSize;
				  	  return (pageNumber-1) * pageSize+index+1;
				}
			}, 
			${fields} ]
		});
		function change(num) {
			document.getElementById("div" + num).style.display = "table";
			document.getElementById("div" + num + "1").style.display = "none";
		}
		function change1(num) {
			document.getElementById("div" + num).style.display = "none";
			document.getElementById("div" + num + "1").style.display = "table";
		}
		$(function() {
			// Calling the plugin
			$('.tab-group').tabify();

			document.getElementById("di1").style.width = (document.body.clientWidth ) + "px";
		})
		function search1(){
			t="";
			if(document.getElementById("i_name").value!=""){
				t+=" and (realname like '%"+document.getElementById("i_name").value+"%' or sfzh like '%"+document.getElementById("i_name").value+"%') ";
			}
			if(document.getElementById("s_dw").value!=""){
				t+=" and (dw like '%"+document.getElementById("s_dw").value+"%' ) ";
			}
			if(document.getElementById("month1").value!=""){
				t+=" and (ksrq > '"+document.getElementById("month1").value+"' or dqrq > '"+document.getElementById("month1").value+"') ";
			}
			if(document.getElementById("month2").value!=""){
				t+=" and (ksrq < '"+document.getElementById("month2").value+"' or dqrq < '"+document.getElementById("month2").value+"') ";
			}
			if(document.getElementById("s_xb").value!=""){
				t+=" and (xb = '"+document.getElementById("s_xb").value+"' ) ";
			}
			$('#rstab1').bootstrapTable('refresh');
		}
		function addUser() {
			var ids="";
			var row=$.map($("#rstab1").bootstrapTable('getSelections'),function(row){
				return row ;
				});
			for(var i=0;i<row.length;i++){
				if(ids==""){
					ids=row[i].id;
				}else{
					ids=ids+","+row[i].id;
				}
			}
			if(ids==""){
				right("请选择要添加的用户!");return false;
			}else{
			    	$.ajax({
		                cache: false,
		                type: "get",
		                dataType: "Json",
		                url: "${ctx}/yxry/addUser",
		                data: {
		                    id: '<%=request.getAttribute("id")%>',
		                    ids: ids,
		                    time: Math.random()
		                },
		                success: function (data)
		                {
		                	$('#rstab1').bootstrapTable('refresh');
		        			$('#rstab').bootstrapTable('refresh');
		                },
		                error:function(data){
		                	$('#rstab1').bootstrapTable('refresh');
		        			$('#rstab').bootstrapTable('refresh');
		                }
		            }); 
			}
		}
		function delUser() {
			var ids="";
			var row=$.map($("#rstab").bootstrapTable('getSelections'),function(row){
				return row ;
				});
			for(var i=0;i<row.length;i++){
				if(ids==""){
					ids=row[i].id;
				}else{
					ids=ids+","+row[i].id;
				}
			}
			if(ids==""){
				right("请选择要删除的用户!");return false;
			}else{
			    	$.ajax({
		                cache: false,
		                type: "get",
		                dataType: "Json",
		                url: "${ctx}/yxry/delUser",
		                data: {
		                    id: '<%=request.getAttribute("id")%>',
		                    ids: ids,
		                    time: Math.random()
		                },
		                success: function (data)
		                {
		                	$('#rstab1').bootstrapTable('refresh');
		        			$('#rstab').bootstrapTable('refresh');
		                },
		                error:function(data){
		                	$('#rstab1').bootstrapTable('refresh');
		        			$('#rstab').bootstrapTable('refresh');
		                }
		            }); 
			}
		}
		function rest(){
			var a = document.getElementById("s_dw");//mySelect是select 的Id
			  a.options[0].selected = true;
			  var b = document.getElementById("s_xb");//mySelect是select 的Id
			  b.options[0].selected = true;
			document.getElementById("i_name").value="";
			document.getElementById("month1").value="";
			document.getElementById("month2").value="";
			search1();
		}
	</script>
</body>
</html>
