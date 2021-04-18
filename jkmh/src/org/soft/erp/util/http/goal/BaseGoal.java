package org.soft.erp.util.http.goal;


/*
 * 基础指标用于继承
 */
public class BaseGoal{
	private String id;//值id
	private String name;//指标名称
	private String value;//指标值
	private String doctor;//医生指导值

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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
}