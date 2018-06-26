package kr.co.ducktube.vo.page;

import java.util.Date;

public class ChannelSummary {
	
	private Integer ownerNo;
	private String title;
	private String longDetail;
	private String imgUrl;
	private Integer userNo;
	
	private Integer subscribeCount;
	private String subscribe;
	
	private Integer totalViewCount;
	private Date createDate;
	
	private String formattedDate;
	
	private String userImgUrl;

	public Integer getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(Integer ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLongDetail() {
		return longDetail;
	}

	public void setLongDetail(String longDetail) {
		this.longDetail = longDetail;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public Integer getSubscribeCount() {
		return subscribeCount;
	}

	public void setSubscribeCount(Integer subscribeCount) {
		this.subscribeCount = subscribeCount;
	}

	public String getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}

	public Integer getTotalViewCount() {
		return totalViewCount;
	}

	public void setTotalViewCount(Integer totalViewCount) {
		this.totalViewCount = totalViewCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}
	public String getUserImgUrl() {
		return userImgUrl;
	}

	public void setUserImgUrl(String userImgUrl) {
		this.userImgUrl = userImgUrl;
	}

	@Override
	public String toString() {
		return "ChannelSummary [ownerNo=" + ownerNo + ", title=" + title + ", longDetail=" + longDetail + ", imgUrl="
				+ imgUrl + ", userNo=" + userNo + ", subscribeCount=" + subscribeCount + ", subscribe=" + subscribe
				+ ", totalViewCount=" + totalViewCount + ", createDate=" + createDate + ", formattedDate="
				+ formattedDate + ", userImgUrl=" + userImgUrl + "]";
	}
	
	
}
