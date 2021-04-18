<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ page import="com.alibaba.fastjson.*"%>
<%@ page import="org.soft.erp.domain.*"%>
<%@ page import="java.util.*"%>
<%@ taglib
	prefix="form"
	uri="http://www.springframework.org/tags/form"
%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
导出按钮
<input
				type="radio"
				name="aaa"
				value="vvv"
				style="margin-left: 40px;margin-top: -5px;"
				onclick="oncheck()"
			/>


<br />

导入按钮
<input
				type="radio"
				name="aaa"
				value="vvv"
				style="margin-left: 40px;margin-top: -5px;"
				onclick="oncheck1()"
			/>


<br />

	<script
		src="${ctx}/js/metronic/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"
	></script>
	<script
		src="${ctx}/js/metronic/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"
	></script>
	<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/jiankang/js/sweetalert.min.js"></script>
	<script src="${ctx}/jiankang/js/public.js"></script>
	<!--[if lt IE 9]>
   <script src="${ctx}/js/metronic/plugins/excanvas.js"></script>
   <script src="${ctx}/js/metronic/plugins/respond.js"></script>  
   <![endif]-->
	<script type="text/javascript">
		
		function oncheck(){
			alert("开始导出Excel");
			
			$.ajax({
	            cache: false,
	            type: "get",
	            dataType: "json",
	            async:false,
	            url: "${ctx}/user/doExportExcel",
	            data: {
	            	tblName :'s_rbac_user',
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	    			//alert(index+" "+value+" "+type);
	    			document.getElementById(index).style.backgroundColor="red";
	            }
	        });
		}
		
		
	</script>

	<script type="text/javascript">
		
		function oncheck1(){
			alert("开始导入Excel");
			
			$.ajax({
	            cache: false,
	            type: "get",
	            dataType: "json",
	            async:false,
	            url: "${ctx}/user/doImportExcel",
	            data: {
	            	tblName :'s_rbac_user',
	                time: Math.random()
	            },
	            success: function (data)
	            {
	            	var t = eval(data);
	    			//alert(index+" "+value+" "+type);
	    			document.getElementById(index).style.backgroundColor="red";
	            }
	        });
		}
		
		
	</script>


<a href="${ctx}/test1.xlsx">test1.xlsx</a>



</body>
</html>
