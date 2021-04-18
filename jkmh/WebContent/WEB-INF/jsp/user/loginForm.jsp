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
<title>健康管理门户系统</title>
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
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
	rel="stylesheet"
>
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
<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
<script
	type="text/javascript"
	src="${ctx}/js/jquery-1.11.0.js"
></script>
<script
	type="text/javascript"
	src="${ctx}/js/jquery.cookie.js"
></script>
<script
	type="text/javascript"
	src="${ctx}/js/jquery-migrate-1.2.1.js"
></script>
<link
	href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet"
	type="text/css"
/>
<script
	src="${ctx}/js/ligerUI/js/core/base.js"
	type="text/javascript"
></script>
<script
	src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"
></script>
<script
	src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"
	type="text/javascript"
></script>
<link
	href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0"
	rel="stylesheet"
>
<link
	href="${ctx}/jiankang/css/sweetalert.css?v=4.1.0"
	rel="stylesheet"
>
<script
	src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"
	type="text/javascript"
></script>
<script type="text/javascript">
	$(window).resize(function() {
		var height = window.innerHeight;
		document.getElementById("pa1").style.top = (height - 288) / 2 + "px";
	});

	$(function() {
		var height = window.innerHeight;
		document.getElementById("pa1").style.top = (height - 288) / 2 + "px";
		/** 按了回车键 */
		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
				//document.getElementById('loginForm').submit();
				login();
			}
		})
		if ("${message }" != "") {
			swal({
				title : "",
				text : "${message }",
				type : "",
				showCancelButton : false,
				closeOnConfirm : true,
				showLoaderOnConfirm : true,
			});
		}
		if ($.cookie("ddjkuser") == "true") {
			$("#j1").attr("checked", true);
			$("#loginname").val($.cookie("loginname"));
			$("#password").val($.cookie("password"));
		}

	})

	function changeVerifyCode() {
		document.getElementById("validateCodeImg").src = "${ctx}/user/verifyCode?t="
		+ Math.random();
	}
</script>
<style>
.sweet-alert {
	margin-left: -117px;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="font-family: 微软雅黑;" onload="load()">
	<div
		id="m1"
		style="background-image:url(${ctx }/images/bg-jkmh.jpg);width:100%;
    height:100%;
    background-size:100% 100%;
    position:absolute;
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='${ctx }/images/0519-05.jpg',sizingMethod='scale');"
	>
		<div
			class="page-lock"
			id="pa1"
			style="left:38%;width:368px!important;top: 329px;"
		>
			<form
				action="${ctx}/user/login"
				method="post"
				id="loginForm"
			>
				<input
					type="hidden"
					name="companyId"
					value="${companyId}"
				>
				<div
					class="page-body"
					style="width:368px!important;height:268px;"
				>
					<div
						class="page-lock-info"
						style="width:368px!important;"
					>
						<span
							style="color:#56a3cd;font-size: 18px;margin-top:10px;text-align:center!important;vertical-align:middle!important;font-weight:bold;;height:28px;"
						> 健康管理门户系统 V1.0</span>
						<div class="control-group">
							<div
								class="controls"
								style="text-align:center!important; margin:0 auto;"
							>
								<div
									class="input-icon left"
									style="width:258px;text-align:center!important; margin:0 auto;"
								>
									<i class="icon-user"></i> <input
										class="m-wrap placeholder-no-fix"
										type="text"
										placeholder="帐号"
										style="width:218px;"
										id="loginname"
										name="loginname"
										value="${loginname}"
									>
									<div style="height:8px;"></div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<div
									class="input-icon left"
									style="width:258px;text-align: right!important; margin:0 auto;"
								>
									<i class="icon-lock"></i> <input
										class="m-wrap placeholder-no-fix"
										type="password"
										placeholder="密码"
										id="password"
										name="password"
										style="width:218px;"
										value="${password}"
									>
									<div style="height:8px;">
										<a
											href="${ctx}/user/findpassword?companyId=${companyId}"
											style="margin-right:20px; color:blue;vertical-align:top;line-height: 8px;text-align:right!important;"
										>忘记密码</a>
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="control-group">
								<div class="controls">
									<div
										class="input-icon right"
										style="width:258px;text-align:center!important; margin:0 auto;"
									>
										<INPUT
											id="verifycode"
											type="text"
											placeholder="验证码"
											size=4
											class="m-wrap placeholder-no-fix"
											style="width:78px;border, box-shadow;"
											name="verifycode"
										><i> <!-- 这是显示的验证码，以图片显示--> <!-- src的路劲为servlet的路劲 -->
											<img
											src="${ctx}/user/verifyCode"
											border=0
											id="validateCodeImg"
											style="height: 33px; width: 76px"
										/></i><a
											href="#"
											onclick="changeVerifyCode()"
										>看不清？换一张</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="relogin"
						style=" margin-top:170px;text-align:center;"
					>
						<!-- 单击登录 -->
						<a
							href="#"
							id="login-submit-btn"
							onclick="login()"
						> <img
							src="${ctx}/images/dl.png"
							border=0
							id="dl"
							style="width:257px;height:32px;"
						/>
						</a>
					</div>
				</div>
			</form>
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
		<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>

	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">
		function load(){
			var msg='<%=request.getAttribute("message")%>';
			if(msg!="null"){
				right(msg);
			}
		}
		function login(){
			var loginname=document.getElementById("loginname").value;
			var password=document.getElementById("password").value;
			var verifycode=document.getElementById("verifycode").value;
			if(loginname==""){
				right1("账号不能为空");
			}else if(password==""){
				right1("密码不能为空");
			}else if(verifycode==""){
				right1("验证码不能为空");
			}else{
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/user/login",
	            data: {
	            	loginname: loginname,
	            	password : password,
	            	verifycode:verifycode,
	            	companyId:"${companyId}",
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	            	if(t.msg!=""){
	            		right1(t.msg);
	            	}else{
	            		location.href="${ctx}"+t.url;
	            	}          
	            },
	            error:function(data){
	            	var t = eval(data);
	            	right1("登录失败!");
	            }
	        });
			}
		}
	</script>
</body>
<!-- END BODY -->
</html>