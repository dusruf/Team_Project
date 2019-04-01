package com.dostrike.perfectten.VO;

public class ContactMessage {

	private int cmSeq;
	private String hhId;
	private String hhName;
	private String personId;
	private String personName;
	private String contactTitle;
	private String contactMessage;
	private String cmIndate;
	private int cmStatus;

	public ContactMessage(int cmSeq, String hhId, String hhName, String personId, String personName,
			String contactTitle, String contactMessage, String cmIndate, int cmStatus) {
		super();
		this.cmSeq = cmSeq;
		this.hhId = hhId;
		this.hhName = hhName;
		this.personId = personId;
		this.personName = personName;
		this.contactTitle = contactTitle;
		this.contactMessage = contactMessage;
		this.cmIndate = cmIndate;
		this.cmStatus = cmStatus;
	}

	public ContactMessage() {
		super();
	}

	public int getCmSeq() {
		return cmSeq;
	}

	public void setCmSeq(int cmSeq) {
		this.cmSeq = cmSeq;
	}

	public String getHhId() {
		return hhId;
	}

	public void setHhId(String hhId) {
		this.hhId = hhId;
	}

	public String getHhName() {
		return hhName;
	}

	public void setHhName(String hhName) {
		this.hhName = hhName;
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

	public String getContactTitle() {
		return contactTitle;
	}

	public void setContactTitle(String contactTitle) {
		this.contactTitle = contactTitle;
	}

	public String getContactMessage() {
		return contactMessage;
	}

	public void setContactMessage(String contactMessage) {
		this.contactMessage = contactMessage;
	}

	public String getCmIndate() {
		return cmIndate;
	}

	public void setCmIndate(String cmIndate) {
		this.cmIndate = cmIndate;
	}

	public int getCmStatus() {
		return cmStatus;
	}

	public void setCmStatus(int cmStatus) {
		this.cmStatus = cmStatus;
	}

	@Override
	public String toString() {
		return "ContactMessage [cmSeq=" + cmSeq + ", hhId=" + hhId + ", hhName=" + hhName + ", personId=" + personId
				+ ", personName=" + personName + ", contactTitle=" + contactTitle + ", contactMessage=" + contactMessage
				+ ", cmIndate=" + cmIndate + ", cmStatus=" + cmStatus + "]";
	}

}// class
