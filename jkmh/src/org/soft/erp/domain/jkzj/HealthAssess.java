package org.soft.erp.domain.jkzj;

import java.util.List;

public class HealthAssess {
	
	private String healthLevel	;
	private String healthState	;
	private String illnessDesc	;
	private List<EpidemicSurvey> epidemicSurvey	;
	private String examConclusion	;
	
	
	public String getHealthLevel() {
		return healthLevel;
	}
	public void setHealthLevel(String healthLevel) {
		this.healthLevel = healthLevel;
	}
	public String getHealthState() {
		return healthState;
	}
	public void setHealthState(String healthState) {
		this.healthState = healthState;
	}
	public String getIllnessDesc() {
		return illnessDesc;
	}
	public void setIllnessDesc(String illnessDesc) {
		this.illnessDesc = illnessDesc;
	}
	public List<EpidemicSurvey> getEpidemicSurvey() {
		return epidemicSurvey;
	}
	public void setEpidemicSurvey(List<EpidemicSurvey> epidemicSurvey) {
		this.epidemicSurvey = epidemicSurvey;
	}
	public String getExamConclusion() {
		return examConclusion;
	}
	public void setExamConclusion(String examConclusion) {
		this.examConclusion = examConclusion;
	}

}
