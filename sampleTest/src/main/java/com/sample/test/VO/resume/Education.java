package com.sample.test.VO.resume;

public class Education {

	private int educationSeq;
	private int resumeSeq;

	private String educationFlag;
	private String schoolName;
	private String major;
	private String diploma;
	private String startDate;
	private String endDate;

	public Education(int educationSeq, int resumeSeq, String educationFlag, String schoolName, String major,
			String diploma, String startDate, String endDate) {
		super();
		this.educationSeq = educationSeq;
		this.resumeSeq = resumeSeq;
		this.educationFlag = educationFlag;
		this.schoolName = schoolName;
		this.major = major;
		this.diploma = diploma;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Education() {
		super();
	}

	public int getEducationSeq() {
		return educationSeq;
	}

	public void setEducationSeq(int educationSeq) {
		this.educationSeq = educationSeq;
	}

	public int getResumeSeq() {
		return resumeSeq;
	}

	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

	public String getEducationFlag() {
		return educationFlag;
	}

	public void setEducationFlag(String educationFlag) {
		this.educationFlag = educationFlag;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDiploma() {
		return diploma;
	}

	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Education [educationSeq=" + educationSeq + ", resumeSeq=" + resumeSeq + ", educationFlag="
				+ educationFlag + ", schoolName=" + schoolName + ", major=" + major + ", diploma=" + diploma
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
