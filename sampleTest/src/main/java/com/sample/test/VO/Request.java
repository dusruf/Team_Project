package com.sample.test.VO;

public class Request {

	private int requestSeq;
	private String hhId;
	private String comName;
	private String comAddr;
	private String jobTitle;
	private String explanation;

	public Request(int requestSeq, String hhId, String comName, String comAddr, String jobTitle, String explanation) {
		super();
		this.requestSeq = requestSeq;
		this.hhId = hhId;
		this.comName = comName;
		this.comAddr = comAddr;
		this.jobTitle = jobTitle;
		this.explanation = explanation;
	}

	public Request() {
		super();
	}

	public int getRequestSeq() {
		return requestSeq;
	}

	public void setRequestSeq(int requestSeq) {
		this.requestSeq = requestSeq;
	}

	public String getHhId() {
		return hhId;
	}

	public void setHhId(String hhId) {
		this.hhId = hhId;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getComAddr() {
		return comAddr;
	}

	public void setComAddr(String comAddr) {
		this.comAddr = comAddr;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	@Override
	public String toString() {
		return "Request [requestSeq=" + requestSeq + ", hhId=" + hhId + ", comName=" + comName + ", comAddr=" + comAddr
				+ ", jobTitle=" + jobTitle + ", explanation=" + explanation + "]";
	}

}
