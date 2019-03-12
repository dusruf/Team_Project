package com.Dostrike.www.vo;

public class Login {

	private String loginId;
	private String loginPw;

	public Login(String loginId, String loginPw) {
		super();
		this.loginId = loginId;
		this.loginPw = loginPw;
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

	@Override
	public String toString() {
		return "Login [loginId=" + loginId + ", loginPw=" + loginPw + "]";
	}

}// class
