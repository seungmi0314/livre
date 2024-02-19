package com.livre.model.bean;

public class Rank {
	private int rankNo;
	private String rankName;
	
	public int getRankNo() {
		return rankNo;
	}
	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public Rank(int rankNo, String rankName) {
		super();
		this.rankNo = rankNo;
		this.rankName = rankName;
	}
	public Rank() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Rank [rankNo=" + rankNo + ", rankName=" + rankName + "]";
	}
	
	

}
