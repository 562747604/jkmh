<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="org.soft.erp.domain.survey.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.alibaba.fastjson.*"%>
<%@ page import="org.soft.erp.util.http.survey.*"%>
<%@taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
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
<script type="text/javascript">
	function load() {
		var height = window.innerHeight;
		document.getElementById("m1").style.height = (height - 190) + "px";
		document.getElementById("m2").style.top = (height - 110) + "px";
		document.getElementById("t1").style.height = (height - 190) + "px";
		document.getElementById("dt1").style.height = (height - 260) + "px";
		window.setInterval("getNowFormatDate()", 1000);
	}
	function getNowFormatDate() {
		var date = new Date();
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		var hours = date.getHours();
		var sec = date.getSeconds();
		var min = date.getMinutes();
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
			+ " " + hours + seperator2 + min
			+ seperator2 + sec;
		document.getElementById("nowTime").innerHTML = currentdate;
	}
</script>
<%
	String submitPeisInfoId = "";
%>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body
	style="font-family: 微软雅黑;"
	onload="load()"
>
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
					id="nowTime"
					style="color: white; font-size: 16px;"
				></label></td>
			</tr>
		</table>
	</div>
	<div
		id="m1"
		style="background-image:url(${ctx }/images/u13.jpg);width:100%;"
	>
		<table
			id="t1"
			style="width: 1024px;  margin: 0px auto;vertical-align: middle;"
		>
			<tr>
				<td
					colspan="3"
					style="height: 60px;text-align: right;vertical-align: middle;opacity:0.7;background-color:#ace3fa;padding-top:5px;line-height: 60px;"
				><a
					href="${ctx}/nurse/survey/submit?peopleId=${peopleId}"
					;
					class="btn btn-outline btn-default"
					style="margin-left: 10px; text-align: center;padding: 5px 0px;width:70px;"
				>提交</a><a
					href="${ctx}/nurse/main"
					class="btn btn-outline btn-default"
					style="margin-left: 10px; text-align: center;padding: 5px 0px;width:70px; margin-right: 20px;"
				>返回</a></td>
			</tr>
			<tr>
				<td
					style="width:270px;text-align:left;vertical-align: top;opacity:0.7;background-color:#ace3fa;line-height:40px;padding: 0px 10px;"
				>
					<%
						List<Question> questions = (List<Question>) request.getAttribute("questions");
						for (int i = 0; i < questions.size(); i++) {
							String answer = questions.get(i).getValue();
							if (answer != null && !answer.equals("") && !answer.equals("{\"answer\":[\"\"]}")) {
								if (i >= 0 && i <= 8) {
					%> <a
					href="#a<%=i%>"
					class="form-control"
					style="background-color: #70eb78;width:30px;"
				>0<%=i + 1%></a> <%
 	} else {
 %> <a
					href="#a<%=i%>"
					class="form-control"
					style="background-color: #70eb78;width:30px;"
				><%=i + 1%></a> <%
 	}

 		} else {
 			if (i >= 0 && i <= 8) {
 %> <a
					href="#a<%=i%>"
					class="form-control"
					style="width:30px;"
				>0<%=i + 1%></a> <%
						} else {
					%> <a
					href="#a<%=i%>"
					class="form-control"
					style="width:30px;"
				><%=i + 1%></a> <%
						}
							}

						}
					%>
				</td>
				<%
						questions = (List<Question>) request.getAttribute("questions");
					%>
				<td
					style="text-align: center;  vertical-align: top;background-color: #f0f0f0;"
				>
					<div
						id="dt1"
						style="overflow: auto;margin-top: 0px;"
					>
						<%
							System.out.println(questions.size());
							for (int i = 0; i < questions.size(); i++) {//问题开始
								Question question = questions.get(i);

								submitPeisInfoId = question.getPeopleId();//用于提交数据
								String peopleId = question.getPeopleId();
								String categoryId = question.getCategoryId();
								String dataId = question.getDataId();
								String questionId = question.getQuestionId();

								String questionCode = question.getQuestionCode();
								String quesStr = question.getQuestion();
								int answerType = question.getAnswerType();//问题类型
								String answerStr = question.getAnswer();

								int order = question.getOrder();//显示顺序
								String value = question.getValue();//答案	

								//			out.println("value==="+value);

								//*********************单选题******************************/
						%>
						<table
							id="a<%=i%>"
							class="form-control"
							style="width:90%;margin: 10px auto; text-align: left;line-height: 30px;background-color: white;"
						>
							<tr>
								<td style="height:30px;padding-left: 20px;"><span><%=i + 1%>：<%=quesStr%></span></td>
							</tr>
							<%
								if (answerType == 1) {

										String answers = question.getAnswer();
										String[] str = JSON.parseObject(answers, String[].class);

										for (int j = 0; j < str.length; j++) {
											Answer answer = JSON.parseObject(str[j], Answer.class);
											String ans_no = answer.getNo() + "";
											String ans_value = answer.getValue();
											String ans_text = answer.getText();
							%>
							<tr>
								<td style="height:30px;padding-left: 40px;"><%=ans_value%>:<%=ans_text%></td>
							</tr>
							<%
								}
							%>
							<tr>
								<td style="height:30px;">
									<%
										//获取答案列表
												Value val = null;
												String[] str2 = null;
												for (int j = 0; j < str.length; j++) {
													Answer answer = JSON.parseObject(str[j], Answer.class);
													String ans_no = answer.getNo() + "";
													String ans_value = answer.getValue();
													
													if (value != null && !value.equals("null")) {
														val = JSON.parseObject(value, Value.class);//"value": "{\"answer\":[\"79\"]}"
														str2 = JSON.parseObject(val.getAnswer(), String[].class);
													}
									%> <input
									type="radio"
									name="r<%=questionId%>"
									value="<%=ans_value%>"
									<%if (value != null && !value.equals("null") && str2[0].equals(ans_value)) {%>
									checked="checked"
									<%}%>
									style="margin-left: 40px;margin-top: -5px;"
									onclick="oncheck('<%=peopleId%>','<%=questionId%>',<%=answerType%>)"
								><%=ans_value%> <%
 	}
 %>
								</td>
							</tr>
							<%
								}
							%>
							<%
								if (answerType == 2) {
										//	out.println(value);

										String answers = question.getAnswer();
										String[] str = JSON.parseObject(answers, String[].class);

										for (int j = 0; j < str.length; j++) {
											Answer answer = JSON.parseObject(str[j], Answer.class);
											String ans_no = answer.getNo() + "";
											String ans_value = answer.getValue();
											String ans_text = answer.getText();
							%>
							<tr>
								<td style="height:30px;padding-left: 40px;"><%=ans_value%>:<%=ans_text%></td>
							</tr>
							<%
								}
							%>
							<tr>
								<td style="height:30px;">
									<%
										//获取答案列表
												Value val = null;
												List<String> str2 = null;
												for (int j = 0; j < str.length; j++) {
													Answer answer = JSON.parseObject(str[j], Answer.class);
													String ans_no = answer.getNo() + "";
													String ans_value = answer.getValue();
													//		out.println("ans_value=="+ans_value);
									%> <input
									type="checkbox"
									name="r<%=questionId%>"
									value="<%=ans_value%>"
									<%if (value != null && !value.equals("null") && value.indexOf(ans_value) != -1) {
							TypeValue typeValue = JSON.parseObject(value, TypeValue.class);
							str2 = typeValue.getAnswer();

							for (String avalue : str2) {
								if (avalue.equals(ans_value)) {%>
									checked="checked"
									<%}
							}
						}%>
									style="margin-left: 40px;margin-top: -5px;"
									onclick="oncheck('<%=peopleId%>','<%=questionId%>',<%=answerType%>)"
								><%=ans_value%> <%
 	}
 %>
								</td>
							</tr>
							<%
								} //end if(answerType==2)
							%>
							<%
								if (answerType == 3) {
										String answers3 = question.getAnswer();
										Answer3 answer3 = JSON.parseObject(answers3, Answer3.class);

										String low = answer3.getLow();
										String height = answer3.getHeight();
										String unit = answer3.getUnit();
										String dtype = answer3.getDtype();
										String centerIndex = answer3.getCenterIndex();
										//out.println(value);
										TypeValue typeValue = JSON.parseObject(value, TypeValue.class);
										//out.println(type3Value.getAnswer().get(0));
										String value3 = typeValue.getAnswer().get(0);
							%>
							<tr>
								<td style="height:30px;padding-left: 40px;">低：<%=low%>，高：<%=height%>，单位：<%=unit%>，类型：<%=dtype%>，中心：<%=centerIndex%></td>
							</tr>
							<tr>
								<td style="height:30px;"><input
									type="text"
									name="r<%=questionId%>"
									value="<%=value3%>"
									style="margin: 5px 0px 5px  40px;width:90%;"
									onchange="oncheck('<%=peopleId%>','<%=questionId%>',<%=answerType%>)"
								></td>
							</tr>
							<%
								}
							%>
						</table>
						<%
							} //问题结束
						%>
					</div>
				</td>
				<td style="width:20px;opacity:0.7;background-color:#ace3fa;">&nbsp;</td>
			</tr>
		</table>
	</div>
	<div
		id="m2"
		style="height:100px;width:100%;text-align:center;line-height:100px;position: absolute;"
	>
		<span>版权所有&copy; 2017-2018 </span><span>丁丁云康健康工作室</span>
	</div>
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
		function sub() {
			location.href = "${ctx}/nurse/report";
		}
		//avalue=所选答案
		function oncheck(peopleId,questionId,answerType) {
						
			var value="";
			if(answerType==1){
				var ck = document.getElementsByName("r" + questionId);
				for (var i = 0; i < ck.length; i++) {
					if (ck[i].checked == true) {
						value = ck[i].value;
					}
				}
			}
			
			if(answerType==2){
				var ck = document.getElementsByName("r" + questionId);
				for (var i = 0; i < ck.length; i++) {
					if (ck[i].checked == true) {
						value += ck[i].value;
					}
				}
			}
			
			if(answerType==3){
				value = document.getElementsByName("r" + questionId)[0].value;
			}
							
//			alert(value)
//			alert(peisInfoId + " " + questionId + " " + answerType + " " + value);
	
			$.ajax({
				cache : false,
				type : "post",
				dataType : "json",
				async : false,
				url : "${ctx}/nurse/updateSttemp",
				data : {
					peopleId : peopleId,
					questionId : questionId,
					answerType : answerType,
					value : value,
	
					time : Math.random()
				},
				success : function(data) {
					var t = eval(data);
					//alert(index+" "+value+" "+type);
					document.getElementById(index).style.backgroundColor = "red";
				}
			});
		}
	</script>
</body>
<!-- END BODY -->
</html>
