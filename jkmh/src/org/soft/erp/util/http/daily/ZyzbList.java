package org.soft.erp.util.http.daily;

import java.util.Date;
import java.util.List;
import java.util.Map;


/*
 * 每日情况-饮食接口
 * 
 */
public class ZyzbList{
	private List<ZyData> list;
	private int lineCount;
	public List<ZyData> getList() {
		return list;
	}

	public void setList(List<ZyData> list) {
		this.list = list;
	}

	public int getLineCount() {
		return lineCount;
	}

	public void setLineCount(int lineCount) {
		this.lineCount = lineCount;
	}

}