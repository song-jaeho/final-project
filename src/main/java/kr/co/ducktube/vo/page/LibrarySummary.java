package kr.co.ducktube.vo.page;

import java.util.Date;

import kr.co.ducktube.util.DateUtil;
import kr.co.ducktube.util.StringUtil;
import kr.co.ducktube.util.TimeUtil;

public class LibrarySummary {

	private Integer userNo;
	private String userNick;
	private String profile_small_img_url;
	
	private Integer videoNo;
	private String title;
	private Integer creatorNo;
	private String masterNick;
	private Integer masterNo;
	private Integer duration;
	private String preview_a1_url;
	private String previewA2Url;
	private String previewA3Url;
	private String videoDetail;
	private String videoStatus;
	
	private Integer playlistNo;
	private Integer ownerNo;
	private String playlistTitle;
	private String playlistContents;
	private String playlistStatus;
	private String playlistRepImg;
	private Integer playlistOrder;
	
	private Integer communityWritingNo;
	private String communityContents;
	private String communityStatus;
	private Integer communityGood;
	private Integer communityBad;
	private Integer communityCommentCount;
	
	private Integer commentNo;
	private String commentContent;
	private String commentStatus;
	private Integer commentGood;
	private Integer commentBad;
	
	private Integer totalVideo;
	private Integer rank;
	private String side;
	private Integer videoCount;
	private Date watchHistoryCreateDate;
	private String lastDay;
	private Date createDate;
	private String createDateStr;
	private String durationStr;
	private String videoDetailShort;
	private Integer watchLaterNo;
	private String checkPlaylistVideo;
	
	public String getCheckPlaylistVideo() {
		return checkPlaylistVideo;
	}
	public void setCheckPlaylistVideo(String checkPlaylistVideo) {
		this.checkPlaylistVideo = checkPlaylistVideo;
	}
	public String getPreviewA3Url() {
		return previewA3Url;
	}
	public void setPreviewA3Url(String previewA3Url) {
		this.previewA3Url = previewA3Url;
	}
	public Integer getWatchLaterNo() {
		return watchLaterNo;
	}
	public void setWatchLaterNo(Integer watchLaterNo) {
		this.watchLaterNo = watchLaterNo;
	}
	public String getVideoDetailShort() {
		return videoDetailShort;
	}
	public String getDurationStr() {
		return durationStr;
	}
	public String getCreateDateStr() {
		return createDateStr;
	}
	
	public void setCreateDate(Date createDate) {
		if(createDate != null) {
			createDateStr = DateUtil.getLastDateFromNow(createDate);
		}
		this.createDate = createDate;
	}
	
	public String getLastDay() {
		return lastDay;
	}
	public void setLastDay(String lastDay) {
		this.lastDay = lastDay;
	}
	public Integer getTotalVideo() {
		return totalVideo;
	}
	public void setTotalVideo(Integer totalVideo) {
		this.totalVideo = totalVideo;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
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
	public String getCommentStatus() {
		return commentStatus;
	}
	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}
	public Integer getCommentGood() {
		return commentGood;
	}
	public void setCommentGood(Integer commentGood) {
		this.commentGood = commentGood;
	}
	public Integer getCommentBad() {
		return commentBad;
	}
	public void setCommentBad(Integer commentBad) {
		this.commentBad = commentBad;
	}
	public Integer getCommunityCommentCount() {
		return communityCommentCount;
	}
	public void setCommunityCommentCount(Integer communityCommentCount) {
		this.communityCommentCount = communityCommentCount;
	}
	public Integer getCommunityWritingNo() {
		return communityWritingNo;
	}
	public void setCommunityWritingNo(Integer communityWritingNo) {
		this.communityWritingNo = communityWritingNo;
	}
	public String getCommunityContents() {
		return communityContents;
	}
	public void setCommunityContents(String communityContents) {
		this.communityContents = communityContents;
	}
	public String getCommunityStatus() {
		return communityStatus;
	}
	public void setCommunityStatus(String communityStatus) {
		this.communityStatus = communityStatus;
	}
	public Integer getCommunityGood() {
		return communityGood;
	}
	public void setCommunityGood(Integer communityGood) {
		this.communityGood = communityGood;
	}
	public Integer getCommunityBad() {
		return communityBad;
	}
	public void setCommunityBad(Integer communityBad) {
		this.communityBad = communityBad;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public Date getWatchHistoryCreateDate() {
		return watchHistoryCreateDate;
	}
	public void setWatchHistoryCreateDate(Date watchHistoryCreateDate) {
		this.watchHistoryCreateDate = watchHistoryCreateDate;
	}
	public String getPreviewA2Url() {
		return previewA2Url;
	}
	public void setPreviewA2Url(String previewA2Url) {
		this.previewA2Url = previewA2Url;
	}
	public String getVideoStatus() {
		return videoStatus;
	}
	public void setVideoStatus(String videoStatus) {
		this.videoStatus = videoStatus;
	}
	public String getVideoDetail() {
		return videoDetail;
	}
	public void setVideoDetail(String videoDetail) {
		if(videoDetail != null) {
			videoDetailShort = StringUtil.getShortString(148, videoDetail);
		}
		this.videoDetail = videoDetail;
	}
	public Integer getPlaylistOrder() {
		return playlistOrder;
	}
	public void setPlaylistOrder(Integer playlistOrder) {
		this.playlistOrder = playlistOrder;
	}
	public Integer getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(Integer ownerNo) {
		this.ownerNo = ownerNo;
	}
	public String getPlaylistContents() {
		return playlistContents;
	}
	public void setPlaylistContents(String playlistContents) {
		this.playlistContents = playlistContents;
	}
	public String getPlaylistRepImg() {
		return playlistRepImg;
	}
	public void setPlaylistRepImg(String playlistRepImg) {
		this.playlistRepImg = playlistRepImg;
	}
	public String getPlaylistStatus() {
		return playlistStatus;
	}
	public void setPlaylistStatus(String playlistStatus) {
		this.playlistStatus = playlistStatus;
	}
	public String getPlaylistTitle() {
		return playlistTitle;
	}
	public void setPlaylistTitle(String playlistTitle) {
		this.playlistTitle = playlistTitle;
	}
	public Integer getPlaylistNo() {
		return playlistNo;
	}
	public void setPlaylistNo(Integer playlistNo) {
		this.playlistNo = playlistNo;
	}
	public Integer getMasterNo() {
		return masterNo;
	}
	public void setMasterNo(Integer masterNo) {
		this.masterNo = masterNo;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getProfile_small_img_url() {
		return profile_small_img_url;
	}
	public void setProfile_small_img_url(String profile_small_img_url) {
		this.profile_small_img_url = profile_small_img_url;
	}
	public Integer getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(Integer videoNo) {
		this.videoNo = videoNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getCreatorNo() {
		return creatorNo;
	}
	public void setCreatorNo(Integer creatorNo) {
		this.creatorNo = creatorNo;
	}
	public String getMasterNick() {
		return masterNick;
	}
	public void setMasterNick(String masterNick) {
		this.masterNick = masterNick;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		if(duration != null) {
			durationStr = TimeUtil.getTime(duration);
		}
		this.duration = duration;
	}
	public String getPreview_a1_url() {
		return preview_a1_url;
	}
	public void setPreview_a1_url(String preview_a1_url) {
		this.preview_a1_url = preview_a1_url;
	}
	public String getSide() {
		return side;
	}
	public void setSide(String side) {
		this.side = side;
	}
	public Integer getVideoCount() {
		return videoCount;
	}
	public void setVideoCount(Integer videoCount) {
		this.videoCount = videoCount;
	}
	@Override
	public String toString() {
		return "LibrarySummary [userNo=" + userNo + ", userNick=" + userNick + ", profile_small_img_url="
				+ profile_small_img_url + ", videoNo=" + videoNo + ", title=" + title + ", creatorNo=" + creatorNo
				+ ", masterNick=" + masterNick + ", masterNo=" + masterNo + ", duration=" + duration
				+ ", preview_a1_url=" + preview_a1_url + ", previewA2Url=" + previewA2Url + ", previewA3Url="
				+ previewA3Url + ", videoDetail=" + videoDetail + ", videoStatus=" + videoStatus + ", playlistNo="
				+ playlistNo + ", ownerNo=" + ownerNo + ", playlistTitle=" + playlistTitle + ", playlistContents="
				+ playlistContents + ", playlistStatus=" + playlistStatus + ", playlistRepImg=" + playlistRepImg
				+ ", playlistOrder=" + playlistOrder + ", communityWritingNo=" + communityWritingNo
				+ ", communityContents=" + communityContents + ", communityStatus=" + communityStatus
				+ ", communityGood=" + communityGood + ", communityBad=" + communityBad + ", communityCommentCount="
				+ communityCommentCount + ", commentNo=" + commentNo + ", commentContent=" + commentContent
				+ ", commentStatus=" + commentStatus + ", commentGood=" + commentGood + ", commentBad=" + commentBad
				+ ", totalVideo=" + totalVideo + ", rank=" + rank + ", side=" + side + ", videoCount=" + videoCount
				+ ", watchHistoryCreateDate=" + watchHistoryCreateDate + ", lastDay=" + lastDay + ", createDate="
				+ createDate + ", createDateStr=" + createDateStr + ", durationStr=" + durationStr
				+ ", videoDetailShort=" + videoDetailShort + ", watchLaterNo=" + watchLaterNo + ", checkPlaylistVideo="
				+ checkPlaylistVideo + "]";
	}

	
	
}
