package org.soft.erp.util.common;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.util.IOUtils;

class Configure{
	private String msg;
	private String code;
	
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
}

public class JSONUtil {

	public static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	public static String readJsonFromFile(String path) throws IOException{
		BufferedReader br  = null;
		try {
			br=new BufferedReader(new InputStreamReader(new FileInputStream(path),"UTF-8"));
			String jsonText = readAll(br);
			return jsonText;
		} finally {
			IOUtils.close(br);
		}
	}

	
	public static Configure getConfigure() throws Exception {
		String data= readJsonFromFile("D:/ecworkspace/jiankangmenhu/java/org/soft/erp/util/common/configure.json");
//		System.out.println(data);
		
		Configure configure = JSON.parseObject(data, Configure.class);
		return configure;

	}
	
	
	public static void main(String[] args) throws Exception {
		String data= readJsonFromFile("D:/ecworkspace/jiankangmenhu/java/org/soft/erp/util/common/configure.json");
		//System.out.println(data);
		
		
		String code = JSONUtil.getConfigure().getCode();
		
		//System.out.println(code);

	}
	
}

