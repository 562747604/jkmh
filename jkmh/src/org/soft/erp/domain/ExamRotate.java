package org.soft.erp.domain;

import org.soft.erp.domain.jggly.Ryfp;

/*
 * 体检用户信息遍历，评估业务和服务追踪左面
 */
public class ExamRotate {
	private String id;
	private String previd;
	private String nextid;
	private Ryfp ryfp;
	private String currentPeisInfoId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPrevid() {
		return previd;
	}
	public void setPrevid(String previd) {
		this.previd = previd;
	}
	public String getNextid() {
		return nextid;
	}
	public void setNextid(String nextid) {
		this.nextid = nextid;
	}
	public Ryfp getRyfp() {
		return ryfp;
	}
	public void setRyfp(Ryfp ryfp) {
		this.ryfp = ryfp;
	}
	public String getCurrentPeisInfoId() {
		return currentPeisInfoId;
	}
	public void setCurrentPeisInfoId(String currentPeisInfoId) {
		this.currentPeisInfoId = currentPeisInfoId;
	}

}
