package com.sample.test.VO;

public class PersonList {

	private int listSeq;
	private String hhId;
	private String personId;
	private String personName;
	private int requestSeq;
	private String comName;
	private String jobTitle;
	private int status;
	private String indate;
	private int contactFlag;

	public PersonList(int listSeq, String hhId, String personId, String personName, int requestSeq, String comName,
			String jobTitle, int status, String indate, int contactFlag) {
		super();
		this.listSeq = listSeq;
		this.hhId = hhId;
		this.personId = personId;
		this.personName = personName;
		this.requestSeq = requestSeq;
		this.comName = comName;
		this.jobTitle = jobTitle;
		this.status = status;
		this.indate = indate;
		this.contactFlag = contactFlag;
	}

	public PersonList() {
		super();
	}

	public int getListSeq() {
		return listSeq;
	}

	public void setListSeq(int listSeq) {
		this.listSeq = listSeq;
	}

	public String getHhId() {
		return hhId;
	}

	public void setHhId(String hhId) {
		this.hhId = hhId;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public int getRequestSeq() {
		return requestSeq;
	}

	public void setRequestSeq(int requestSeq) {
		this.requestSeq = requestSeq;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public int getContactFlag() {
		return contactFlag;
	}

	public void setContactFlag(int contactFlag) {
		this.contactFlag = contactFlag;
	}

	@Override
	public String toString() {
		return "PersonList [listSeq=" + listSeq + ", hhId=" + hhId + ", personId=" + personId + ", personName="
				+ personName + ", requestSeq=" + requestSeq + ", comName=" + comName + ", jobTitle=" + jobTitle
				+ ", status=" + status + ", indate=" + indate + ", contactFlag=" + contactFlag + "]";
	}

}
