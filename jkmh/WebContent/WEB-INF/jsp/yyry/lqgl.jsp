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
						value="领取"
						class="btn btn-outline btn-default"
						style="margin-left: 0px;<%=request.getAttribute("dyBtn")%>"
						onclick="lq()"
					/> <input
						id="b-edit"
						type="button"
						value="导出"
						class="btn btn-outline btn-default"
						style="margin-left: 5px;<%=request.getAttribute("dcBtn")%>"
						onclick="doOut()"
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
							>> 报告领取</lable></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align:right; vertical-align:middle;"
						><%
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
						><span class="Jcxmphicon Jcxmphicon-th"></span></span> - <input
							id="<%=enname%>2"
							name="dataCon"
							class="form-control"
							runat="server"
							type="text"
							placeholder="截止<%=cnname%>"
						/> <span
							class="input-group-addon"
							style="display:none;"
						><span class="Jcxmphicon Jcxmphicon-th"></span></span> <%
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
							onclick="doSx('${ctx}/sys/updateSearchColumn','lqgl')"
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
		<!--领取弹窗开始 -->
		<div
			class="modal fade"
			id="lqModel"
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
						>领取</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px; background-color: f3f3f4;"
								> 领取方式</span> <select
									class="form-control single-line"
									id="a_lqr"
								>
									<option value="自领">自领</option>
									<option value="代领">代领</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 5px; padding-right:5px; background-color: f3f3f4;"
								> 领取人姓名</span> <input
									id="a_lqrxm"
									type="text"
									class="form-control"
									placeholder="请输入新的领取人姓名"
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
							onclick="doLq()"
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
		<!--领取弹窗结束 -->
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
		url: 'selectLqgl', //请求后台的URL（*）
		method: 'get', //请求方式（*）
		contentType : "application/x-www-form-urlencoded",
		toolbar:"#rsTabToolbar", //工具按钮用哪个容器
		striped: true, //是否显示行间隔色
		cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination: true, //是否显示分页（*）
		sortable: true, //是否启用排序
		sortOrder: "desc", //排序方式
		iconSize:"outline",
		showRefresh:true,
		showToggle:true,
		//queryParams: oTableInit.queryParams, //传递参数（*）
		sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
		pageNumber: 1, //初始化加载第一页，默认第一页
		height:$(window).height()-70,
		pageSize:10, //每页的记录行数（*）

		 onColumnSwitch: 
			  function getvl(params) {
			 var vc= $('#exampleTableEvents').bootstrapTable('getVisibleColumns','');			
				var strColumns="";
				$.post("${ctx}/sys/updateToggleColumn?clickColumn="+arguments[0]+":"+arguments[1]+"&tblname=lqgl",arguments[0]);
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
		            fieldString:"lqgl"
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
			${fields}		
			]
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
	function lq(){
		var ids="";
		var row=$.map($("#rsTab").bootstrapTable('getSelections'),function(row){
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
			right("请选择要领取的数据!");
			return false;
		}
		 document.getElementById("a_lqrxm").value="";
		 document.getElementById("a_lqr").selectedIndex=0;
		document.getElementById("eid").value=ids;
		$('#lqModel').modal();
		
	}
	function doLq(){
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "${ctx}/yyry/updateLqgl",
            data: {
                ids: document.getElementById("eid").value,
                lqr: document.getElementById("a_lqr").value,
                lqrxm: document.getElementById("a_lqrxm").value,
                time: Math.random()
            },
            success: function (data)
            {
            	right("领取成功!");
            },
            error:function(data){
            	right("领取失败!");
            }
        });
	}
	function doOut(){//导出方法
		var s="";		
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "doLqgl",
            data: {
           	tblName:'d_grtjbg',
            	keyword:s,
            	dcEnfields:'<%= request.getAttribute("dcEnfields")%>',
            	dcCnfields:'<%= request.getAttribute("dcCnfields")%>',
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	location.href="${ctx}/"+t.filename;            	
            },
            error:function(data){
            	right("导出失败!");
            }
        });
	}	
	</script>
</body>
</html>
