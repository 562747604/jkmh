package org.soft.erp.domain.jkzj;

import java.util.List;

public class StatsInfo {

	private String code	;
	private String msg	;
	private List<StatInfo> statInfo;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<StatInfo> getStatInfo() {
		return statInfo;
	}
	public void setStatInfo(List<StatInfo> statInfo) {
		this.statInfo = statInfo;
	}

	
	
}
