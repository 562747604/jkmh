<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<body onload="load()" style="background-color:#bef2ff!important;">
	<form action="">
		 
								
								
								<table
									style="border:1px silver solid;width:100%;margin-left:auto;margin-right:auto;background-color:white;"
								>
									<tr style="height:25px;line-height:25px;">
										<td
											style="width:200px;border-bottom:1px silver solid;height:25px;line-height:25px;text-align:left;"
										><span
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										>重要指标</span></td>
										<td style="border-bottom:1px silver solid;">&nbsp;</td>
										<td style="width:50px;border-bottom:1px silver solid;"><a
											href="#.html"
											onclick="s_show('grs')"
										><img
												src="${ctx}/images/jkpgyw/u31.png"
												style="height:20px;"
											></a></td>
									</tr>
									<tr
										id="grs"
										style="display:table-row;"
									>
										<td colspan="3">
											<table style="width:100%;text-align:center;">
												<tr style="height:25px;line-height:25px;">
													<td
														style="width:15%;border-bottom:1px silver solid;border-right:1px silver solid;"
													><span style="font-size:15px;">名称</span></td>
													<td
														style="width:50%;border-bottom:1px silver solid;border-right:1px silver solid;"
													>描述</td>
													<td
														style="width:15%;border-bottom:1px silver solid;border-right:1px silver solid;"
													>范围</td>
													<td
														style="width:20%;border-bottom:1px silver solid;border-right:1px silver solid;"
													>结果列表</td>
												</tr>
												
<c:forEach var="indexs" items="${indexs}" varStatus="status">   
	<tr style="height:25px;line-height:25px;">
		<td
			style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
		><span style="font-size:15px;">${indexs.name }</span></td>
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;text-align: left;"
		>${indexs.desc }</td>
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>${indexs.range }</td>
		<td
			style="border-bottom:1px silver solid;border-right:1px silver solid;"
		>
<c:forEach var="value" items="${indexs.values}">   
		单位：${value.unit }<br/>
		值：${value.value }<br/>
		时间：${value.year }
</c:forEach>
		</td>
	</tr>												
</c:forEach> 												


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
		function s_show(name) {
			if (document.getElementById(name).style.display == "table-row") {
				document.getElementById(name).style.display = "none";
			} else {
				document.getElementById(name).style.display = "table-row";
			}
		}
		function load() {
			document.getElementById("tab").style.height=(document.body.clientHeight)+"px";
		}
		function wc(){
			$.ajax({
                cache: false,
                type: "get",
                dataType: "Json",
                url: "${ctx}/jkzj/updateJkzjzt",
                data: {
                    id: "${rotate.id}",
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
                    id: "${rotate.id}",
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
