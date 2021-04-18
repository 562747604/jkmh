package org.soft.erp.util.http.daily;

import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.common.SysProp;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/*
 * 每日情况-饮食接口
 */
public class HttpDiet {

	public static void main(String[] args) throws Exception {

/*		String date = "2017-07-30";
		String peopleId = "2";
		String result = getDiet(date,peopleId);
		System.out.println("饮食 接口=====" + result);

		GetDiet getDiet = JSON.parseObject(result, GetDiet.class);
		DietData data = getDiet.getData();
		System.out.println("饮食 接口=====" + data.getBreakfast().getList().get(0).getAmount());*/

		String date = "2017-08-09";
		String peopleId = "05e3a870-4cac-4bd0-aa29-8adc4ae7e5bc";
		String result = getMrData(date,peopleId);
		//System.out.println("每日对比 接口=====" + result);

		GetMrData getDiet = JSON.parseObject(result, GetMrData.class);
		//MrData data = getDiet.getData();
		//System.out.println("每日对比 接口=====" + data.getName());
	}

	
	public static String getDiet(String date,String peopleId) throws Exception {
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/healthapi/v1/people/diet/portal/show?"
				+ "date="
				+ date
				+ "&peopleId="
				+ peopleId;

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpGet httpGet = new HttpGet(url);

			CloseableHttpResponse response = httpclient.execute(httpGet);
			try {
				HttpEntity httpEntity = response.getEntity();
				int statusCode = response.getStatusLine().getStatusCode();
				//System.out.println("statusCode=====" + statusCode);
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
	
	public static String getMrData(String date,String peopleId) throws Exception {
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/healthapi/v1/analyze/portal/"
				+ peopleId
				+ "/log?date="
				+ date;

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpGet httpGet = new HttpGet(url);

			CloseableHttpResponse response = httpclient.execute(httpGet);
			try {
				HttpEntity httpEntity = response.getEntity();
				int statusCode = response.getStatusLine().getStatusCode();
				//System.out.println("statusCode=====" + statusCode);
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
	public static String getZyzbData(String date,String peopleId) throws Exception {
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/healthapi/v1/analyze/index/items?apikey=123456";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpGet httpGet = new HttpGet(url);

			CloseableHttpResponse response = httpclient.execute(httpGet);
			try {
				HttpEntity httpEntity = response.getEntity();
				int statusCode = response.getStatusLine().getStatusCode();
				//System.out.println("statusCode=====" + statusCode);
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
	
	public static String getHisData(String startDate,String finishTime,String planId,String peopleId) throws Exception {
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/healthapi/v1/analyze/portal/"
				+ peopleId
				+ "/logs";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);

			JSONObject jsonParam = new JSONObject();
			jsonParam.put("startTime", startDate);
			jsonParam.put("finishTime", finishTime);
			jsonParam.put("planId", planId);
			StringEntity entity = new StringEntity(jsonParam.toString(),
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
	
	public static String getZyzbData(String startDate,String finishTime,String planId,String peopleId) throws Exception {
		SysProp sys=new SysProp();
		String url =sys.getProperty("httphost")+"/healthapi/v1/analyze/index/"
				+ peopleId
				+ "/logs";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpPost httpPost = new HttpPost(url);

			JSONObject jsonParam = new JSONObject();
			jsonParam.put("startTime", startDate);
			jsonParam.put("finishTime", finishTime);
			jsonParam.put("indexId", planId);
			StringEntity entity = new StringEntity(jsonParam.toString(),
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

