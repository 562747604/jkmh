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
		 
					<table style="width:100%;text-align:center;margin-top:-20px;">
						<tr>
							<td
								colspan="5"
								style="border-top:none;border-bottom:none; vertical-align:top;"
							><c:forEach
									var="diseases"
									items="${diseases}"
									varStatus="status"
									
								>
									<table
										style="border:1px silver solid;width:100%;margin-left:auto;margin-right:auto;background-color:white;margin-top:20px;"
									>
										<tr style="height:25px;line-height:25px;">
											<td
												style="width:800px;border-bottom:1px silver solid;height:25px;line-height:25px;text-align:left;"
											><span
												style="font-size:16px; font-weight:bolder;margin-left:10px;"
											> ${diseases.name }  </span></td>
											<td style="border-bottom:1px silver solid;">&nbsp;</td>
											<td style="width:50px;border-bottom:1px silver solid;"><a
												href="#.html"
												onclick="s_show('grs${status.index}')"
											><img
													src="${ctx}/images/jkpgyw/u31.png"
													style="height:20px;"
												></a></td>
										</tr>
										<tr
											id="grs${status.index}"
											style="display:table-row;min-height:350px; vertical-align:top;"
										>
											<td colspan="3">
											<table style="width:100%;">
													    <tr style="height:26px;line-height:26px;">
														<td style="text-align:left;"><span
												style="font-size:14px;padding-left:10px;"
											>  评级：${diseases.evalGrade } </span> <br><span
												style="font-size:14px; padding-left:10px;"
											>建议：${diseases.suggest }   </span> </td>
														</tr>
														<tr>
														<td>
												<table style="width:100%;">
													<tr style="height:80px;line-height:80px;">
														<td style="text-align:left;left:40px;"><input
															type="button"
															value="风险评估"
															class="form-control"
															style="height:30px;width:80px;margin-left:20px;"
															onclick="change('${status.index  }')"
														/> <input
															type="button"
															value="风险因素"
															class="form-control"
															style="height:30px;width:80px;"
															onclick="change1('${status.index }')"
														/></td>
													</tr>
												</table>
												<table
													id="div${status.index }"
													style="width:370px;margin-left:auto;margin-right:auto;"
												>
													<tr style="height:40px;line-height:40px;">
														<td
															style="width:123px;text-align:center;vertical-align:middle;background-color: green;"
														>低风险</td>
														<td
															style="width:123px;text-align:center;vertical-align:middle;background-color:yellow;"
														>中风险</td>
														<td
															style="width:123px;text-align:center;vertical-align:middle;background-color: red;"
														>高风险</td>
													</tr>
													<tr style="height:40px;line-height:40px;">
														<td
															style="width:123px;text-align:center;vertical-align:middle;"
														><c:if test="${diseases.evalGrade==1}">
																<img
																	src="${ctx}/images/sj.jpg"
																	height="30"
																>
															</c:if></td>
														<td
															style="width:123px;text-align:center;vertical-align:middle;"
														><c:if test="${diseases.evalGrade==2}">
																<img
																	src="${ctx}/images/sj.jpg"
																	height="30"
																>
															</c:if></td>
														<td
															style="width:123px;text-align:center;vertical-align:middle;"
														><c:if test="${diseases.evalGrade==3}">
																<img
																	src="${ctx}/images/sj.jpg"
																	height="30"
																>
															</c:if></td>
													</tr>
												</table>
												<table
													id="div${status.index  }1"
													style="width:100%;"
												>
													<tr style="height:40px;line-height:40px;">
														<td style="text-align:center;padding-top:40px;"><span>
																根据您提供的相关信息及临床检查的结果，我们评估您糖尿病的易感性为_</span><span
															style="color:red;"
														><c:if test="${diseases.evalGrade==1}">
	        	低风险
	        </c:if> <c:if test="${diseases.evalGrade==2}">
	        	中风险
	        </c:if> <c:if test="${diseases.evalGrade==3}">
	        	高风险
	        </c:if></span></td>
													</tr>
												</table>
												<table
													id="div${status.index  }11"
													style="width:80%;margin-left:auto;margin-right:auto;display:none;margin-top:30px;margin-bottom: 30px;"
												>
													</tr>
																<tr style="height:30px;line-height:30px;">
																	<td
																		style="text-align:center;border:1px silver solid;"
																	>指标因素</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>本次检查</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>上一次检查</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>上二次检查</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>理性目标</td>
																</tr>
																<c:forEach
																	var="diseases_indexs"
																	items="${diseases.indexs}"
																>
																	<tr style="height:30px;line-height:30px;">
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;"
																		>${diseases_indexs.name }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		>${diseases_indexs.value }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		><c:forEach
																				var="historys"
																				items="${diseases_indexs.historys}"
																			>   
								<c:if test="${historys.order==0}">
								${historys.value }
								</c:if> <br />
																			</c:forEach></td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		><c:forEach
																				var="historys"
																				items="${diseases_indexs.historys}"
																			>   
								<c:if test="${historys.order==1}">
								${historys.value }
								</c:if> <br />
																			</c:forEach></td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		></td>
																	</tr>
																</c:forEach>
												</table>
											</td>
										</tr>
									</table>
									</td></tr></table>
								</c:forEach>     </td>
						</tr>
					</table>
				 
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<script type="text/javascript">
		function s_show(name) {
			if (document.getElementById(name).style.display == "table-row") {
				document.getElementById(name).style.display = "none";
			} else {
				document.getElementById(name).style.display = "table-row";
			}
		}
		function change(num) {
			document.getElementById("div" + num).style.display = "table";
			document.getElementById("div" + num + "1").style.display = "table";
			document.getElementById("div" + num + "11").style.display = "none";
		}
		function change1(num) {
			document.getElementById("div" + num).style.display = "none";
			document.getElementById("div" + num + "1").style.display = "none";
			document.getElementById("div" + num + "11").style.display = "table";
		}
		function load() {
			document.getElementById("tab").style.height = (document.body.clientHeight) + "px";
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