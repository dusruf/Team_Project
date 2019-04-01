package com.dostrike.perfectten.VO.Resume;

public class Certificate {

	private int certiSeq;
	private int resumeSeq;
	private String certiTitle;
	private String certiOrg;
	private String certiDate;

	public Certificate(int certiSeq, int resumeSeq, String certiTitle, String certiOrg, String certiDate) {
		super();
		this.certiSeq = certiSeq;
		this.resumeSeq = resumeSeq;
		this.certiTitle = certiTitle;
		this.certiOrg = certiOrg;
		this.certiDate = certiDate;
	}

	public Certificate() {
		super();
	}

	public int getCertiSeq() {
		return certiSeq;
	}

	public void setCertiSeq(int certiSeq) {
		this.certiSeq = certiSeq;
	}

	public int getResumeSeq() {
		return resumeSeq;
	}

	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

	public String getCertiTitle() {
		return certiTitle;
	}

	public void setCertiTitle(String certiTitle) {
		this.certiTitle = certiTitle;
	}

	public String getCertiOrg() {
		return certiOrg;
	}

	public void setCertiOrg(String certiOrg) {
		this.certiOrg = certiOrg;
	}

	public String getCertiDate() {
		return certiDate;
	}

	public void setCertiDate(String certiDate) {
		this.certiDate = certiDate;
	}

	@Override
	public String toString() {
		return "Certificate [certiSeq=" + certiSeq + ", resumeSeq=" + resumeSeq + ", certiTitle=" + certiTitle
				+ ", certiOrg=" + certiOrg + ", certiDate=" + certiDate + "]";
	}

}
