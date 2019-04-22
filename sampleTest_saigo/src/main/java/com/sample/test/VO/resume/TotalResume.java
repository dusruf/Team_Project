package com.sample.test.VO.resume;

import java.util.ArrayList;
import java.util.List;

public class TotalResume {

	private int resumeSeq;
	private String personId;

	private int basicSeq;
	private String personName;
	private String birthDate;
	private String gender;
	private String personEmail;
	private String personPhone;
	private String personAddr;

	// Ability
	private int abilitySeq;

	private List<String> abilityTitle;
	private List<String> abilityStatus;
	private List<String> abilityDetails;

	private ArrayList<Ability> abilityList;

	// Activity
	private int activitySeq;

	private List<String> activityTitle;
	private List<String> activityOrg;
	private List<String> activityDetails;

	private ArrayList<Activity> activityList;

	// Certificate

	private int certiSeq;

	private List<String> certiTitle;
	private List<String> certiOrg;
	private List<String> certiDate;

	private ArrayList<Certificate> certificateList;

	// Language

	private int languageSeq;

	private List<String> languageType;
	private List<String> languageTitle;
	private List<String> languageScore;
	private List<String> languageOrg;
	private List<String> languageDate;

	private ArrayList<LanguageScore> languageScoreList;

	// Career

	private int careerSeq;

	private List<String> companyName;
	private List<String> careerStartDate;
	private List<String> careerEndDate;
	private List<String> careerPosition;
	private List<String> careerCategory;
	private List<String> careerDepartment;
	private List<String> careerRegion;
	private List<String> careerSalary;
	private List<String> careerTask;
	private List<String> careerDetails;

	private ArrayList<Career> careerList;

	// Education

	private int educationSeq;

	private List<String> educationFlag;
	private List<String> schoolName;
	private List<String> major;
	private List<String> diploma;
	private List<String> eduStartDate;
	private List<String> eduEndDate;

	private ArrayList<Education> educationList;

	public TotalResume(int resumeSeq, String personId, int basicSeq, String personName, String birthDate, String gender,
			String personEmail, String personPhone, String personAddr, int abilitySeq, List<String> abilityTitle,
			List<String> abilityStatus, List<String> abilityDetails, ArrayList<Ability> abilityList, int activitySeq,
			List<String> activityTitle, List<String> activityOrg, List<String> activityDetails,
			ArrayList<Activity> activityList, int certiSeq, List<String> certiTitle, List<String> certiOrg,
			List<String> certiDate, ArrayList<Certificate> certificateList, int languageSeq, List<String> languageType,
			List<String> languageTitle, List<String> languageScore, List<String> languageOrg, List<String> languageDate,
			ArrayList<LanguageScore> languageScoreList, int careerSeq, List<String> companyName,
			List<String> careerStartDate, List<String> careerEndDate, List<String> careerPosition,
			List<String> careerCategory, List<String> careerDepartment, List<String> careerRegion,
			List<String> careerSalary, List<String> careerTask, List<String> careerDetails,
			ArrayList<Career> careerList, int educationSeq, List<String> educationFlag, List<String> schoolName,
			List<String> major, List<String> diploma, List<String> eduStartDate, List<String> eduEndDate,
			ArrayList<Education> educationList) {
		super();
		this.resumeSeq = resumeSeq;
		this.personId = personId;
		this.basicSeq = basicSeq;
		this.personName = personName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.personEmail = personEmail;
		this.personPhone = personPhone;
		this.personAddr = personAddr;
		this.abilitySeq = abilitySeq;
		this.abilityTitle = abilityTitle;
		this.abilityStatus = abilityStatus;
		this.abilityDetails = abilityDetails;
		this.abilityList = abilityList;
		this.activitySeq = activitySeq;
		this.activityTitle = activityTitle;
		this.activityOrg = activityOrg;
		this.activityDetails = activityDetails;
		this.activityList = activityList;
		this.certiSeq = certiSeq;
		this.certiTitle = certiTitle;
		this.certiOrg = certiOrg;
		this.certiDate = certiDate;
		this.certificateList = certificateList;
		this.languageSeq = languageSeq;
		this.languageType = languageType;
		this.languageTitle = languageTitle;
		this.languageScore = languageScore;
		this.languageOrg = languageOrg;
		this.languageDate = languageDate;
		this.languageScoreList = languageScoreList;
		this.careerSeq = careerSeq;
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
		this.careerList = careerList;
		this.educationSeq = educationSeq;
		this.educationFlag = educationFlag;
		this.schoolName = schoolName;
		this.major = major;
		this.diploma = diploma;
		this.eduStartDate = eduStartDate;
		this.eduEndDate = eduEndDate;
		this.educationList = educationList;
	}

	public TotalResume() {
		super();
	}

	public int getResumeSeq() {
		return resumeSeq;
	}

	public void setResumeSeq(int resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public int getBasicSeq() {
		return basicSeq;
	}

	public void setBasicSeq(int basicSeq) {
		this.basicSeq = basicSeq;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPersonEmail() {
		return personEmail;
	}

	public void setPersonEmail(String personEmail) {
		this.personEmail = personEmail;
	}

	public String getPersonPhone() {
		return personPhone;
	}

	public void setPersonPhone(String personPhone) {
		this.personPhone = personPhone;
	}

	public String getPersonAddr() {
		return personAddr;
	}

	public void setPersonAddr(String personAddr) {
		this.personAddr = personAddr;
	}

	public int getAbilitySeq() {
		return abilitySeq;
	}

	public void setAbilitySeq(int abilitySeq) {
		this.abilitySeq = abilitySeq;
	}

	public List<String> getAbilityTitle() {
		return abilityTitle;
	}

	public void setAbilityTitle(List<String> abilityTitle) {
		this.abilityTitle = abilityTitle;
	}

	public List<String> getAbilityStatus() {
		return abilityStatus;
	}

	public void setAbilityStatus(List<String> abilityStatus) {
		this.abilityStatus = abilityStatus;
	}

	public List<String> getAbilityDetails() {
		return abilityDetails;
	}

	public void setAbilityDetails(List<String> abilityDetails) {
		this.abilityDetails = abilityDetails;
	}

	public ArrayList<Ability> getAbilityList() {
		return abilityList;
	}

	public void setAbilityList(ArrayList<Ability> abilityList) {
		this.abilityList = abilityList;
	}

	public int getActivitySeq() {
		return activitySeq;
	}

	public void setActivitySeq(int activitySeq) {
		this.activitySeq = activitySeq;
	}

	public List<String> getActivityTitle() {
		return activityTitle;
	}

	public void setActivityTitle(List<String> activityTitle) {
		this.activityTitle = activityTitle;
	}

	public List<String> getActivityOrg() {
		return activityOrg;
	}

	public void setActivityOrg(List<String> activityOrg) {
		this.activityOrg = activityOrg;
	}

	public List<String> getActivityDetails() {
		return activityDetails;
	}

	public void setActivityDetails(List<String> activityDetails) {
		this.activityDetails = activityDetails;
	}

	public ArrayList<Activity> getActivityList() {
		return activityList;
	}

	public void setActivityList(ArrayList<Activity> activityList) {
		this.activityList = activityList;
	}

	public int getCertiSeq() {
		return certiSeq;
	}

	public void setCertiSeq(int certiSeq) {
		this.certiSeq = certiSeq;
	}

	public List<String> getCertiTitle() {
		return certiTitle;
	}

	public void setCertiTitle(List<String> certiTitle) {
		this.certiTitle = certiTitle;
	}

	public List<String> getCertiOrg() {
		return certiOrg;
	}

	public void setCertiOrg(List<String> certiOrg) {
		this.certiOrg = certiOrg;
	}

	public List<String> getCertiDate() {
		return certiDate;
	}

	public void setCertiDate(List<String> certiDate) {
		this.certiDate = certiDate;
	}

	public ArrayList<Certificate> getCertificateList() {
		return certificateList;
	}

	public void setCertificateList(ArrayList<Certificate> certificateList) {
		this.certificateList = certificateList;
	}

	public int getLanguageSeq() {
		return languageSeq;
	}

	public void setLanguageSeq(int languageSeq) {
		this.languageSeq = languageSeq;
	}

	public List<String> getLanguageType() {
		return languageType;
	}

	public void setLanguageType(List<String> languageType) {
		this.languageType = languageType;
	}

	public List<String> getLanguageTitle() {
		return languageTitle;
	}

	public void setLanguageTitle(List<String> languageTitle) {
		this.languageTitle = languageTitle;
	}

	public List<String> getLanguageScore() {
		return languageScore;
	}

	public void setLanguageScore(List<String> languageScore) {
		this.languageScore = languageScore;
	}

	public List<String> getLanguageOrg() {
		return languageOrg;
	}

	public void setLanguageOrg(List<String> languageOrg) {
		this.languageOrg = languageOrg;
	}

	public List<String> getLanguageDate() {
		return languageDate;
	}

	public void setLanguageDate(List<String> languageDate) {
		this.languageDate = languageDate;
	}

	public ArrayList<LanguageScore> getLanguageScoreList() {
		return languageScoreList;
	}

	public void setLanguageScoreList(ArrayList<LanguageScore> languageScoreList) {
		this.languageScoreList = languageScoreList;
	}

	public int getCareerSeq() {
		return careerSeq;
	}

	public void setCareerSeq(int careerSeq) {
		this.careerSeq = careerSeq;
	}

	public List<String> getCompanyName() {
		return companyName;
	}

	public void setCompanyName(List<String> companyName) {
		this.companyName = companyName;
	}

	public List<String> getCareerStartDate() {
		return careerStartDate;
	}

	public void setCareerStartDate(List<String> careerStartDate) {
		this.careerStartDate = careerStartDate;
	}

	public List<String> getCareerEndDate() {
		return careerEndDate;
	}

	public void setCareerEndDate(List<String> careerEndDate) {
		this.careerEndDate = careerEndDate;
	}

	public List<String> getCareerPosition() {
		return careerPosition;
	}

	public void setCareerPosition(List<String> careerPosition) {
		this.careerPosition = careerPosition;
	}

	public List<String> getCareerCategory() {
		return careerCategory;
	}

	public void setCareerCategory(List<String> careerCategory) {
		this.careerCategory = careerCategory;
	}

	public List<String> getCareerDepartment() {
		return careerDepartment;
	}

	public void setCareerDepartment(List<String> careerDepartment) {
		this.careerDepartment = careerDepartment;
	}

	public List<String> getCareerRegion() {
		return careerRegion;
	}

	public void setCareerRegion(List<String> careerRegion) {
		this.careerRegion = careerRegion;
	}

	public List<String> getCareerSalary() {
		return careerSalary;
	}

	public void setCareerSalary(List<String> careerSalary) {
		this.careerSalary = careerSalary;
	}

	public List<String> getCareerTask() {
		return careerTask;
	}

	public void setCareerTask(List<String> careerTask) {
		this.careerTask = careerTask;
	}

	public List<String> getCareerDetails() {
		return careerDetails;
	}

	public void setCareerDetails(List<String> careerDetails) {
		this.careerDetails = careerDetails;
	}

	public ArrayList<Career> getCareerList() {
		return careerList;
	}

	public void setCareerList(ArrayList<Career> careerList) {
		this.careerList = careerList;
	}

	public int getEducationSeq() {
		return educationSeq;
	}

	public void setEducationSeq(int educationSeq) {
		this.educationSeq = educationSeq;
	}

	public List<String> getEducationFlag() {
		return educationFlag;
	}

	public void setEducationFlag(List<String> educationFlag) {
		this.educationFlag = educationFlag;
	}

	public List<String> getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(List<String> schoolName) {
		this.schoolName = schoolName;
	}

	public List<String> getMajor() {
		return major;
	}

	public void setMajor(List<String> major) {
		this.major = major;
	}

	public List<String> getDiploma() {
		return diploma;
	}

	public void setDiploma(List<String> diploma) {
		this.diploma = diploma;
	}

	public List<String> getEduStartDate() {
		return eduStartDate;
	}

	public void setEduStartDate(List<String> eduStartDate) {
		this.eduStartDate = eduStartDate;
	}

	public List<String> getEduEndDate() {
		return eduEndDate;
	}

	public void setEduEndDate(List<String> eduEndDate) {
		this.eduEndDate = eduEndDate;
	}

	public ArrayList<Education> getEducationList() {
		return educationList;
	}

	public void setEducationList(ArrayList<Education> educationList) {
		this.educationList = educationList;
	}

	@Override
	public String toString() {
		return "TotalResume [resumeSeq=" + resumeSeq + ", personId=" + personId + ", basicSeq=" + basicSeq
				+ ", personName=" + personName + ", birthDate=" + birthDate + ", gender=" + gender + ", personEmail="
				+ personEmail + ", personPhone=" + personPhone + ", personAddr=" + personAddr + ", abilitySeq="
				+ abilitySeq + ", abilityTitle=" + abilityTitle + ", abilityStatus=" + abilityStatus
				+ ", abilityDetails=" + abilityDetails + ", abilityList=" + abilityList + ", activitySeq=" + activitySeq
				+ ", activityTitle=" + activityTitle + ", activityOrg=" + activityOrg + ", activityDetails="
				+ activityDetails + ", activityList=" + activityList + ", certiSeq=" + certiSeq + ", certiTitle="
				+ certiTitle + ", certiOrg=" + certiOrg + ", certiDate=" + certiDate + ", certificateList="
				+ certificateList + ", languageSeq=" + languageSeq + ", languageType=" + languageType
				+ ", languageTitle=" + languageTitle + ", languageScore=" + languageScore + ", languageOrg="
				+ languageOrg + ", languageDate=" + languageDate + ", languageScoreList=" + languageScoreList
				+ ", careerSeq=" + careerSeq + ", companyName=" + companyName + ", careerStartDate=" + careerStartDate
				+ ", careerEndDate=" + careerEndDate + ", careerPosition=" + careerPosition + ", careerCategory="
				+ careerCategory + ", careerDepartment=" + careerDepartment + ", careerRegion=" + careerRegion
				+ ", careerSalary=" + careerSalary + ", careerTask=" + careerTask + ", careerDetails=" + careerDetails
				+ ", careerList=" + careerList + ", educationSeq=" + educationSeq + ", educationFlag=" + educationFlag
				+ ", schoolName=" + schoolName + ", major=" + major + ", diploma=" + diploma + ", eduStartDate="
				+ eduStartDate + ", eduEndDate=" + eduEndDate + ", educationList=" + educationList + "]";
	}

}// class
