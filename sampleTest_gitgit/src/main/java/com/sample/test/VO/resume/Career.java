package com.sample.test.VO.resume;

public class Career {

	private int careerSeq;
	private int resumeSeq;

	private String companyName;
	private String careerCategory;
	private String careerStartDate;
	private String careerEndDate;
	private String careerDepartment;
	private String careerPosition;
	private String careerRegion;
	private String careerSalary;
	private String careerTask;
	private String careerDetails;

	public Career(int careerSeq, int resumeSeq, String companyName, String careerStartDate, String careerEndDate,
			String careerPosition, String careerCategory, String careerDepartment, String careerRegion,
			String careerSalary, String careerTask, String careerDetails) {
		super();
		this.careerSeq = careerSeq;
		this.resumeSeq = resumeSeq;
		this.companyName = companyName;
		this.careerStartDate = careerStartDate;
		this.careerEndDate = careerEndDate;
		this.careerPosition = careerPosition;
		this.careerCategory = careerCategory;
		this.careerDepartment = careerDepartment;
		this.careerRegion = careerRegion;
		this.careerSalary = careerSalary;
		this.careerTask = careerTask;
		this.careerDetails = careerDetails;
	}

	public Career() {
		super();
	}

	public int getCareerSeq() {
		return careerSeq;
	}

	public void setCareerSeq(int careerSeq) {
		this.careerSeq = careerSeq;
	}

	public int getResumeSeq() {
		return resumeSeq;
	}

	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCareerStartDate() {
		return careerStartDate;
	}

	public void setCareerStartDate(String careerStartDate) {
		this.careerStartDate = careerStartDate;
	}

	public String getCareerEndDate() {
		return careerEndDate;
	}

	public void setCareerEndDate(String careerEndDate) {
		this.careerEndDate = careerEndDate;
	}

	public String getCareerPosition() {
		return careerPosition;
	}

	public void setCareerPosition(String careerPosition) {
		this.careerPosition = careerPosition;
	}

	public String getCareerCategory() {
		return careerCategory;
	}

	public void setCareerCategory(String careerCategory) {
		this.careerCategory = careerCategory;
	}

	public String getCareerDepartment() {
		return careerDepartment;
	}

	public void setCareerDepartment(String careerDepartment) {
		this.careerDepartment = careerDepartment;
	}

	public String getCareerRegion() {
		return careerRegion;
	}

	public void setCareerRegion(String careerRegion) {
		this.careerRegion = careerRegion;
	}

	public String getCareerSalary() {
		return careerSalary;
	}

	public void setCareerSalary(String careerSalary) {
		this.careerSalary = careerSalary;
	}

	public String getCareerTask() {
		return careerTask;
	}

	public void setCareerTask(String careerTask) {
		this.careerTask = careerTask;
	}

	public String getCareerDetails() {
		return careerDetails;
	}

	public void setCareerDetails(String careerDetails) {
		this.careerDetails = careerDetails;
	}

	@Override
	public String toString() {
		return "Career [careerSeq=" + careerSeq + ", resumeSeq=" + resumeSeq + ", companyName=" + companyName
				+ ", careerCategory=" + careerCategory + ", careerStartDate=" + careerStartDate + ", careerEndDate="
				+ careerEndDate + ", careerDepartment=" + careerDepartment + ", careerPosition=" + careerPosition
				+ ", careerRegion=" + careerRegion + ", careerSalary=" + careerSalary + ", careerTask=" + careerTask
				+ ", careerDetails=" + careerDetails + "]";
	}

}
