package com.sample.test.VO;

public class Person {

	private String personId;
	private String personPw;
	private String personName;
	private String personEmail;
	private int loginFlag;

	public Person(String personId, String personPw, String personName, String personEmail, int loginFlag) {
		super();
		this.personId = personId;
		this.personPw = personPw;
		this.personName = personName;
		this.personEmail = personEmail;
		this.loginFlag = loginFlag;
	}

	public Person() {
		super();
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getPersonPw() {
		return personPw;
	}

	public void setPersonPw(String personPw) {
		this.personPw = personPw;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPersonEmail() {
		return personEmail;
	}

	public void setPersonEmail(String personEmail) {
		this.personEmail = personEmail;
	}

	public int getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}

	@Override
	public String toString() {
		return "Person [personId=" + personId + ", personPw=" + personPw + ", personName=" + personName
				+ ", personEmail=" + personEmail + ", loginFlag=" + loginFlag + "]";
	}

}// class