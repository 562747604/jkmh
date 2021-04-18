package org.soft.erp.domain.jkzj;

import java.util.List;

public class Unusual {

	private String cateId	;
	private String cateName	;
	private List<Item> items	;
	
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
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	

	
	
}
