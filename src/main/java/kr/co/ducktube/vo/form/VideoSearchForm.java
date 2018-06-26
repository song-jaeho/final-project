package kr.co.ducktube.vo.form;

public class VideoSearchForm {

	private String createDate;

	private String type;

	private String function;
	
	private String sortBy;

	private Integer primaryCategoryNo;

	private Integer pno;

	private String keywords;

	private Integer videoStartRn;
	
	private Integer videoEndRn;
	
	private Integer channelStartRn;
	
	private Integer channelEndRn;
	
	private Integer playlistStartRn;
	
	private Integer playlistEndRn;
	
	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public Integer getPrimaryCategoryNo() {
		return primaryCategoryNo;
	}

	public void setPrimaryCategoryNo(Integer primaryCategoryNo) {
		this.primaryCategoryNo = primaryCategoryNo;
	}

	public Integer getPno() {
		return pno;
	}

	public void setPno(Integer pno) {
		this.pno = pno;
	}

	public Integer getVideoStartRn() {
		return videoStartRn;
	}

	public void setVideoStartRn(Integer videoStartRn) {
		this.videoStartRn = videoStartRn;
	}

	public Integer getVideoEndRn() {
		return videoEndRn;
	}

	public void setVideoEndRn(Integer videoEndRn) {
		this.videoEndRn = videoEndRn;
	}

	public Integer getChannelStartRn() {
		return channelStartRn;
	}

	public void setChannelStartRn(Integer channelStartRn) {
		this.channelStartRn = channelStartRn;
	}

	public Integer getChannelEndRn() {
		return channelEndRn;
	}

	public void setChannelEndRn(Integer channelEndRn) {
		this.channelEndRn = channelEndRn;
	}

	public Integer getPlaylistStartRn() {
		return playlistStartRn;
	}

	public void setPlaylistStartRn(Integer playlistStartRn) {
		this.playlistStartRn = playlistStartRn;
	}

	public Integer getPlaylistEndRn() {
		return playlistEndRn;
	}

	public void setPlaylistEndRn(Integer playlistEndRn) {
		this.playlistEndRn = playlistEndRn;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	@Override
	public String toString() {
		return "VideoSearchForm [createDate=" + createDate + ", type=" + type + ", function=" + function + ", sortBy="
				+ sortBy + ", primaryCategoryNo=" + primaryCategoryNo + ", pno=" + pno + ", keywords=" + keywords
				+ ", videoStartRn=" + videoStartRn + ", videoEndRn=" + videoEndRn + ", channelStartRn=" + channelStartRn
				+ ", channelEndRn=" + channelEndRn + ", playlistStartRn=" + playlistStartRn + ", playlistEndRn="
				+ playlistEndRn + "]";
	}

}
