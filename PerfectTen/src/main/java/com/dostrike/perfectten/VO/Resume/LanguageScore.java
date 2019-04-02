package com.dostrike.perfectten.VO.Resume;

public class LanguageScore {

	private int languageSeq;
	private int resumeSeq;
	private String languageType;
	private String languageTitle;
	private String languageScore;
	private String languageOrg;
	private String languageDate;

	public LanguageScore(int languageSeq, int resumeSeq, String languageType, String languageTitle, String languageScore,
			String languageOrg, String languageDate) {
		super();
		this.languageSeq = languageSeq;
		this.resumeSeq = resumeSeq;
		this.languageType = languageType;
		this.languageTitle = languageTitle;
		this.languageScore = languageScore;
		this.languageOrg = languageOrg;
		this.languageDate = languageDate;
	}

	public LanguageScore() {
		super();
	}

	public int getLanguageSeq() {
		return languageSeq;
	}

	public void setLanguageSeq(int languageSeq) {
		this.languageSeq = languageSeq;
	}

	public int getResumeSeq() {
		return resumeSeq;
	}

	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

	public String getLanguageType() {
		return languageType;
	}

	public void setLanguageType(String languageType) {
		this.languageType = languageType;
	}

	public String getLanguageTitle() {
		return languageTitle;
	}

	public void setLanguageTitle(String languageTitle) {
		this.languageTitle = languageTitle;
	}

	public String getLanguageScore() {
		return languageScore;
	}

	public void setLanguageScore(String languageScore) {
		this.languageScore = languageScore;
	}

	public String getLanguageOrg() {
		return languageOrg;
	}

	public void setLanguageOrg(String languageOrg) {
		this.languageOrg = languageOrg;
	}

	public String getLanguageDate() {
		return languageDate;
	}

	public void setLanguageDate(String languageDate) {
		this.languageDate = languageDate;
	}

	@Override
	public String toString() {
		return "Language [languageSeq=" + languageSeq + ", resumeSeq=" + resumeSeq + ", languageType=" + languageType
				+ ", languageTitle=" + languageTitle + ", languageScore=" + languageScore + ", languageOrg="
				+ languageOrg + ", languageDate=" + languageDate + "]";
	}

}
