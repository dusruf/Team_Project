package com.dostrike.perfectten.VO;

public class Options {

	private int optionSeq;
	private int requestSeq;
	private String comOption;
	private int ranking;

	public Options(int optionSeq, int requestSeq, String comOption, int ranking) {
		super();
		this.optionSeq = optionSeq;
		this.requestSeq = requestSeq;
		this.comOption = comOption;
		this.ranking = ranking;
	}

	public Options() {
		super();
	}

	public int getOptionSeq() {
		return optionSeq;
	}

	public void setOptionSeq(int optionSeq) {
		this.optionSeq = optionSeq;
	}

	public int getRequestSeq() {
		return requestSeq;
	}

	public void setRequestSeq(int requestSeq) {
		this.requestSeq = requestSeq;
	}

	public String getComOption() {
		return comOption;
	}

	public void setComOption(String comOption) {
		this.comOption = comOption;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	@Override
	public String toString() {
		return "Options [optionSeq=" + optionSeq + ", requestSeq=" + requestSeq + ", comOption=" + comOption
				+ ", ranking=" + ranking + "]";
	}

}
