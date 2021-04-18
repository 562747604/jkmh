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
	$(function() {var height = window.innerHeight;
	var width = window.innerWidth;
		document.getElementById("m1").style.height = (height - 190) + "px";
		document.getElementById("m2").style.top = (height - 110) + "px";
		window.setInterval("getNowFormatDate()",1000);		

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
		<table
			style="width: 800px; height:500px; margin: 0px auto;vertical-align: middle;"
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
					style="background-color: white;height:80px;"
				>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"
					style="height:80px;width:300px;background-color: white;text-align: center;font-size: 3em; font-weight: bolder;color:red;"
				>
				<%=request.getAttribute("msg") %>
				</td>
			</tr>
			<tr>
				<td colspan="2"
					style="height:80px;width:300px;background-color: white;text-align: center;font-size: 1.5em; font-weight: bolder;"
				>
				请选择退出系统或返回首页
				</td>
			</tr>
			<tr>
				<td
					colspan="2"
					style="background-color: white;text-align: center; vertical-align: middle;"
				><a
					href="${ctx}/nurse/main"
					style="background-color: silver; padding: 10px 30px; font-size: 1.5em;margin: 0px 10px;"
				>返回首页</a><a
					href="${ctx}/nurse/main"
					style="background-color: silver; padding: 10px 30px; font-size: 1.5em;margin: 0px 10px;"
				>退出登录</a></td>
			</tr>
		</table>
				<div id="m2"
			style="height:100px;width:100%;text-align:center;line-height:100px;position: absolute;"
		>
			<span>版权所有&copy; 2017-2018 </span><span>丁丁云康健康工作室</span>
		</div>
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
</body>
<!-- END BODY -->
</html>