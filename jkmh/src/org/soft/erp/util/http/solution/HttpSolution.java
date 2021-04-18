package org.soft.erp.util.http.solution;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.common.SysProp;

/*
 * 获取用户的促进方案接口
 */
public class HttpSolution {

	public static void main(String[] args) throws Exception {

		String peopleId = "08694a6b-3229-4639-9b44-ff08823e517f";
		String peisInfoId = "2ab2352e-b1d6-4df6-878c-c89adc64a0f9";

		String result = getHealthSolution("","");
		//System.out.println("用户健康促进方案=====" + result);

	}
	
	/*
	 * 取得用户促进方案
	 * 方式：POST
	 * @param peopleId		用户Id						String
	 * @param peisInfoId	与用户健康促进报告对应的体检报告Id	String
	 */
	
	public static String getHealthSolution(String peopleId,String peisInfoId) throws Exception {

		//System.out.println("peopleId=="+peopleId);
		//System.out.println("peisInfoId=="+peisInfoId);
		
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/peisapi/v1/health/"
				+ peopleId
				+ "/"
				+ peisInfoId
				+ "/plan/info?apikey=ldlkd";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			CloseableHttpResponse response = httpclient.execute(httpPost);
			try {
				HttpEntity httpEntity = response.getEntity();
				int statusCode = response.getStatusLine().getStatusCode();
				//System.out.println("statusCode=="+statusCode);

				if (statusCode == HttpStatus.SC_OK) {
					result = EntityUtils.toString(httpEntity);// 返回json格式
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
	
//	
//	public static void getHealthSolution(String result) throws Exception{
//		
//		String xx = getPromotionSolution();
//		HealthSolution healthSolution = JSON.parseObject(xx, HealthSolution.class);
//		String data = healthSolution.getData();
////		System.out.println("获取用户促进方案=====" + data);
//		Data dataStr = JSON.parseObject(data, Data.class);
////
//		
//		String dietSolution=  dataStr.getDietSolution();
//		System.out.println("dietSolution=====" + dietSolution);
//		DietSolution dietStr = JSON.parseObject(dietSolution, DietSolution.class);
//		System.out.println("getDiet=====" + dietStr.getDiet());
//
//		Diet diet = JSON.parseObject(dietStr.getDiet(), Diet.class);
//
//
//		System.out.println("dataStr.getBreakfast()=====" + diet.getBreakfast());
//		
//		
//		Breakfast breakfast = JSON.parseObject(diet.getBreakfast(), Breakfast.class);
//		System.out.println("breakfast=====" + breakfast.getCal());
//
//	}
//	
//	


}

