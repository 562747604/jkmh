package org.soft.erp.domain.jkzj;

public class StatInfo {

	private int totalCount	;
	private int maleCount	;
	private int femaleCount	;
	private String conclusionName	;
	private String maleRate	;
	private String femaleRate	;
	
	public String getConclusionName() {
		return conclusionName;
	}
	public void setConclusionName(String conclusionName) {
		this.conclusionName = conclusionName;
	}
	public int getFemaleCount() {
		return femaleCount;
	}
	public void setFemaleCount(int femaleCount) {
		this.femaleCount = femaleCount;
	}
	public int getMaleCount() {
		return maleCount;
	}
	public void setMaleCount(int maleCount) {
		this.maleCount = maleCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getMaleRate() {
		return maleRate;
	}
	public void setMaleRate(String maleRate) {
		this.maleRate = maleRate;
	}
	public String getFemaleRate() {
		return femaleRate;
	}
	public void setFemaleRate(String femaleRate) {
		this.femaleRate = femaleRate;
	}

	
	
}
