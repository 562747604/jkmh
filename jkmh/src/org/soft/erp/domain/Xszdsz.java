package org.soft.erp.domain;

import java.io.Serializable;
import java.util.Date;

/**   
 * @Description: 
 * <br>网站：
 * @author    
 * @version V1.0   
 */
public class Xszdsz implements Serializable {

	private Integer id;			// id
	private String uid;	// 用户名
	private String tblname;	// 登录名
	private Integer xh;		// 状态
	private String field;	// 建档日期
	
	// 无参数构造器
	public Xszdsz() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getTblname() {
		return tblname;
	}


	public void setTblname(String tblname) {
		this.tblname = tblname;
	}


	public Integer getXh() {
		return xh;
	}


	public void setXh(Integer xh) {
		this.xh = xh;
	}


	public String getField() {
		return field;
	}


	public void setField(String field) {
		this.field = field;
	}


	public Xszdsz(Integer id, String uid, String tblname, Integer xh,
			String field) {
		super();
		this.id = id;
		this.uid = uid;
		this.tblname = tblname;
		this.xh = xh;
		this.field = field;
	}
	
}
