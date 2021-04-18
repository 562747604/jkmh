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
	<%
		User u = (User) session.getAttribute("user_session");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS ");
	%>
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
						<td><i class="fa fa-table"></i> <lable class="pathtitle">租户管理
							>> 代码库管理</lable></td>
					</tr>
					<tr>
						<form>
							<td
								class="font3"
								style="text-align: right; vertical-align: middle;"
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
								id="<%=enname%>" onchange='selChange("<%=enname%>")'
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
						</form>
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
							onclick="add()"
						/> <input
							id="b-del"
							type="button"
							value="删除"
							class="btn btn-outline btn-default"
							style="margin-left: 5px;"
							onclick="del('${ctx}/sys/deleteCodebase','dmkgl')"
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
						>新增</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 类型</span> <input
									id="a_ctype"
									type="text"
									class="form-control"
									placeholder="请输入类型"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 名称</span> <input
									id="a_cname"
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
									style="font-weight: bolder; padding-left: 33px; padding-right: 33px; background-color: f3f3f4;"
								> 值</span> <input
									id="a_cvalue"
									type="text"
									class="form-control"
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
						>修改</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 类型</span> <input
									id="e_ctype"
									type="text"
									class="form-control"
									placeholder="请输入类型"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 名称</span> <input
									id="e_cname"
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
									style="font-weight: bolder; padding-left: 33px; padding-right: 33px; background-color: f3f3f4;"
								> 值</span> <input
									id="e_cvalue"
									type="text"
									class="form-control"
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
						>查看</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 类型</span> <input
									id="s_ctype"
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
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;"
								> 名称</span> <input
									id="s_cname"
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
									style="font-weight: bolder; padding-left: 33px; padding-right: 33px; background-color: f3f3f4;"
								> 值</span> <input
									id="s_cvalue"
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
							onclick="doSx('updateSearchColumn','dmkgl')"
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
		url: 'selectCodebase', //请求后台的URL（*）
		method: 'get', //请求方式（*）
		contentType : "application/x-www-form-urlencoded",
		toolbar:"#rsTabToolbar", //工具按钮用哪个容器
		striped: true, //是否显示行间隔色
		cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination: true, //是否显示分页（*）
		sortable: true, //是否启用排序
		sortOrder: "desc", //排序方式
		height:$(window).height()-70,
		iconSize:"outline",
		showRefresh:true,
		showToggle:true,
		//queryParams: oTableInit.queryParams, //传递参数（*）
		sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
		pageNumber: 1, //初始化加载第一页，默认第一页
		pageSize:10, //每页的记录行数（*）
		onColumnSwitch: 
			  function getvl(params) {
			 var vc= $('#exampleTableEvents').bootstrapTable('getVisibleColumns','');			
				var strColumns="";
				$.post("updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=dmkgl",arguments[0]);
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
		            fieldString:"dmkgl"
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
	            	var d = '<a href="#" mce_href="#" onclick="show(\''+ row.id +'\')"><img title="查看" src="${ctx}/images/prev.gif" /></a> '; 
	                 var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id +'\')" ><img title="修改" src="${ctx}/images/update.gif" /></a> ';  
	              return d+e;  
			   } }	 , 
			${fields}			
			]
		});		
	
	function edit(id) {//修改按钮方法
		document.getElementById("eid").value=id;
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "${ctx}/sys/editCodebase",
            data: {
                id: id,
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
                document.getElementById("e_ctype").value = t.rows[0]["ctype"];
                document.getElementById("e_cname").value = t.rows[0]["cname"];
                document.getElementById("e_cvalue").value = t.rows[0]["cvalue"];
    			$('#editModel').modal();
            }
        });
	}
	function doEdit(){//修改保存方法
		if(document.getElementById("e_ctype").value==""){
			noRight("请输入代码类型!");return false;
		}else if(document.getElementById("e_cname").value==""){
			noRight("请输入名称!");return false;
		}else if(document.getElementById("e_cvalue").value==""){
			noRight("请输入值!");return false;
		}
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "updateCodebase",
            data: {
                id: document.getElementById("eid").value,
                ctype:document.getElementById("e_ctype").value,
                cname:document.getElementById("e_cname").value,
                cvalue:document.getElementById("e_cvalue").value,
         
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	right(t.msg);
            },
            error:function(data){
            	noRight(t.msg);
            }
        });
	}		
	
		function add() {//新增按钮方法
			document.getElementById("a_ctype").value = "";
			document.getElementById("a_cname").value = "";
			document.getElementById("a_cvalue").value = "";
			$('#addModel').modal();
		}
		function doAdd(){//新增保存方法
			if(document.getElementById("a_ctype").value==""){
				noRight("请输入代码类型!");return false;
			}else if(document.getElementById("a_cname").value==""){
				noRight("请输入名称!");return false;
			}else if(document.getElementById("a_cvalue").value==""){
				noRight("请输入值!");return false;
			}
			$('#addModel').modal('hide');	
			$.ajax({
                cache: false,
                type: "post",
                dataType: "Json",
                url: "insertCodebase",
                data: {
                    ctype:document.getElementById("a_ctype").value,
                    cname:document.getElementById("a_cname").value,
                    cvalue:document.getElementById("a_cvalue").value,
                    time: Math.random()
                },
                success: function (data)
                {
                var t = eval(data);
                right(t.msg);
                },
                error:function(data){
                	var t = eval(data);
                	noRight(t.msg);
                }
            });
		}
		function show(id){
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "editCodebase",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("s_ctype").value = t.rows[0]["ctype"]==undefined?"":t.rows[0]["ctype"];
	                document.getElementById("s_cname").value = t.rows[0]["cname"]==undefined?"":t.rows[0]["cname"];
	                document.getElementById("s_cvalue").value = t.rows[0]["cvalue"]==undefined?"":t.rows[0]["cvalue"];
	    			$('#showModel').modal();
	            }
	        });
		}
		$("input[name ='dataCon']").datetimepicker({
			language: 'zh-CN',
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
