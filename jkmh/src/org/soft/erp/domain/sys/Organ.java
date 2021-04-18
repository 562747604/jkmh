package org.soft.erp.domain.sys;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 机构  s_organ
 * @author    :中庸陈
 * @version V1.0   
 */
public class Organ implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String companyName;//机构名称
	private String companyId;//机构编码
	private String address;//地址
	private String mobile;//电话
	private String postcode;//邮编
	private String remark;//备注
	private String logo;//logo路径
	private String email;//邮箱
	private String jcode;//邮箱
	private String pgsh;//邮箱
	private String fwsh;//邮箱
	private String jgbm;//邮箱

	private String companySName;//机构名称
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createDate;
	
	private String creator;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getJcode() {
		return jcode;
	}
	public void setJcode(String jcode) {
		this.jcode = jcode;
	}
	public String getCompanySName() {
		return companySName;
	}
	public void setCompanySName(String companySName) {
		this.companySName = companySName;
	}
	public String getPgsh() {
		return pgsh;
	}
	public void setPgsh(String pgsh) {
		this.pgsh = pgsh;
	}
	public String getFwsh() {
		return fwsh;
	}
	public void setFwsh(String fwsh) {
		this.fwsh = fwsh;
	}
	public String getJgbm() {
		return jgbm;
	}
	public void setJgbm(String jgbm) {
		this.jgbm = jgbm;
	}
	

	
}
