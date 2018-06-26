package kr.co.ducktube.vo.table;

import java.util.Date;
import java.util.List;

import kr.co.ducktube.vo.page.VideoSummary;

public class Playlist {
	
	private Integer no;
	private Integer ownerNo;
	private String title;
	private String contents;
	private String status;
	private String img;
	private Date createDate;
	private Date updateDate;
	
	private List<VideoSummary> videos;

	private Integer videoOrder;
	private Integer videoCount;

	private String formattedRecentUpdateDate;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public List<VideoSummary> getVideos() {
		return videos;
	}

	public void setVideos(List<VideoSummary> videos) {
		this.videos = videos;
	}

	public Integer getVideoOrder() {
		return videoOrder;
	}

	public void setVideoOrder(Integer videoOrder) {
		this.videoOrder = videoOrder;
	}

	public Integer getVideoCount() {
		return videoCount;
	}

	public void setVideoCount(Integer videoCount) {
		this.videoCount = videoCount;
	}

	public String getFormattedRecentUpdateDate() {
		return formattedRecentUpdateDate;
	}

	public void setFormattedRecentUpdateDate(String formattedRecentUpdateDate) {
		this.formattedRecentUpdateDate = formattedRecentUpdateDate;
	}

	@Override
	public String toString() {
		return "Playlist [no=" + no + ", ownerNo=" + ownerNo + ", title=" + title + ", contents=" + contents
				+ ", status=" + status + ", img=" + img + ", createDate=" + createDate + ", updateDate=" + updateDate
				+ ", videos=" + videos + ", videoOrder=" + videoOrder + ", videoCount=" + videoCount
				+ ", formattedRecentUpdateDate=" + formattedRecentUpdateDate + "]";
	}
	

	
	
}
