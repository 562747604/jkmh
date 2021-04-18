package org.soft.erp.util.http.goal;

import java.util.List;


/*
 * 体重管理指标
 */
public class Data{

	public List<Weight> weight;//体重管理指标
	public List<Diseases> diseases;//慢病管理指标
	
	
	public List<Weight> getWeight() {
		return weight;
	}
	public void setWeight(List<Weight> weight) {
		this.weight = weight;
	}
	public List<Diseases> getDiseases() {
		return diseases;
	}
	public void setDiseases(List<Diseases> diseases) {
		this.diseases = diseases;
	}


}