<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
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
<style type="text/css">
.a {
	height: 40px;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: pointer;
	background-color: #bef2ff;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}

.nav-tabs>li>a {
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

.clearfix:after, .container:after, .tab-nav:after {
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
<body
	onload="load()"
	style="background-color:#bef2ff!important;"
>
	<form action="">
		<table>
			<tr style="height:40px;line-height:40px;">
				<td style="width:200px;border:none;height:25px;line-height:25px;"><input
					type="button"
					value="审核通过"
					class="form-control"
					 style="height:30px;width:100px;<%=request.getAttribute("shan") %>"
					onclick="wc()"
				/> <input
					type="button"
					value="编辑"
					id="a1"
					class="form-control"
					style="height:30px;width:50px;margin: 5px 0px;display:none;"
					onclick="alledit()"
				/> 
				<!-- <input
					type="button"
					value="取消"
					id="aa1"
					class="form-control"
					style="height:30px;width:50px;margin: 5px 0px;display:none;"
					onclick="allresetsz()"
				/> -->
				</td>
			</tr>
		</table>
		<table
			style="border:1px silver solid;width:100%;margin-left:auto;margin-right:auto;background-color:white;"
		>
			<tr style="height:25px;line-height:25px;">
				<td
					style="width:200px;border-bottom:1px silver solid;height:25px;line-height:25px;text-align:left;"
				><span
					style="font-size:16px; font-weight:bolder;margin-left:10px;"
				>方案指导</span></td>
				<td style="border-bottom:1px silver solid;">&nbsp;</td>
				<td style="width:50px;border-bottom:1px silver solid;"><a
					href="#.html"
					onclick="s_show('grs')"
				><img
						src="${ctx}/images/jkpgyw/u31.png"
						style="height:20px;"
					></a></td>
			</tr>
			<tr
				id="grs"
				style="display:table-row;"
			>
				<td colspan="3">
					<table style="width:100%;text-align:center;">
						<tr style="height:25px;line-height:25px;">
							<td
								style="width:30%;border-bottom:1px silver solid;border-right:1px silver solid;"
							><span style="font-size:15px;">项目名称</span></td>
							<td
								style="width:35%;border-bottom:1px silver solid;border-right:1px silver solid;"
							>系统建议值</td>
							<td
								style="width:35%;border-bottom:1px silver solid;border-right:1px silver solid;"
							>医生计划值</td>
						</tr>
					<% if(request.getAttribute("shan")!=null&&request.getAttribute("shan").equals("display:none;")){%>
					<c:forEach
							var="data"
							items="${data}"
							varStatus="status"
						>
							<tr style="height:25px;line-height:25px;">
								<td
									style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
								><span style="font-size:15px;">${data.name }
<c:if test="${data.type==1 }">(${data.unit})</c:if>
</span></td>
								<td
									style="border-bottom:1px silver solid;border-right:1px silver solid;<c:if test="${data.type==2 }">text-align:left;</c:if>"
								>${data.plan}</td>
								<td
									style="border-bottom:1px silver solid;border-right:1px silver solid;<c:if test="${data.type==2 }">text-align:left;</c:if>"
								>
								<c:if test="${data.doctorPlan1==null||data.doctorPlan1=='' }">
									${data.doctorPlan}
								</c:if>
								<c:if test="${data.doctorPlan1!=null&&data.doctorPlan1!='' }">
									${data.doctorPlan}~${data.doctorPlan1}
								</c:if>
								</td>
							</tr>
						</c:forEach>
				<%} else{%>
						<c:forEach
							var="data"
							items="${data}"
							varStatus="status"
						>
							<tr style="height:25px;line-height:25px;">
								<td
									style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
								><span style="font-size:15px;">${data.name }
								<c:if test="${data.type==1 }">(${data.unit})</c:if>
								</span></td>
								<td
									style="border-bottom:1px silver solid;border-right:1px silver solid;<c:if test="${data.type==2 }">text-align:left;</c:if>"
								>${data.plan}</td>
								<td
									style="border-bottom:1px silver solid;border-right:1px silver solid;<c:if test="${data.type==2 }">text-align:left;</c:if>"
								>
								<c:if test="${data.type==2 }">
									${data.doctorPlan}
								</c:if>
								<c:if test="${data.type==1 }">
								<input
									id="b${data.id }"
									type='text'
									style="width:40%;"
									value='${data.doctorPlan }'
									placeholder="请输入最小值"
								/>~<input
									id="b1${data.id }"
									type='text'
									style="width:40%;"
									value='${data.doctorPlan1 }'
									placeholder="请输入最大值"
								/></c:if>
								</td>
							</tr>
						</c:forEach>
						<%} %>
					</table>
				</td>
			</tr>
		</table>
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
						>菜谱</span>
					</div>
					<div class="modal-body">
						<table style="width: 300px;">
							<tr>
								<td
									style="border:1px silver solid;text-align: center;background-color: #e8e4e4;height:30px; line-height: 30px;"
								><span style="font-size: 20px;font-weight: bolder;">早餐</span></td>
								<td
									style="border:1px silver solid;text-align: center;height:30px; line-height: 30px;"
								><span style="font-size: 20px;font-weight: bolder;">午餐</span></td>
								<td
									style="border:1px silver solid;text-align: center;height:30px; line-height: 30px;"
								><span style="font-size: 20px;font-weight: bolder;">晚餐</span></td>
							</tr>
						</table>
						<table
							style="width: 100%;margin-top: 10px;background-color: white;text-align: center;height:30px; line-height: 30px;"
						>
							<tr>
								<td style="border:1px silver solid;width: 45%;"><span>食物</span></td>
								<td style="border:1px silver solid;width: 10%;"><span>操作</span></td>
								<td style="border:1px silver solid;width: 45%;"><span>已选</span></td>
							</tr>
							<tr>
								<td
									style="border:1px silver solid;height:300px;overflow: auto;vertical-align: top;"
								>
									<table style="width:90%;margin: 10px auto;">
										<tr>
											<td style="border:1px silver solid;width: 10%;"></td>
											<td style="border:1px silver solid;width: 45%;">名称</td>
											<td style="border:1px silver solid;width: 45%;">成份</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉</td>
										</tr>
									</table>
								</td>
								<td
									style="border:1px silver solid;text-align: center;vertical-align: middle;"
								><a href="#.html"><img
										alt=""
										src="${ctx}/images/fwjzz/u442.png"
										height="40"
									></a></br> </br> <a href="#.html"><img
										alt=""
										src="${ctx}/images/fwjzz/u444.png"
										height="40"
									></a></td>
								<td
									style="border:1px silver solid;height:300px;overflow: auto;vertical-align: top;"
								>
									<table style="width:90%;margin: 10px auto;">
										<tr>
											<td style="border:1px silver solid;width: 10%;"></td>
											<td style="border:1px silver solid;width: 45%;">名称</td>
											<td style="border:1px silver solid;width: 45%;">成份</td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉 <input
												type="text"
												class="form-control"
												style="width:50px;"
											></td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid;">面粉 <input
												type="text"
												class="form-control"
												style="width:50px;"
											></td>
										</tr>
										<tr>
											<td style="border:1px silver solid;"><input
												type="checkbox"
											></td>
											<td style="border:1px silver solid;">馒头</td>
											<td style="border:1px silver solid; vertical-align: middle;">面粉
												<input
												type="text"
												class="form-control"
												style="width:50px;"
											>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
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
			id="add1Model"
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
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 项目</span> <select
									class="form-control"
									id="e_zj"
								>
									<option value="">慢跑</option>
									<option value="1">跳绳</option>
									<option value="2">骑车</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 时长</span> <input
									id=""
									type="text"
									class="form-control"
									placeholder="请输入时长"
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
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
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
	<script src="${ctx}/jiankang/js/plugins/echarts/echarts-all.js"></script>
	<script
		src="${ctx}/jiankang/js/prefixfree.min.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/jquery-tab.js"
		charset="utf8"
	></script>
	<script type="text/javascript">
	function load() {
		//alledit();
	}
		function e_show(name) {
			document.getElementById("i_" + name).style.display = "none";
			document.getElementById("t_" + name).style.display = "inline";
			document.getElementById("bs_" + name).style.display = "inline";
			document.getElementById("bc_" + name).style.display = "inline";
		}
		function e_noshow(name) {
			document.getElementById("i_" + name).style.display = "inline";
			document.getElementById("t_" + name).style.display = "none";
			document.getElementById("bs_" + name).style.display = "none";
			document.getElementById("bc_" + name).style.display = "none";
		}
		function s_show(name) {
			if (document.getElementById(name).style.display == "table-row") {
				document.getElementById(name).style.display = "none";
			} else {
				document.getElementById(name).style.display = "table-row";
			}
		}
		function add() { //新增按钮方法
			$('#addModel').modal();
		}
		function add1() { //新增按钮方法
			$('#add1Model').modal();
		}
		function doAdd() { //新增保存方法
	
			$('#addModel').modal('hide');
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "/sys/insertDmkgl",
				data : {
					type : "add",
					ctype : document.getElementById("a_ctype").value,
					cname : document.getElementById("a_cname").value,
					cvalue : document.getElementById("a_cvalue").value,
					time : Math.random()
				},
				success : function(data) {
					right("新增成功!");
				},
				error : function(data) {
					right("新增失败!");
				}
			});
		}
		function change(str){
			if(str=="ysDiv"){
				document.getElementById("ysDiv").style.display="table";
				document.getElementById("ydDiv").style.display="none";
				document.getElementById("smDiv").style.display="none";
			}else if(str=="ydDiv"){
				document.getElementById("ysDiv").style.display="none";
				document.getElementById("ydDiv").style.display="table";
				document.getElementById("smDiv").style.display="none";
			}else if(str=="smDiv"){
				document.getElementById("ysDiv").style.display="none";
				document.getElementById("ydDiv").style.display="none";
				document.getElementById("smDiv").style.display="table";
			}
		}
// 		function allresetsz()
// 		{
// 			$('#a1').show();
// 			$('#aa1').hide();	
// 			   <c:forEach var="data" items="${data}" varStatus="status">   
// 			   hideinput('${data.id }');
// 			   </c:forEach> 
// 		}
// 		 function alledit() { //新增按钮方法
			$('#aa1').show();
			$('#a1').hide();	
// 			   <c:forEach var="data" items="${data}" varStatus="status">   
// 				showinput('${data.id }');
// 			   </c:forEach> 
// 				}
		 				
// 		function showinput(a){
// 			 $('#b1'+a).show();
// 			 $('#b'+a).hide();
// 			}
// 			function hideinput(a){
// 			 $('#b'+a).show();
// 			 $('#b1'+a).hide();
// 			}
// 			function showbut(a){
// 				        $('#d'+a).show();
// 						$('#e'+a).show();
// 						$('#c'+a).hide();	
// 						}
// 			function resetsz(a)
// 			{
// 			hideinput(a);
// 			 $('#d'+a).hide();
// 			 $('#e'+a).hide();
// 			 $('#c'+a).show();
// 			}
// 					function edit(id) { //新增按钮方法
// 					showinput(id);
// 					showbut(id);
// 					}
					function save(){
						var json="[";
						var i=0;
						var r=true;
						var msg="";
						var amsg=false;
						 <c:forEach var="data" items="${data}" varStatus="status"> 
						 if('${data.type }'==1){
						 if($('#b${data.id }').val()!=""){
							
							 if(isNaN($('#b${data.id }').val())){
								 amsg=true;
							 }
						 }
						 if($('#b1${data.id }').val()!=""){
							 if(isNaN($('#b1${data.id }').val())){
								 amsg=true;
							 }
						 }
						 
							json=json+'{"fId":"${data.id }","fDoctorPlan":"'+($('#b1${data.id }').val()==""?$('#b${data.id }').val():$('#b${data.id }').val()+"~"+$('#b1${data.id }').val())+'","fCloseWarn":0},';
					
							i=i+1;
						 }
						 </c:forEach> 
						 if(amsg==true){
							 right("请输入数字!");
						 }else{
						 if (i>0)
							 {
						 json=json.substring(0,json.length-1);
							 }
						 json=json+"]";
						$.ajax({
			                cache: false,
			                type: "post",
			                dataType: "Json",
			                url: "${ctx}/jkzy/updateCjfa",
			                data: {
			                	peisId:"${PeisInfoId}",
			                	josnlist:json 
			                },
			                success: function (data)
			                {
			                	if (data.msg!="OK")
			                	{
			                		noRight(data.msg);
			                		 r=false;
			                	}
			                	else
			                	{	
			                	//noRight("保存成功!");
// 			                 <c:forEach var="data" items="${data}" varStatus="status">   
// 			                 document.getElementById("b${data.id }").innerHTML=$('#b1${data.id }').val();
// 							 </c:forEach> 
			                	//allresetsz();	
			                	$.ajax({
					                cache: false,
					                type: "get",
					                dataType: "Json",
					                url: "${ctx}/jkfw/updateFwzt",
					                data: {
					                    id: "${rotate.id}",
					                    time: Math.random()
					                },
					                success: function (data)
					                {   
					                	noRight("审核通过！开始服务！");
					                	$(window.parent.parent.parent.$("#iframe0"))[0].contentWindow.search();
					                	
					                },
					                error:function(data){
					                	right("审核失败!");
					                }
					            });	
			                	}
			                },
			                error:function(data){
			                	noRight("保存失败!");
			                	 r=false;
			                }
			            });	
					 
					 
						return r;
						 }
					}
					function wc(){
						
						var i=0;
						 <c:forEach var="data" items="${data}" varStatus="status">   
		                 i=i+1;
						 </c:forEach> 
						// if (i==0)
						//	 {
						//	 noRight("接口无数据！不能保存！");
		                //	 return false; 
						//	 }
						swal({
							title : "",
							text : "确认审核通过吗?",
							type : "",
							showCancelButton : true,
							closeOnConfirm : false,
							showLoaderOnConfirm : false,
						}, function() {	
							var json="[";
							var i=0;
							var r=true;
							var msg="";
							var amsg=false;
							 <c:forEach var="data" items="${data}" varStatus="status"> 
							 if('${data.type }'==1){
							 if($('#b${data.id }').val()!=""){
								 if(isNaN($('#b${data.id }').val())){
									 amsg=true;
								 }
							 }
							 if($('#b1${data.id }').val()!=""){
								 if(isNaN($('#b1${data.id }').val())){
									 amsg=true;
								 }
							 }
								json=json+'{"fPlanId":"${data.planId }","fDoctorPlan":"'+($('#b1${data.id }').val()==""?$('#b${data.id }').val():$('#b${data.id }').val()+"~"+$('#b1${data.id }').val())+'","fCloseWarn":0},';
						
								i=i+1;
							 }
							 </c:forEach> 
							 if(amsg==true){
								 noRight("请输入数字!");
							 }else{
							 if (i>0)
								 {
							 json=json.substring(0,json.length-1);
								 }
							 json=json+"]";
							$.ajax({
				                cache: false,
				                type: "post",
				                dataType: "Json",
				                url: "${ctx}/jkzy/updateCjfa",
				                data: {
				                	peisId:"${PeisInfoId}",
				                	josnlist:json 
				                },
				                success: function (data)
				                {
				                	if (data.msg!="OK")
				                	{
				                		noRight(data.msg);
				                		 r=false;
				                	}
				                	else
				                	{	
				                	//noRight("保存成功!");
//	 			                 <c:forEach var="data" items="${data}" varStatus="status">   
//	 			                 document.getElementById("b${data.id }").innerHTML=$('#b1${data.id }').val();
//	 							 </c:forEach> 
				                	//allresetsz();	
				                	$.ajax({
						                cache: false,
						                type: "get",
						                dataType: "Json",
						                url: "${ctx}/jkfw/updateFwzt",
						                data: {
						                    id: "${rotate.id}",
						                    time: Math.random()
						                },
						                success: function (data)
						                {   
						                	noRight("审核通过！开始服务！");
						                	//$(window.parent.parent.parent.$("#iframe0"))[0].contentWindow.search();
						                	parent.parent.gb();
											parent.parent.ifa.location.reload(true);
						                },
						                error:function(data){
						                	right("审核失败!");
						                }
						            });	
				                	}
				                },
				                error:function(data){
				                	noRight("保存失败!");
				                }
				            });	
							 }
						})
					}
	</script>
</body>
</html>
