package kr.co.ducktube.vo.page;

import java.util.Date;

public class PlayerSummary {

	//{ table : VIDEOS
		private int videoNo;
		private int creatorNo;
		private int primaryCategoryNo;
		private int secondaryCategoryNo;
		private String title;
		private String detail;
		private String status;
		private Date createDate;
		private Date updateDate;
		private String subTitle;
	//}

		//{ table : VIDEO_META
		private String url;
		private int fps;
		private double duration;
		private String filename;
		private String previewA1Url;
		private String previewA2Url;
		private String previewA3Url;
		private String previewA4Url;
		private String externalLink;
		private String videoTime;
	//}
		
	public String getVideoTime() {
			return videoTime;
		}
		public void setVideoTime(String videoTime) {
			this.videoTime = videoTime;
		}
		// { table : users
		private int userNo;
		private String userNick;
		private String profileBigImgUrl;
		private String profileSmallImgUrl;
		private int userNo2;
	//}		
		
	// { table : video_categories
		private int categoryNo;
		private String categoryName;
	//}
	// { table :playlists
		private int playlistNo;
		private String playlistTitle;
	//}
	// { table :playlists
		private int playOrderNo;
	//}

		
		public String getSubTitle() {
			return subTitle;
		}
		public void setSubTitle(String subTitle) {
			this.subTitle = subTitle;
		}
		//날짜
		private String lastDate;
		
		private String formatDate;
		
	public String getFormatDate() {
			return formatDate;
		}
		public void setFormatDate(String formatDate) {
			this.formatDate = formatDate;
		}
		// getter/setter	
		public int getVideoNo() {
			return videoNo;
		}
		public String getLastDate() {
			return lastDate;
		}
		public void setLastDate(String lastDate) {
			this.lastDate = lastDate;
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
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDetail() {
			return detail;
		}
		public void setDetail(String detail) {
			this.detail = detail;
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
		public Date getUpdateDate() {
			return updateDate;
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
		public void setDuration(double duration) {
			this.duration = duration;
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
		public int getCategoryNo() {
			return categoryNo;
		}
		public void setCategoryNo(int categoryNo) {
			this.categoryNo = categoryNo;
		}
		public String getCategoryName() {
			return categoryName;
		}
		public void setCategoryName(String categoryName) {
			this.categoryName = categoryName;
		}
		public int getUserNo2() {
			return userNo2;
		}
		public void setUserNo2(int userNo2) {
			this.userNo2 = userNo2;
		}
		public String getPlaylistTitle() {
			return playlistTitle;
		}
		public void setPlaylistTitle(String playlistTitle) {
			this.playlistTitle = playlistTitle;
		}
		public int getplayOrderNo() {
			return playOrderNo;
		}
		public void setplayOrderNo(int playOrderNo) {
			this.playOrderNo = playOrderNo;
		}
		public int getPlaylistNo() {
			return playlistNo;
		}
		public void setPlaylistNo(int playlistNo) {
			this.playlistNo = playlistNo;
		}

		@Override
		public String toString() {
			return "PlayerSummary [videoNo=" + videoNo + ", creatorNo=" + creatorNo + ", primaryCategoryNo="
					+ primaryCategoryNo + ", secondaryCategoryNo=" + secondaryCategoryNo + ", title=" + title
					+ ", detail=" + detail + ", status=" + status + ", createDate=" + createDate + ", updateDate="
					+ updateDate + ", url=" + url + ", fps=" + fps + ", duration=" + duration + ", filename=" + filename
					+ ", previewA1Url=" + previewA1Url + ", previewA2Url=" + previewA2Url + ", previewA3Url="
					+ previewA3Url + ", previewA4Url=" + previewA4Url + ", externalLink=" + externalLink + ", userNo="
					+ userNo + ", userNick=" + userNick + ", profileBigImgUrl=" + profileBigImgUrl
					+ ", profileSmallImgUrl=" + profileSmallImgUrl + ", userNo2=" + userNo2 + ", categoryNo="
					+ categoryNo + ", categoryName=" + categoryName + ", playlistNo=" + playlistNo + ", playlistTitle="
					+ playlistTitle + ", lastDate=" + lastDate + ", formatDate="
					+ formatDate + "]";
		}
		
		
		
}
