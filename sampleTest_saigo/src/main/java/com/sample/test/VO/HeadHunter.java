package com.sample.test.VO;

public class HeadHunter {

	private String hhId;
	private String hhPw;
	private String cdn;
	private String hhName;
	private String representative;
	private String phone;
	private String addr;
	private String hhEmail;
	private int loginFlag;

	public HeadHunter(String hhId, String hhPw, String cdn, String hhName, String representative, String phone,
			String addr, String hhEmail, int loginFlag) {
		super();
		this.hhId = hhId;
		this.hhPw = hhPw;
		this.cdn = cdn;
		this.hhName = hhName;
		this.representative = representative;
		this.phone = phone;
		this.addr = addr;
		this.hhEmail = hhEmail;
		this.loginFlag = loginFlag;
	}

	public HeadHunter() {
		super();
	}

	public String getHhId() {
		return hhId;
	}

	public void setHhId(String hhId) {
		this.hhId = hhId;
	}

	public String getHhPw() {
		return hhPw;
	}

	public void setHhPw(String hhPw) {
		this.hhPw = hhPw;
	}

	public String getCdn() {
		return cdn;
	}

	public void setCdn(String cdn) {
		this.cdn = cdn;
	}

	public String getHhName() {
		return hhName;
	}

	public void setHhName(String hhName) {
		this.hhName = hhName;
	}

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getHhEmail() {
		return hhEmail;
	}

	public void setHhEmail(String hhEmail) {
		this.hhEmail = hhEmail;
	}

	public int getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}

	@Override
	public String toString() {
		return "HeadHunter [hhId=" + hhId + ", hhPw=" + hhPw + ", cdn=" + cdn + ", hhName=" + hhName
				+ ", representative=" + representative + ", phone=" + phone + ", addr=" + addr + ", hhEmail=" + hhEmail
				+ ", loginFlag=" + loginFlag + "]";
	}

}// class
