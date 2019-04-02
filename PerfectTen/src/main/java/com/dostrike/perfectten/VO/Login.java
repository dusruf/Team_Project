package com.dostrike.perfectten.VO;

public class Login {

	private String loginId;
	private String loginPw;
	private int loginFlag;

	public Login(String loginId, String loginPw, int loginFlag) {
		super();
		this.loginId = loginId;
		this.loginPw = loginPw;
		this.loginFlag = loginFlag;
	}

	public Login() {
		super();
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPw() {
		return loginPw;
	}

	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}

	public int getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}

	@Override
	public String toString() {
		return "Login [loginId=" + loginId + ", loginPw=" + loginPw + ", loginFlag=" + loginFlag + "]";
	}

}// class
