package org.soft.erp.util.http.user;

import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.soft.erp.util.common.ErpConstants;
import org.soft.erp.util.common.SysProp;

import com.alibaba.fastjson.JSON;

public class HttpCompany {
	private static Logger logger = Logger.getLogger(HttpCompany.class);
	public static void main(String[] args) throws Exception {

		getCompany();

	}


	/*
	 * 获取体检机构列表接口
	 * 方式：GET
	 * @param 
	 */
	public static List<Company> getCompany() throws Exception {
		
		class GetResponse {
			private String msg;
			private String code;
			private List<Company> companys;
			public String getMsg() {
				return msg;
			}
			public void setMsg(String msg) {
				this.msg = msg;
			}
			public String getCode() {
				return code;
			}
			public void setCode(String code) {
				this.code = code;
			}
			public List<Company> getCompanys() {
				return companys;
			}
			public void setCompanys(List<Company> companys) {
				this.companys = companys;
			}

		}
		
		SysProp sys=new SysProp();
		
		/*********** http get ************/

		String url = sys.getProperty("httphost")+"/peisapi/v1/companys/11?apikey=12312";

		CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			HttpGet httpGet = new HttpGet(url);

			CloseableHttpResponse response = httpclient.execute(httpGet);
			try {
				HttpEntity httpEntity = response.getEntity();

				int statusCode = response.getStatusLine().getStatusCode();
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

		// System.out.println(result);
		 GetResponse getResponse = JSON.parseObject(result, GetResponse.class);

		return getResponse.getCompanys();
	}


	
}


