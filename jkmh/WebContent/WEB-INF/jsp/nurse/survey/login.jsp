<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html lang="zh">
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
<link
	href="${ctx}/js/metronic/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="${ctx}/js/metronic/plugins/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="${ctx}/js/metronic/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="${ctx}/js/metronic/css/style-metro.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="${ctx}/js/metronic/css/style.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="${ctx}/js/metronic/css/style-responsive.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="${ctx}/js/metronic/css/themes/default.css"
	rel="stylesheet"
	type="text/css"
	id="style_color"
/>
<link
	href="${ctx}/js/metronic/plugins/uniform/css/uniform.default.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="${ctx}/js/metronic/css/pages/lock.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	rel="shortcut icon"
	href="${ctx}/images/favicon.ico"
/>
<link
	href="${ctx }/js/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet"
	type="text/css"
/>
<script
	type="text/javascript"
	src="${ctx }/js/jquery-1.11.0.js"
></script>
<script
	type="text/javascript"
	src="${ctx }/js/jquery.cookie.js"
></script>
<script type="text/javascript">
	$(function() {
		var date = new Date();
		var height = window.innerHeight;
		var width = window.innerWidth;
		document.getElementById("m1").style.height = (height - 190) + "px";
		document.getElementById("m2").style.top = (height - 110) + "px";
		window.setInterval("getNowFormatDate()", 1000);
		/** 给登录按钮绑定点击事件  */
		$("#login-submit-btn").on("click", function() {
			/** 校验登录参数 ctrl+K */
			var loginname = $("#loginname").val();
			var password = $("#password").val();

			var msg = "";

			if (!/^\w{4,20}$/.test(loginname)) {
				msg = "登录名长度必须是6~20之间";
			} else if (!/^\w{4,20}$/.test(password)) {
				msg = "密码长度必须是6~20之间";
			}
			if (msg != "") {
				alert(msg);
				return;
			}
			/** 提交表单 */
			$("#loginForm").submit();
		})
	})
	function getNowFormatDate() {
		var date = new Date();
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		var hours = date.getHours();
		var sec = date.getSeconds();
		var min = date.getMinutes();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		if (hours >= 0 && hours <= 9) {
			hours = "0" + hours;
		}
		if (min >= 0 && min <= 9) {
			min = "0" + min;
		}
		if (sec >= 0 && sec <= 9) {
			sec = "0" + sec;
		}
		var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
			+ " " + hours + seperator2 + min
			+ seperator2 + sec;
		document.getElementById("nowTime").innerHTML = currentdate;
	}
</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="font-family: 微软雅黑;">
	<div
		id="top"
		style="background-color:#27bcc2;height:60px;width:100%;text-align:left;line-height:30px;background-repeat: round;"
	>
		<table style="width:100%;">
			<tr>
				<td
					rowspan="2"
					style=""
				><img
					src="${ctx }/images/u19.png"
					style="z-index:99; height:60px;margin-top:-5px; "
				></td>
				<td
					style="text-align:center;width:200px;color: white; font-size: 16px;vertical-align: bottom;"
				>正常服务</td>
			</tr>
			<tr>
				<td style="text-align:center;vertical-align: top;"><label
					id="nowTime"
					style="color: white; font-size: 16px;"
				></label></td>
			</tr>
		</table>
	</div>
	<div
		id="m1"
		style="background-image:url(${ctx }/images/u13.jpg);width:100%;"
	>
	
		<table
			style="width: 600px; height:350px; margin: 0px auto;vertical-align: middle;"
		>
			<tr>
				<td
					colspan="2"
					style="height: 150px;text-align: right;vertical-align: bottom;"
				>&nbsp;</td>
			</tr>
			<tr>
				<td
					colspan="2"
					style="opacity:0.7;background-color:#ffffff;height:40px;text-align: left;font-size: 18px;"
				><span style="margin-left: 20px;">流调问卷</span></td>
				<td
					colspan="2"
					style="height:40px;text-align: right;opacity:0.7;background-color:#ffffff;"
				><input
					type="button"
					value="返回"
					class="btn btn-outline btn-default"
					style="margin-right: 20px;"
					onclick="fh()"
				/></td>
			</tr>
			<tr>
				<td
					colspan="4"
					style="height:60px;opacity:0.7;background-color:#ace3fa;text-align: center;font-size:18px; font-weight: bolder;"
				>请输入体检号</td>
			</tr>
			<tr>
				<td
					colspan="4"
					style="height:60px;opacity:0.7;background-color:#ace3fa;text-align: left;font-size:15px; font-weight: bolder;padding-left: 40px;"
				><input
					id="a_examNum"
					type="text"
					class="form-control"
					placeholder="请输入体检号"
					style="width:506px;height:60px;line-height: 60px;"
				/></td>
			</tr>

			<tr style="border-top: 1px silver solid;">
				<td style="width:40px;opacity:0.7;background-color:#ace3fa;">&nbsp;</td>
				<td
					colspan="2"
					style="text-align: center; vertical-align: middle;background-color: white;"
				><input
					type="button"
					value="确定"
					class="btn btn-outline btn-default"
					style="margin: 10px;"
					onClick="login()"
				/>

				
				</td>
				<td style="width:40px;opacity:0.7;background-color:#ace3fa;">&nbsp;</td>
			</tr>
			<tr>
				<td
					colspan="4"
					style="opacity:0.7;background-color:#ace3fa;height:20px;"
				>&nbsp;</td>
			</tr>
			<tr>
				<td
					colspan="4"
					style="opacity:0.7;background-color:#ace3fa;text-align: center;font-size:15px; font-weight: bolder;"
				><label style="color:red; font-size:20px;height:30px;line-height:30px;" id="msg">&nbsp;</label></td>
			</tr>
			<tr>
				<td
					colspan="4"
					style="opacity:0.7;background-color:#ace3fa;height:20px;"
				>&nbsp;</td>
			</tr>
		</table>

				<div id="m2"
			style="height:100px;width:100%;text-align:center;line-height:100px;position: absolute;"
		>
			<span>版权所有&copy; 2017-2018 </span><span>丁丁云康健康工作室</span>
		</div>
	</div>
		
		
	</div>
	<script
		src="${ctx}/js/metronic/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"
	></script>
	<script
		src="${ctx}/js/metronic/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"
	></script>
	<!--[if lt IE 9]>
   <script src="${ctx}/js/metronic/plugins/excanvas.js"></script>
   <script src="${ctx}/js/metronic/plugins/respond.js"></script>  
   <![endif]-->
	<script type="text/javascript">
		function ks() {
			document.location.href="${ctx}/nurse/main";
			/*
			$.ajax({
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/nurse/main",
				data : {
					id : id,
					sfzh : document.getElementById("a_sfzh").value,
					sjh : document.getElementById("a_sjh").value,
					yzm : document.getElementById("a_yzm").value,
					time : Math.random()
				},
				success : function(data) {
					location.href = "${ctx}/nurse/report";
				},
				error : function(data) {
					var t = eval(data);
					right(t.msg);
				}
			});
			*/
		}
		function sub() {
			location.href = "${ctx }/nurse/main";
		}
		function fh() {
			location.href = "${ctx}/nurse/main";
		}
		function reset() {
			document.getElementById("a_sfzh").value = "";
		}
		function login(){
			var examNum = document.getElementById("a_examNum").value;
			if (examNum == "") {
				document.getElementById("msg").innerHTML="体检号输入错误，请核实后登录";
				return;
			}

			$.ajax({
				async:false,
				cache : false,
				type : "post",
				dataType : "Json",
				url : "${ctx}/nurse/survey/doLogin",
				data : {
					examNum : document.getElementById("a_examNum").value,
					time : Math.random()
				},
				success : function(data) {
					if(data.msg=="true"){
						document.location="${ctx}/nurse/survey/loginOk?examNum="+document.getElementById("a_examNum").value;
					}else{
						document.getElementById("msg").innerHTML=data.msg;
					}					
				},
				error : function(data) {
					document.getElementById("msg").innerHTML="网络错误无法访问";
				}
			});	
		}
	</script>
</body>
<!-- END BODY -->
</html>