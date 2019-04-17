package com.sample.test.VO;

public class QnaComment {

	private int commentSeq;
	private int qBoardSeq;
	private String hhId;
	private String hhName;
	private String comments;
	private String indate;
	private int parentSeq;

	public QnaComment(int commentSeq, int qBoardSeq, String hhId, String hhName, String comments, String indate,
			int parentSeq) {
		super();
		this.commentSeq = commentSeq;
		this.qBoardSeq = qBoardSeq;
		this.hhId = hhId;
		this.hhName = hhName;
		this.comments = comments;
		this.indate = indate;
		this.parentSeq = parentSeq;
	}

	public QnaComment() {
		super();
	}

	public int getCommentSeq() {
		return commentSeq;
	}

	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}

	public int getqBoardSeq() {
		return qBoardSeq;
	}

	public void setqBoardSeq(int qBoardSeq) {
		this.qBoardSeq = qBoardSeq;
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

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public int getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}

	@Override
	public String toString() {
		return "QnaComment [commentSeq=" + commentSeq + ", qBoardSeq=" + qBoardSeq + ", hhId=" + hhId + ", hhName="
				+ hhName + ", comments=" + comments + ", indate=" + indate + ", parentSeq=" + parentSeq + "]";
	}

}// class
