package org.soft.erp.util.http.daily;


/*
 * 每日情况-饮食接口
 * 
 */
public class DietItem{

	private int foodId;//返回码
	private String amount;//返回消息
	private String name;//返回消息
	private String value;//返回消息
	
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
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



}