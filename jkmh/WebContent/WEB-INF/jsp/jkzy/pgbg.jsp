<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
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

table {
	display: table;
	border-collapse: separate;
}

.panel-heading {
	padding: 0px 0px;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd
}
</style>
</head>

<body
	onload="load()"
	background-color="#27bcc2"
>
	<form action="">
		<table
		id="tab"
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px;height:655px;min-width:1000px; "
		>
			<tr>
				<td
					style="text-align:center;height:50px;line-height:50px; vertical-align:middle;width:200px;background-color:#27bac1;"
				></td>
				<td
					style="text-align:left;line-height:50px; vertical-align:middle;background-color:#27bac1;"
				> </td>
			</tr>
			<tr>
				<td
					style="text-align:center; vertical-align:top;
						border-right:15px #27bac1 solid;border-left:20px #27bac1 solid;border-bottom:15px #27bac1 solid;"
				>
					<table style="width:200px;text-align:center;">
						<tr>
						 <td colspan="2"
					style="text-align:center;height:30px;line-height:30px; vertical-align:middle;width:200px;
						 "
			                           	>
					     <h2>基本信息</h2>
				       </td>
					   </tr>
						<tr>
							<td
								colspan="2"
								style="text-align:center;height:30px;line-height:30px; vertical-align:middle;"
							><a href="${ctx}/jkzy/pgbg?id=${rotate.previd}"><img
									src="${ctx}/images/jkpgyw/u756.png"
									style="height:30px;"
								></a> <img
								src="${ctx}/images/jkpgyw/u718.jpg"
								style="height:100px;"
							> <a href="${ctx}/jkzy/pgbg?id=${rotate.nextid}"><img
									src="${ctx}/images/jkpgyw/u758.png"
									style="height:30px;"
								></a></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:30px;line-height:30px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>体检号:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>${rotate.ryfp.tjh }</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>姓 名:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>${rotate.ryfp.realname }</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>性别:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>${rotate.ryfp.xb }</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>年龄:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>${rotate.ryfp.nl }</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>单位:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>${rotate.ryfp.dw }</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>身份证:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>${rotate.ryfp.sfzh }</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
						<tr>
							<td
								colspan="2"
								style="height:10px;line-height:10px;"
							>&nbsp;</td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>电话:</span></td>
							<td
								style="text-align:center;height:20px;line-height:20px; vertical-align:middle;
						"
							><span>${rotate.ryfp.mobile }</span></td>
						</tr>
						<tr>
							<td
								style="text-align:right;height:5px;line-height:5px; vertical-align:middle;width:50px;
						"
							><span>&nbsp;</span></td>
							<td
								style="text-align:left;height:5px;line-height:5px; vertical-align:middle;width:150px;
						"
							><span>__________________</span></td>
						</tr>
					</table>
				</td>
				<td
					style="text-align:left;line-height:30px; vertical-align:top;background-color:#bef2ff;border-right:20px #27bac1 solid;border-bottom:15px #27bac1 solid;"
				>
					<table
						style="width:100%;text-align:center;height:40px;background-color:#27bac1;"
					>
						<tr style="height:40px;line-height:40px;">
							<td style="line-height:40px;height:40px;">
								<div
									class="panel blank-panel"
									style="background-color:#27bac1;height:40px!important;line-height:40px;"
								>
									<div
										class="panel-heading"
										style="height:40px!important;"
									>
										<div
											class="panel-options"
											style="height:40px!important;"
										>
											<ul
												class="nav nav-tabs"
												style="height:40px!important;"
											>
												<li id="tl1" 
													class="active"
													style="height:40px!important;"
												><a
													 
													onclick="showsrc('${ctx}/sys/jksc?id=${rotate.id}','tl1');return false"
								                      href="javascript:void(0)"
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">评估报告</h2>
												</a></li>
												<li id="tl2"  style="height:40px!important;"><a
													onclick="showsrc('${ctx}/jkzy/cjmb?id=${rotate.id}','tl2');return false"
								                      href="javascript:void(0)"												 
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">促进目标</h2>
												</a></li>
												<li id="tl3" style="height:40px!important;"><a													 
													onclick="showsrc('${ctx}/jkzy/fazd?id=${rotate.id}','tl3');return false"
								                      href="javascript:void(0)"	
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">方案指导</h2>
												</a></li>
												<li id="tl4"  style="height:40px!important;"><a
												onclick="showsrc('${ctx}/jkzy/mrqk?id=${rotate.id}','tl4');return false"
								                      href="javascript:void(0)"														 
													style="height:40px!important;"
												>
														<h2 style="margin-top: 0px;margin-bottom: 0px;">每日情况</h2>
												</a></li>
<!-- 												<li style="height:40px!important;"><a -->
<!-- 													href="${ctx}/jkzy/fwzz5?id=${rotate.id}" -->
<!-- 													style="height:40px!important;" -->
<!-- 												> -->
<!-- 														<h2 style="margin-top: 0px;margin-bottom: 0px;">设备上传</h2> -->
<!-- 												</a></li> -->
<!-- 												<li style="height:40px!important;"><a -->
<!-- 													href="${ctx}/jkzy/fwzz6?id=${rotate.id}" -->
<!-- 													style="height:40px!important;" -->
<!-- 												> -->
<!-- 														<h2 style="margin-top: 0px;margin-bottom: 0px;">回访追踪</h2> -->
<!-- 												</a></li> -->

											</ul>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					 <table  style="width:100%;text-align:center;">
					 <tr style="height:20px;line-height:20px;">
							<td style="border:1px silver solid;border-bottom:none;">
							  
							  </td>
						</tr>
					 <tr>
							 
							<td  
								 
								style="border:1px silver solid;border-top:none;border-bottom:none; vertical-align:top;"
							>
                     <iframe
						id="ifc"
						style="width:90%;margin-left:auto;margin-right:auto;margin-top:20px;"
						frameborder="0"
						scrolling="auto"
						onload="changeFrameHeight()" 
						src="${ctx}/sys/jksc?id=${rotate.id}"
					></iframe>
				</td>
			 
						</tr></table>

					</form> <script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script> <script
						src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"
					></script> <script src="${ctx}/jiankang/js/sweetalert.min.js"></script> <script
						src="${ctx}/jiankang/js/public.js"
					></script> <script type="text/javascript">
					function changeFrameHeight(){
					    var ifm= document.getElementById("ifc"); 
					    ifm.height=document.documentElement.clientHeight-160;
					}
					window.onresize=function(){  
					     changeFrameHeight();  
					}
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
						function s_show(name) {
							if (document.getElementById(name).style.display == "table-row") {
								document.getElementById(name).style.display = "none";
							} else {
								document.getElementById(name).style.display = "table-row";
							}
						}
						function load() {
							document.getElementById("tab").style.height=(document.body.clientHeight)+"px";
							changeFrameHeight();
						}
						function showsrc(o,l)
						  { 
						   var $lis1 = $("#side-menu").find('li');  
					            $lis1.removeClass('se');
						  $("#ifc").attr("src",o);
						 
							 var $this1 = $('#'+l);
							 
					          $('#tl1').removeClass('active');
							   $('#tl2').removeClass('active');
							    $('#tl3').removeClass('active');
								   $('#tl4').removeClass('active');
						    $this1.toggleClass("active");
						  }
						function wc(){
							swal({
								title : "",
								text : "确认开始服务么?",
								type : "",
								showCancelButton : true,
								closeOnConfirm : false,
								showLoaderOnConfirm : true,
							}, function() {	
							$.ajax({
				                cache: false,
				                type: "get",
				                dataType: "Json",
				                url: "${ctx}/jkfw/updateFwzt",
				                data: {
				                    id: "${rotate.id}",
				                    time: Math.random()
				                },
				                success: function (data)
				                {
				                	$(window.parent.$("#iframe0"))[0].contentWindow.search();
				                	swal({
				                		title : "",
				                		text :"服务成功！",
				                		type : "",
				                		showCancelButton : false,
				                		closeOnConfirm : false,
				                		showLoaderOnConfirm : true,
				                	}, function() {
				                		swal.close();
				                		location.href ="${ctx}/jkzy/pgbg?id=${rotate.nextid}";
				                	});
				                	
				                	
				                },
				                error:function(data){
				                	right("审核失败!");
				                }
				            });			
							})
						}
					</script>
</body>
</html>
