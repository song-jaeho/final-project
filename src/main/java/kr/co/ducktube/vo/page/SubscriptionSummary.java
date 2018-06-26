package kr.co.ducktube.vo.page;

import java.util.Date;

public class SubscriptionSummary {

	private int videoNo;
	private int creatorNo;
	private String title;
	private Date createDate;
	private String videoStatus;
	private String formatDate;
	private String lastDate;
	private String whenToday;
	private int viewCount;
	
	private int userNo;
	
	private String creatorNick;
	
	private double duration;
	private String priviewA4URL;
	
	private String channelNotice;

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getWhenToday() {
		return whenToday;
	}

	public void setWhenToday(String whenToday) {
		this.whenToday = whenToday;
	}
	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public int getCreatorNo() {
		return creatorNo;
	}

	public void setCreatorNo(int creatorNo) {
		this.creatorNo = creatorNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getVideoStatus() {
		return videoStatus;
	}

	public void setVideoStatus(String videoStatus) {
		this.videoStatus = videoStatus;
	}

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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCreatorNick() {
		return creatorNick;
	}

	public void setCreatorNick(String creatorNick) {
		this.creatorNick = creatorNick;
	}

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}

	public String getPriviewA4URL() {
		return priviewA4URL;
	}

	public void setPriviewA4URL(String priviewA4URL) {
		this.priviewA4URL = priviewA4URL;
	}

	public String getChannelNotice() {
		return channelNotice;
	}

	public void setChannelNotice(String channelNotice) {
		this.channelNotice = channelNotice;
	}

	@Override
	public String toString() {
		return "SubscriptionSummary [videoNo=" + videoNo + ", creatorNo=" + creatorNo + ", title=" + title
				+ ", createDate=" + createDate + ", videoStatus=" + videoStatus + ", formatDate=" + formatDate
				+ ", lastDate=" + lastDate + ", whenToday=" + whenToday + ", viewCount=" + viewCount + ", userNo="
				+ userNo + ", creatorNick=" + creatorNick + ", duration=" + duration + ", priviewA4URL=" + priviewA4URL
				+ ", channelNotice=" + channelNotice + ", getViewCount()=" + getViewCount() + ", getWhenToday()="
				+ getWhenToday() + ", getVideoNo()=" + getVideoNo() + ", getCreatorNo()=" + getCreatorNo()
				+ ", getTitle()=" + getTitle() + ", getCreateDate()=" + getCreateDate() + ", getVideoStatus()="
				+ getVideoStatus() + ", getFormatDate()=" + getFormatDate() + ", getLastDate()=" + getLastDate()
				+ ", getUserNo()=" + getUserNo() + ", getCreatorNick()=" + getCreatorNick() + ", getDuration()="
				+ getDuration() + ", getPriviewA4URL()=" + getPriviewA4URL() + ", getChannelNotice()="
				+ getChannelNotice() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}