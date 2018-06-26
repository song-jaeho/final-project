package kr.co.ducktube.vo.page;

import kr.co.ducktube.util.StringUtil;
import kr.co.ducktube.vo.table.User;
import kr.co.ducktube.vo.table.video.Video;

public class VideoSummary {

	private Video video;
	
	private User creator;

	private String primaryCategoryName;
	
	private String secondaryCategoryName;
	
	private String formattedDate;
	
	private String formattedDuration;
	
	private int likeCount;
	
	private int hateCount;
	
	private int watchCount;

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public String getPrimaryCategoryName() {
		return primaryCategoryName;
	}

	public void setPrimaryCategoryName(String primaryCategoryName) {
		this.primaryCategoryName = primaryCategoryName;
	}

	public String getSecondaryCategoryName() {
		return secondaryCategoryName;
	}

	public void setSecondaryCategoryName(String secondaryCategoryName) {
		this.secondaryCategoryName = secondaryCategoryName;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

	public String getFormattedDuration() {
		return formattedDuration;
	}

	public void setFormattedDuration(String formattedDuration) {
		this.formattedDuration = formattedDuration;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getHateCount() {
		return hateCount;
	}

	public void setHateCount(int hateCount) {
		this.hateCount = hateCount;
	}

	public int getWatchCount() {
		return watchCount;
	}

	public void setWatchCount(int watchCount) {
		this.watchCount = watchCount;
	}

	public String getShortTitle() {
		return StringUtil.getShortString(22, video.getTitle());
	}
	
	@Override
	public String toString() {
		return "VideoSummary [video=" + video + ", creator=" + creator + ", primaryCategoryName=" + primaryCategoryName
				+ ", secondaryCategoryName=" + secondaryCategoryName + ", formattedDate=" + formattedDate
				+ ", formattedDuration=" + formattedDuration + ", likeCount=" + likeCount + ", hateCount=" + hateCount
				+ ", watchCount=" + watchCount + "]";
	}
	
}
