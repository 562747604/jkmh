package org.soft.erp.domain.jkzj;

import java.util.List;

public class CheckDatas {

	private String cateId	;
	private String cateName	;
	private String conclusion	;
	private List<ReportItems> reportItems	;
	private String doctor;
	
	public String getCateId() {
		return cateId;
	}
	public void setCateId(String cateId) {
		this.cateId = cateId;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getConclusion() {
		return conclusion;
	}
	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}
	public List<ReportItems> getReportItems() {
		return reportItems;
	}
	public void setReportItems(List<ReportItems> reportItems) {
		this.reportItems = reportItems;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	
	
}
