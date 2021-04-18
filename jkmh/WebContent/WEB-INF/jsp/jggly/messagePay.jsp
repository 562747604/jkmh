<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style type="text/css">
.demo{width:400px; margin:40px auto 0 auto; min-height:250px;}
.demo p{line-height:30px}
#code{margin-top:10px}
</style>
<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript" src="${ctx}/js/jquery.qrcode.min.js"></script>
</head>
<body>

<script type="text/javascript">


	var str = "<%=request.getAttribute("PAYURL") %>";
	$('#code').qrcode(str);




$(function(){
	
	$("#code").qrcode({
		render: "table",
		width: 200,
		height:200,
		text: str
	});
	
	$("#sub_btn").click(function(){
		$("#code").empty();
		var str = toUtf8($("#mytxt").val());
		
		$("#code").qrcode({
			render: "table",
			width: 200,
			height:200,
			text: str
		});
	});
})
function toUtf8(str) {   
    var out, i, len, c;   
    out = "";   
    len = str.length;
    for(i = 0; i < len; i++) {   
    	c = str.charCodeAt(i);   
    	if ((c >= 0x0001) && (c <= 0x007F)) {   
        	out += str.charAt(i);   
    	} else if (c > 0x07FF) {   
        	out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));   
        	out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));   
        	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
    	} else {   
        	out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));   
        	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
    	}   
    }   
    return out;   
}  

</script>


<div id="main">
   <div class="demo">
   		<p>请扫描下方二维码完成充值</p>
<!--         <p><input type="text" class="input" id="mytxt" value=""> <input type="button" id="sub_btn" value="提交"></p>
 -->   		<div id="code"></div>
   </div>

</div>


</body>



</html>
