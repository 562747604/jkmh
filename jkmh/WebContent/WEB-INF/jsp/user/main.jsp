<%@page import="org.soft.erp.domain.sys.Organ"%>
<%@page import="org.soft.erp.domain.jggly.User"%>
<%@page import="java.util.*"%>
<%@page import="org.soft.erp.domain.sys.Menu"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
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
	href="${ctx}/jiankang/css/animate.min.css"
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
<link
	href="${ctx}/jiankang/js/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet"
>
 <style>
.nav > li > a:hover,
.nav > li > a.J_menuItem:focus {
  text-decoration: none;
  background-color: #3b748f;
}
  </style>
</head>
<%
	User u = (User) session.getAttribute("user_session");
	Organ organ = (Organ) session.getAttribute("organ");
	String jgname = organ.getCompanyName();
	String jgsname = organ.getCompanySName();
	String jcode = organ.getJcode();
%>
<body
	class="fixed-sidebar full-height-layout "
	style="overflow:hidden"
>
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav
			class="navbar-default navbar-static-side"
			role="navigation"
		>
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div
				class="sidebar-collapse"
				style="background-color:#52aec3;" onsize="showtitle();"
			>
				<ul
					class="nav"
					id="side-menu"
				>
					<li
						style="height:60px; line-height:60px; text-align:center;background-color:#269eb9;"
					><span style="font-size:20px; font-weight:bolder;color:#ffffff;" id="tit">
							<%=jgname%>
					</span></li>
					<li
						class="nav-header"
						style="padding:0px 0px;text-align:center;background-color:#ffffff;"
					><img
						alt="image"
						src="<%=session.getAttribute("url") %>/images/logo/<%=jcode %>_b.png"  id="logo"
					/></li>


<%
List<Menu> list = (List<Menu>)request.getAttribute("menulist");
List<Menu> list2 = (List<Menu>)request.getAttribute("menulist");
String tempId=null;
String tempUrl=null;

	for(int i=0;i<list.size();i++ ){
		Menu menu=list.get(i);
		if(menu.getParent_id()==0){
			tempId=menu.getMenu_id();
			tempUrl=menu.getMenu_url();
			%>
						
							<li class="active se" id="li<%=i%>" ><table style="width:100%;"><tr style="height:50px;"><td> <a onclick="showsrc('${ctx}/<%=menu.getMenu_url() %>','li<%=i%>','ul<%=i%>');return false"
								href="javascript:void(0)"
								style="margin-left:10px;font-weight: 600; padding: 14px 20px 14px 25px; font-size: 16px;width:173px;"
							><i
									class="fa fa-table"
									style="color:white;"
								></i> <span
									class="nav-label"
									style="color:white;width:173px;"
								><%=menu.getMenu_name() %></span></a></td><td style="width:20%;"><a  onclick="showul('li<%=i%>','ul<%=i%>');return false" style="width:40px;" href="javascript:void(0)"><span
									class="fa arrow"
									style="color:white;width:60px;display:block;margin:0 auto;text-align:center;"
								></span> </a></td></tr></table>
								<ul id="ul<%=i%>"
									class="nav nav-second-level"
									style="padding-left:0%; background-color:#269eb9;"
								>
									
								<%
								
								for(int j=0;j<list2.size();j++){
									Menu menu2=list2.get(j);
									if(menu2.getParent_id()==menu.getId()){
										%>
											<li id="lis<%=i%><%=j%>" >
											<a class="J_menuItem"
												href="${ctx}/<%=menu2.getMenu_url() %>"
												style="color:white;" onclick="showac('lis<%=i%><%=j%>');"
											><%=menu2.getMenu_name() %>
											</a>
											</li>
										<%
									}
								}
								%>	
								</ul></li>			
			<%
			break;
		}
	}
%>




<%

	for(int i=0;i<list.size();i++){
		Menu menu=list.get(i);
		if(menu.getParent_id()==0&&menu.getMenu_id()!=tempId){
			%>
							<li  id="li<%=i%>" ><table style="width:100%;"><tr style="height:50px;"><td> <a onclick="showsrc('${ctx}/<%=menu.getMenu_url() %>','li<%=i%>','ul<%=i%>');return false"
								href="javascript:void(0)"
								style="margin-left:10px;font-weight: 600; padding: 14px 20px 14px 25px; font-size: 16px;width:173px;"
							><i
									class="fa fa-table"
									style="color:white;"
								></i> <span
									class="nav-label"
									style="color:white;width:173px;"
								><%=menu.getMenu_name() %></span></a></td><td style="width:20%;"><a  onclick="showul('li<%=i%>','ul<%=i%>');return false" style="width:40px;" href="javascript:void(0)"><span
									class="fa arrow"
									style="color:white;width:60px;display:block;margin:0 auto;text-align:center;"
								></span> </a></td></tr></table>
								<ul id="ul<%=i%>"
									class="nav nav-second-level"
									style="padding-left:0%; background-color:#269eb9;"
								>
									
								<%
								
								for(int j=0;j<list2.size();j++){
									Menu menu2=list2.get(j);
									if(menu2.getParent_id()==menu.getId()){
										%>
											<li id="lis<%=i%><%=j%>">
											<a class="J_menuItem"
												href="${ctx}/<%=menu2.getMenu_url() %>"
												style="color:white;"
												onclick="showac('lis<%=i%><%=j%>');"
											><%=menu2.getMenu_name() %>
											</a>
											</li>
										<%
									}
								}
								%>	
								</ul></li>			
			<%
		}
	}
%>
					
					
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div
			id="page-wrapper"
			class=" dashbard-1"
			style="background-color:#bef2ff;"
		>
			<div
				class="row border-bottom"
				style="height:60px;"
			>
				<nav
					class="navbar"
					role="navigation"
					style="margin-bottom: 0px;background-color:#269eb9; "
				>
					<div class="navbar-header">
						<a
							class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#" onclick="showtitle()"
						><i class="fa fa-bars"></i> </a>
						<form
							role="search"
							class="navbar-form-custom"
							method="post"
							action=""
						>&nbsp;</form>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li
							class="dropdown"
							style="height:60px; line-height:60px; vertical-align:middle;"
						><img
							alt="image"
							class="img-circle"
							src="<%=session.getAttribute("url")+u.getTxPath() %>"
							style="height:40px;"
						/></li>
						<li
							class="dropdown"
							style="height:60px; line-height:27px; vertical-align:middle;"
						><a
							data-toggle="dropdown"
							class="dropdown-toggle"
							href="#"
							style="padding:0px 10px; min-height:0px;"
						> <span class="clear"> <span
									class="block m-t-xs"
									style="color:white;"
								><strong class="font-bold"><%=u.getLoginname()%></strong></span> <span
									class="text-muted text-xs block"
									style="color:white;"
								><%=u.getXm()%><b class="caret"></b></span>
							</span>
						</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a
									href="#.html"
									onclick="show('<%=u.getId() %>')"
								>个人资料</a></li>
								<li class="divider"></li>
								<li><a
									href="#.html"
									onclick="edit()"
								>密码修改</a></li>
								<li class="divider"></li>
								<li><a
									href="#.html"
									onclick="upload()"
								>上传头像</a></li>
								<li class="divider"></li>
								<li><a
									href="#.html"
									onclick="edit1('<%=u.getId() %>')"
								>修改资料</a></li>
								<li class="divider"></li>
								<li><a
									href="#.html"
									onclick="LoginOut('<%=u.getJgid() %>')"
								>安全退出</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
			<div
				class="row J_mainContent d8"
				id="content-main"
				style="margin-top:20px;"
			>
				<iframe
					class="J_iframe"
					name="iframe0"
					id="iframe0"
					width="100%"
					height="100%"
					src="${ctx}/<%=tempUrl %>"
					frameborder="0"
					data-id="index_v1.html"
					seamless
				></iframe>
			</div>
			<div class="footer">
				<div
					class="d8"
					style="height:60px; line-height:60px;"
				>
					<table style="width:100%;">
						<tr>
							<td style="text-align:left; padding-left:20px;">版权所有&copy;
								2021-2030 健康管理门户系统</td>
							<td style="text-align:right; padding-right:20px;"><span
								style=""> VERSION 1.0 </span></td>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div
		id="showD"
		style="width:90%;visibility:hidden;left:5%; position:absolute;top:30px; background-color:white;margin-left:auto;margin-right:auto;z-index:9999; border:none;overflow: auto;"
	>
		<table style="width:100%;">
			<tr>
				<td
					style="height:30px;background-color:#27bac1;line-height:30px;text-align:left;"
				><span
					id="title1"
					style="margin-left:10px;color:white;font-size:20px;"
				></span></td>
				<td
					style="height:30px;background-color:#27bac1;line-height:30px;text-align:right;"
				><a
					style="margin-right:10px;color:white;font-size:20px;"
					onclick="gb()"
				>关闭 </a></td>
			</tr>
			<tr>
				<td colspan="2"><iframe
						id="ifa"
						style="width:100%;height:100%;"
						frameborder="1"
						scrolling="auto"
						src=""
					></iframe></td>
			</tr>
		</table>
	</div>
	<!--修改密码弹窗开始 -->
	<div
		class="modal fade"
		id="editModel"
		tabindex="-1"
		role="dialog"
		aria-labelledby="myModalLabel"
	>
		<div
			class="modal-dialog"
			role="document"
		>
			<div
				class="modal-content"
				style="background-color:#f3f3f4;"
			>
				<div class="modal-header">
					<button
						type="button"
						class="close"
						data-dismiss="modal"
						aria-label="Close"
					>
						<span aria-hidden="true">×</span>
					</button>
					<span
						class="glyphicon glyphicon-align-center"
						style="color: Silver;
                        font-size: 25px;"
					>密码修改</span>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
							> 新的密码</span> <input
								id="e_pass"
								type="password"
								class="form-control"
								placeholder="请输入新的密码"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
							> 再次输入</span> <input
								id="e_pass1"
								type="password"
								class="form-control"
								placeholder="请再次输入新的密码"
							/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button
						type="button"
						class="btn btn-default"
						data-dismiss="modal"
					>
						<span
							class="glyphicon glyphicon-remove"
							aria-hidden="true"
						></span>关闭
					</button>
					<button
						type="button"
						class="btn btn-primary"
						onclick="doEdit()"
					>
						<span
							class="glyphicon glyphicon-floppy-disk"
							aria-hidden="true"
						></span>保存
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--修改密码弹窗结束 -->
	<!--查看弹窗开始 -->
	<div
		class="modal fade"
		id="showModel"
		tabindex="-1"
		role="dialog"
		aria-labelledby="myModalLabel"
	>
		<div
			class="modal-dialog"
			role="document"
		>
			<div
				class="modal-content"
				style="background-color:#f3f3f4;"
			>
				<div class="modal-header">
					<button
						type="button"
						class="close"
						data-dismiss="modal"
						aria-label="Close"
					>
						<span aria-hidden="true">×</span>
					</button>
					<span
						class="glyphicon glyphicon-align-center"
						style="color: Silver;
                        font-size: 25px;"
					>查看</span>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
							> 个人账号</span> <input
								id="s_usercode"
								type="text"
								class="form-control"
								readonly="readonly"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
							> 姓名</span> <input
								id="s_xm"
								type="text"
								class="form-control"
								readonly="readonly"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
							> 出生日期</span> <input
								id="s_csrq"
								type="text"
								class="form-control"
								readonly="readonly"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
							> 身份证号</span> <input
								id="s_sfzh"
								type="text"
								class="form-control"
								readonly="readonly"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 19px; padding-right: 19px;background-color:f3f3f4;"
							> 手机号</span> <input
								id="s_sjh"
								type="text"
								class="form-control"
								readonly="readonly"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
							> 邮箱</span> <input
								id="s_yx"
								type="text"
								class="form-control"
								readonly="readonly"
							/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span
								class="input-group-addon"
								style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
							> 性别</span> <input
								id="s_xb"
								type="text"
								class="form-control"
								readonly="readonly"
							/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button
						type="button"
						class="btn btn-default"
						data-dismiss="modal"
					>
						<span
							class="glyphicon glyphicon-remove"
							aria-hidden="true"
						></span>关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--查看弹窗结束 -->
	<!--修改弹窗开始 -->
		<div
			class="modal fade"
			id="editModel1"
			tabindex="-1"
			role="dialog"
			aria-labelledby="myModalLabel"
		>
			<div
				class="modal-dialog"
				role="document"
			>
				<div
					class="modal-content"
					style="background-color:#f3f3f4;"
				>
					<div class="modal-header">
						<button
							type="button"
							class="close"
							data-dismiss="modal"
							aria-label="Close"
						>
							<span aria-hidden="true">×</span>
						</button>
						<span
							class="glyphicon glyphicon-align-center"
							style="color: Silver;
                        font-size: 25px;"
						>修改资料</span>
					</div>
					<div class="modal-body">							
						<div class="form-group">
							<div
								class="input-group date form_datetime col-md-2"
								style="text-align: center;"
							>
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 出生日期</span> <input
									id="e_csrq"
									name="dataCon"
									class="form-control"
									runat="server"
									type="text"
									style="width:455px;"
									placeholder="请输入出生日期"
								/> <span
									class="input-group-addon"
									style="display:none;"
								><span class="glyphicon glyphicon-th"></span></span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 12px; padding-right: 12px;background-color:f3f3f4;"
								> 身份证号</span> <input
									id="e_sfzh"
									type="text"
									class="form-control"
									placeholder="请输入新的身份证号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 19px; padding-right: 19px;background-color:f3f3f4;"
								> 手机号</span> <input
									id="e_sjh"
									type="text"
									class="form-control"
									placeholder="请输入新的手机号"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 邮箱</span> <input
									id="e_yx"
									type="text"
									class="form-control"
									placeholder="请输入新的邮箱"
								/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span
									class="input-group-addon"
									style="font-weight: bolder; padding-left: 26px; padding-right: 26px;background-color:f3f3f4;"
								> 性别</span> <select
									class="form-control single-line"
									id="e_xb"
								>
									<option value="">性别</option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-default"
							data-dismiss="modal"
						>
							<span
								class="glyphicon glyphicon-remove"
								aria-hidden="true"
							></span>关闭
						</button>
						<button
							type="button"
							class="btn btn-primary"
							onclick="doEdit1()"
						>
							<span
								class="glyphicon glyphicon-floppy-disk"
								aria-hidden="true"
							></span>保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--修改弹窗结束 -->
		<!--导入弹窗开始 -->
	<div
		class="modal fade"
		id="drModel"
		tabindex="-1"
		role="dialog"
		aria-labelledby="myModalLabel"
	>
		<div
			class="modal-dialog"
			role="document"
		>
			<div
				class="modal-content"
				style="background-color: #f3f3f4;"
			>
				<div class="modal-header">
					<button
						type="button"
						class="close"
						data-dismiss="modal"
						aria-label="Close"
					>
						<span aria-hidden="true">×</span>
					</button>
					<span
						class="glyphicon glyphicon-align-center"
						style="color: Silver; font-size: 25px;"
					>上传头像</span>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group">
							<input
								type="hidden"
								name="flag" class="form-control"
								value="2"
							> <input
								id="copanyLogo"
								type="file"
								name="files"
								class="form-control"
								style="width:400px;"
							/><input
								type="button"
								id="button1"
								name="button1"
								style="margin-left: 10px;"
								value="上传头像"
								class="btn btn-outline btn-default"
								onclick="ajaxFileUpload()"
							/>
						</div>
					</div>
					<div class="form-group">
						<div
							class="input-group"
							id="result"
						></div>
					</div>
					<input
						type="hidden"
						id="drId1"
					>
				</div>
				<div class="modal-footer">
					<button
						type="button"
						class="btn btn-default"
						data-dismiss="modal"
					>
						<span
							class="glyphicon glyphicon-remove"
							aria-hidden="true"
						></span>关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--导入弹窗结束 -->
		<input
			type="hidden"
			id="eid"
		>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/jiankang/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${ctx}/jiankang/js/plugins/slimscroll/jquery.slimscroll.min.js"
	></script>
	<script src="${ctx}/jiankang/js/plugins/layer/layer.min.js"></script>
	<script src="${ctx}/jiankang/js/hplus.min.js?v=4.1.0"></script>
		<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<script
		type="text/javascript"
		src="${ctx}/jiankang/js/contabs.min.js"
	></script>
	<script src="${ctx}/jiankang/js/plugins/pace/pace.min.js"></script>
		<script
		type="text/javascript"
		src="${ctx }/js/ajaxfileupload.js"
	></script>
		<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/js/bootstrap-datetimepicker.js"
		charset="utf8"
	></script>
	<script
		src="${ctx}/jiankang/js/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="utf8"
	></script>
	<script type="text/javascript">
	function showsrc(o,l,u)
	  { 
		  var $lis1 = $("#side-menu").find('li');  
          $lis1.removeClass('se');
          $lis1.removeClass('active');
      var $lis2 = $("#side-menu").find('ul');
          $lis2.removeClass('in');
	  $(".J_mainContent").find("iframe.J_iframe").attr("src",o);
	   var $this = $('#'+u);
		 var $this1 = $('#'+l);
		 var $lis = $("#side-menu").find('.nav-second-level li');  
         $lis.removeClass('active');
		  if (IEVersion() <= 9) {
			if ($this.is(':hidden'))
			{
				$this.collapse("show");
				$this1.toggleClass("active"); 
			 
			}
			else
			{
			   
				
				 
		
			}
      } else {
			
			if ($this.is(':hidden'))
			{
			 $this1.children("ul").collapse("show");
			 $this1.toggleClass("active");
				 
			}
			else
			{
                
				 
			}
      }
	   $this1.addClass("se"); 
	  }
	  function IEVersion(){
var rv = -1;
if (navigator.appName == 'Microsoft Internet Explorer'){
var ua = navigator.userAgent;
var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
if (re.exec(ua) != null)
rv = parseFloat( RegExp.$1 );
}else if (navigator.appName == 'Netscape'){
var ua = navigator.userAgent;
var re  = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
if (re.exec(ua) != null)
rv = parseFloat( RegExp.$1 );
}
return rv;
}

function showul(o,n)
	  { 
	     var $this = $('#'+n);
		 var $this1 = $('#'+o);
		 var $lis1 = $("#side-menu").find('li');  
         $lis1.removeClass('active');
        var $lis2 = $("#side-menu").find('ul');
         $lis2.removeClass('in');


      if (IEVersion() <= 9) {
			if ($this.is(':hidden'))
			{
				$this.collapse("show");
				$this1.toggleClass("active");
				
			}
			else
			{
			   $this.collapse("hide");	
			   $this1.removeClass("active");
		
			}
      } else {
			
			if ($this.is(':hidden'))
			{
				$this1.children("ul").collapse("show");
				 $this1.toggleClass("active");
				
			}
			else
			{
			  $this1.children("ul.in").collapse("hide");
			  $this1.removeClass("active");
			
			}
      }
	  }
	      function showtitle()
		  { 
		    var t1="<%=jgname%>";
		    var t2="<%=jgsname%>";
		    var t=$("#tit").html().trim();
			var p1="<%=session.getAttribute("url")%>/images/logo/<%=jcode %>_b.png";
			var p2="<%=session.getAttribute("url")%>/images/logo/<%=jcode %>_b1.png";
			
			if (t==t1)
			{
				$("#tit").html(t2);
				$("#logo").attr("src",p2);  
			}
			else
			{
				$("#tit").html(t1);
				$("#logo").attr("src",p1);  
				 
			}
			  
		  }
		 function showac(id) {
		 var $lis = $("#side-menu").find('.nav-second-level li');  
          $lis.filter('.active').removeClass('active');
          $("#"+id).addClass('active');
		   var $lis1 = $("#side-menu").find('li');  
           $lis1.removeClass('se');
		  }
		function showDiv(title, url) {
			document.getElementById("showD").style.height = (document.body.clientHeight - 100) + "px";
			document.getElementById("showD").style.width = (document.body.clientWidth * 9 / 10) + "px";
			document.getElementById("title1").innerHTML = title;
			document.getElementById("ifa").style.height = (document.body.clientHeight - 140) + "px";
			document.getElementById("ifa").style.width = (document.body.clientWidth * 9 / 10 - 10) + "px";
			document.getElementById("ifa").src = url;
			document.getElementById("showD").style.visibility = "visible";
		}
		function gb() {
			document.getElementById("showD").style.visibility = "hidden";
		}
		function LoginOut(jgid) {
			swal({
				title : "",
				text : "确认退出当前用户么",
				type : "",
				showCancelButton : true,
				closeOnConfirm : false,
				onfirmButtonText : "Yes"
			}, function() {
				window.location.href = "${ctx}/user/logout?companyId="+jgid;
			});
		}
		function edit() {//新增按钮方法
			document.getElementById("e_pass").value = "";
			document.getElementById("e_pass1").value = "";
			$('#editModel').modal();
		}
		function doEdit(){//修改保存方法
			if(document.getElementById("e_pass").value==""||document.getElementById("e_pass1").value==""||document.getElementById("e_pass").value!=document.getElementById("e_pass1").value){
				swal({
					title : "",
					text : "两次输入的密码不一致",
					type : "",
					showCancelButton : false,
					closeOnConfirm : false,
					showLoaderOnConfirm : true,
				});
				return false;
			}
			if(!/^\w{4,20}$/.test(document.getElementById("e_pass").value)){
				swal({
					title : "",
					text : "密码长度必须是6~20之间",
					type : "",
					showCancelButton : false,
					closeOnConfirm : false,
					showLoaderOnConfirm : true,
				});
				return false;
			}
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/user/updateUser",
	            data: {
	                id: "<%=u.getId()%>",
					password : document.getElementById("e_pass").value,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	            	swal({
	            		title : "",
	            		text : "修改成功!",
	            		type : "",
	            		showCancelButton : false,
	            		closeOnConfirm : true,
	            		showLoaderOnConfirm : true,
	            	}, function() {
	            		$('#editModel').modal('hide');	
	            	});
	            },
	            error:function(data){
	            	swal({
	            		title : "",
	            		text : "修改失败!",
	            		type : "",
	            		showCancelButton : false,
	            		closeOnConfirm : true,
	            		showLoaderOnConfirm : true,
	            	}, function() {
	            		$('#editModel').modal('hide');	
	            	});
	            }
	        });
		}
		function show(id){

			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/jggly/editGly",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("s_usercode").value = t.rows[0]["loginname"]==undefined?"":t.rows[0]["loginname"];
	                document.getElementById("s_xm").value = t.rows[0]["xm"]==undefined?"":t.rows[0]["xm"];
	                document.getElementById("s_sfzh").value = t.rows[0]["sfzh"]==undefined?"":t.rows[0]["sfzh"];
	                document.getElementById("s_sjh").value = t.rows[0]["sjh"]==undefined?"":t.rows[0]["sjh"];
	                document.getElementById("s_yx").value = t.rows[0]["yx"]==undefined?"":t.rows[0]["yx"];
	                document.getElementById("s_csrq").value = t.rows[0]["csrq"]==undefined?"":t.rows[0]["csrq"];
	                document.getElementById("s_xb").value = t.rows[0]["xb"]==undefined?"":t.rows[0]["xb"];
	    			$('#showModel').modal();
	            }
	        });
		}
		function upload(id){
			document.getElementById("copanyLogo").value="";
			document.getElementById("result").innerHTML="";
			document.getElementById("drId1").value=id;
			$('#drModel').modal();
		}
	    function ajaxFileUpload(){  
	    	document.getElementById("result").innerHTML="";
	        //执行上传文件操作的函数  
	        var name=document.getElementById("copanyLogo").value;
	        if(name!=""){
	        name=name.substr(name.lastIndexOf(".")+1);
	        if(name.toLocaleLowerCase()=="png"||name.toLocaleLowerCase()=="jpg"||name.toLocaleLowerCase()=="jpeg"){
	        $.ajaxFileUpload({  
	        url:'${ctx}/common/addTx',  //上传机构id
	        secureuri:false,                           //是否启用安全提交,默认为false   
	        fileElementId:'copanyLogo',               //文件选择框的id属性  
	        dataType:'json',                           //服务器返回的格式,选择json或者xml貌似有问题
	        type:'post',
	        success:function(data){            //服务器响应成功时的处理函数  
	        	right("头像上传成功!");
	        },  
	        error:function(data){ //服务器响应失败时的处理函数  
	        	noRight("头像上传失败!");
	      		  }  
	        });  
	        }else{
	        	noRight("请选择结尾.jpg或.png或.jpeg的图片文件!");
	        }
	    }else{
	    	noRight("请选择上传头像文件!");
	    }
	    }  
	    function edit1(id) {//修改按钮方法
			document.getElementById("eid").value=id;
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/user/editUser",
	            data: {
	                id: id,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	                document.getElementById("e_sfzh").value = t.rows[0]["sfzh"]==undefined?"":t.rows[0]["sfzh"];
	                document.getElementById("e_sjh").value = t.rows[0]["sjh"]==undefined?"":t.rows[0]["sjh"];
	                document.getElementById("e_yx").value = t.rows[0]["yx"]==undefined?"":t.rows[0]["yx"];
	                document.getElementById("e_csrq").value = t.rows[0]["csrq"]==undefined?"":t.rows[0]["csrq"];
	                document.getElementById("e_xb").value = t.rows[0]["xb"]==undefined?"":t.rows[0]["xb"];
	                selChange("e_xb");
	    			$('#editModel1').modal();
	            }
	        });
		}
		$("input[name='dataCon']").datetimepicker({
			language: 'zh-CN',
			format : 'yyyy-mm-dd',
			autoclose : true,
			timepicker : false, //关闭时间选项
			startView : 2,
			minView : 3,
			todayHighlight : true
		});
		function doEdit1(){//修改保存方法
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			 var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			 var myreg2 = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
				 if(document.getElementById("e_sjh").value==""){
				noRight("请输入手机号!");return false;
			}else if(document.getElementById("e_yx").value==""){
				noRight("请输入邮箱!");return false;
			}else if(document.getElementById("e_csrq").value==""){
				noRight("请选择出生日期!");return false;
			}else if (!myreg.test(document.getElementById("e_sjh").value))
	        {
				noRight("请输入有效的手机号");return false;
	        }else if (!myreg1.test(document.getElementById("e_yx").value))
	        {
	        	noRight("请输入有效的邮箱");return false;
	        }else if (!myreg2.test(document.getElementById("e_sfzh").value))
	        {
	        	noRight("请输入有效的身份证号");return false;
	        }
			$.ajax({
	            cache: false,
	            type: "post",
	            dataType: "Json",
	            url: "${ctx}/user/updateUser",
	            data: {
	                id: document.getElementById("eid").value,
					sfzh : document.getElementById("e_sfzh").value,
					sjh : document.getElementById("e_sjh").value,
					yx : document.getElementById("e_yx").value,
					csrq : document.getElementById("e_csrq").value,
					xb : document.getElementById("e_xb").value,
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	            	right(t.msg);
	            },
	            error:function(data){
	            	noRight(t.msg);
	            }
	        });
		}	
	</script>
</body>
</html>
