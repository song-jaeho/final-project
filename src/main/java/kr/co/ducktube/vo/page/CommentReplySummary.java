package kr.co.ducktube.vo.page;

import java.util.Date;

import kr.co.ducktube.util.DateUtil;

public class CommentReplySummary {

	private Integer userNo;
	private String strNo;
	private Integer commentNo;
	private String commentContent;
	private Integer videoNo;
	private String videoTitle;
	private String type;
	private Integer rank;
	private String commentStatus;
	private String videoSub;
	private Date createDate;
	private String strCreateDate;
	
	public String getVideoSub() {
		return videoSub;
	}
	public void setVideoSub(String videoSub) {
		this.videoSub = videoSub;
	}
	public String getCommentStatus() {
		return commentStatus;
	}
	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}
	public String getStrCreateDate() {
		return strCreateDate;
	}
	public void setStrCreateDate(String strCreateDate) {
		this.strCreateDate = strCreateDate;
	}
	public String getStrNo() {
		return strNo;
	}
	public void setStrNo(String strNo) {
		this.strNo = strNo;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public Integer getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		if(createDate != null) {
			strCreateDate = DateUtil.getLastDateFromNow(createDate);
		}
		this.createDate = createDate;
	}
	public Integer getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(Integer videoNo) {
		this.videoNo = videoNo;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "CommentReplySummary [userNo=" + userNo + ", commentNo=" + commentNo + ", commentContent="
				+ commentContent + ", createDate=" + createDate + ", videoNo=" + videoNo + ", videoTitle=" + videoTitle
				+ ", type=" + type + ", rank=" + rank + "]";
	}
	
	
}
