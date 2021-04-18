<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="form"
	uri="http://www.springframework.org/tags/form"
%>
<!DOCTYPE html>
<html >
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
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
	rel="shortcut icon"
	href="${ctx}/images/favicon.ico"
>
 
<link href="${ctx}/jiankang/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/jiankang/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${ctx}/jiankang/css/plugins/steps/jquery.steps.css" rel="stylesheet">
<link href="${ctx}/jiankang/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/jiankang/css/style.min862f.css?v=4.1.0" rel="stylesheet">
 
<link
	rel="shortcut icon"
	href="${ctx}/images/favicon.ico"
/>
  <style>
   .form-control {
    width: 360px;
    height: 35px;
    padding: 4px 12px 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
	 margin:0 auto;
    background-color: #ffffff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.wizard > .content > .body {
    float: left;
    position: absolute;
    width: 100%;
    height: 95%;
    padding: 2.5%;
}
.col-sm-8 {
    width: 100%;
	padding-left: 0px;
}
.wizard > .actions {
    position: relative;
    display: block;
    text-align:center!important;
    width: 100%;
}
        </style>
<script type="text/javascript">
$(window).resize(function() {
  	var height =window.innerHeight;
       document.getElementById("pa1").style.top = (height  - 500)/2 + "px";
});
$(function() {
	var height =window.innerHeight;
   document.getElementById("pa1").style.top = (height  - 500)/2 + "px";
}); 
</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="font-family: 微软雅黑;">
	<div
		id="m1"	 >
                    <div class="ibox-content" id="pa1" style="width:50%;min-width:500px;height:500px; margin:auto auto;top: 16%;left:25%;position: absolute;border-width: 0px 0; text-align:center;">
                             <h2>
                                 忘记密码
                            </h2>
                        <p>
                            完成以下步骤重置密码
                        </p>

                        <form id="form" action="${ctx}/user/loginm1?companyId=${companyId}" method="post" class="wizard-big">
                            <h1>账户信息</h1>
                            <fieldset>
                                <h2>请填写用户及邮箱信息</h2>
                                <div  style="text-align:center!important;position: absolute;width:100%;">
                                    <div class="col-sm-8" style="text-align:center!important; margin:0 auto;">
                                        <div class="form-group">
                                            <label>个人账号 *</label>
                                            <input id="userName" name="userName" type="text" class="form-control required">
                                        </div>
                                       <div class="form-group">
                                            <label>Email *</label>
                                            <input id="email" name="email" type="text" class="form-control required email">
                                        </div>
                                    </div>
                                    
                                </div>

                            </fieldset>
                            <h1>邮件验证</h1>
                            <fieldset>
                                <h2>收到验证邮件后，请输入邮件验证码</h2>
                                <div style="text-align:center!important;position: absolute;width:100%;" >
     
                                    <div class="col-sm-8">
                                        <div class="form-group">
                                            <label>验证码</label>
                                            <input id="yz" name="yz" type="text" class="form-control required ">
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                            <h1>修改密码</h1>
                            <fieldset>
                                         <h2>输入新密码</h2> 
										 <div style="text-align:center!important;position: absolute;width:100%;">
                                    <div class="col-sm-8">
										 <div class="form-group">
                                            <label>密码 *</label>
                                            <input id="password" name="password" type="text" class="form-control required">
                                        </div>
                                        <div class="form-group">
                                            <label>确认密码 *</label>
                                            <input id="confirm" name="confirm" type="text" class="form-control required">
                                        </div>
									 </div>
                                </div>
                            </fieldset>
                            <h1>完成</h1>
                            <fieldset>
                                <h2>密码修改完成，点完成按钮将自动登录系统！</h2>
                                 
                            </fieldset>
                        </form>
                    </div>
              
		 
		<div
			id="m2"
			style="height:50px;width:100%;text-align:center;position: absolute;"
		>
			<span>版权所有&copy; 2017-2018 </span><span>丁丁健康管理中心</span>
		</div>
		</div>
    <script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/jiankang/js/bootstrap.min.js?v=3.3.6"></script>

    <script src="${ctx}/jiankang/js/plugins/staps/jquery.steps.min.js"></script>
    <script src="${ctx}/jiankang/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx}/jiankang/js/plugins/validate/messages_zh.min.js"></script>
 
   <script>
   $(function() {
		var height = window.screen.availHeight;
		document.getElementById("m1").style.height = (height - 80) + "px";
		document.getElementById("m2").style.top = (height - 130) + "px";
   });
        $(document).ready(
		function(){
			$("#form").validate({  
		        rules: {  
		    
		   password: {  
		    required: true,  
		    minlength: 6,
		    maxlength:20 	
		   },  
		   confirm_password: {  
		    required: true,  
		    minlength: 6,  
			maxlength:20,
		    equalTo: "#password"  
		   }  
					}});
			$("#form").steps(
			{bodyTag:"fieldset",
			  onCanceled: function (event)
                {
                    location.href ="${ctx}/user/loginForm";
                },
			onStepChanging:function(event,currentIndex,newIndex)
			{if(currentIndex>newIndex)
			{
		   return true}
 
		if(currentIndex==0)
	 { 
		var	rt=$.ajax({ cache: false,url:"${ctx}/user/yzyj?companyId=${companyId}&loginname="+document.getElementById("userName").value+"&email="+document.getElementById("email").value,async:false});
 
		 if (rt.responseText=="ok")
			 {
			 
			 }
		 else  if (rt.responseText=="err1" ||rt.responseText=="err2" )
		 {
			 alert("验证邮发送失败！"); 
			 return;
		 }
		 else
			 {
			 alert("用户或邮箱不存在！");
			 return;	 
			 }
      }
		if(currentIndex==1)
		 { 
			var	rt=$.ajax({ cache: false,url:"${ctx}/user/yzyjm?companyId=${companyId}&loginname="+document.getElementById("userName").value,async:false});
	 
			 if (rt.responseText==document.getElementById("yz").value)
			 {
				 
			 }
			 else   
			 {
				 alert("验证码输入错误！"); 
				 return;
			 }
	      }
		if(currentIndex==2)
		 { 
			var	rt=$.ajax({ cache: false,url:"${ctx}/user/yzyjpasswd?companyId=${companyId}&loginname="+document.getElementById("userName").value+"&email="+document.getElementById("email").value+"&yzcode="+document.getElementById("yz").value+"&passwd="+document.getElementById("password").value,async:false});
	 
			 if (rt.responseText=="ok")
			 {
				 
			 }
			 else  if (rt.responseText=="err1")  
			 {
				 alert("验证码输入错误！"); 
				 return;
			 }
			 else  if (rt.responseText=="err2")  
			 {
				 alert("用户或邮箱不存在！"); 
				 return;
			 }
			 else   
			 {
				 alert("修改密码失败！"); 
				 return;
			 }
	      }
		 
	var form=$(this);
	if(currentIndex<newIndex){
		$(".body:eq("+newIndex+") label.error",form).remove();
		$(".body:eq("+newIndex+") .error",form).removeClass("error")}
		form.validate().settings.ignore=":disabled,:hidden";return form.valid()},
		onStepChanged:function(event,currentIndex,priorIndex)
		{ 
},
onFinishing:function(event,currentIndex)
{var form=$(this);
form.validate().settings.ignore=":disabled";
return form.valid()
},
onFinished:function(event,currentIndex)
{var form=$(this);form.submit()}
}).validate(
{errorPlacement:function(error,element){element.before(error)},rules:{confirm:{equalTo:"#password"}}})});
    </script>

</body>
<!-- END BODY -->
</html>