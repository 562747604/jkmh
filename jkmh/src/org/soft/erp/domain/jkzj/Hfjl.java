package org.soft.erp.domain.jkzj;

import java.io.Serializable;
import java.util.Date;

/**   
 * @Description: 代码库  s_rbac_menu
 * @author    :中庸陈
 * @version V1.0   
 */
public class Hfjl implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id	;
	private String jgid	;
	private Integer hid	;
	private Integer yid	;
	private Date htime	;
	private String hlx	;
	private Integer did	;
	private Integer emailId	;
	private String tel	;
	private String zt	;
	private String jg	;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getHid() {
		return hid;
	}
	public void setHid(Integer hid) {
		this.hid = hid;
	}
	public Integer getYid() {
		return yid;
	}
	public void setYid(Integer yid) {
		this.yid = yid;
	}
	public Date getHtime() {
		return htime;
	}
	public void setHtime(Date htime) {
		this.htime = htime;
	}
	public String getHlx() {
		return hlx;
	}
	public void setHlx(String hlx) {
		this.hlx = hlx;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public Integer getEmailId() {
		return emailId;
	}
	public void setEmailId(Integer emailId) {
		this.emailId = emailId;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getJg() {
		return jg;
	}
	public void setJg(String jg) {
		this.jg = jg;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	
}
