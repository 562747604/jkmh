package org.soft.erp.util.http.user;

import java.util.List;

public class GetFwUsers {
	private int code;
	private String msg;
	List<FwUsers> data;
	
	public List<FwUsers> getData() {
		return data;
	}
	public void setData(List<FwUsers> data) {
		this.data = data;
	}
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




	

}
