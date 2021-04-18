package org.soft.erp.util.common;

import java.io.File;
import javax.net.ssl.SSLContext;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;

public class SSLClient {

	public static CloseableHttpClient getSSLClient() throws Exception {
		// Trust own CA and all self-signed certs
		SSLContext sslcontext = SSLContexts.custom()
				.loadTrustMaterial(new File("my.keystore"), "nopassword".toCharArray(), new TrustSelfSignedStrategy())
				.build();
		// Allow TLSv1 protocol only
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[] { "TLSv1" }, null,
				SSLConnectionSocketFactory.getDefaultHostnameVerifier());
		CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();

		return httpclient;
	}

	public final static void main(String[] args) throws Exception {
		CloseableHttpClient httpclient = SSLClient.getSSLClient();
		try {

			HttpGet httpget = new HttpGet("https://httpbin.org/");

			System.out.println("Executing request " + httpget.getRequestLine());

			CloseableHttpResponse response = httpclient.execute(httpget);
			try {
				HttpEntity entity = response.getEntity();

				System.out.println("----------------------------------------");
				System.out.println(response.getStatusLine());
				EntityUtils.consume(entity);
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
	}
}

// public class SSLClient {
//
// public final static void main(String[] args) throws Exception {
// // Trust own CA and all self-signed certs
// SSLContext sslcontext = SSLContexts.custom()
// .loadTrustMaterial(new File("my.keystore"), "nopassword".toCharArray(),
// new TrustSelfSignedStrategy())
// .build();
// // Allow TLSv1 protocol only
// SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
// sslcontext,
// new String[] { "TLSv1" },
// null,
// SSLConnectionSocketFactory.getDefaultHostnameVerifier());
// CloseableHttpClient httpclient = HttpClients.custom()
// .setSSLSocketFactory(sslsf)
// .build();
// try {
//
// HttpGet httpget = new HttpGet("https://httpbin.org/");
//
// System.out.println("Executing request " + httpget.getRequestLine());
//
// CloseableHttpResponse response = httpclient.execute(httpget);
// try {
// HttpEntity entity = response.getEntity();
//
// System.out.println("----------------------------------------");
// System.out.println(response.getStatusLine());
// EntityUtils.consume(entity);
// } finally {
// response.close();
// }
// } finally {
// httpclient.close();
// }
// }
//
// }
