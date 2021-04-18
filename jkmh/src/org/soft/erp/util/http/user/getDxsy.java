package org.soft.erp.util.http.user;

import java.util.List;

public class getDxsy {
	private String msg;
	private int code;
	private DxInfo data;
	public DxInfo getData() {
		return data;
	}
	public void setData(DxInfo data) {
		this.data = data;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
}
