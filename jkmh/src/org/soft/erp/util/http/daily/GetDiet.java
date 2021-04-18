package org.soft.erp.util.http.daily;


/*
 * 每日情况-饮食接口
 * 
 */
public class GetDiet{
	private int code;//返回码
	private String msg;//返回消息
	private DietData data;//内容
	
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
	public DietData getData() {
		return data;
	}
	public void setData(DietData data) {
		this.data = data;
	}


}
