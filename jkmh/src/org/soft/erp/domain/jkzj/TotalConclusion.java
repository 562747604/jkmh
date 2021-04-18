package org.soft.erp.domain.jkzj;

import java.util.List;

public class TotalConclusion {

	private String id	;
	private String time	;
	private String doctor	;
	private List<Unusual> unusuals	;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}


	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	public List<Unusual> getUnusuals() {
		return unusuals;
	}
	public void setUnusuals(List<Unusual> unusuals) {
		this.unusuals = unusuals;
	}
	
	
	
}
