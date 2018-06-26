package kr.co.ducktube.vo.criteria;

import java.util.List;

public class HomeCriteria {

	private Integer userNo;
	private Integer videoNo;
	private Integer afterVideoNo;
	private Integer playlistNo;
	private List<Integer> playlistGroup;
	private String playlistTitle;
	private String playlistName;
	private String playlistStatus;
	private String playlistContent;
	private String playlistRepImg;
	private int beforeOrder;
	private int afterOrder;
	private Integer videoCount;
	private String preview;
	
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public Integer getAfterVideoNo() {
		return afterVideoNo;
	}
	public void setAfterVideoNo(Integer afterVideoNo) {
		this.afterVideoNo = afterVideoNo;
	}
	public int getBeforeOrder() {
		return beforeOrder;
	}
	public void setBeforeOrder(int beforeOrder) {
		this.beforeOrder = beforeOrder;
	}
	public int getAfterOrder() {
		return afterOrder;
	}
	public void setAfterOrder(int afterOrder) {
		this.afterOrder = afterOrder;
	}
	public String getPlaylistRepImg() {
		return playlistRepImg;
	}
	public void setPlaylistRepImg(String playlistRepImg) {
		this.playlistRepImg = playlistRepImg;
	}
	public String getPlaylistContent() {
		return playlistContent;
	}
	public void setPlaylistContent(String playlistContent) {
		this.playlistContent = playlistContent;
	}
	public String getPlaylistTitle() {
		return playlistTitle;
	}
	public void setPlaylistTitle(String playlistTitle) {
		this.playlistTitle = playlistTitle;
	}
	public Integer getVideoCount() {
		return videoCount;
	}
	public void setVideoCount(Integer videoCount) {
		this.videoCount = videoCount;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public Integer getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(Integer videoNo) {
		this.videoNo = videoNo;
	}
	public Integer getPlaylistNo() {
		return playlistNo;
	}
	public void setPlaylistNo(Integer playlistNo) {
		this.playlistNo = playlistNo;
	}
	public List<Integer> getPlaylistGroup() {
		return playlistGroup;
	}
	public void setPlaylistGroup(List<Integer> playlistGroup) {
		this.playlistGroup = playlistGroup;
	}
	public String getPlaylistName() {
		return playlistName;
	}
	public void setPlaylistName(String playlistName) {
		this.playlistName = playlistName;
	}
	public String getPlaylistStatus() {
		return playlistStatus;
	}
	public void setPlaylistStatus(String playlistStatus) {
		this.playlistStatus = playlistStatus;
	}
	@Override
	public String toString() {
		return "HomeCriteria [userNo=" + userNo + ", videoNo=" + videoNo + ", afterVideoNo=" + afterVideoNo
				+ ", playlistNo=" + playlistNo + ", playlistGroup=" + playlistGroup + ", playlistTitle=" + playlistTitle
				+ ", playlistName=" + playlistName + ", playlistStatus=" + playlistStatus + ", playlistContent="
				+ playlistContent + ", playlistRepImg=" + playlistRepImg + ", beforeOrder=" + beforeOrder
				+ ", afterOrder=" + afterOrder + ", videoCount=" + videoCount + ", preview=" + preview + "]";
	}
	
}
