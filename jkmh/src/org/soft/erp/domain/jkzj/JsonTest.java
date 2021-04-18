package org.soft.erp.domain.jkzj;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.soft.erp.util.common.HttpUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.util.IOUtils;

public class JsonTest {

	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	public static String readJsonFromUrl(String url) throws IOException,
			JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is,
					Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			return jsonText;

		} finally {
			is.close();
		}
	}

	public static String readJsonFromFile(String path) throws IOException {
		BufferedReader rd = null;
		try {
			rd = new BufferedReader(new FileReader(path));
			String jsonText = readAll(rd);
			return jsonText;
		} finally {
			// rd.close();
			IOUtils.close(rd);
		}
	}

	public static List getGuideDatas(String uid) throws Exception {
		
		List<Content> listContent = null;
		String data = JsonTest
				.readJsonFromFile("D:/ecworkspace/jiankangmenhu/java/org/soft/erp/domain/jkzj/report.json");
		Report report = JSON.parseObject(data, Report.class);
		String strGuideDatas = report.getGuideDatas().toString();
		List<GuideDatas> listGuideDatas = (List<GuideDatas>) JSON.parseObject(strGuideDatas, ArrayList.class);
		// System.out.println(listGuideDatas);

		for (int i = 0; i < listGuideDatas.size(); i++) {
			String gdStr = listGuideDatas.get(i) + "";
			 //System.out.println(gdStr);
			GuideDatas gt = JSON.parseObject(gdStr, GuideDatas.class);
			//System.out.println(gt.getName());
			listContent = (List<Content>) JSON.parseObject(gt.getContent(), ArrayList.class);
		}

		return listContent;
	}

	
	
	public static void main(String[] args) throws Exception {

	}
	
	
	
	


}
