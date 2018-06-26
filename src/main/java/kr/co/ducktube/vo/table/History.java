package kr.co.ducktube.vo.table;

import java.util.Date;

public class History {

	private Integer userNo;
	
	private Integer targetNo;
	
	private String voteSide;
	
	private Date createDate;
	
	private Date newDate;
	
	private String reportContents;

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public Integer getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(Integer targetNo) {
		this.targetNo = targetNo;
	}

	public String getVoteSide() {
		return voteSide;
	}

	public void setVoteSide(String voteSide) {
		this.voteSide = voteSide;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getReportContents() {
		return reportContents;
	}

	public void setReportContents(String contents) {
		this.reportContents = contents;
	}

	public Date getNewDate() {
		return newDate;
	}

	public void setNewDate(Date newDate) {
		this.newDate = newDate;
	}

	@Override
	public String toString() {
		return "History [userNo=" + userNo + ", targetNo=" + targetNo + ", voteSide=" + voteSide + ", createDate="
				+ createDate + ", newDate=" + newDate + ", reportContents=" + reportContents + "]";
	}

}
