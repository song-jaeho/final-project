package kr.co.ducktube.vo.form;

public class VideoSearchConditions {
	
	// criteria
	
	private String criteria;
	
	private String playlist;
	
	private int videoNo;
	
	private int creatorNo;
	
	private String keyword;

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}

	public String getPlaylist() {
		return playlist;
	}

	public void setPlaylist(String playlist) {
		this.playlist = playlist;
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
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public VideoSearchConditions(String criteria, String playlist, int videoNo, int creatorNo) {
		super();
		this.criteria = criteria;
		this.playlist = playlist;
		this.videoNo = videoNo;
		this.creatorNo = creatorNo;
	}
	
	public VideoSearchConditions(String criteria, String playlist, int creatorNo) {
		super();
		this.criteria = criteria;
		this.playlist = playlist;
		this.creatorNo = creatorNo;
	}

	public VideoSearchConditions(String keyword) {
		super();
		this.keyword = keyword;
	}

	public VideoSearchConditions() {
		super();
	}

	
	
}
