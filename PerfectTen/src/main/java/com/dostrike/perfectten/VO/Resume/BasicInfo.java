package com.dostrike.perfectten.VO.Resume;

import java.util.ArrayList;

public class BasicInfo {

	private int resumeSeq;
	private String personId;

	private int basicSeq;
	private String personName;
	private String birthDate;
	private String gender;
	private String personEmail;
	private String personPhone;
	private String personAddr;

	public BasicInfo(int resumeSeq, String personId, int basicSeq, String personName, String birthDate, String gender,
			String personEmail, String personPhone, String personAddr) {
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
	}

	public BasicInfo() {
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

	@Override
	public String toString() {
		return "BasicInfo [resumeSeq=" + resumeSeq + ", personId=" + personId + ", basicSeq=" + basicSeq
				+ ", personName=" + personName + ", birthDate=" + birthDate + ", gender=" + gender + ", personEmail="
				+ personEmail + ", personPhone=" + personPhone + ", personAddr=" + personAddr + "]";
	}

}//
