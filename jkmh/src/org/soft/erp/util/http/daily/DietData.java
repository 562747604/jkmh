package org.soft.erp.util.http.daily;

import java.util.Map;


/*
 * 每日情况-饮食接口
 * 
 */
public class DietData{
	private String heat;
	private Level3 breakfast;
	private Level3 lunch;
	private Level3 dinner;
	private Level3 extra;
	
	public String getHeat() {
		return heat;
	}
	public void setHeat(String heat) {
		this.heat = heat;
	}
	public Level3 getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(Level3 breakfast) {
		this.breakfast = breakfast;
	}
	public Level3 getLunch() {
		return lunch;
	}
	public void setLunch(Level3 lunch) {
		this.lunch = lunch;
	}
	public Level3 getDinner() {
		return dinner;
	}
	public void setDinner(Level3 dinner) {
		this.dinner = dinner;
	}
	public Level3 getExtra() {
		return extra;
	}
	public void setExtra(Level3 extra) {
		this.extra = extra;
	}

}