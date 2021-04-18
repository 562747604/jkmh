package org.soft.erp.util.http.daily;

import java.util.List;
import java.util.Map;


/*
 * 每日情况-饮食接口
 * 
 */
public class HisData{
	private String plan;
	private List<His> list;
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public List<His> getList() {
		return list;
	}
	public void setList(List<His> list) {
		this.list = list;
	}
}