package org.soft.erp.util.http.daily;

import java.util.Map;


/*
 * 每日情况-饮食接口
 * 
 */
public class MrData{
	private int planId;
	private String name;
	private String unit;
	private String plan;
	private String reality;
	private String warn;
	private String bl;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public String getReality() {
		return reality;
	}
	public void setReality(String reality) {
		this.reality = reality;
	}
	public String getWarn() {
		return warn;
	}
	public void setWarn(String warn) {
		this.warn = warn;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public String getBl() {
		return bl;
	}
	public void setBl(String bl) {
		this.bl = bl;
	}
	

}