package org.soft.erp.util.http.daily;

import java.util.Date;
import java.util.List;
import java.util.Map;


/*
 * 每日情况-饮食接口
 * 
 */
public class ZyData{
	private String id;
	private Date createdTime;
	private List<Zy> indexs;
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
	public List<Zy> getIndexs() {
		return indexs;
	}
	public void setIndexs(List<Zy> indexs) {
		this.indexs = indexs;
	}

}