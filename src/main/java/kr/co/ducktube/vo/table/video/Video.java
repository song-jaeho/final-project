package kr.co.ducktube.vo.table.video;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.co.ducktube.util.DateUtil;
import kr.co.ducktube.util.StringUtil;
import kr.co.ducktube.util.TimeUtil;

public class Video {

//{ table : VIDEOS
	private int no;
	
	private int creatorNo;
	
	private int nextVideoNo;
	
	private Video nextVideo;
	
	private int primaryCategoryNo;
	
	private int secondaryCategoryNo;
	
	private String title;
	
	private String detail;
	
	private String status;
	
	private Date createDate;
	
	private Date updateDate;
//}
	
//{ table : VIDEO_META
	private String url;
	
	private int fps;
	
	private double duration;
	
	private String durationStr;
	
	private String filename;
	
	private String previewA1Url;
	
	private String previewA2Url;
	
	private String previewA3Url;
	
	private String previewA4Url;
	
	private String externalLink;
//}
	
//{ table : tags	
	private List<String> tagList = new ArrayList<String>();
	
	private String tags;
//}	

// { table : watch_history
	private Integer watchCount;
// }	

// { table :users
	private String userNick;
// }	
	
	private Integer proximityPoint;
	
	private Integer likeCount;
	
	private Integer hateCount;
	
	private double grade;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCreatorNo() {
		return creatorNo;
	}

	public int getNextVideoNo() {
		return nextVideoNo;
	}

	public void setNextVideoNo(int nextVideoNo) {
		this.nextVideoNo = nextVideoNo;
	}
	
	public void setCreatorNo(int creatorNo) {
		this.creatorNo = creatorNo;
	}

	public int getPrimaryCategoryNo() {
		return primaryCategoryNo;
	}

	public void setPrimaryCategoryNo(int primaryCategoryNo) {
		this.primaryCategoryNo = primaryCategoryNo;
	}

	public int getSecondaryCategoryNo() {
		return secondaryCategoryNo;
	}

	public void setSecondaryCategoryNo(int secondaryCategoryNo) {
		this.secondaryCategoryNo = secondaryCategoryNo;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getCreateDateStr() {
		return DateUtil.getLastDateFromNow(createDate);
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public String getUpdateDateStr() {
		if(updateDate != null) {
			return DateUtil.getLastDateFromNow(updateDate);
		}
		return null;
	}
	
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getFps() {
		return fps;
	}

	public void setFps(int fps) {
		this.fps = fps;
	}

	public double getDuration() {
		return duration;
	}

	public void setDuration(Double duration) {
		durationStr = TimeUtil.getTime(duration.intValue());
		this.duration = duration;
	}

	public String getDurationStr() {
		return durationStr;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getPreviewA1Url() {
		return previewA1Url;
	}

	public void setPreviewA1Url(String previewA1Url) {
		this.previewA1Url = previewA1Url;
	}

	public String getPreviewA2Url() {
		return previewA2Url;
	}

	public void setPreviewA2Url(String previewA2Url) {
		this.previewA2Url = previewA2Url;
	}

	public String getPreviewA3Url() {
		return previewA3Url;
	}

	public void setPreviewA3Url(String previewA3Url) {
		this.previewA3Url = previewA3Url;
	}

	public String getPreviewA4Url() {
		return previewA4Url;
	}

	public void setPreviewA4Url(String previewA4Url) {
		this.previewA4Url = previewA4Url;
	}

	public String getExternalLink() {
		return externalLink;
	}

	public void setExternalLink(String externalLink) {
		this.externalLink = externalLink;
	}

	public String getMiddleSizeTitle() {
		return StringUtil.getShortString(30, title);
	}
	
	public String getShortTitle() {
		return StringUtil.getShortString(22, title);
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		String[] tagArray = tags.split(",");
		for(String tag : tagArray) {
			this.tagList.add(tag);
		}
		this.tags = tags;
	}

	public List<String> getTagList() {
		return tagList;
	}

	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}

	public Video getNextVideo() {
		return nextVideo;
	}

	public void setNextVideo(Video nextVideo) {
		this.nextVideo = nextVideo;
	}

	public Integer getWatchCount() {
		return watchCount;
	}

	public void setWatchCount(Integer watchCount) {
		this.watchCount = watchCount;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public Integer getProximityPoint() {
		return proximityPoint;
	}

	public void setProximityPoint(Integer proximityPoint) {
		this.proximityPoint = proximityPoint;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getHateCount() {
		return hateCount;
	}

	public void setHateCount(Integer hateCount) {
		this.hateCount = hateCount;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Video [no=" + no + ", creatorNo=" + creatorNo + ", nextVideoNo=" + nextVideoNo + ", nextVideo="
				+ nextVideo + ", primaryCategoryNo=" + primaryCategoryNo + ", secondaryCategoryNo="
				+ secondaryCategoryNo + ", title=" + title + ", detail=" + detail + ", status=" + status
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + ", url=" + url + ", fps=" + fps
				+ ", duration=" + duration + ", filename=" + filename + ", previewA1Url=" + previewA1Url
				+ ", previewA2Url=" + previewA2Url + ", previewA3Url=" + previewA3Url + ", previewA4Url=" + previewA4Url
				+ ", externalLink=" + externalLink + ", tagList=" + tagList + ", tags=" + tags + ", watchCount="
				+ watchCount + ", userNick=" + userNick + ", proximityPoint=" + proximityPoint + ", likeCount="
				+ likeCount + ", hateCount=" + hateCount + ", grade=" + grade + "]";
	}

}
