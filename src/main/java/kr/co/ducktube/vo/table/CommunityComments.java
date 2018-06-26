package kr.co.ducktube.vo.table;

import java.util.Date;
public class CommunityComments {
	
	private Date createDate;
	private Integer no;
	private Integer commenterNo;
	private String status;
	private String contents;
	
	private String userImgUrl;
	private String userNick;
	
	private Integer commentLikeCount;
	private Integer commentDislikeCount;
	private Integer commentSumCount;
	private Integer commentReportStack;
	
	private String formattedDate;
	
	private CommunityReplies replies;
	
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

	public Integer getCommenterNo() {
		return commenterNo;
	}

	public void setCommenterNo(Integer commenterNo) {
		this.commenterNo = commenterNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public Integer getCommentLikeCount() {
		return commentLikeCount;
	}

	public void setCommentLikeCount(Integer commentLikeCount) {
		this.commentLikeCount = commentLikeCount;
	}

	public Integer getCommentDislikeCount() {
		return commentDislikeCount;
	}

	public void setCommentDislikeCount(Integer commentDislikeCount) {
		this.commentDislikeCount = commentDislikeCount;
	}

	public Integer getCommentSumCount() {
		return commentSumCount;
	}

	public void setCommentSumCount(Integer commentSumCount) {
		this.commentSumCount = commentSumCount;
	}

	public Integer getCommentReportStack() {
		return commentReportStack;
	}

	public void setCommentReportStack(Integer commentReportStack) {
		this.commentReportStack = commentReportStack;
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

	public CommunityReplies getReplies() {
		return replies;
	}

	public void setReplies(CommunityReplies replies) {
		this.replies = replies;
	}

	public History getHistory() {
		return history;
	}

	public void setHistory(History history) {
		this.history = history;
	}

	@Override
	public String toString() {
		return "CommunityComments [createDate=" + createDate + ", no=" + no + ", commenterNo=" + commenterNo
				+ ", status=" + status + ", contents=" + contents + ", userImgUrl=" + userImgUrl + ", userNick="
				+ userNick + ", commentLikeCount=" + commentLikeCount + ", commentDislikeCount=" + commentDislikeCount
				+ ", commentSumCount=" + commentSumCount + ", commentReportStack=" + commentReportStack
				+ ", formattedDate=" + formattedDate + ", replies=" + replies + ", user=" + user + ", history="
				+ history + "]";
	}

	
	
}
