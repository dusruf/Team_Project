package com.sample.test.VO;

public class Chat {

	private String chatSeq;
	private String roomSeq;
	private String userId;
	private String message;
	private String indate;

	public Chat(String chatSeq, String roomSeq, String userId, String message, String indate) {
		super();
		this.chatSeq = chatSeq;
		this.roomSeq = roomSeq;
		this.userId = userId;
		this.message = message;
		this.indate = indate;
	}

	public Chat() {
		super();
	}

	public String getChatSeq() {
		return chatSeq;
	}

	public void setChatSeq(String chatSeq) {
		this.chatSeq = chatSeq;
	}

	public String getRoomSeq() {
		return roomSeq;
	}

	public void setRoomSeq(String roomSeq) {
		this.roomSeq = roomSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "Chat [chatSeq=" + chatSeq + ", roomSeq=" + roomSeq + ", userId=" + userId + ", message=" + message
				+ ", indate=" + indate + "]";
	}

}
