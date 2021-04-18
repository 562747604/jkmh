package org.soft.erp.domain.sys;

import java.io.Serializable;

/**   
 * @Description: 搜索显示字段  d_search_column
 * @author    :中庸陈
 * @version V1.0   
 */
public class SearchColumn implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String uid	;//用户ID
	private String tblname;//表名称
	private String field	;//字段名称
	private String jgid	;//字段名称
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTblname() {
		return tblname;
	}
	public void setTblname(String tblname) {
		this.tblname = tblname;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	
	

	
}
