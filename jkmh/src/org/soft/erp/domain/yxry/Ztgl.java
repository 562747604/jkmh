package org.soft.erp.domain.yxry;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 机构  s_organ
 * @author    :中庸陈
 * @version V1.0   
 */
public class Ztgl  implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String jgid;
	private String lx;
	private String sfkj;
	private String mc;
	private String nr;
	private String mmc;
	private String createtime;
	private String creator;
	private String creatorname;
	private String fs;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createDate;

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
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getLx() {
		return lx;
	}
	public void setLx(String lx) {
		this.lx = lx;
	}
	public String getSfkj() {
		return sfkj;
	}
	public void setSfkj(String sfkj) {
		this.sfkj = sfkj;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getNr() {
		return nr;
	}
	public void setNr(String nr) {
		this.nr = nr;
	}

	public String getMmc() {
		return mmc;
	}
	public void setMmc(String mmc) {
		this.mmc = mmc;
	}
	public String getCreatorname() {
		return creatorname;
	}
	public void setCreatorname(String creatorname) {
		this.creatorname = creatorname;
	}

	public String getFs() {
		return fs;
	}
	public void setFs(String fs) {
		this.fs = fs;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
}
