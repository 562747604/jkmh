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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>丁丁健康管理系统</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<link rel="shortcut icon" href="${ctx}/images/favicon.ico">
<link href="${ctx}/jiankang/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link
	href="${ctx}/jiankang/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link
	href="${ctx}/jiankang/css/plugins/bootstrap-table/bootstrap-table.css"
	rel="stylesheet" />
<link href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<form action="">
		<div class="col-sm-12">
			<!-- Example Events -->
			<div class="example-wrap">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="line-height: 30px; margin-top: 10px;">
					<tr>
						<td><i class="fa fa-table"></i> <lable class="pathtitle">超级管理员
							>> 代码库管理</lable></td>
					</tr>
					<tr><form>
						<td class="font3"
							style="text-align: right; line-height: 30px; vertical-align: middle; padding-bottom: 5px;"><input
							type="text" id="keyword" class="form-control" placeholder="请输入名称" />
							<select class="form-control single-line" id="s_ctype">
								<option value="">代码类型</option>
								<option value="性别">性别</option>
								<option value="民族">民族</option>
						</select> <input type="submit" value="检索1" class="form-control"
							style="height: 30px; width: 55px;" onclick="sx('/jkzj/selectHfjl?','s_codebase')" /> 
							<input id="addbtn"
							type="button" value="筛选" class="form-control"
							style="height: 30px; width: 55px;"
							/></td>
							</form>
					</tr>
				</table>
				<div class="example">
					<div class="btn-group hidden-xs" id="rsTabToolbar" role="group"
						style="height: 30px; line-height: 30px;">
						<input id="b-add" type="button" value="新增"
							class="btn btn-outline btn-default" onclick="add()" /> <input
							id="b-edit" type="button" value="修改"
							class="btn btn-outline btn-default" style="margin-left: 5px;"
							onclick="edit(1)" /> <input id="b-del" type="button"
							value="删除" class="btn btn-outline btn-default"
							style="margin-left: 5px;"
							onclick="del('dmlglcheck.servlet?','hfjl')" />
					</div>
					<table id="rsTab" data-height="510"
						data-url="js/demo/bootstrap_table_test.json"
						data-mobile-responsive="true" data-click-to-select="true">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true" data-halign="center"
									data-align="center"></th>
								<th data-field="id" data-halign="center" data-align="center">类型</th>
								<th data-field="name" data-halign="center" data-align="center">名称</th>
								<th data-field="price" data-halign="center" data-align="center">值</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<!-- End Example Events -->
		</div>
		<!--新增弹窗开始 -->
		<div class="modal fade" id="addModel" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="background-color: #f3f3f4;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<span class="glyphicon glyphicon-align-center"
							style="color: Silver; font-size: 25px;">新增</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;">
									类型</span> <input id="a_ctype" type="text"
									class="form-control input-lg" placeholder="请输入类型" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;">
									名称</span> <input id="a_cname" type="text"
									class="form-control input-lg" placeholder="请输入新的名称" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"
									style="font-weight: bolder; padding-left: 33px; padding-right: 33px; background-color: f3f3f4;">
									值</span> <input id="a_cvalue" type="text"
									class="form-control input-lg" placeholder="请输入新的值" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="doAdd()">
							<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--新增弹窗结束 -->
		<!--修改弹窗开始 -->
		<div class="modal fade" id="editModel" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="background-color: #f3f3f4;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<span class="glyphicon glyphicon-align-center"
							style="color: Silver; font-size: 25px;">修改</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;">
									类型</span> <input id="e_ctype" type="text"
									class="form-control input-lg" placeholder="请输入类型" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px; background-color: f3f3f4;">
									名称</span> <input id="e_cname" type="text"
									class="form-control input-lg" placeholder="请输入新的名称" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"
									style="font-weight: bolder; padding-left: 33px; padding-right: 33px; background-color: f3f3f4;">
									值</span> <input id="e_cvalue" type="text"
									class="form-control input-lg" placeholder="请输入新的值" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="doEdit()">
							<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--修改弹窗结束 -->
		<!--筛选弹窗开始 -->
		<div class="modal fade" id="sxModel" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="background-color: #f3f3f4;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<span class="glyphicon glyphicon-align-center"
							style="color: Silver; font-size: 25px;">筛选</span>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<table style="width: 100%;">
								<tr>
									<td style="text-align: right;"><label><input
											type="checkbox">全选 </label></td>
								</tr>
								<tr>
									<td style="text-align: left;" id="sxtd"><input
										type="checkbox" name="sxck" value="id">类型 <input
										type="checkbox" name="sxck" value="name"
										style="margin-left: 20px;">名称 <input
										type="checkbox" value="price" name="sxck"
										style="margin-left: 20px;">值
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
						</button>
						<button type="button" class="btn btn-primary"
							onclick="doSx('dmlglcheck.servlet?','hfjl')">
							<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--筛选弹窗结束 -->
		<input type="hidden" id="eid">
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/bootstrap-table.min.js"
		charset="utf8"></script>
	<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"
		charset="utf8"></script>
	<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/locale/bootstrap-table.js"
		charset="utf8"></script>
	<script
		src="${ctx}/jiankang/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"
		charset="utf8"></script>
	<script>
	
	$('#rsTab').bootstrapTable({
		url: '${ctx}/jkzj/selectHfjl', //请求后台的URL（*）
		method: 'get', //请求方式（*）
		contentType : "application/x-www-form-urlencoded",
		toolbar:"#exampleTableEventsToolbar", //工具按钮用哪个容器
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
		pageSize: 10, //每页的记录行数（*）
		
		
		 onColumnSwitch: 
			  function getvl(params) {
	            var vc= $('#exampleTableEvents').bootstrapTable('getVisibleColumns','');
				var strColumns="";
				 for (var i=0;i<vc.length;i++)
                {
					  if (vc[i]["title"]!="" && vc[i]["switchable"]==true && vc[i]["field"]!="0")
					  {
						strColumns=strColumns+vc[i]["field"]+","; 
					  }
				 }
				 if (vc.length>0)
				 {
					 //$.post("/user/saveColumns?strColumns="+strColumns+"&tableName=s_rbac_user",strColumns);
				 }
				  //alert(strColumns);
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
	                   return index+1;  
			}
		}, 
		${fields} ,
        {
            title: '操作',
            align: 'center',
			  switchable:false,
            formatter:function(value,row,index){  
                 var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id +'\')"><img title="修改" src="${ctx}/images/update.gif" /></a> ';  
                 var d = '<a href="#" mce_href="#" onclick="del(\'/jkzj/deleteHfjl\',\'s_codebase\',\''+ row.id +'\')">删除</a> ';  
              return e+d;  
		   } }			
		
		]
	});		
	
	function edit(id) {//修改按钮方法
		document.getElementById("eid").value=id;
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "${ctx}/jkzj/editHfjl",
            data: {
                type: "edit",
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
		alert(document.getElementById("eid").value);
		$.ajax({
            cache: false,
            type: "post",
            dataType: "Json",
            url: "${ctx}/jkzj/updateHfjl",
            data: {
                type: "edit",
                id: document.getElementById("eid").value,

                ctype:document.getElementById("e_ctype").value,
                cname:document.getElementById("e_cname").value,
                cvalue:document.getElementById("e_cvalue").value,
         
                time: Math.random()
            },
            success: function (data)
            {
            	var t = eval(data);
            	right("修改成功!");
            },
            error:function(data){
            	right("修改失败!");
            }
        });
	}		
	
	
		$('#rsTab').on('click-row.bs.table', function (e, row, element) 
				{
				  $('.success').removeClass('success');//去除之前选中的行的，选中样式
				  $(element).addClass('success');//添加当前选中的 success样式用于区别
				});
		function add() {//新增按钮方法
			document.getElementById("a_ctype").value = "";
			document.getElementById("a_cname").value = "";
			document.getElementById("a_cvalue").value = "";
			$('#addModel').modal();
		}
		function doAdd(){//新增保存方法
						
			$('#addModel').modal('hide');	
			$.ajax({
                cache: false,
                type: "post",
                dataType: "Json",
                url: "${ctx}/jkzj/insertHfjl",
                data: {
                    type: "add",
                    ctype:document.getElementById("a_ctype").value,
                    cname:document.getElementById("a_cname").value,
                    cvalue:document.getElementById("a_cvalue").value,
                    time: Math.random()
                },
                success: function (data)
                {
                	right("新增成功!");
                },
                error:function(data){
                	right("新增失败!");
                }
            });
		}
		
	</script>
</body>
</html>
