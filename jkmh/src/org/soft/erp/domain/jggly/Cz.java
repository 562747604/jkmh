package org.soft.erp.domain.jggly;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 代码库  s_rbac_menu
 * @author    :中庸陈
 * @version V1.0   
 */
public class Cz implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private int uid;
	private Date otime	;
	private String	mkname	;
	private String jgid;
	private String	uname	;
	private String	nr	;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNr() {
		return nr;
	}
	public void setNr(String nr) {
		this.nr = nr;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getMkname() {
		return mkname;
	}
	public void setMkname(String mkname) {
		this.mkname = mkname;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getOtime() {
		return otime;
	}
	public void setOtime(Date otime) {
		this.otime = otime;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	
	
}
