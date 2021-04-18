package org.soft.erp.domain.jggly;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 代码库  s_rbac_menu
 * @author    :中庸陈
 * @version V1.0   
 */
public class Cztj implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String juid;
	private String jtime	;
	private String	mc	;
	private String jgid;
	private String	ddh	;
	private String 	je	;
	private String	zt	;
	private String stime	;
	private String	tno	;
	private String	ts	;
	private String	jname	;
	private String tcname	;

	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	public String getDdh() {
		return ddh;
	}
	public void setDdh(String ddh) {
		this.ddh = ddh;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	public String getJtime() {
		return jtime;
	}
	public void setJtime(String jtime) {
		this.jtime = jtime;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getTcname() {
		return tcname;
	}
	public void setTcname(String tcname) {
		this.tcname = tcname;
	}
	public String getJe() {
		return je;
	}
	public void setJe(String je) {
		this.je = je;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJuid() {
		return juid;
	}
	public void setJuid(String juid) {
		this.juid = juid;
	}
	public String getTs() {
		return ts;
	}
	public void setTs(String ts) {
		this.ts = ts;
	}
	
}
