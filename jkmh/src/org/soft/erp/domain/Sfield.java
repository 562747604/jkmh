package org.soft.erp.domain;

import java.io.Serializable;
import java.util.Date;

/**   
 * @Description: 
 * <br>网站：
 * @author    
 * @version V1.0   
 */
public class Sfield implements Serializable {

	private Integer id;			// id
	private String tblname;	// 用户名
	private String chtblname;	// 登录名
	private String enname;	// 密码
	private String chname;	// 用户名
	
	private String xsname;	// 密码
	private String ftype;	// 用户名
	private String autoup;	// 登录名
	private int flength;	// 密码
		
	private int fpoint;	// 密码
	private String isnull;	// 用户名
	private int issys;	// 登录名
	private String sm;	// 密码
	
	private int kjtype;	// 密码
	private String dytblname;	// 用户名
	private String dyfield;	// 登录名
	private String dyvalue;	// 密码
	private String isgroup;	// 密码
	private int fieldWidth;	// 密码
	private int px;	// 密码
	private String hasTbl;	// 密码
	private String searchStatus;//当前是否选中

	// 无参数构造器
	public Sfield() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getfieldWidth() {
		return fieldWidth;
	}

	public void setfieldWidth(Integer fieldWidth) {
		this.fieldWidth = fieldWidth;
	}
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

	public String getChtblname() {
		return chtblname;
	}

	public void setChtblname(String chtblname) {
		this.chtblname = chtblname;
	}

	public String getEnname() {
		return enname;
	}

	public void setEnname(String enname) {
		this.enname = enname;
	}

	public String getChname() {
		return chname;
	}

	public void setChname(String chname) {
		this.chname = chname;
	}

	public String getXsname() {
		return xsname;
	}

	public void setXsname(String xsname) {
		this.xsname = xsname;
	}

	public String getFtype() {
		return ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	public String getAutoup() {
		return autoup;
	}

	public void setAutoup(String autoup) {
		this.autoup = autoup;
	}

	public int getFlength() {
		return flength;
	}

	public void setFlength(int flength) {
		this.flength = flength;
	}

	public int getFpoint() {
		return fpoint;
	}

	public void setFpoint(int fpoint) {
		this.fpoint = fpoint;
	}

	public String getIsnull() {
		return isnull;
	}

	public void setIsnull(String isnull) {
		this.isnull = isnull;
	}

	public int getIssys() {
		return issys;
	}

	public void setIssys(int issys) {
		this.issys = issys;
	}

	public String getSm() {
		return sm;
	}

	public void setSm(String sm) {
		this.sm = sm;
	}

	public int getKjtype() {
		return kjtype;
	}

	public void setKjtype(int kjtype) {
		this.kjtype = kjtype;
	}

	public String getDytblname() {
		return dytblname;
	}

	public void setDytblname(String dytblname) {
		this.dytblname = dytblname;
	}

	public String getDyfield() {
		return dyfield;
	}

	public void setDyfield(String dyfield) {
		this.dyfield = dyfield;
	}

	public String getDyvalue() {
		return dyvalue;
	}

	public void setDyvalue(String dyvalue) {
		this.dyvalue = dyvalue;
	}

	public String getIsgroup() {
		return isgroup;
	}

	public void setIsgroup(String isgroup) {
		this.isgroup = isgroup;
	}

	public String getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}
	public int getPx() {
		return px;
	}
	public void setPx(int px) {
		this.px = px;
	}
	public String getHasTbl() {
		return hasTbl;
	}
	public void setHasTbl(String hasTbl) {
		this.hasTbl = hasTbl;
	}
	
	
}
