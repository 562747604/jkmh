package org.soft.erp.domain.jggly;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 机构  s_tuser
 * @author    :
 * @version V1.0   
 */
public class Ryfp implements Serializable {
	
	private Integer id;
	private String jgid;
	private String uid;
	private Integer zjid;
	private Integer zyid;
	private String zt;
	private String uname;
	private String realname;
	private String mobile;
	private String tjh;
	private String xb;
	private String nl;
	private String dw;
	private String sfzh;
	private String email;
	private String hy;
	private String yx;
	private String zdyx;
	private String zjname;
	private String zyname;
	private String zjshzt;
	private String 	shTime;
	private String csrq;
	private String jtime;
	
//	private String fId;
	private String fBirthplace;
	
	private String fCreatedTime;
	private String fUpdatedTime;
	private String fPhone;
	private String fCompanyId;
	private String fCompanyName;
	private String jobtitle;
	private String zyjobtitle;
	private String fwzt;
	private String dqrq;
	private String ksrq;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Integer getZjid() {
		return zjid;
	}
	public void setZjid(Integer zjid) {
		this.zjid = zjid;
	}
	public Integer getZyid() {
		return zyid;
	}
	public void setZyid(Integer zyid) {
		this.zyid = zyid;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTjh() {
		return tjh;
	}
	public void setTjh(String tjh) {
		this.tjh = tjh;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getNl() {
		return nl;
	}
	public void setNl(String nl) {
		this.nl = nl;
	}
	public String getDw() {
		return dw;
	}
	public void setDw(String dw) {
		this.dw = dw;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHy() {
		return hy;
	}
	public void setHy(String hy) {
		this.hy = hy;
	}
	public String getYx() {
		return yx;
	}
	public void setYx(String yx) {
		this.yx = yx;
	}
	public String getZdyx() {
		return zdyx;
	}
	public void setZdyx(String zdyx) {
		this.zdyx = zdyx;
	}
	public String getZjname() {
		return zjname;
	}
	public void setZjname(String zjname) {
		this.zjname = zjname;
	}
	public String getZyname() {
		return zyname;
	}
	public void setZyname(String zyname) {
		this.zyname = zyname;
	}
	public String getZjshzt() {
		return zjshzt;
	}
	public void setZjshzt(String zjshzt) {
		this.zjshzt = zjshzt;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getJtime() {
		return jtime;
	}
	public void setJtime(String jtime) {
		this.jtime = jtime;
	}
//	public String getfId() {
//		return fId;
//	}
//	public void setfId(String fId) {
//		this.fId = fId;
//	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public String getfBirthplace() {
		return fBirthplace;
	}
	public void setfBirthplace(String fBirthplace) {
		this.fBirthplace = fBirthplace;
	}
	public String getfCreatedTime() {
		return fCreatedTime;
	}
	public void setfCreatedTime(String fCreatedTime) {
		this.fCreatedTime = fCreatedTime;
	}
	public String getfUpdatedTime() {
		return fUpdatedTime;
	}
	public void setfUpdatedTime(String fUpdatedTime) {
		this.fUpdatedTime = fUpdatedTime;
	}
	public String getfPhone() {
		return fPhone;
	}
	public void setfPhone(String fPhone) {
		this.fPhone = fPhone;
	}

	public String getShTime() {
		return shTime;
	}
	public void setShTime(String shTime) {
		this.shTime = shTime;
	}
	public String getfCompanyId() {
		return fCompanyId;
	}
	public void setfCompanyId(String fCompanyId) {
		this.fCompanyId = fCompanyId;
	}
	public String getfCompanyName() {
		return fCompanyName;
	}
	public void setfCompanyName(String fCompanyName) {
		this.fCompanyName = fCompanyName;
	}
	public String getJobtitle() {
		return jobtitle;
	}
	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}

	public String getFwzt() {
		return fwzt;
	}
	public void setFwzt(String fwzt) {
		this.fwzt = fwzt;
	}
	public String getZyjobtitle() {
		return zyjobtitle;
	}
	public void setZyjobtitle(String zyjobtitle) {
		this.zyjobtitle = zyjobtitle;
	}
	public String getDqrq() {
		return dqrq;
	}
	public void setDqrq(String dqrq) {
		this.dqrq = dqrq;
	}
	public String getKsrq() {
		return ksrq;
	}
	public void setKsrq(String ksrq) {
		this.ksrq = ksrq;
	}

}
