package kr.co.ducktube.vo.table;

public class Subscription {

	private Integer userNo;
	
	private Integer ownerNo;
	
	private String notice;

	private String longDetail;
	
	private String imgUrl;
	
	private String title;
	
	private Integer unsightVideoCount;
	
	private Integer subscriptionCount;
	
	private Integer videoCount;
	
	private String userImgUrl;

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public Integer getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(Integer ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getUnsightVideoCount() {
		return unsightVideoCount;
	}

	public void setUnsightVideoCount(Integer unsightVideoCount) {
		this.unsightVideoCount = unsightVideoCount;
	}

	public Integer getSubscriptionCount() {
		return subscriptionCount;
	}

	public void setSubscriptionCount(Integer subscriptionCount) {
		this.subscriptionCount = subscriptionCount;
	}

	public Integer getVideoCount() {
		return videoCount;
	}

	public void setVideoCount(Integer videoCount) {
		this.videoCount = videoCount;
	}

	public String getUserImgUrl() {
		return userImgUrl;
	}

	public void setUserImgUrl(String userImgUrl) {
		this.userImgUrl = userImgUrl;
	}

	@Override
	public String toString() {
		return "Subscription [userNo=" + userNo + ", ownerNo=" + ownerNo + ", notice=" + notice + ", longDetail="
				+ longDetail + ", imgUrl=" + imgUrl + ", title=" + title + ", unsightVideoCount=" + unsightVideoCount
				+ ", subscriptionCount=" + subscriptionCount + ", videoCount=" + videoCount + ", userImgUrl="
				+ userImgUrl + "]";
	}

	
	
	
}
