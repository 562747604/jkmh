package org.soft.erp.domain.yxry;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 机构  s_organ
 * @author    :中庸陈
 * @version V1.0   
 */
public class Tjyx  implements Serializable {

	private static final long serialVersionUID = 1L;

	private String jgid;
	private String tslx;
	private String mmc;
	private String ftime;
	private Date fname;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public String getFtime() {
		return ftime;
	}
	public void setFtime(String ftime) {
		this.ftime = ftime;
	}
	public String getJgid() {
		return jgid;
	}
	public void setJgid(String jgid) {
		this.jgid = jgid;
	}
	public String getTslx() {
		return tslx;
	}
	public void setTslx(String tslx) {
		this.tslx = tslx;
	}
	public String getMmc() {
		return mmc;
	}
	public void setMmc(String mmc) {
		this.mmc = mmc;
	}
	public Date getFname() {
		return fname;
	}
	public void setFname(Date fname) {
		this.fname = fname;
	}

	
	
}
