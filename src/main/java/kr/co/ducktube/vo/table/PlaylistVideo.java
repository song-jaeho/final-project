package kr.co.ducktube.vo.table;

import java.util.Date;

public class PlaylistVideo {
	
// videos (A)

	private int no;
	private int creatorNo;
	private int primaryCategoryNo;
	private int secondaryCategoryNo;
	private int nextVideoNo;
	private String title;
	private String detail;
	private String status;
	private Date createDate;
	private Date releaseDate;

// video_categories (B)

	private int categoryNo;
	private String categoryName;

// video_comments (C)

	private int commentNo;
	private int commenterNo;
		//private int videoNo;	--> no로 대체
	private String commentContents;
	private String commentStatus;
	private Date commentCreateDate;

// video_meta (D)

		//private int video_no; --> no로 대체
	private String url;
	private int fps;
	private int duration;
	private String fileName;
	private String previewA1Url;
	private String previewA2Url;
	private String previewA3Url;
	private String previewA4Url;
	private String externalLink;

// video_report_history (E)

	private int reportUserNo;
		//private int videoNo; --> no로 대체
	private String reportContents;
	
// video_vote_history (F)
	
	private int voteUserNo;
		//private int videoNo; --> no로 대체
	private String side;
	
// getter setter
	
	public Date getCommentCreateDate() {
		return commentCreateDate;
	}
	public void setCommentCreateDate(Date commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}
	public int getVoteUserNo() {
		return voteUserNo;
	}
	public void setVoteUserNo(int voteUserNo) {
		this.voteUserNo = voteUserNo;
	}
	public String getSide() {
		return side;
	}
	public void setSide(String side) {
		this.side = side;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getNextVideoNo() {
		return nextVideoNo;
	}
	public void setNextVideoNo(int nextVideoNo) {
		this.nextVideoNo = nextVideoNo;
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
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
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
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getCommenterNo() {
		return commenterNo;
	}
	public void setCommenterNo(int commenterNo) {
		this.commenterNo = commenterNo;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public String getCommentStatus() {
		return commentStatus;
	}
	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
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
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public int getReportUserNo() {
		return reportUserNo;
	}
	public void setReportUserNo(int reportUserNo) {
		this.reportUserNo = reportUserNo;
	}
	public String getReportContents() {
		return reportContents;
	}
	public void setReportContents(String reportContents) {
		this.reportContents = reportContents;
	}
	@Override
	public String toString() {
		return "PlaylistVideo [no=" + no + ", creatorNo=" + creatorNo + ", primaryCategoryNo=" + primaryCategoryNo
				+ ", secondaryCategoryNo=" + secondaryCategoryNo + ", nextVideoNo=" + nextVideoNo + ", title=" + title
				+ ", detail=" + detail + ", status=" + status + ", createDate=" + createDate + ", releaseDate="
				+ releaseDate + ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", commentNo="
				+ commentNo + ", commenterNo=" + commenterNo + ", commentContents=" + commentContents
				+ ", commentStatus=" + commentStatus + ", commentCreateDate=" + commentCreateDate + ", url=" + url
				+ ", fps=" + fps + ", duration=" + duration + ", fileName=" + fileName + ", previewA1Url="
				+ previewA1Url + ", previewA2Url=" + previewA2Url + ", previewA3Url=" + previewA3Url + ", previewA4Url="
				+ previewA4Url + ", externalLink=" + externalLink + ", reportUserNo=" + reportUserNo
				+ ", reportContents=" + reportContents + ", voteUserNo=" + voteUserNo + ", side=" + side + "]";
	}

}
