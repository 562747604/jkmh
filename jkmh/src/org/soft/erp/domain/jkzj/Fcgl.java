package org.soft.erp.domain.jkzj;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 代码库  s_rbac_menu
 * @author    :中庸陈
 * @version V1.0   
 */
public class Fcgl implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id	;
	private String jgid	;
	private Integer zjid	;
	private String zjname	;
	private String dw	;
	private String sfzh	;
	private String sjh	;
	private String email	;
	private String fcxm	;
	private String fcsj	;
	private String createdate	;
	private String creator	;
	private String uid	;
	private String tjh	;
	private String fczt	;
	private String uname	;
	private String tsstatus	;
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
	public Integer getZjid() {
		return zjid;
	}
	public void setZjid(Integer zjid) {
		this.zjid = zjid;
	}
	public String getZjname() {
		return zjname;
	}
	public void setZjname(String zjname) {
		this.zjname = zjname;
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

	public String getFcxm() {
		return fcxm;
	}
	public void setFcxm(String fcxm) {
		this.fcxm = fcxm;
	}

	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getTjh() {
		return tjh;
	}
	public void setTjh(String tjh) {
		this.tjh = tjh;
	}
	public String getFczt() {
		return fczt;
	}
	public void setFczt(String fczt) {
		this.fczt = fczt;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getFcsj() {
		return fcsj;
	}
	public void setFcsj(String fcsj) {
		this.fcsj = fcsj;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSjh() {
		return sjh;
	}
	public void setSjh(String sjh) {
		this.sjh = sjh;
	}
	public String getTsstatus() {
		return tsstatus;
	}
	public void setTsstatus(String tsstatus) {
		this.tsstatus = tsstatus;
	}
	

	
}
