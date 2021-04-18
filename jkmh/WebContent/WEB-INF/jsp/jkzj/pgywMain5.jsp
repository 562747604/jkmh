<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%
String id=(String)request.getAttribute("id");
String upid=(String)request.getAttribute("upid");
String nextid=(String)request.getAttribute("nextid");
String[] info=(String[])request.getAttribute("info");
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
tbody {border: 1px silver solid;}
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
					value="加入复查"
					class="form-control"
					style="height:30px;width:80px;margin-left:20px;"
					onclick="fc()"
				/> <input
					type="button"
					value="审核通过"
					class="form-control"
					style="height:30px;width:80px;<%=request.getAttribute("shtg") %>"
					onclick="wc()"
				/>
				</td>
			</tr>
			<tr>
			<td
					style="text-align:center; vertical-align:top;
						border-right:15px #27bac1 solid;border-left:20px #27bac1 solid;border-bottom:15px #27bac1 solid;" >
					<table style="width:200px;text-align:center;">
					 <tr>
						 <td colspan="2"
					style="text-align:center;height:30px;line-height:30px; vertical-align:middle;width:200px;" >
					     <h2>基本信息</h2>
				       </td>
					   </tr>
						<tr>
							<td
								colspan="2"
								style="text-align:center;height:30px;line-height:30px; vertical-align:middle;"
							><a href="${ctx}/jkzj/pgywMain5?id=<%=upid%>"><img
									src="${ctx}/images/jkpgyw/u756.png"
									style="height:30px;"
								></a> <img
								src="${ctx}/images/jkpgyw/u718.jpg"
								style="height:100px;"
							> <a href="${ctx}/jkzj/pgywMain5?id=<%=nextid%>"><img
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
                                                <li  style="height:40px!important;"> <a href="${ctx}/jkzj/pgywMain1?id=<%=request.getAttribute("id") %>" style="height:40px!important;"><h2 style="margin-top: 0px;margin-bottom: 0px;">总检结论及建议</h2></a>
                                                </li>
                                                <li style="height:40px!important;"><a href="${ctx}/jkzj/pgywMain2?id=<%=request.getAttribute("id") %>"  style="height:40px!important;"><h2 style="margin-top: 0px;margin-bottom: 0px;">重要指标</h2></a>
                                                </li>
												<li   style="height:40px!important;">
												<a href="${ctx}/jkzj/pgywMain3?id=<%=request.getAttribute("id") %>" style="height:40px!important;"  ><h2 style="margin-top: 0px;margin-bottom: 0px;">慢性易感性评估</h2></a>
							                    </li>
												<li style="height:40px!important;">
												<a href="${ctx}/jkzj/pgywMain4?id=<%=request.getAttribute("id") %>"  style="height:40px!important;"><h2 style="margin-top: 0px;margin-bottom: 0px;">指导建议</h2></a>
							                    </li>
<!-- 												<li class="active"  style="height:40px!important;"> -->
<!-- 												<a href="${ctx}/jkzj/pgywMain5?id=<%=request.getAttribute("id") %>" style="height:40px!important;"><h2 style="margin-top: 0px;margin-bottom: 0px;">促进目标</h2></a> -->
<!-- 							                    </li> -->
                                            </ul>
                                        </div>
                                    </div>
						</div>
							  
							  </td>
						</tr>
						</table>
						<table style="width:100%;text-align:center;height:732px;">
						<tr>
							<td
								colspan="5"
								style="border:1px silver solid;border-top:none;border-bottom:none; vertical-align:top;"
							>
								<table
									style="width:90%;margin-left:auto;margin-right:auto;margin-top:20px;"
								>
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
													>服务</td>
												</tr>
												<tr>
													<td
														style="height:200px; vertical-align:top; text-align: center;"
													><input
														type="button"
														value="体重管理"
														class="form-control"
														style="height:30px;width:100px;margin-top:20px;"
														onclick="showtab('tz','mb')"
													/></br> <input
														type="button"
														value="慢病管理"
														class="form-control"
														style="height:30px;width:100px;margin-top:10px;"
														onclick="showtab('mb','tz')"
													/></td>
												</tr>
											</table>
										</td>
										<td
											style="line-height:25px;text-align:left;vertical-align:top;"
										>
											<table
												style="width:100%;border:1px silver solid;background-color:white; margin-left:10px;"
											>
												<tr>
													<td
														style="font-size:20px;font-weight:bolder;border-bottom:1px silver solid;"
													>内容</td>
												</tr>
												<tr>
													<td style="height:400px; vertical-align:top;">
<!-- 													<input -->
<!-- 														type="button" -->
<!-- 														value="新增" -->
<!-- 														class="form-control" -->
<!-- 														style="height:30px;width:100px;margin-top:10px;margin-left: 10px;" -->
<!-- 														onclick="add()" -->
<!-- 													/> <br> -->
														<table
															style="border:1px silver solid;width:90%;margin-left:auto;margin-right:auto;background-color:white;margin-top:20px;"
														>
															<tr
																id="jzbs"
																style="display:table-row;" >
																<td colspan="3">
	 <table style="width:100%;text-align: center;" id="tz">
	 <tr><td colspan="4" style="border-bottom:1px silver solid;">体重管理<td></tr>
	<tr style="height:25px;line-height:25px;">

		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>名称</td>

		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>指标值</td>
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>医生指导值</td>
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		></td>
	</tr>										
									
<c:forEach var="weight" items="${weight}" varStatus="status">   

		<tr style="height:25px;line-height:25px;">
			<td
				style="width:50px;border-bottom:1px silver solid;border-right:1px silver solid;"
			>  ${weight.name }<span style="font-size:15px;"></span></td>

			<td
				style="border-bottom:1px silver solid;border-right:1px silver solid;"
			><span style="font-size:15px;" id="a${weight.id }">${weight.value }</span></td>
			<td
				style="border-bottom:1px silver solid;border-right:1px silver solid;"
			><span style="font-size:15px;" id="b${weight.id }">${weight.doctor }</span><input id="b1${weight.id }" type='text' style="display:none;" value='${weight.doctor }' /></td>

			<td style="border-bottom:1px silver solid;"><input
				type="button"
				value="编辑"
				id="c${weight.id }"
				class="form-control"
				style="height:30px;width:50px;margin: 5px 0px;"
				onclick="edit('${weight.id }')"
			/>
			<input
				type="button"
				value="保存"
				id="d${weight.id }"
				class="form-control"
				style="height:30px;width:50px;margin: 5px 0px;display:none;"
				onclick="save('${weight.id }')"
			/>
			<input
				type="button"
				value="取消"
				id="e${weight.id }"
				class="form-control"
				style="height:30px;width:50px;margin: 5px 0px;display:none;"
				onclick="resetsz('${weight.id }')"
			/></td>
		</tr>
</c:forEach> 									
 </table>
  <table style="width:100%;text-align: center;display:none;"  id="mb">
  <tr><td colspan="4" style="border-bottom:1px silver solid;">慢病管理指标<td></tr>
	<tr style="height:25px;line-height:25px;">
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>名称</td>

		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>指标值</td>
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>医生指导值</td>
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		></td>
	</tr>										
			
									
<c:forEach var="deseases" items="${deseases}" varStatus="status">   

		<tr style="height:25px;line-height:25px;">
			<td
				style="width:50px;border-bottom:1px silver solid;border-right:1px silver solid;"
			>${deseases.name }<span style="font-size:15px;"></span></td>

			<td
				style="border-bottom:1px silver solid;border-right:1px silver solid;"
			>${deseases.value }</td>
			<td
				style="border-bottom:1px silver solid;border-right:1px silver solid;"
			><span style="font-size:15px;" id="b${deseases.id }">${deseases.doctor }</span><input id="b1${deseases.id }" type='text' style="display:none;" value='${deseases.doctor }' /></td>

			<td style="border-bottom:1px silver solid;"> 
			<input
				type="button"
				value="编辑"
				id="c${weight.id }"
				class="form-control"
				style="height:30px;width:50px;margin: 5px 0px;"
				onclick="edit('${deseases.id }')"
			/>
			<input
				type="button"
				value="保存"
				id="d${weight.id }"
				class="form-control"
				style="height:30px;width:50px;margin: 5px 0px;display:none;"
				onclick="save('${deseases.id }')"
			/>
			<input
				type="button"
				value="取消"
				id="e${weight.id }"
				class="form-control"
				style="height:30px;width:50px;margin: 5px 0px;display:none;"
				onclick="resetsz('${deseases.id }')"
			/>
			 </td>
		</tr>
</c:forEach> 									

																	</table>																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																</td>
															</tr>
														</table></td>
												</tr>
											</table>
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
			document.getElementById("tab").style.height=(document.body.clientHeight)+"px";
		}
		function showtab(a,b) { //切换
			$('#'+a).show();
			$('#'+b).hide();
		}
		function add() { //新增按钮方法
			$('#addModel').modal();
		}
function showinput(a){
 $('#b1'+a).show();
 $('#b'+a).hide();
}
function hideinput(a){
 $('#b'+a).show();
 $('#b1'+a).hide();
}
function showbut(a){
	        $('#d'+a).show();
			$('#e'+a).show();
			$('#c'+a).hide();	
			}
function resetsz(a)
{
hideinput(a);
 $('#d'+a).hide();
 $('#e'+a).hide();
 $('#c'+a).show();
}
		function edit(id) { //新增按钮方法
		showinput(id);
		showbut(id);
		}
		function save(id){
			$.ajax({
                cache: false,
                type: "post",
                dataType: "Json",
                url: "${ctx}/jkzj/updatePromotionGoal",
                data: {
                    id: id,
                    value: $('#b1'+id).val()
                },
                success: function (data)
                {
                	noRight("保存成功!");
					document.getElementById("b"+id).innerHTML=$('#b1'+id).val();
                	resetsz(id);	
                },
                error:function(data){
                	noRight("保存失败!");
                }
            });			
		}
		function wc(){
			$.ajax({
                cache: false,
                type: "get",
                dataType: "Json",
                url: "${ctx}/jkzj/updateJkzjzt",
                data: {
                    id: "<%=id%>",
                    time: Math.random()
                },
                success: function (data)
                {
                	right("评估成功!");
                	parent.gb();
                },
                error:function(data){
                	right("评估失败!");
                }
            });			
		}
		
		function fc(){
			$.ajax({
                cache: false,
                type: "get",
                dataType: "Json",
                url: "${ctx}/jkzj/addFc",
                data: {
                    id: "<%=id%>",
                    time: Math.random()
                },
                success: function (data)
                {
                	var t = eval(data);
                	right(data.msg);
                },
                error:function(data){
                	var t = eval(data);
                	right(data.msg);
                }
            });			
		}
	</script>
</body>
</html>
