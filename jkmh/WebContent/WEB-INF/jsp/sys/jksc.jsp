<%@ page
	language="java"
	import="java.util.*"
	pageEncoding="utf-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>

<body
	onload="load()"
	background-color="#27bcc2"
>
	<form action="">
		<table
			width="100%"
			cellpadding="0"
			cellspacing="0"
			style="line-height:30px;margin-top:0px; "
		>
			<tr>
				<td
					style="text-align:center; vertical-align:top;
						border:30px #27bac1 solid;"
				>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="fm"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:65%;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: right;height: 30px;line-height: 30px;"><u><label
												style="font-weight: bold;"
											>编号:</label> <span id="a_bh">${rotate.ryfp.tjh }</span></u></td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 400px;line-height: 30px;"
										><span style="font-size:30px; font-weight: bold;">健康评估报告</span></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 30px;line-height: 30px;">
											<table 
												style="width: 400px;margin: 0px auto;border:none;"
												border="1"  
											>
												<tr>
													<td
														style="height:50px;width:100px; text-align: center;border:none;"
													><label style="font-size:20px; font-weight: bold;">姓&nbsp;&nbsp;&nbsp;&nbsp;名</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;border-bottom: 1px silver solid ; "
													>${rotate.ryfp.realname }</td>
												</tr>
												<tr>
													<td
														style="height:50px;width:100px; text-align: center;border:none;padding-top: 30px;"
													><label style="font-size:20px; font-weight: bold;">性&nbsp;&nbsp;&nbsp;&nbsp;别</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;border-bottom: 1px silver solid ;"
													>${rotate.ryfp.xb }</td>
												</tr>
												<tr>
													<td
														style="height:50px;width:100px; text-align: center;border:none;padding-top: 30px;"
													><label style="font-size:20px; font-weight: bold;">身份证号</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;border-bottom: 1px silver solid ;"
													>${rotate.ryfp.sfzh }</td>
												</tr>
												<tr>
													<td
														style="height:50px;width:100px; text-align: center;border:none;padding-top: 30px;"
													><label style="font-size:20px; font-weight: bold;">联系方式</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;border-bottom: 1px silver solid ;"
													>${rotate.ryfp.mobile }</td>
												</tr>
												<tr>
													<td
														style="height:50px;width:100px; text-align: center;border:none;padding-top: 30px;"
													><label style="font-size:20px; font-weight: bold;">体检日期</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;border-bottom: 1px silver solid ;"
													>${rotate.ryfp.fCreatedTime }</td>
												</tr>
												<tr>
													<td
														style="height:50px;width:100px; text-align: center;border:none;padding-top: 30px;"
													><label style="font-size:20px; font-weight: bold;">工作单位</label></td>
													<td
														style="font-size:20px; border-top:none;border-left:none;border-right:none;border-bottom: 1px silver solid ;"
													>${rotate.ryfp.dw }</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="qy"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:65%;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 100px;"
										><span style="font-size:30px; font-weight: bold;">前 言</span></td>
									</tr>
									<tr>
										<td style="text-align: left;line-height: 40px;font-size: 16px;"><span style="margin-left:40px;">亲爱的朋友，欢迎您来到</span><u style="padding: 0px 20px;">&nbsp;&nbsp;&nbsp;&nbsp;${organ.companyName }&nbsp;&nbsp;&nbsp;&nbsp;</u><span>健康管理中心，我们由衷的为您献上最真诚的感恩与祝福，并为您提供您所需要的健康照护和服务。
												</br>
												<span style="margin-left:40px;">这本健康手册为您提供了健康照护和服务的相关内容：</span></br>
												<span style="margin-left:80px;">1.为您提供了您选择的健康体检项目检查结果，
												并协助您进行生活习惯及健康状况评估，使您能够获得健康风险因子的资讯。</span></br>
												<span style="margin-left:80px;">2.为您提供了健康体检记录表，协助您记录自己的健康状况，以便帮助您能够幸福、平安、快乐的度过自己的一生。</span></br>
												<span style="margin-left:80px;">3.为您提供了您应该知道的相关健康保健讯息，帮助您更好的适应因年龄的变化、家庭的变化以及生活环境的变化对身心的影响。</span></br>
												<span style="margin-left:80px;">4.
												这份体检报告收集了您选择的健康体检项目和流行病学调查的部分相关数据，它仅反映了您目前的身体状况和部分生活方式，仅供参考。</span></br>
												<span style="margin-left:40px;">如有不解的问题，请选择健康咨询。</br>
												<span style="margin-left:40px;">请您仔细阅读，以便帮助您了解人在其一生中如何关怀自己的生命，照顾好自己的健康，选择积极的生活态度。</span></br>
												<span style="margin-left:40px;">当您接受这本健康手册的同时，您就接受了对健康生活的追求，踏入了健康生存的旅程。</span>
										</span></td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 30px;"
										>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="ml"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:65%;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">目录</span></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#fm"
										>1:封面..................................................................................1</a></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#qy"
										>2:前言..................................................................................2</a></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#ml"
										>3:目录..................................................................................3</a></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#jl"
										>4:健康体检评估与结论..........................................................4</a></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#zb"
										>5:重要指标...........................................................................5</a></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#mx"
										>6:慢病风险评估.....................................................................6</a></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#zd"
										>7:指导方案...........................................................................7</a></td>
									</tr>
									<tr>
										<td style="text-align: center;height: 80px;line-height: 80px;"><a
											style="font-size:20px;color:black; "
											href="#js"
										>8:寄语...................................................................................8</a></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="jl"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:70%;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">健康体检评估与结论</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;">
											<table
												style="width:90%;border:1px silver solid;margin:20px auto;font-size: 16px;"
											>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:120px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: center;"
													><span>健康级别</span></td>
													<td style="border-bottom:1px silver solid;text-align: center;">${healthAssess.healthLevel }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: center;"
													><span>健康状态</span></td>
													<td style="border-bottom:1px silver solid;text-align: center;">${healthAssess.healthState }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: center;"
													><span>疾病易感性</span></td>
													<td style="border-bottom:1px silver solid;text-align: center;">${healthAssess.illnessDesc }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: center;"
													><span>体检结论</span></td>
													<td style="border-bottom:1px silver solid;text-align: left;">${healthAssess.examConclusion }</td>
												</tr>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:150px;border-bottom:1px silver solid;border-right:1px silver solid;text-align: center;"
													><span>流行病学调查</span></td>
													<td style="border-bottom:1px silver solid;text-align: left;">
														<!-- 流行病学调查 --> <c:forEach
															var="epidemicSurvey"
															items="${epidemicSurvey}"
															varStatus="status"
														>   
<span style="margin-left:20px;">${epidemicSurvey.name}:${epidemicSurvey.value}	</span></br>											
</c:forEach>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="zb"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:70%;margin: 10px auto; font-size:20px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">重要指标</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 60px;word-wrap:break-word;word-wrap:break-all;">
											<table
												style="width:90%;border:1px silver solid;margin:20px auto;font-size: 16px;text-align: center;word-wrap:break-word;word-wrap:break-all;"
											>
												<tr style="height:40px;line-height:40px;">
													<td
														style="width:15%;border-bottom:1px silver solid;border-right:1px silver solid;"
													>名称</td>
													<td
														style="width:40%;border-bottom:1px silver solid;border-right:1px silver solid;"
													>描述</td>
													<td
														style="width:15%;border-bottom:1px silver solid;border-right:1px silver solid;"
													>范围</td>
													<td
														style="width:20%;border-bottom:1px silver solid;border-right:1px silver solid;word-wrap:break-word;word-wrap:break-all;"
													>结果列表</td>
												</tr>
												<c:forEach
													var="indexs"
													items="${indexs}"
													varStatus="status"
												>
													<tr style="height:40px;line-height:40px;">
														<td
															style="border-bottom:1px silver solid;border-right:1px silver solid;"
														>${indexs.name }</td>
														<td
															style="border-bottom:1px silver solid;border-right:1px silver solid;text-align: left;"
														>${indexs.desc }</td>
														<td
															style="border-bottom:1px silver solid;border-right:1px silver solid;"
														>${indexs.range }</td>
														<td
															style="border-bottom:1px silver solid;border-right:1px silver solid;word-wrap:break-word;word-wrap:break-all;"
														><c:forEach var="value" items="${indexs.values}">   
		单位：${value.unit }<br/>
		值：${value.value }<br/>
		时间：${value.year }
</c:forEach></td>
													</tr>
												</c:forEach>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="mx"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:70%;margin: 10px auto; font-size:16px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">慢病风险评估</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 80px;line-height: 80px;">
											<c:forEach
												var="diseases"
												items="${diseases}"
												varStatus="status"
											>
												<table
													style="border:1px silver solid;width:90%;margin-left:auto;margin-right:auto;background-color:white;margin-top:20px;"
												>
													<tr style="height:25px;line-height:25px;">
														<td
															style="width:800px;border-bottom:1px silver solid;height:25px;line-height:25px;text-align:left;"
														><span
															style="font-size:20px; font-weight:bolder;margin-left:10px;"
														> ${diseases.name } </span></td>
														<td style="border-bottom:1px silver solid;">&nbsp;</td>
														<td style="width:50px;border-bottom:1px silver solid;"><a
															href="#.html"
															onclick="s_show('grs${diseases.indexs}')"
														><img
																src="${ctx}/images/jkpgyw/u31.png"
																style="height:20px;"
															></a></td>
													</tr>
													<tr
														id="grs${diseases.indexs}"
														style="display:table-row;min-height:350px; vertical-align:top;"
													>
														<td colspan="3">
															<table
																id="div111"
																style="width:80%;margin-left:auto;margin-right:auto;margin-top:30px;"
															> <tr style="height:26px;line-height:26px;">
														<td style="text-align:left;"colspan="4" ><span
												style="padding-left:10px;"
											>  评级：${diseases.evalGrade } </span> <br><span
												style=" padding-left:10px;"
											>建议：${diseases.suggest }   </span> </td>
														</tr>
																<tr style="height:30px;line-height:30px;">
																	<td
																		style="text-align:center;border:1px silver solid;"
																	>指标因素</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>本次检查</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>上一次检查</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>上二次检查</td>
																	<td
																		style="text-align:center;border:1px silver solid;border-left:none;width:100px;"
																	>理性目标</td>
																</tr>
																<c:forEach
																	var="diseases_indexs"
																	items="${diseases.indexs}"
																>
																	<tr style="height:30px;line-height:30px;">
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;"
																		>${diseases_indexs.name }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		>${diseases_indexs.value }</td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		><c:forEach
																				var="historys"
																				items="${diseases_indexs.historys}"
																			>   
								<c:if test="${historys.order==0}">
								${historys.value }
								</c:if> <br />
																			</c:forEach></td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		><c:forEach
																				var="historys"
																				items="${diseases_indexs.historys}"
																			>   
								<c:if test="${historys.order==1}">
								${historys.value }
								</c:if> <br />
																			</c:forEach></td>
																		<td
																			style="text-align:center;border:1px silver solid;border-top:none;border-left:none;"
																		></td>
																	</tr>
																</c:forEach>
															</table>
															<table
																id="div11"
																style="width:100%;"
															>
																<tr style="height:40px;line-height:40px;">
																	<td style="text-align:center;"><span>
																			根据您提供的相关信息及临床检查的结果，我们评估您糖尿病的易感性为_</span><span
																		style="color:red;"
																	><c:if test="${diseases.evalGrade==1}">
	        	低风险
	        </c:if> <c:if test="${diseases.evalGrade==2}">
	        	中风险
	        </c:if> <c:if test="${diseases.evalGrade==3}">
	        	高风险
	        </c:if></span></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</c:forEach>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="zd"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:70%;margin: 10px auto; font-size:16px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height:100px;"
										><span style="font-size:30px; font-weight: bold;">指导方案</span></td>
									</tr>
									<tr>
										<td style="text-align: left;height: 40px;line-height: 40px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${assessReport.guide.content}</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					<table style="width:100%;text-align:center;margin: 0px auto;">
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							><a
								name="js"
								href=""
							></a></td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/middle.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:1060px;"
							>
								<table style="width:70%;margin: 10px auto; font-size:16px; ">
									<tr>
										<td style="text-align: center;height: 50px;line-height: 30px;">&nbsp;</td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 100px;"
										><span style="font-size:30px; font-weight: bold;">寄语——我和你</span></td>
									</tr>
									<tr>
										<td style="text-align: left;line-height: 40px;"><span><span style="margin-left:40px;">亲爱的朋友：</span></br>
												<span style="margin-left:40px;">我们的眼睛和耳朵，是为了认识您，倾听您；</span></br>
												<span style="margin-left:40px;">我们的脚，是为了走进您；</span></br>
												<span style="margin-left:40px;">我们的手，是为了帮助您，牵引您；</span></br>
												<span style="margin-left:40px;">我们的脑子，是为了造福您；</span></br>
												<span style="margin-left:40px;">我们的心，是为了体贴您关爱您。</span></br>
												<span style="margin-left:40px;">说真的，若没有您，我们还能成为我们吗？</span></br>
												<span style="margin-left:40px;">祝您在人生的旅途中一路平安！健康长寿！</span></br>
												</br>
												<span style="margin-left:40px;">健康是一种意识，也是一种习惯，更是一种自然状态。</span></br>
												<span style="margin-left:40px;">健康是一种顺应，也是一种和谐，更是一种合一状态。</span></br>
											<span style="float: right;margin-right:40px;">丁丁云康健康工作室</span></br>
												</br>
												 <span style="margin-left:40px;">人的一生中最重要的事情——就是能够认识到健康是一个人最重要的事情，并努力去照
												顾好自己的身体。</span></br>
												 <span style="float: right;margin-right:40px;">亚当
												. 杰克森</span></br>
												<span style="margin-left:40px;">每个人不仅有治疗自己的能力，更能够创造源源不断的健康。现在你需要做的是，了解自然的法则，并且坚持你将为自己的身体状况负责的信念。没有其他人可以为你的健康负责，包括医生、父母、老师、心理医生等。当你接受这种责任的时候，就是你开始战胜疾病的时刻，也是你开始创造出源源不断的健康的时刻。</br>
												健康就是精力、力量，是生活的趣味，生命的喜悦。
										</span></br> <span style="float: right;margin-right:40px;">亚当
												. 杰克森</span></br></td>
									</tr>
									<tr>
										<td
											style="text-align: center;height: 100px;line-height: 30px;"
										>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td
								style="border:none; vertical-align:top;background-image: url('${ctx}/images/top.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;height:153px;"
							>&nbsp;</td>
						</tr>
					</table>
					</td>
					</tr>
					</table>
					</form> 
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
div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, menu, nav, output, ruby, section, summary, time, mark, audio, video, input
	{
	font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif!important;	
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
	padding: 0px 15px;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd
}
</style>
					<script src="${ctx}/jiankang/js/jquery.min.js?v=2.1.4"></script><script src="${ctx}/jiankang/js/sweetalert.min.js"></script> <script
						src="${ctx}/jiankang/js/public.js"
					></script> <script type="text/javascript">
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
					</script>
</body>
</html>
