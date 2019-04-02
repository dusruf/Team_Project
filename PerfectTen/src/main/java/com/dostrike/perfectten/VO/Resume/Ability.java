package com.dostrike.perfectten.VO.Resume;

public class Ability {

	private int resumeSeq;

	private int abilitySeq;
	private String abilityTitle;
	private String abilityStatus;
	private String abilityDetails;

	public Ability(int resumeSeq, int abilitySeq, String abilityTitle, String abilityStatus, String abilityDetails) {
		super();
		this.resumeSeq = resumeSeq;
		this.abilitySeq = abilitySeq;
		this.abilityTitle = abilityTitle;
		this.abilityStatus = abilityStatus;
		this.abilityDetails = abilityDetails;
	}

	public Ability() {
		super();
	}

	public int getResumeSeq() {
		return resumeSeq;
	}

	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

	public int getAbilitySeq() {
		return abilitySeq;
	}

	public void setAbilitySeq(int abilitySeq) {
		this.abilitySeq = abilitySeq;
	}

	public String getAbilityTitle() {
		return abilityTitle;
	}

	public void setAbilityTitle(String abilityTitle) {
		this.abilityTitle = abilityTitle;
	}

	public String getAbilityStatus() {
		return abilityStatus;
	}

	public void setAbilityStatus(String abilityStatus) {
		this.abilityStatus = abilityStatus;
	}

	public String getAbilityDetails() {
		return abilityDetails;
	}

	public void setAbilityDetails(String abilityDetails) {
		this.abilityDetails = abilityDetails;
	}

	@Override
	public String toString() {
		return "Ability [resumeSeq=" + resumeSeq + ", abilitySeq=" + abilitySeq + ", abilityTitle=" + abilityTitle
				+ ", abilityStatus=" + abilityStatus + ", abilityDetails=" + abilityDetails + "]";
	}

}//
