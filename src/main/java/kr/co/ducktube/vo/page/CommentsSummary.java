package kr.co.ducktube.vo.page;

import java.util.Date;

public class CommentsSummary {

	private int no;
	private int commenterNo;
	private int videoNo;
	private String contents;
	private String status;
	private Date createDate;
	private int userNo;
	private String userNick;
	private String profileBigImgUrl;
	private String profileSmallImgUrl;
	private String formatDate;
	private String lastDate;
	
	public String getFormatDate() {
		return formatDate;
	}
	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCommenterNo() {
		return commenterNo;
	}
	public void setCommenterNo(int commenterNo) {
		this.commenterNo = commenterNo;
	}
	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
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
		return "CommentsSummary [no=" + no + ", commenterNo=" + commenterNo + ", videoNo=" + videoNo + ", contents="
				+ contents + ", status=" + status + ", createDate=" + createDate + ", userNo=" + userNo + ", userNick="
				+ userNick + ", profileBigImgUrl=" + profileBigImgUrl + ", profileSmallImgUrl=" + profileSmallImgUrl
				+ "]";
	}
}
