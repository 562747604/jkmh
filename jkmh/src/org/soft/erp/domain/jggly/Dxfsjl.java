package org.soft.erp.domain.jggly;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 代码库  s_rbac_menu
 * @author    
 * @version V1.0   
 */
public class Dxfsjl implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String jgid	;
	private int uid	;
	private String juid	;
	private String jname	;
	private String nr	;
	private String ftime;
	private String stime;
	private String zt	;
	private String yx	;
	private String mc	;
	private String tslx	;
	private String cffs	;
	private String fname	;
	private String tsfs	;
	private String dsfs	;
	private String dstime	;
	private String zqts	;
	private String moble	;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	public String getNr() {
		return nr;
	}
	public void setNr(String nr) {
		this.nr = nr;
	}

	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	public String getYx() {
		return yx;
	}
	public void setYx(String yx) {
		this.yx = yx;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getTslx() {
		return tslx;
	}
	public void setTslx(String tslx) {
		this.tslx = tslx;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getTsfs() {
		return tsfs;
	}
	public void setTsfs(String tsfs) {
		this.tsfs = tsfs;
	}
	public String getDsfs() {
		return dsfs;
	}
	public void setDsfs(String dsfs) {
		this.dsfs = dsfs;
	}
	public String getCffs() {
		return cffs;
	}
	public void setCffs(String cffs) {
		this.cffs = cffs;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	public String getZqts() {
		return zqts;
	}
	public void setZqts(String zqts) {
		this.zqts = zqts;
	}
	public String getMoble() {
		return moble;
	}
	public void setMoble(String moble) {
		this.moble = moble;
	}
	public String getFtime() {
		return ftime;
	}
	public void setFtime(String ftime) {
		this.ftime = ftime;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getDstime() {
		return dstime;
	}
	public void setDstime(String dstime) {
		this.dstime = dstime;
	}

	public String getJuid() {
		return juid;
	}
	public void setJuid(String juid) {
		this.juid = juid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	

	
}
