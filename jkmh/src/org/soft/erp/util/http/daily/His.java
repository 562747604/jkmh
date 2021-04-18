package org.soft.erp.util.http.daily;

import java.util.Date;
import java.util.List;
import java.util.Map;


/*
 * 每日情况-饮食接口
 * 
 */
public class His{
	private String id;
	private Date createdTime;
	private String value;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}