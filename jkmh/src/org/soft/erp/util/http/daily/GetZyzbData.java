package org.soft.erp.util.http.daily;

import java.util.List;

/*
 * 每日情况-饮食接口
 * 
 */
public class GetZyzbData{
	private int code;//返回码
	private String msg;//返回消息
	private List<ZyzbData> data;//内容
	
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
	public List<ZyzbData> getData() {
		return data;
	}
	public void setData(List<ZyzbData> data) {
		this.data = data;
	}



}
