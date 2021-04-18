<%@page import="org.soft.erp.domain.jggly.User"%>
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
	href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
	rel="stylesheet"
>
</head>
<body class="gray-bg" style="font-size: 15px;">
	<form>
		<%
			User user = (User) request.getAttribute("user");
		%>
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
						<td><i class="fa fa-table"></i> <lable class="pathtitle">系统管理
							>> 充值</lable></td>
					</tr>
					<tr>
						<td
							colspan="4"
							class="font3"
							style="text-align:left; vertical-align:middle;"
						><span style="margin:0px 5px;">客服人员：</span><span
							style="margin:0px 5px;color:red;"
						><%=user.getXm()%></span> <span style="margin:0px 5px;">手机号：</span><span
							style="margin:0px 5px;color:red;"
						><%=user.getSjh()%></span> <span style="margin:0px 5px;">Email：</span><span
							style="margin:0px 5px;color:red;"
						><%=user.getYx()%></span> </span></td>
					</tr>
					<tr>
						<td
							colspan="4"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						><span style="margin:0px 5px;">您当前短信剩余：</span><span
							style="margin:0px 5px;color:red;"
						><%=request.getAttribute("hasDx")%></span> <span
							style="margin:0px 5px;"
						>条</span></td>
					</tr>
					<tr>
						<td
							colspan="4"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;"
						><span style="margin:0px 5px;">&nbsp;</td>
					</tr>
					<tr>
						<td
							colspan="4"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;border-bottom:1px silver solid;"
						><span style="margin:0px 5px;">短信在线充值</span></td>
					</tr>
					<tr>
						<td
							colspan="3"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						>可选套餐:</td>
						<td rowspan="5" style="text-align: center; vertical-align: middle;"><iframe id="ifa" height="500" width="500"  frameborder=0 style="margin: 0px auto;" ></iframe></td>
					</tr>
					<tr>
						<td
							class="font3"
							style="text-align:center;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						><table
								style="width:200px;border:1px silver solid;margin:30px auto;"
							>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>1500套餐</span></td>
								</tr>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>包含短信20000条</span></td>
								</tr>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>单件0.075/条</span></td>
								</tr>
							</table></td>
						<td
							class="font3"
							style="text-align:center;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						><table
								style="width:200px;border:1px silver solid;margin:30px auto;"
							>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>3000套餐</span></td>
								</tr>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>包含短信43000条</span></td>
								</tr>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>单件0.07/条</span></td>
								</tr>
							</table></td>
						<td
							class="font3"
							style="text-align:center;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						><table
								style="width:200px;border:1px silver solid;margin:30px auto;"
							>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>5000套餐</span></td>
								</tr>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>包含短信75000条</span></td>
								</tr>
								<tr>
									<td style="text-align:center;"><span
										style="margin:0px 5px;"
									>单件0.067/条</span></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td
							colspan="3"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						><span style="margin:0px 5px;">选择套餐:</span> <input
							type="radio"
							name="tc"
							value="无"
							checked="checked"
						>无套餐 <input
							type="radio"
							name="tc"
							value="1500"
						>1500套餐 <input
							type="radio"
							name="tc"
							value="3000"
						>3000套餐 <input
							type="radio"
							name="tc"
							value="5000"
						>5000套餐</td>
					</tr>
					<tr>
						<td
							colspan="3"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						><span style="margin:0px 5px;">其它金额:</span> <input
							type="text"
							id="i_je"
							class="form-control"
							style="width:300px;"
							placeholder="输入其它充值金额,不支持小数"
						/> <span style="margin:0px 5px;">0.1元/条</span></td>
					</tr>
					<tr>
						<td
							colspan="3"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						><span style="margin:0px 5px;">充值方式:</span> <input
							type="radio"
							name="fs"
							value="微信支付"
							checked="checked"
						>微信支付 <input
							type="radio"
							name="fs"
							value="支付宝支付"
						>支付宝支付</td>
					</tr>
					<tr>
						<td
							colspan="4"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						>&nbsp;</td>
					</tr>
					<tr>
						<td
							colspan="4"
							class="font3"
							style="text-align:center; vertical-align:middle;background-color:white;"
						><input
							type="button"
							value="充值"
							onclick="cz()"
							class="btn btn-outline btn-default"
						/></td>
					</tr>
					<tr>
						<td
							colspan="3"
							class="font3"
							style="text-align:left;line-height:30px; vertical-align:middle;padding-bottom:0px;background-color:white;"
						>&nbsp;</td>
					</tr>
				</table>
			</div>
			<!-- End Example Events -->
		</div>
	</form>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<script>
		function cz() {
			var r = /^\+?[1-9][0-9]*$/;
			var je = "";
			var tc = "";
			var fs = "";
			var rad = document.getElementsByName("tc");
			for (var i = 0; i < rad.length; i++) {
				if (rad[i].checked == true) {
					je = rad[i].value;
					tc = rad[i].value + "套餐";
				}
			}
			var f = document.getElementsByName("fs");
			for (var i = 0; i < f.length; i++) {
				if (f[i].checked == true) {
					fs = f[i].value;
				}
			}
			if (je == "" || je == null || je == 0 || je == "无") {
				je = document.getElementById("i_je").value;
			}
			if (je == "" || je == null || je == 0 || je == "无") {
				right("请输入您要充值的金额");
			} else {
				if (r.test(je) == false) {
					right("请输入正整数");
				} else {
					swal({
						title : "",
						text : "您已选择套餐:\"" + tc + "\",金额为:\"" + je + "元\",支付方式为:\"" + fs + "\",确定充值么?",
						type : "",
						showCancelButton : true,
						closeOnConfirm : false,
						showLoaderOnConfirm : true
					}, function() {
					//	location.href="${ctx }/jggly/messagePay?je="+je+"&fs="+fs+"&tc="+tc+"&time="+Math.random();
						$.ajax({
							cache : false,
							type : "post",
							dataType : "Json",
							url : "${ctx }/jggly/messagePay",
							data : {
								fs : fs,
								je : je,
								tc : tc,
								time : Math.random()
							},
							success : function(data) {
								var t = eval(data);
								document.getElementById("ifa").src="${ctx }/jggly/messagePay1?url="+t.payurl;
								swal.close();
							},
							error : function(data) {
								alert("生成失败");
							}
						});
					});
				}
			}
		}
	</script>
</body>
</html>
