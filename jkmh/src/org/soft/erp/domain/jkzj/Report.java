package org.soft.erp.domain.jkzj;

import java.util.List;

public class Report {
	
	private int code	;
	private String msg	;
	
	private List<CheckDatas> checkDatas	;
	private HealthDatas healthDatas	;
	private List<GuideDatas> guideDatas	;
	
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
	public List<CheckDatas> getCheckDatas() {
		return checkDatas;
	}
	public void setCheckDatas(List<CheckDatas> checkDatas) {
		this.checkDatas = checkDatas;
	}
	public HealthDatas getHealthDatas() {
		return healthDatas;
	}
	public void setHealthDatas(HealthDatas healthDatas) {
		this.healthDatas = healthDatas;
	}
	public List<GuideDatas> getGuideDatas() {
		return guideDatas;
	}
	public void setGuideDatas(List<GuideDatas> guideDatas) {
		this.guideDatas = guideDatas;
	}


	
	
}
