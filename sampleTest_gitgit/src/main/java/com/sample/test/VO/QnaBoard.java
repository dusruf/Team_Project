package com.sample.test.VO;

public class QnaBoard {

	private int qBoardSeq;
	private String personId;
	private String title;
	private String contents;
	private int hitcount;
	private String indate;
	private int commentNum;

	public QnaBoard(int qBoardSeq, String personId, String title, String contents, int hitcount, String indate,
			int commentNum) {
		super();
		this.qBoardSeq = qBoardSeq;
		this.personId = personId;
		this.title = title;
		this.contents = contents;
		this.hitcount = hitcount;
		this.indate = indate;
		this.commentNum = commentNum;
	}

	public QnaBoard() {
		super();
	}

	public int getqBoardSeq() {
		return qBoardSeq;
	}

	public void setqBoardSeq(int qBoardSeq) {
		this.qBoardSeq = qBoardSeq;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	@Override
	public String toString() {
		return "QnaBoard [qBoardSeq=" + qBoardSeq + ", personId=" + personId + ", title=" + title + ", contents="
				+ contents + ", hitcount=" + hitcount + ", indate=" + indate + ", commentNum=" + commentNum + "]";
	}

}
