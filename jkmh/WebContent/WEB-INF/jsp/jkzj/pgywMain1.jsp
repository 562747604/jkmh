<%@page import="java.io.Console"%>
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
table {
    display: table;
    border-collapse: separate;
}
.panel-heading {
    padding: 0px 15px;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd
}
        </style>
</head>
<body onload="load()" style="background-color:#bef2ff!important;" >
	<form action="">
		 
								
								<table
									style="border:1px silver solid;width:100%;margin-left:auto;margin-right:auto;background-color:white;"
								>
									<tr style="height:25px;line-height:25px;">
										<td
											style="width:200px;border-bottom:1px silver solid;height:25px;line-height:25px;text-align:left;"
										><span
											style="font-size:16px; font-weight:bolder;margin-left:10px;"
										>健康体检评估与结论</span></td>
										<td style="border-bottom:1px silver solid;">&nbsp;</td>
										<td style="width:50px;border-bottom:1px silver solid;"><a
											href="#.html"
											onclick="s_show('zkjc')"
										><img
												src="${ctx}/images/jkpgyw/u31.png"
												style="height:20px;"
											></a></td>
									</tr>
									<tr
										id="zkjc"
										style=""
									>
										<td colspan="3">
											<table style="width:100%;text-align:center;">

												<tr style="height:25px;line-height:25px;">
													<td
														style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
													><span style="font-size:15px;">健康级别</span></td>
													<td style="border-bottom:1px silver solid;">${healthAssess.healthLevel }</td>
													<td style="width:50px;border-bottom:1px silver solid;"></td>
												</tr>
												<tr style="height:25px;line-height:25px;">
													<td
														style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
													><span style="font-size:15px;">健康状态</span></td>
													<td style="border-bottom:1px silver solid;">${healthAssess.healthState }</td>
													<td style="width:50px;border-bottom:1px silver solid;"></td>
												</tr>
												<tr style="height:25px;line-height:25px;">
													<td
														style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
													><span style="font-size:15px;">疾病易感性</span></td>
													<td style="border-bottom:1px silver solid;">${healthAssess.illnessDesc }</td>
													<td style="width:50px;border-bottom:1px silver solid;"></td>
												</tr>
												<tr style="height:25px;line-height:25px;">
													<td
														style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
													><span style="font-size:15px;">体检结论</span></td>
													<td style="border-bottom:1px silver solid;text-align: left;">${healthAssess.examConclusion }</td>
													<td style="width:50px;border-bottom:1px silver solid;"></td>
												</tr>
												<tr style="height:25px;line-height:25px;">
													<td
														style="width:200px;border-bottom:1px silver solid;border-right:1px silver solid;"
													><span style="font-size:15px;">流行病学调查</span></td>
													<td style="border-bottom:1px silver solid;text-align: left;">
<!-- 流行病学调查 -->																								
<c:forEach var="epidemicSurvey" items="${epidemicSurvey}" varStatus="status">   
${epidemicSurvey.name}:${epidemicSurvey.value}</br>											
</c:forEach> 													
													</td>
													<td style="width:50px;border-bottom:1px silver solid;"></td>
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
		function e_show(name) {
			document.getElementById("i_" + name).style.display = "none";
			document.getElementById("t_" + name).style.display = "inline";
			document.getElementById("bs_" + name).style.display = "inline";
			document.getElementById("bc_" + name).style.display = "inline";
		}
		function e_noshow(name) {
			document.getElementById("i_" + name).style.display = "inline";
			document.getElementById("t_" + name).style.display = "none";
			document.getElementById("bs_" + name).style.display = "none";
			document.getElementById("bc_" + name).style.display = "none";
		}
		function s_show(name){
			if(document.getElementById(name).style.display=="table-row"){
				document.getElementById(name).style.display = "none";
			}else{
				document.getElementById(name).style.display="table-row";
			}
		}
		function load() {
			document.getElementById("tab").style.height=(document.body.clientHeight)+"px";
		}
		function wc(){
			swal({
				title : "",
				text : "确认审核通过么?",
				type : "",
				showCancelButton : true,
				closeOnConfirm : false,
				showLoaderOnConfirm : true,
			}, function() {	
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
                	right("审核成功!");
                	parent.gb();
                },
                error:function(data){
                	right("审核失败!");
                }
            });		
			})
		}
		
		function fc(){
			swal({
				title : "",
				text : "确认加入复查么?",
				type : "",
				showCancelButton : true,
				closeOnConfirm : false,
				showLoaderOnConfirm : true,
			}, function() {	
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
			})
		}
	</script>
</body>
</html>
