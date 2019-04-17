package com.sample.test.VO;

public class DiaryInfo {
	private int diaryseq; 
	private String title;
	private String start;
	private String end;
	private String color;
	
	public DiaryInfo() {
		super();
	}

	public DiaryInfo(int diaryseq, String title, String start, String end, String color) {
		super();
		this.diaryseq = diaryseq;
		this.title = title;
		this.start = start;
		this.end = end;
		this.color = color;
	}

	public int getDiaryseq() {
		return diaryseq;
	}

	public void setDiaryseq(int diaryseq) {
		this.diaryseq = diaryseq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "DiaryInfo [diaryseq=" + diaryseq + ", title=" + title + ", start=" + start + ", end=" + end + ", color="
				+ color + "]";
	}
}
