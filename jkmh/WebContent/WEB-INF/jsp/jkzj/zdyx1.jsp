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
</head>
<body style="background-color:#bef2ff;">
	<form action="">
		<table
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;"
		>
			<tr>
				<td
					style="text-align:left;line-height:50px; vertical-align:middle;background-color:#ffffff;"
				><input
					type="button"
					value="预览"
					class="btn btn-outline btn-default"
					style="margin-left:20px;"
				/> <input
					type="button"
					value="复查"
					class="btn btn-outline btn-default"
				/> <input
					type="button"
					value="完成"
					class="btn btn-outline btn-default"
				/></td>
				<td
					style="text-align:right;line-height:50px; vertical-align:middle;background-color:#ffffff;"
				><span style="font-size:20px;font-weight:bolder;">体检号:</span><span
					style="font-size:20px;font-weight:bolder;margin-right:20px;"
				>9527</span> <span style="font-size:20px;font-weight:bolder;">姓名:</span><span
					style="font-size:20px;font-weight:bolder;margin-right:20px;"
				>张三 </span> <span style="font-size:20px;font-weight:bolder;">性别:</span> <span
					style="font-size:20px;font-weight:bolder;margin-right:20px;"
				>男 </span> <span style="font-size:20px;font-weight:bolder;">年龄:</span><span
					style="font-size:20px;font-weight:bolder;margin-right:20px;"
				>34</span> <span style="font-size:20px;font-weight:bolder;">电话:</span><span
					style="font-size:20px;font-weight:bolder;margin-right:20px;"
				>123456</span></td>
			</tr>
			<tr>
				<td
					colspan="2"
					rowspan="23"
					style="text-align:left;line-height:30px; vertical-align:top;background-color:#bef2ff;"
				>
					<table
						style="width:100%;text-align:center;height:510px;margin-top:10px;"
					>
						<tr>
							<td
								style="vertical-align:top;text-align:left;height:50px;line-height:50px;"
							><input
								type="button"
								value="体检异常"
								class="btn btn-outline btn-default"
								style="margin-left:20px;"
								onclick="change('1')"
							/> <input
								type="button"
								value="处理内容"
								class="btn btn-outline btn-default"
								onclick="change1('1')"
							/></td>
						</tr>
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<table
									id="div1"
									style="width:80%;margin-left:auto;margin-right:auto;margin-top:0px;background-color:white;"
								>
									<tr style="height:30px;line-height:30px;">
										<td style="text-align:center;border:1px silver solid;">1</td>
										<td
											style="text-align:center;border:1px silver solid;border-left:none;"
										>检查项目</td>
										<td
											style="text-align:center;border:1px silver solid;border-left:none;"
										>结果</td>
										<td style="text-align:center;border:1px silver solid;">&nbsp;</td>
									</tr>
									<tr style="height:30px;line-height:30px;">
										<td
											style="text-align:center;border:1px silver solid;border-top:none;"
										></td>
										<td
											style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
										></td>
										<td
											style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
										></td>
										<td
											style="text-align:center;border:1px silver solid;border-top:none;"
										></td>
									</tr>
									<tr style="height:30px;line-height:30px;">
										<td
											style="text-align:center;border:1px silver solid;border-top:none;"
										></td>
										<td
											style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
										></td>
										<td
											style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
										></td>
										<td
											style="text-align:center;border:1px silver solid;border-top:none;"
										></td>
									</tr>
								</table>
								<table
									id="div11"
									style="display:none;margin-left:auto;margin-right:auto;margin-top:0px;background-color:white;"
								>
									<tr style="height:30px;line-height:30px;">
										<td style="text-align:center;"><textarea
												rows="10"
												cols="200"
												class="form-control"
												style="width:auto;"
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
	<script type="text/javascript">
		function change(num) {
			document.getElementById("div" + num).style.display = "table";
			document.getElementById("div" + num + "1").style.display = "none";
		}
		function change1(num) {
			document.getElementById("div" + num).style.display = "none";
			document.getElementById("div" + num + "1").style.display = "table";
		}
	</script>
</body>
</html>
