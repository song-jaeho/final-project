package kr.co.ducktube.vo.table;

import java.util.Date;

public class CommunityReplies {
	
	private Date createDate;
	private Integer no;
	private String contents;
	private String status;
	private Integer replyerNo;
	
	private String userImgUrl;
	private String userNick;
	
	private Integer commentReplyLikeCount;
	private Integer commentReplyDislikeCount;
	private Integer commentReplySumCount;
	private Integer commentReplyReportStack;
	
	private String formattedDate;
	
	private User user;
	
	private History history;

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
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

	public Integer getReplyerNo() {
		return replyerNo;
	}

	public void setReplyerNo(Integer replyerNo) {
		this.replyerNo = replyerNo;
	}

	public String getUserImgUrl() {
		return userImgUrl;
	}

	public void setUserImgUrl(String userImgUrl) {
		this.userImgUrl = userImgUrl;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public Integer getCommentReplyLikeCount() {
		return commentReplyLikeCount;
	}

	public void setCommentReplyLikeCount(Integer commentReplyLikeCount) {
		this.commentReplyLikeCount = commentReplyLikeCount;
	}

	public Integer getCommentReplyDislikeCount() {
		return commentReplyDislikeCount;
	}

	public void setCommentReplyDislikeCount(Integer commentReplyDislikeCount) {
		this.commentReplyDislikeCount = commentReplyDislikeCount;
	}

	public Integer getCommentReplySumCount() {
		return commentReplySumCount;
	}

	public void setCommentReplySumCount(Integer commentReplySumCount) {
		this.commentReplySumCount = commentReplySumCount;
	}

	public Integer getCommentReplyReportStack() {
		return commentReplyReportStack;
	}

	public void setCommentReplyReportStack(Integer commentReplyReportStack) {
		this.commentReplyReportStack = commentReplyReportStack;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public History getHistory() {
		return history;
	}

	public void setHistory(History history) {
		this.history = history;
	}

	@Override
	public String toString() {
		return "CommunityReplies [createDate=" + createDate + ", no=" + no + ", contents=" + contents + ", status="
				+ status + ", replyerNo=" + replyerNo + ", userImgUrl=" + userImgUrl + ", userNick=" + userNick
				+ ", commentReplyLikeCount=" + commentReplyLikeCount + ", commentReplyDislikeCount="
				+ commentReplyDislikeCount + ", commentReplySumCount=" + commentReplySumCount
				+ ", commentReplyReportStack=" + commentReplyReportStack + ", formattedDate=" + formattedDate
				+ ", user=" + user + ", history=" + history + "]";
	}
	
	
	
}
