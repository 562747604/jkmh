package org.soft.erp.domain.jggly;

import java.io.Serializable;
import java.util.Date;

/**   
 * @Description: 代码库  s_rbac_menu
 * @author    :中庸陈
 * @version V1.0   
 */
public class Userlog implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private int uid	;
	private String ltime	;
	private String	lip	;
	private String jgid;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getLip() {
		return lip;
	}
	public void setLip(String lip) {
		this.lip = lip;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	public String getLtime() {
		return ltime;
	}
	public void setLtime(String ltime) {
		this.ltime = ltime;
	}


	
}
