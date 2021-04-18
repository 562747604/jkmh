package org.soft.erp.util.common;

import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.soft.erp.util.http.user.GetPeisUsers;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class HttpUtils {
	private static Logger logger = Logger.getLogger(HttpUtils.class);
	public static void main(String[] args) throws Exception {
		//		submitMessage();
	}






	/*
	 * 2.3.2报告临时授权/绑定用户家庭角色
	 * 
	 * HTTP/1.1 200 result：{"msg":"OK","code":200}
	 * 
	 * result====={"msg":"OK","code":200,"tmpAuthCode":
	 * "0b03134a-5ef9-48d7-8689-44b491fda7cf"}
	 */
	public static String getTmpAuthCode() throws Exception {
		class TmpAuthCode{
			private int code;
			private String msg;
			private String tmpAuthCode;
			public int getCode() {
				return code;
			}
			public void setCode(int code) {
				this.code = code;
			}
			public String getMsg() {
				return msg;
			}
			public void setMsg(String msg) {
				this.msg = msg;
			}
			public String getTmpAuthCode() {
				return tmpAuthCode;
			}
			public void setTmpAuthCode(String tmpAuthCode) {
				this.tmpAuthCode = tmpAuthCode;
			}

		}

		//		getReportVerifycode("","");
		/*********** http post ************/

		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/peisapi/v1/report/token?apikey=123456&"
				+ "uid=76938736-ec25-4711-81dd-a639d0362b95&token=f98611b0-b019-4281-b5b1-d8d71e0fd414";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);

			JSONObject jsonParam = new JSONObject();
			jsonParam.put("memberId", "1ed55737-ff76-42c4-820e-959f029defa6");
			jsonParam.put("mobile", "18600411131");
			jsonParam.put("realname", "王先生");
			jsonParam.put("roleId", "b96bccc4-b816-4a99-812e-21d592bc4d73");
			jsonParam.put("verifyCode", "123456");

			StringEntity entity = new StringEntity(jsonParam.toString(),
					"utf-8");// 解决中文乱码问题
			entity.setContentEncoding("UTF-8");
			entity.setContentType("application/json");
			httpPost.setEntity(entity);

			CloseableHttpResponse response2 = httpclient.execute(httpPost);
			try {
				HttpEntity entity2 = response2.getEntity();
				if (response2.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
					result = EntityUtils.toString(entity2);// 返回json格式
					//System.out.println("报告临时授权/绑定用户家庭角色接口=====" + result);
				}
				EntityUtils.consume(entity2);
			} finally {
				response2.close();
			}
		} finally {
			httpclient.close();
		}


		TmpAuthCode tmpAuthCode = JSON.parseObject(result,TmpAuthCode.class);

		return tmpAuthCode.getTmpAuthCode();
	}































	/*
	 * 获取资讯内容
	 */
	public static String getContent() throws Exception {

		/*********** http get ************/

		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/discoveryapi/v1/recommendation/150?apikey=123456&pageSize=4&pageIndex=1";
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpGet httpGet = new HttpGet(url);

			CloseableHttpResponse response1 = httpclient.execute(httpGet);
			try {
				HttpEntity entity = response1.getEntity();

				if (response1.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
					result = EntityUtils.toString(entity);// 返回json格式
				}
				EntityUtils.consume(entity);

			} finally {
				response1.close();
			}
		} finally {
			httpclient.close();
		}

		//		System.out.println("获取报告接口========" + result);
		return result;
	}

	/*
	 * 获取体检机构统计信息
	 * 
	 */
	public static String getCompanyStatsinfo() throws Exception {

		/*********** http get ************/
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/peisapi/v1/companys/company/"
				+ "21e0db9b-38c8-4f5a-9f0d-bcf5f6f55fc0/statsinfo?"
				+ "ageStartVal=0&ageEndVal=30&rank=10&"
				+ "dateStartVal=1356969600000&dateEndVal=1483200000000&apikey=34kjfddfadsfa";


		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpGet httpGet = new HttpGet(url);
			CloseableHttpResponse response1 = httpclient.execute(httpGet);
			try {
				HttpEntity entity = response1.getEntity();

				if (response1.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
					result = EntityUtils.toString(entity);// 返回json格式
				}
				EntityUtils.consume(entity);

			} finally {
				response1.close();
			}
		} finally {
			httpclient.close();
		}

		//System.out.println("获取体检机构统计信息========" + result);
		return result;
	}
	/*
	 * 提交消息推送接口
	 */
	public static int submitMessage(List<String> userIdList,int messageType,
			String bt,String content ) throws Exception {

		int status = 400;
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/messageapi/v1/4ef51f91-e68e-4e02-9e1c-fa2c808ce0f6/message?apikey=34kjfddfadsfa";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			List<Map<String, String>> li = new ArrayList<Map<String, String>>();

			class SmessageInfo {
				private List<String> userIdList;
				private int messageType;
				private ContentInfo content;
				public List<String> getUserIdList() {
					return userIdList;
				}
				public void setUserIdList(List<String> userIdList) {
					this.userIdList = userIdList;
				}
				public int getMessageType() {
					return messageType;
				}
				public void setMessageType(int messageType) {
					this.messageType = messageType;
				}
				public ContentInfo getContent() {
					return content;
				}
				public void setContent(ContentInfo content) {
					this.content = content;
				}
			}

			SmessageInfo smessage=new SmessageInfo();
			smessage.setUserIdList(userIdList);
			smessage.setMessageType(messageType);
			ContentInfo con=new ContentInfo();
			con.setPriority(1);
			con.setExpire(60);
			con.setTitle(bt);
			con.setMessage(content);
			smessage.setContent(con);


			String jsonEntity = JSONObject.toJSONString(smessage);

			StringEntity entity = new StringEntity(jsonEntity, "utf-8");// 解决中文乱码问题
			entity.setContentEncoding("UTF-8");
			entity.setContentType("application/json");
			httpPost.setEntity(entity);
			//System.out.println("json:"+jsonEntity);
			//
			CloseableHttpResponse response2 = httpclient.execute(httpPost);
			try {
				HttpEntity entity2 = response2.getEntity();
				if (response2.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
					status = HttpStatus.SC_OK;
				//	System.out.println("提交消息推送接口=====SC_OK" );
				}
				else
				{
					logger.error("提交消息推送接口失败！");
					logger.error("json:"+jsonEntity);
					logger.error("result:"+ EntityUtils.toString(entity2));
					status=100;
				}
				//result = EntityUtils.toString(entity2);// 返回json格式
				//System.out.println("提交消息推送接口=====" + result);
				EntityUtils.consume(entity2);
			} finally {
				response2.close();
			}
		} finally {
			httpclient.close();
		}
		return status;
	}


	public static int submitMessage() throws Exception {


		ContentInfo ci = new ContentInfo("您好",1,100,"您好，我正在测试！");



		class SmessageInfo {
			private List<String> userIdList;
			private int messageType;
			private String content;

			public List<String> getUserIdList() {
				return userIdList;
			}

			public void setUserIdList(List<String> userIdList) {
				this.userIdList = userIdList;
			}

			public int getMessageType() {
				return messageType;
			}

			public void setMessageType(int messageType) {
				this.messageType = messageType;
			}

			public String getContent() {
				return content;
			}

			public void setContent(String content) {
				this.content = content;
			}

		}

		List<String> userIdList = new ArrayList<String>();
		userIdList.add("2a83e45b-c768-45a1-93e5-e8ae5444208c");
		int messageType=3;
		SmessageInfo si = new SmessageInfo();
		si.setContent(JSON.toJSONString(ci));
		si.setMessageType(messageType);
		si.setUserIdList(userIdList);


		int status = 400;
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/messageapi/v1/message?apikey=34kjfddfadsfa";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			String jsonEntity = JSONObject.toJSONString(si);

			StringEntity entity = new StringEntity(jsonEntity, "utf-8");// 解决中文乱码问题
			entity.setContentEncoding("UTF-8");
			entity.setContentType("application/json");
			httpPost.setEntity(entity);
			//System.out.println("json:" + jsonEntity);
			//
			CloseableHttpResponse response2 = httpclient.execute(httpPost);
			try {
				HttpEntity entity2 = response2.getEntity();
				//System.out.println("status==="+response2.getStatusLine().getStatusCode());


				if (response2.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
					status = HttpStatus.SC_OK;
				//	System.out.println("提交消息推送接口=====SC_OK");
				} else {
					logger.error("提交消息推送接口失败！");
					logger.error("json:" + jsonEntity);
					logger.error("result:" + EntityUtils.toString(entity2));
					status = 100;
				}
				// result = EntityUtils.toString(entity2);// 返回json格式
				// System.out.println("提交消息推送接口=====" + result);
				EntityUtils.consume(entity2);
			} finally {
				response2.close();
			}
		} finally {
			httpclient.close();
		}
		return status;



	}

/*
	 * 邮件发送接口
	 */
	public static String sendmail(String uname,String mc,String nr,String email){

		String rt=""; 
		if (nr.equals("")|| email.equals(""))
		{
			logger.error("信息不完全，无法发送邮件！");
			return "信息不完全，无法发送邮件！";

		}
		try
		{
			String host="";
			String emailname="";
			String passwd="";


			SysProp s1=new SysProp();
			host= s1.getProperty("smtphost");
			emailname=s1.getProperty("email");
			passwd=s1.getProperty("passwd");

			Properties props = System.getProperties();
			props.setProperty("mail.smtp.host",host);
			props.put("mail.smtp.auth", "true");
			final String emailname1= emailname;
			final String passwd1=	passwd;	
			Session session = Session.getInstance( props, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication( emailname1, passwd1);
				}
			});

			MimeMessage  message1 = new MimeMessage(session);
			InternetAddress from = new InternetAddress(emailname);
			message1.setFrom(from);
			message1.setRecipient(RecipientType.TO, new InternetAddress(email));
			message1.setSubject(mc);
			message1.setContent(uname+" ，您好！</br>"+nr,"text/html;charset=utf-8");
			Transport.send(message1);
			rt="ok";

		}
		catch (AddressException e) {
			// TODO Auto-generated catch block
			logger.error(email+"邮件地址无效，发送邮件失败！");
			logger.error(e.getMessage());
			rt="邮件地址无效，发送邮件失败！";
			//e.printStackTrace();
		} catch (MessagingException e) {
			logger.error(email+"发送邮件失败！");
			logger.error(e.getMessage());
			rt="发送邮件失败！";
			//e.printStackTrace();
		}

		return  rt;
	}

	/*
	 * 消息发送
	 * jguid 机构ID	
	 */
	public static String sentMessge(String companyId,String type,String jsonContent,String userList) throws Exception {

		/*********** http get ************/
		String url = "";
		SysProp sys=new SysProp();
//		if(type.equals("2")){
//			//jsonContent="{\"messageType\":7,\"messageId\":null,\"notification\":{\"peisInfoId\":null,\"peopleId\":null,\"msg\":\""+companyName+"("+fname+"):"+jsonContent+"\"}}";
//			jsonContent="{\"messageType\":7,\"messageId\":null,\"notification\":{\"peisInfoId\":null,\"peopleId\":null,\"msg\":\""+jsonContent+"\"}}";
//			jsonContent=URLEncoder.encode(jsonContent.replace("\\", ""), "utf-8");
//			url = sys.getProperty("httphost")+"/userapi/v1/user/pushSelfMessage?companyId="+companyId+"&type="+type+"&jsonContent="+jsonContent+"&apikey=34kjfddfadsfa";
//		}else{
//			jsonContent=URLEncoder.encode(jsonContent, "utf-8");
//			url = sys.getProperty("httphost")+"/userapi/v1/user/pushSelfMessage?companyId="+companyId+"&type="+type+"&jsonContent="+jsonContent+"&apikey=34kjfddfadsfa";
//		}
		url = sys.getProperty("httphost")+"/userapi/v1/user/pushSelfMessage";
		jsonContent="{\"peopleIds\":["+userList+"],\"messageType\":7,\"msg\":\""+jsonContent+"\",\"type\":\""+type+"\",\"portal\":\""+companyId+"\"}";
		//String temp="{\"companyId\":\""+companyId+"\",\"users\":["+userList+"],\"type\":"+type+",\"jsonContent\":\"";
		//temp=temp.replace("\\", "").replace("null", "");
		//temp=temp+jsonContent+"\"}".replace("\\", "").replace("null", "");
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		
		try {
			HttpPost httpPost = new HttpPost(url);

			/*			JSONObject jsonParam = new JSONObject();
			jsonParam.put("portalId", companyId);
			jsonParam.put("itemId", itemid);
			jsonParam.put("days", days);
			jsonParam.put("ratioMin", min);
			jsonParam.put("ratioMax", max);*/
			StringEntity entity = new StringEntity(jsonContent,
					"utf-8");// 解决中文乱码问题
			entity.setContentEncoding("UTF-8");
			entity.setContentType("application/json");
			httpPost.setEntity(entity);

			CloseableHttpResponse response = httpclient.execute(httpPost);
			try {
				HttpEntity httpEntity = response.getEntity();
				int statusCode = response.getStatusLine().getStatusCode();
				//System.out.println("statusCode=====" + statusCode);
				if (statusCode == HttpStatus.SC_OK) {
					result = EntityUtils.toString(httpEntity);// 返回json格式		
					Configure configure = JSON.parseObject(result, Configure.class);
					result=configure.getCode();
				}else{
					result = "error";
				}
				EntityUtils.consume(httpEntity);
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
		return result;
	}
}



class ContentInfo {
	private String title;
	private int priority;
	private int expire;
	private String message;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getExpire() {
		return expire;
	}
	public void setExpire(int expire) {
		this.expire = expire;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}


	public ContentInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContentInfo(String title, int priority, int expire,
			String message) {
		super();
		this.title = title;
		this.priority = priority;
		this.expire = expire;
		this.message = message;
	}

}