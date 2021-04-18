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
	href="${ctx}/jiankang/css/animate.min.css"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/js/plugins/datetimepicker/css/bootstrap-datetimepicker.css"
	rel="stylesheet"
>
<style>
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

tbody {
	border: 1px silver solid;
}

.panel-heading {
	padding: 0px 15px;
}

table {
	display: table;
	border-collapse: separate;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd
}
</style>
</head>
<body
	onload="load()"
	style="background-color:#bef2ff!important;"
>
	<form action="">
		<table style="width:100%;text-align:center;">
			<tr>
				<td
					colspan="5"
					style="border-top:none;border-bottom:none; vertical-align:top;"
				>
					<table style="width:100%;margin-left:auto;margin-right:auto;">
						<tr style="height:25px;line-height:25px;">
							<td
								style="width:200px;line-height:25px;text-align:left;vertical-align:top;"
							>
								<table
									style="width:100%;border:1px silver solid;background-color:white;margin-right:10px;"
								>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;border-bottom:1px silver solid;"
										>服务内容</td>
									</tr>
									<tr>
										<td
											style="height:200px; vertical-align:top; text-align: center;"
										><c:forEach
												var="fwlist"
												items="${fwlist}"
												varStatus="status"
											>
												<c:if test="${fwlist.isManaged==true}">
													<input
														type="button"
														value="${fwlist.name }"
														class="form-control"
														style="height:30px;width:100px;margin-top:20px;background-color: red;cursor:default;"
													<%-- 	onclick="showtab(${fwlist.diseaseId },'${fwlist.name }')" --%>
													/>
													</br>
												</c:if>
												<c:if test="${fwlist.isManaged==false}">
													<input
														type="button"
														value="${fwlist.name }"
														class="form-control"
														style="height:30px;width:100px;margin-top:20px;background-color:#e0dfdf;cursor:default;"
													/>
													</br>
												</c:if>
											</c:forEach></td>
									</tr>
									<tr>
										<td
											style="height:20px; vertical-align:top; text-align: center;"
										>&nbsp;</td>
									</tr>
								</table>
							</td>
							<td style="line-height:25px;text-align:left;vertical-align:top;">
								<table
									style="width:100%;border:1px silver solid;background-color:white; margin-left:10px;"
								>
									<tr>
										<td
											style="font-size:20px;font-weight:bolder;border-bottom:1px silver solid;"
										>促进目标</td>
									</tr>
									<tr>
										<td
											style=" vertical-align:top;text-align: center;padding-bottom: 20px;"
										>
											<div
												id="divT"
												style="overflow: auto;"
											>
												<!-- 													<input -->
												<!-- 														type="button" -->
												<!-- 														value="新增" -->
												<!-- 														class="form-control" -->
												<!-- 														style="height:30px;width:100px;margin-top:10px;margin-left: 10px;" -->
												<!-- 														onclick="add()" -->
												<!-- 													/> <br> -->
												<table
													style="width:95%;text-align: center;margin-right:10px;margin-left:10px;margin-top:20px;border:1px silver solid;text-align: left;"
													id="tz"
												>
													<tr>
														<td
															style="padding: 0px 5px;height:25px; line-heigth:25px;font-size:18px;border-bottom:1px silver solid;font-weight:bolder;"
														>体重管理
														<td>
													</tr>
													<tr style="height:25px;line-height:25px;">
														<td style="border:none;padding: 0px 5px;"><span
															style="font-size:15px;"
															id="n1"
														></span><span
															style="font-size:15px;"
															id="zq"
														></span><input
															id="bzq"
															type='text'
															style="display:none;width:30px;"
															value=''
														/> <span
															style="font-size:15px;"
															id="n2"
														></span><span
															style="font-size:15px;"
															id="n4"
														></span><select
															style=" width:50px;line-height:30px;height:30px;display:none;"
															id="lx"
														>
																<option
																	style="color:#000000!important;"
																	value="减重"
																>减重</option>
																<option
																	style="color:#000000!important;"
																	value="增重"
																>增重</option>
														</select> <span
															style="font-size:15px;"
															id="jz"
														></span><input
															id="bjz"
															type='text'
															style="display:none;width:30px;"
															value=''
														/> <span
															style="font-size:15px;"
															id="n3"
														></span> <input
															type="button"
															value="编辑"
															id="c0"
															class="form-control"
															style="height:30px;width:50px;margin: 5px 0px;<%=request.getAttribute("bjan")%>"
															onclick="edit('0')"
														/> <input
															type="button"
															value="保存"
															id="d0"
															class="form-control"
															style="height:30px;width:50px;margin: 5px 0px;display:none;"
															onclick="save('0')"
														/> <input
															type="button"
															value="取消"
															id="e0"
															class="form-control"
															style="height:30px;width:50px;margin: 5px 0px;display:none;"
															onclick="resetsz('0')"
														/></td>
													</tr>
													<tr style="height:25px;line-height:25px;">
														<td style="border:none;">&nbsp;</td>
													</tr>
												</table>
												<%
													List<String[]> list = (List<String[]>) request.getAttribute("cjmbs");
													for (int i = 0; i < list.size(); i++) {
												%>
												<table
													style="width:95%;text-align: center;margin-right:10px;margin-left:10px;margin-top:20px;border:1px silver solid;text-align: left;"
												>
									<tr>
										<td
											style="padding: 0px 5px;height:25px; line-heigth:25px;font-size:18px;border-bottom:1px silver solid;font-weight:bolder;"
										><%=list.get(i)[0]%>
										<td>
									</tr>
									<tr>
										<td style="border:none;padding: 0px 5px;"><span
											style="font-size:15px;"
										><%=list.get(i)[1]%></span>
										<td>
									</tr>
									<tr style="height:25px;line-height:25px;">
										<td style="border:none;">&nbsp;</td>
									</tr>
								</table> <%
 	}
 %>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</td>
		</tr>
		</table>
		<!--添加弹窗开始 -->
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
						>添加</span>
					</div>
					<div class="modal-body">
						<table style="width:100%;">
							<tr>
								<td style="width:40%;">
									<table style="width:95%;height:400px;">
										<tr>
											<td style="border:1px silver solid;height:30px;">理想指标</td>
										</tr>
										<tr>
											<td
												style="border:1px silver solid; vertical-align: top;padding-top: 10px;"
											>理想体重: <input
												id="a_tz"
												type="text"
												class="form-control"
												placeholder="请输入理想体重"
												style="width:130px;"
											/>
											</td>
										</tr>
									</table>
								</td>
								<td style="width:60%;border:1px silver solid;">
									<table style="width:100%;height:400px;">
										<tr>
											<td style="border-bottom:1px silver solid;height:30px;">计划</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>体重增加/减: <input
												id="a_zj"
												type="text"
												class="form-control"
												placeholder="请输入增/减体重"
												style="width:130px;"
											/>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 25px;height:30px;"
											>周期: <input
												id="a_zq"
												type="text"
												class="form-control"
												placeholder="请输入周期"
												style="width:120px;"
											/>周
											</td>
										</tr>
										<tr>
											<td
												style="vertical-align: top;padding: 10px 0px;height:30px;"
											>开始时间: <input
												id="a_kssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>结束时间: <input
												id="a_jssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
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
		<!--添加弹窗结束 -->
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
						>修改</span>
					</div>
					<div class="modal-body">
						<table style="width:100%;">
							<tr>
								<td style="width:40%;">
									<table style="width:95%;height:400px;">
										<tr>
											<td style="border:1px silver solid;height:30px;">理想指标</td>
										</tr>
										<tr>
											<td
												style="border:1px silver solid; vertical-align: top;padding-top: 10px;"
											>理想体重: <input
												id="e_tz"
												type="text"
												class="form-control"
												placeholder="请输入理想体重"
												style="width:130px;"
											/>
											</td>
										</tr>
									</table>
								</td>
								<td style="width:60%;border:1px silver solid;">
									<table style="width:100%;height:400px;">
										<tr>
											<td style="border-bottom:1px silver solid;height:30px;">计划</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>体重增加/减: <input
												id="e_zj"
												type="text"
												class="form-control"
												placeholder="请输入增/减体重"
												style="width:130px;"
											/>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 25px;height:30px;"
											>周期: <input
												id="e_zq"
												type="text"
												class="form-control"
												placeholder="请输入周期"
												style="width:120px;"
											/>周
											</td>
										</tr>
										<tr>
											<td
												style="vertical-align: top;padding: 10px 0px;height:30px;"
											>开始时间: <input
												id="e_kssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td
												style=" vertical-align: top;padding: 10px 0px;height:30px;"
											>结束时间: <input
												id="e_jssj"
												name="dataCon"
												class="form-control"
												runat="server"
												type="text"
												placeholder=""
											/> <span
												class="input-group-addon"
												style="display:none;"
											><span class="glyphicon glyphicon-th"></span></span>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
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
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/js/bootstrap-datetimepicker.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="utf8"
	></script>
	<script type="text/javascript">
		$("input[name='dataCon']").datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
		function load() {
			showtab(0, '体重管理');
			document.getElementById("tab").style.height = (document.body.clientHeight) + "px";
			document.getElementById("divT").style.height = (window.screen.availHeight - 360) + "px";
		}
		function showtab(id, tm) { //切换
			if (id > 0) {
				$('#mb').show();
				$('#tz').hide();
			} else {
				$('#tz').show();
				$('#mb').hide();
	
			}
			$.ajax({
				cache : false,
				type : "get",
				dataType : "Json",
				url : "${ctx}/jkzy/getFw",
				data : {
					id : id,
					peisId : '${peisId}',
					time : Math.random()
				},
				success : function(data) {
					if (id > 0) {
						document.getElementById("tm").innerHTML = tm;
						document.getElementById("sm").innerHTML = data.msg;
					} else {
						document.getElementById("n1").innerHTML = data.n1;
						document.getElementById("n2").innerHTML = data.n2;
						document.getElementById("n3").innerHTML = data.n3;
						document.getElementById("n4").innerHTML = data.lx;
						document.getElementById("zq").innerHTML = data.zq;
						$('#bzq').val(data.zq);
						document.getElementById("jz").innerHTML = data.jz;
						$('#bjz').val(data.jz);
						$("#lx").find("option[text='" + lx + "']").attr("selected", true);
					}
				},
				error : function(data) {
					var t = eval(data);
					noRight("获取信息失败！");
				}
			});
		}
		function add() { //新增按钮方法
			$('#addModel').modal();
		}
		function showinput() {
			$('#bzq').show();
			$('#bjz').show();
			$('#lx').show();
			$('#zq').hide();
			$('#jz').hide();
			$('#n4').hide();
		}
		function hideinput() {
			$('#bzq').hide();
			$('#bjz').hide();
			$('#lx').hide();
			$('#zq').show();
			$('#jz').show();
			$('#n4').show();
		}
		function showbut(a) {
			$('#d' + a).show();
			$('#e' + a).show();
			$('#c' + a).hide();
		}
		function resetsz(a) {
			hideinput(a);
			$('#d' + a).hide();
			$('#e' + a).hide();
			$('#c' + a).show();
		}
		function edit(id) { //新增按钮方法
			showinput();
			showbut(id);
		}
		function save(id) {
			var zq1 = $('#bzq').val();
			var lx = $("#lx option:selected").val();
			var jz1 = 1.0;
			;
			if (lx == "减重") {
				jz1 = -$('#bjz').val();
			} else {
				jz1 = $('#bjz').val();
			}
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/jkzy/updateTzgl",
				data : {
					peisId : '${peisId}',
					zq : zq1,
					jz : jz1
				},
				success : function(data) {
					if (data.msg == "OK") {
						noRight("保存成功!");
						document.getElementById("zq").innerHTML = $('#bzq').val();
						document.getElementById("jz").innerHTML = $('#bjz').val();
						document.getElementById("n4").innerHTML = lx;
						resetsz(id);
					} else {
						noRight("保存失败!");
					}
				},
				error : function(data) {
					noRight("保存失败!");
				}
			});
		}
		function wc() {
			$.ajax({
				cache : false,
				type : "get",
				dataType : "Json",
				url : "${ctx}/jkzj/updateJkzjzt",
				data : {
					id : "${rotate.id}",
					time : Math.random()
				},
				success : function(data) {
					right("评估成功!");
					parent.gb();
				},
				error : function(data) {
					right("评估失败!");
				}
			});
		}
	
		function fc() {
			$.ajax({
				cache : false,
				type : "get",
				dataType : "Json",
				url : "${ctx}/jkzj/addFc",
				data : {
					id : "${rotate.id}",
					time : Math.random()
				},
				success : function(data) {
					var t = eval(data);
					right(data.msg);
				},
				error : function(data) {
					var t = eval(data);
					right(data.msg);
				}
			});
		}
	</script>
</body>
</html>
