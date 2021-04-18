package org.soft.erp.util.http.user;

import java.util.Date;

public class FwUsers {
	
	private String peisId;
	private String peopleId;
	private int state;
	private String manageContent;
	
	private Date start;
	private Date end;
	public String getPeisId() {
		return peisId;
	}
	public void setPeisId(String peisId) {
		this.peisId = peisId;
	}
	public String getPeopleId() {
		return peopleId;
	}
	public void setPeopleId(String peopleId) {
		this.peopleId = peopleId;
	}

	public String getManageContent() {
		return manageContent;
	}
	public void setManageContent(String manageContent) {
		this.manageContent = manageContent;
	}

	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	
}
