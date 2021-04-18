package org.soft.erp.util.http.goal;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.common.SysProp;

import com.alibaba.fastjson.JSON;

/*
 * 促进目标接口,获取系统推荐的慢病指标
 */
public class HttpGoal {

	public static void main(String[] args) throws Exception {

		String peisInfoId = "d032a25f-b2b2-470f-9f73-09de13ebbf7d";
		String result = getPromotionGoal(peisInfoId);
		//System.out.println("促进目标-获取系统推荐的慢病指标=====" + result);


//		updatePromotionGoal("","");

	}

	
	public static String getPromotionGoal(String currentPeisInfoId) throws Exception {

		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/peisapi/v1/health/"
				+ currentPeisInfoId
				+ "/plan/indexs?apikey=ieie";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);

			CloseableHttpResponse response = httpclient.execute(httpPost);
			try {
				HttpEntity httpEntity = response.getEntity();
				int statusCode = response.getStatusLine().getStatusCode();
				if (statusCode == HttpStatus.SC_OK) {
					result = EntityUtils.toString(httpEntity);// 返回json格式
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

	

	/*
	 * 促进目标更新
	 * 方法 POST
	 */
	public static String updatePromotionGoal(String id,String value) throws Exception {

		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/peisapi/v1/health/plan/indexs?apikey=ldfls&"
				+ "id="+id+"&value="+value;

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			CloseableHttpResponse response = httpclient.execute(httpPost);
			try {
				HttpEntity httpEntity = response.getEntity();
				//System.out.println("促进目标中医生指导更新=====" + response.getStatusLine().getStatusCode());

				int statusCode = response.getStatusLine().getStatusCode();
				if (statusCode == HttpStatus.SC_OK) {
					result = EntityUtils.toString(httpEntity);// 返回json格式
				//	System.out.println("促进目标中医生指导更新=====" + result);
				}
				EntityUtils.consume(httpEntity);
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
				
		return "";
	}

	
//	
//	
//	
//	
	public static Goal getGoal(String currentPeisInfoId) throws Exception{
		
		String xx = getPromotionGoal(currentPeisInfoId);
		Goal goal = JSON.parseObject(xx, Goal.class);
	//	System.out.println("促进目标=="+goal);
		return goal;
	}
	
//	
//	public static List<Weight> getWeight() throws Exception{
//		String data = getData();
//		System.out.println("体重管理指标=====" + getData());
//		Data dataStr = JSON.parseObject(data, Data.class);
//		List<Weight> list=  dataStr.getWeight();
//		return list;
//	}
//	
//	public static List<Diseases> getDiseases() throws Exception{
//		String data = getData();
////		System.out.println("慢病管理指标=====" + getData());
//		Data dataStr = JSON.parseObject(data, Data.class);
//		List<Diseases> list=  dataStr.getDiseases();
//		return list;
//	}
//	
}

