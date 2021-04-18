package org.soft.erp.util.http.cjmb;

import java.util.List;

public class GetCjmb {
	private int code;
	private String msg;
	List<Cjmb> data;
	
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
	public List<Cjmb> getData() {
		return data;
	}
	public void setData(List<Cjmb> data) {
		this.data = data;
	}

}
