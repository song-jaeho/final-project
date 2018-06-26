package kr.co.ducktube.vo.page;

import java.util.Date;

public class ReplySummary {
	private int no;
	private int commentNo;
	private int replierNo;
	private String contents;
	private String status;
	private Date createDate;
	private int userNo;
	private String userNick;
	private String profileBigImgUrl;
	private String profileSmallImgUrl;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getReplierNo() {
		return replierNo;
	}
	public void setReplierNo(int replierNo) {
		this.replierNo = replierNo;
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
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getProfileBigImgUrl() {
		return profileBigImgUrl;
	}
	public void setProfileBigImgUrl(String profileBigImgUrl) {
		this.profileBigImgUrl = profileBigImgUrl;
	}
	public String getProfileSmallImgUrl() {
		return profileSmallImgUrl;
	}
	public void setProfileSmallImgUrl(String profileSmallImgUrl) {
		this.profileSmallImgUrl = profileSmallImgUrl;
	}

	@Override
	public String toString() {
		return "ReplySummary [no=" + no + ", commentNo=" + commentNo + ", replierNo=" + replierNo + ", contents="
				+ contents + ", status=" + status + ", createDate=" + createDate + ", userNo=" + userNo + ", userNick="
				+ userNick + ", profileBigImgUrl=" + profileBigImgUrl + ", profileSmallImgUrl=" + profileSmallImgUrl
				+ "]";
	}
}
