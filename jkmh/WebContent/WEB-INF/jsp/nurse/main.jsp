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
<script
	type="text/javascript"
	src="${ctx }/js/jquery-1.11.0.js"
></script>
<script
	type="text/javascript"
	src="${ctx }/js/jquery.cookie.js"
></script>
<script
	type="text/javascript"
	src="${ctx }/js/jquery-migrate-1.2.1.js"
></script>
<link
	href="${ctx }/js/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet"
	type="text/css"
/>
<script
	src="${ctx }/js/ligerUI/js/core/base.js"
	type="text/javascript"
></script>
<script
	src="${ctx }/js/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"
></script>
<script
	src="${ctx }/js/ligerUI/js/plugins/ligerDrag.js"
	type="text/javascript"
></script>
<script
	src="${ctx }/js/ligerUI/js/plugins/ligerResizable.js"
	type="text/javascript"
></script>
<script type="text/javascript">
$(window).resize(function() {
var height = window.innerHeight;
		var width = window.innerWidth;
		document.getElementById("m1").style.height = (height - 190) + "px";
		document.getElementById("m2").style.top = (height - 110) + "px";
		document.getElementById("pa1").style.left=(width-504)/2+ "px";
});
	$(function() {
var height = window.innerHeight;
		var width = window.innerWidth;
		document.getElementById("m1").style.height = (height - 190) + "px";
		document.getElementById("m2").style.top = (height - 110) + "px";
		document.getElementById("pa1").style.left=(width-504)/2+ "px";
		window.setInterval("getNowFormatDate()",1000);
		/** 按了回车键 */
		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
				$("#login-submit-btn").trigger("click");
			}
		})
		if ($.cookie("ddjkuser") == "true") {
			$("#j1").attr("checked", true);
			$("#loginname").val($.cookie("loginname"));
			$("#password").val($.cookie("password"));
		}
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

			if (document.getElementById("j1").checked == true) {
				var str_username = $("#loginname").val();
				var str_password = $("#password").val();
				$.cookie("ddjkuser", "true", {
					expires : 7
				}); //存储一个带7天期限的cookie
				$.cookie("loginname", str_username, {
					expires : 7
				});
				$.cookie("password", str_password, {
					expires : 7
				});
			} else {
				$.cookie("ddjkuser", "false", {
					expire : -1
				});
				$.cookie("loginname", "", {
					expires : -1
				});
				$.cookie("password", "", {
					expires : -1
				});
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
    var hours= date.getHours();
    var sec=date.getSeconds();
    var min=date.getMinutes();
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
            + " " + hours+ seperator2 + min
            + seperator2 + sec;
    document.getElementById("nowTime").innerHTML= currentdate;
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
					id="nowTime"  style="color: white; font-size: 16px;"
				></label></td>
			</tr>
		</table>
	</div>
	<div
		id="m1"
		style="background-image:url(${ctx }/images/u13.jpg);width:100%;"
	>
		<div
			class="page-lock" id="pa1"
			style="margin-top:-50px;"
		>
			<form
				action="/nurse/Login"
				method="post"
				id="loginForm"
			>
				<div
					style="width:250px;height:150px;text-algin:center;float:left; vertical-align:middle;margin-right:2px;"
				>
					<a href="${ctx }/nurse/survey/login"><table
							style="width:100%;height:150px;"
							cellpadding="0"
							cellspacing="0"
						>
							<tr>
								<td
									style="text-align:center;line-height:150px;vertical-align:middle;"
								><img src="${ctx }/images/0519-06.png"  style="height:150px;" height="150"></td>
							</tr>
						</table></a>
				</div>
				<div
					style="width:250px;height:150px;text-algin:center;float:left;  vertical-align:middle;margin-left:2px;"
				>
					<a href="${ctx }/nurse/report/login"><table
							style="width:100%;height:150px;"
							cellpadding="0"
							cellspacing="0"
						>
							<tr>
								<td
									style="text-align:center;line-height:150px;vertical-align:middle;"
								><img src="${ctx }/images/0519-07.png"  style="height:150px;" height="150"></td>
							</tr>
						</table></a>
				</div>
			</form>
		</div>
				<div id="m2"
			style="height:100px;width:100%;text-align:center;line-height:100px;position: absolute;"
		>
			<span>版权所有&copy; 2017-2018 </span><span>丁丁云康健康工作室</span>
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
	<script
		src="${ctx}/js/metronic/plugins/breakpoints/breakpoints.js"
		type="text/javascript"
	></script>
	<!-- IMPORTANT! jquery.slimscroll.min.js depends on jquery-ui-1.10.1.custom.min.js -->
	<script
		src="${ctx}/js/metronic/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"
	></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${ctx}/js/metronic/plugins/backstretch/jquery.backstretch.min.js"
		type="text/javascript"
	></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${ctx}/js/metronic/scripts/app.js"></script>
	<script>
		$(function() {
			App.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>