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
<style type="text/css">
<
style type ="text /css">.clearfix:after, .container:after, .tab-nav:after
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
	padding-left: 20px;
	overflow: hidden;
	transition: opacity 0.4s ease, height 0.4s ease;
}

.tab-group section.active {
	opacity: 1;
	height: 473px;
	overflow-x: hidden;
	overflow-y: auto;
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
						<td><i class="fa fa-table"></i> <lable class="pathtitle">营销管理
							>> 体检营销</lable></td>
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
							style="<%=request.getAttribute("dcBtn")%>"
							onclick="add()"
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
						<div style="width: 340px;;float: left; ">
							<div class="form-group">
								<div class="input-group">
									<select
										class="form-control"
										id="a_zt"
										style="width: 325px;"
										onchange="ztsel()"
									>
										<option value=""></option>
										<%=request.getAttribute("ztstr")%>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<select
										class="form-control"
										id="a_fs"
										style="width: 325px;"
									>
										<option value="短信">短信</option>
										<option value="邮件">邮件</option>
										<option value="App">App</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<textarea
										class="form-control"
										rows="1"
										cols="40"
										id="a_bt"
										style="width:auto;"
									></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<textarea
										id="a_nr"
										class="form-control"
										rows="14"
										cols="40"
										style="width:auto;"
									></textarea>
								</div>
							</div>
						</div>
						<div style="float: left; margin-left: 10px;;">
							<table style="width: 100%;height: 470px; padding-bottom: 30px;">
								<tr>
									<td style="vertical-align: top;">
										<div
											class="tab-group"
											style="margin-top: 30px;overflow-x: none;border:none;"
										>
											<section
												id="tab1"
												title="&nbsp;&nbsp;人员&nbsp;&nbsp;"
											>
												<table
													style="width:180px; background-color: white;margin-left: -12px;height:445px;"
												>
												<tr><td style="text-align: center;"><span  id="msg" style="color: red;">&nbsp;</span></td></tr>
													<tr>
														<td style="vertical-align: top;height:40px;text-align: center;"><input
															type="text"
															id="i_name"
															class="form-control"
															style="width:150px;margin-top:5px;"
															placeholder="姓名,体检号,手机号"
															onkeyup="seach()"
														/></td>
													</tr>
													<tr>
														<td style="vertical-align: top;">
														<div style="height: 400px; overflow-y: auto;">
															<table
																id="peo"
																style="width:150px;overflow-x: hidden; vertical-align: top;margin-left:10px;"
															>
															</table>
															</div>
														</td>
													</tr>
												</table>
											</section>
											<section
												id="tab2"
												title="&nbsp;&nbsp;群组&nbsp;&nbsp;"
											>
												<table
													style="width:160px; background-color: white;height:444px;margin-left: -12px;"
												>
													<%=request.getAttribute("group")%>
													<tr>
														<td style="vertical-align: top; text-align: center;">
															&nbsp;</td>
													</tr>
												</table>
											</section>
										</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div
						class="modal-footer"
						style="margin-top:30px;border:none;"
					>
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
							onclick="doSx('${ctx}/sys/updateSearchColumn','tyyx')"
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
	<script src="${ctx}/jiankang/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="${ctx}/jiankang/js/plugins/jsKnob/jquery.knob.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.tooltip.min.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.resize.js"
		type="text/javascript"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/flot/jquery.flot.pie.js"
		type="text/javascript"
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
	<script
		src="${ctx}/jiankang/js/prefixfree.min.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/jquery-tab.js"
		charset="utf8"
	></script>
	<script>
	var t="";
	function load(){
		t=sxstr('<%=controls%>');
	}
		$('#rsTab').bootstrapTable({
			url : 'selectTyyx', //请求后台的URL（*）
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
					$.post("${ctx}/sys/updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=tyyx",arguments[0]);
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
			            fieldString:"tyyx"
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
				${fields}]
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
		function add() { //新增按钮方法
			document.getElementById("a_zt").selectedIndex=-1;
			document.getElementById("a_fs").selectedIndex=-1;
			document.getElementById("a_bt").innerHTML="";
        	document.getElementById("a_nr").innerHTML="";
        	document.getElementById("a_bt").value="";
        	document.getElementById("a_nr").value="";
			$('#addModel').modal();
		}
		function doAdd() { //新增保存方法
			var gids="";
			var gr = document.getElementsByName("gr");
			for (var i = 0; i < gr.length; i++){
				if(gr[i].checked==true){
				if(gids==""){
					gids=gr[i].value;
				}else{
					gids+=","+gr[i].value;
				}
				}
			}		
			var pids="";
			var pe = document.getElementsByName("pe");
			for (var i = 0; i < pe.length; i++){
				if(pe[i].checked==true){
				if(pids==""){
					pids=pe[i].value;
				}else{
					pids+=","+pe[i].value;
				}
				}
			}		
		
			if(gids==""&&pids==""){
				noRight("请选择要发送的用户!");return false;
			}
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "insertTsxx",
	            data: {
	            	gids:gids,
	            	pids:pids,
	                mc:document.getElementById("a_bt").value,
	                nr:document.getElementById("a_nr").value,
	                lx:document.getElementById("a_fs").value,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	right("发送成功!");
	            	document.getElementById("a_bt").value="";
	            	document.getElementById("a_nr").value="";
                	document.getElementById("a_bt").innerHTML="";
                	document.getElementById("a_nr").innerHTML="";
	    			document.getElementById("a_zt").selectedIndex=-1;
	    			document.getElementById("a_fs").selectedIndex=-1;
	    			var gr0 = document.getElementsByName("gr");
	    			for (var i = 0; i < gr0.length; i++){
	    				gr0[i].checked=false;
	    			}
	    			var pe0 = document.getElementsByName("pe");
	    			for (var i = 0; i < pe0.length; i++){
	    				pe0[i].checked=false;
	    			}	
	            },
	            error:function(data){
	            	noRight("发送失败!");
	            }
	        });
		}
		$(function() {
			// Calling the plugin
			$('.tab-group').tabify();
		})
		function ztsel(){
			var str=document.getElementById("a_zt");
			if(str.selectedIndex=="-1"||str.selectedIndex=="0"){
				document.getElementById("a_bt").innerHTML="";
				document.getElementById("a_nr").innerHTML="";
            	document.getElementById("a_bt").value="";
            	document.getElementById("a_nr").value="";
				document.getElementById("a_fs").selectValue="";
			}else{
				$.ajax({
					cache : false,
					type : "post",
					dataType : "Json",
					url : "${ctx}/yxry/getZt",
					data : {
						id : str.selectedOptions[0].value,
						time : Math.random()
					},
					success : function(data) {
						var t = eval(data);
						document.getElementById("a_bt").innerHTML=t.mc;
						document.getElementById("a_nr").innerHTML=t.nr;
						document.getElementById("a_bt").value=t.mc;
				    	document.getElementById("a_nr").value=t.nr;
						var fs=document.getElementById("a_fs");
						for(var i=0;i<fs.options.length;i++){
							if(fs.options[i].text==t.fs){
								fs.options[i].selected=true;
							}
						}
					},
					error : function(data) {
						//right("读取失败!");
					}
				});
			}		
		}
		function seach(){
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/yxry/getPeo",
				data : {
					keyword : document.getElementById("i_name").value,
					time : Math.random()
				},
				beforeSend:function(data){
					document.getElementById("msg").innerHTML="查询中........";
				},
				success : function(data) {
					var t = eval(data);
					document.getElementById("msg").innerHTML="&nbsp;";
					document.getElementById("peo").innerHTML="";
					document.getElementById("peo").innerHTML=t.rows;
				},
				error : function(data) {
					document.getElementById("msg").innerHTML="查询失败";
				}
			});
		}
	</script>
</body>
</html>
