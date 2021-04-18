package org.soft.erp.util.http.cjmb;

public class Cjmb {
	private int id;
	private int diseaseId;
	private String name;
	private String code;
	private  boolean isManaged; 	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDiseaseId() {
		return diseaseId;
	}
	public void setDiseaseId(int diseaseId) {
		this.diseaseId = diseaseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public boolean getIsManaged() {
		return isManaged;
	}
	public void setIsManaged(boolean isManaged) {
		this.isManaged = isManaged;
	}


}
