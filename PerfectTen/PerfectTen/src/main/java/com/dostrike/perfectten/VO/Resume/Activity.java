package com.dostrike.perfectten.VO.Resume;

public class Activity {

	private int resumeSeq;

	private int activitySeq;
	private String activityTitle;
	private String activityOrg;
	private String activityDetails;

	public Activity(int resumeSeq, int activitySeq, String activityTitle, String activityOrg, String activityDetails) {
		super();
		this.resumeSeq = resumeSeq;
		this.activitySeq = activitySeq;
		this.activityTitle = activityTitle;
		this.activityOrg = activityOrg;
		this.activityDetails = activityDetails;
	}

	public Activity() {
		super();
	}

	public int getResumeSeq() {
		return resumeSeq;
	}

	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

	public int getActivitySeq() {
		return activitySeq;
	}

	public void setActivitySeq(int activitySeq) {
		this.activitySeq = activitySeq;
	}

	public String getActivityTitle() {
		return activityTitle;
	}

	public void setActivityTitle(String activityTitle) {
		this.activityTitle = activityTitle;
	}

	public String getActivityOrg() {
		return activityOrg;
	}

	public void setActivityOrg(String activityOrg) {
		this.activityOrg = activityOrg;
	}

	public String getActivityDetails() {
		return activityDetails;
	}

	public void setActivityDetails(String activityDetails) {
		this.activityDetails = activityDetails;
	}

	@Override
	public String toString() {
		return "Activity [resumeSeq=" + resumeSeq + ", activitySeq=" + activitySeq + ", activityTitle=" + activityTitle
				+ ", activityOrg=" + activityOrg + ", activityDetails=" + activityDetails + "]";
	}

}