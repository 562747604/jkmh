
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
<style>
div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
	pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins,
	kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i,
	center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, menu, nav, output,
	ruby, section, summary, time, mark, audio, video, input {
	font-family: "open sans", "Helvetica Neue", Helvetica, Arial,
		sans-serif !important;
}

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
	border-color: #eee #eee #ddd;
}

.time-table, th, td {
	border: 0px;
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
				<td><div
						id="t1"
						style="width:100%;"
					>
						<table
							style="width:100%;text-align:left;margin:0px auto;background-color: #ffffff;"
						>
							<tr>
								<td
									colspan="2"
									style="font-size:20px;font-weight:bolder;"
								>指导建议</td>
							</tr>
							<tr>
								<td style="min-height:2000px; vertical-align:top;">
									<div
										id="reportcontent"
										contenteditable="true"
									>${assessReport.guide.content}</div>
								</td>
								<td style="vertical-align: top;width:100px; text-align: left;"><input
									type="button"
									value="保存"
									class="btn btn-outline btn-default"
									style="margin: 0px 10px;"
									onClick="uptext();"
								/></td>
							</tr>
						</table>
					</div>
					<div
						id="t2"
						style="width:100%; display: none ;"
					>
						<table
							style="width:100%;text-align:left;margin:0px auto;background-color: #ffffff;"
						>
							<tr>
								<td
									colspan="2"
									style="font-size:20px;font-weight:bolder; "
								>指导建议</td>
							</tr>
							<tr>
								<td style="min-height:480px; vertical-align:top;">
									<form
										id="guideForm"
										name="guideForm"
										action="${ctx }/jkzj/guide/updateGuide"
										method="post"
									>
										<style>
div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
	pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins,
	kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i,
	center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, menu, nav, output,
	ruby, section, summary, time, mark, audio, video, input {
	font-family: "open sans", "Helvetica Neue", Helvetica, Arial,
		sans-serif !important;
}

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
	border-color: #eee #eee #ddd;
}

.time-table, th, td {
	border: 0px;
	font-size: inherit;
}
</style>
									</form>
								</td>
								<td style="vertical-align: top;width:100px; text-align: left;"><input
									type="button"
									value="提交"
									class="btn btn-outline btn-default"
									style="margin: 10px 10px;"
									onClick="uptext();"
								/><input
									type="button"
									value="取消"
									class="btn btn-outline btn-default"
									style="margin: 10px 10px;display:none;"
									onClick="ca();"
								/></td>
							</tr>
						</table>
					</div></td>
			</tr>
		</table>
	</form>
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
div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
	pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins,
	kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i,
	center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, menu, nav, output,
	ruby, section, summary, time, mark, audio, video, input {
	font-family: "open sans", "Helvetica Neue", Helvetica, Arial,
		sans-serif !important;
}

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
	border-color: #eee #eee #ddd;
}

.time-table, th, td {
	border: 0px;
}
</style>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<script type="text/javascript">
		var um = UM.getEditor('myEditor', {
			initialFrameWidth : null
		});
		// var value = prompt('插入html代码', '');
		var a = $("#reportcontent").html();
	
		um.execCommand('insertHtml', a);
		function uptext() {
			//alert('${assessReport.guide.svcGuideId}'+UM.getEditor('myEditor').getContent());
	
			//if (!UM.getEditor('myEditor').hasContents()) {
			//	right('请先填写内容!');
			//	} else {
			//alert(UM.getEditor('myEditor').getContent());
			//alert($("#reportcontent").html());
			if (checkhHtml5()) {
				$.ajax({
					cache : false,
					type : "post",
					dataType : "Json",
					url : "${ctx}/jkzj/updateAssessGuide",
					data : {
						guideId : "${assessReport.guide.svcGuideId}",
						content : $("#reportcontent").html(),
						time : Math.random()
					},
					success : function(data) {
						right("修改成功!");
					//parent.gb();
					},
					error : function(data) {
						right("修改失败!");
					}
				});
			}
	
		//document.noticeForm.content.value = UM.getEditor('myEditor').getContent();
		//document.noticeForm.submit();
		//}
		}
		function checkhHtml5() {
			if (typeof (Worker) !== "undefined") {
				return true;
			} else {
				alert("此浏览器不支持HTML5，请下载google浏览器!");
				return false;
			}
		}
		function load() {
			document.getElementById("tab").style.height = (document.body.clientHeight) + "px";
			checkhHtml5();
		}
	
		//$("#reportcontent").dblclick(function(){ edit();
		//});
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
	<script type="text/javascript">
	function edit(){
		document.getElementById("t1").style.display="none";
		document.getElementById("t2").style.display="inline";
	}
	function ca(){
		document.getElementById("t2").style.display="none";
		document.getElementById("t1").style.display="inline";
	}
	</script>
</body>
</html>
