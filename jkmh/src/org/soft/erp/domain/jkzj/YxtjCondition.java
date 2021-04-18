package org.soft.erp.domain.jkzj;

public class YxtjCondition {

//	private String orgId	="21e0db9b-38c8-4f5a-9f0d-bcf5f6f55fc0";
//	private String ageStartVal	="0";
//	private String ageEndVal	="10";
//	private String dateStartVal	="2013-01-01";
//	private String dateEndVal	="2017-01-01";
//	private String rank	="10";
	
	private String orgId	;
	private String ageStartVal	;
	private String ageEndVal	;
	private String dateStartVal	;
	private String dateEndVal	;
	private String rank	;
	
	public String getAgeStartVal() {
		return ageStartVal;
	}
	public void setAgeStartVal(String ageStartVal) {
		this.ageStartVal = ageStartVal;
	}
	public String getAgeEndVal() {
		return ageEndVal;
	}
	public void setAgeEndVal(String ageEndVal) {
		this.ageEndVal = ageEndVal;
	}
	public String getDateStartVal() {
		return dateStartVal;
	}
	public void setDateStartVal(String dateStartVal) {
		this.dateStartVal = dateStartVal;
	}
	public String getDateEndVal() {
		return dateEndVal;
	}
	public void setDateEndVal(String dateEndVal) {
		this.dateEndVal = dateEndVal;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	
	public YxtjCondition(String orgId, String ageStartVal, String ageEndVal,
			String dateStartVal, String dateEndVal, String rank) {
		super();
		this.orgId = orgId;
		this.ageStartVal = ageStartVal;
		this.ageEndVal = ageEndVal;
		this.dateStartVal = dateStartVal;
		this.dateEndVal = dateEndVal;
		this.rank = rank;
	}
	public YxtjCondition() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
