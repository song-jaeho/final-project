package kr.co.ducktube.vo.page;

import java.util.List;

import kr.co.ducktube.vo.table.CommunityWritings;

public class CommunityCommentSummary {

	private List<CommunityWritings> writing;
	
	private String userImgURL;
	private String userNick;
	
	private Integer commentLikeCount;
	private Integer commentDislikeCount;
	private Integer commentSumCount;
	private Integer commentReportStack;
	
	private Integer commentReplyLikeCount;
	private Integer commentReplyDislikeCount;
	private Integer commentReplySumCount;
	private Integer commentReplyReportStack;
	
	public List<CommunityWritings> getWriting() {
		return writing;
	}
	public void setWriting(List<CommunityWritings> writing) {
		this.writing = writing;
	}
	public String getUserImgURL() {
		return userImgURL;
	}
	public void setUserImgURL(String userImgURL) {
		this.userImgURL = userImgURL;
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
	@Override
	public String toString() {
		return "CommunityCommentSummary [writing=" + writing + ", userImgURL=" + userImgURL + ", userNick=" + userNick
				+ ", commentLikeCount=" + commentLikeCount + ", commentDislikeCount=" + commentDislikeCount
				+ ", commentSumCount=" + commentSumCount + ", commentReportStack=" + commentReportStack
				+ ", commentReplyLikeCount=" + commentReplyLikeCount + ", commentReplyDislikeCount="
				+ commentReplyDislikeCount + ", commentReplySumCount=" + commentReplySumCount
				+ ", commentReplyReportStack=" + commentReplyReportStack + "]";
	}
	
	
}
