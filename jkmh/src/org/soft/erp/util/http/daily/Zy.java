package org.soft.erp.util.http.daily;

import java.util.Date;
import java.util.List;
import java.util.Map;


/*
 * 每日情况-饮食接口
 * 
 */
public class Zy{
	private String indexId;
	private String name;
	private String unit;
	private String value;
	public String getIndexId() {
		return indexId;
	}
	public void setIndexId(String indexId) {
		this.indexId = indexId;
	}
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
}