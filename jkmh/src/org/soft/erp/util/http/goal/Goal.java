package org.soft.erp.util.http.goal;


/*
 * 促进目标
 * 
	code	返回码	Int
	msg	返回消息	String
	data	指标内容	JsonObject

 */
public class Goal{
	private int code;//返回码
	private String msg;//返回消息
	private Data data;//指标内容
	
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
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}



}