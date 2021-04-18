package org.soft.erp.domain.jkzj;

import java.util.List;


//examItems
public class ReportItems {

	private String id	;
	private String name	;
	private List<PeisDatas> examItems	;
	private String[] imgUris;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<PeisDatas> getExamItems() {
		return examItems;
	}
	public void setExamItems(List<PeisDatas> examItems) {
		this.examItems = examItems;
	}
	public String[] getImgUris() {
		return imgUris;
	}
	public void setImgUris(String[] imgUris) {
		this.imgUris = imgUris;
	}


	
}
