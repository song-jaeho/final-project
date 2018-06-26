package kr.co.ducktube.vo.page;

import java.util.Date;

public class CommunitySummary {
	
	private Integer no;
	
	private Integer ownerNo;
	
	private String contents;
	
	private String status;
	
	private Date createDate;
	
	private Integer voteUserNo;
	
	private Integer reportUserNo;
	
	private Integer likeCount;
	
	private Integer dislikeCount;
	
	private Integer calculatedLikeCount;
	
	private Integer reportCount;
	
	private String formattedDate;
	
	private Integer commentCount;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(Integer ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getVoteUserNo() {
		return voteUserNo;
	}

	public void setVoteUserNo(Integer voteUserNo) {
		this.voteUserNo = voteUserNo;
	}

	public Integer getReportUserNo() {
		return reportUserNo;
	}

	public void setReportUserNo(Integer reportUserNo) {
		this.reportUserNo = reportUserNo;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getDislikeCount() {
		return dislikeCount;
	}

	public void setDislikeCount(Integer dislikeCount) {
		this.dislikeCount = dislikeCount;
	}

	public Integer getReportCount() {
		return reportCount;
	}

	public void setReportCount(Integer reportCount) {
		this.reportCount = reportCount;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}
	
	public Integer getCalculatedLikeCount() {
		return calculatedLikeCount;
	}

	public void setCalculatedLikeCount(Integer calculatedLikeCount) {
		this.calculatedLikeCount = calculatedLikeCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "CommunitySummary [no=" + no + ", ownerNo=" + ownerNo + ", contents=" + contents + ", status=" + status
				+ ", createDate=" + createDate + ", voteUserNo=" + voteUserNo + ", reportUserNo=" + reportUserNo
				+ ", likeCount=" + likeCount + ", dislikeCount=" + dislikeCount + ", calculatedLikeCount="
				+ calculatedLikeCount + ", reportCount=" + reportCount + ", formattedDate=" + formattedDate
				+ ", commentCount=" + commentCount + "]";
	}
	
	
}
