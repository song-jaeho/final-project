package kr.co.ducktube.vo.form;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VideoUploadForm {

	private int videoNo;
	
	private int creatorNo;
	
	private int nextVideoNo;
	
	private int primaryCategoryNo;
	
	private int secondaryCategoryNo;
	
	private String title;
	
	private String detail;

	private MultipartFile videoFile;
	
	private double selectedDuration;
	
	private List<String> tagList;
	
	public int getCreatorNo() {
		return creatorNo;
	}

	public void setCreatorNo(int creatorNo) {
		this.creatorNo = creatorNo;
	}

	public int getNextVideoNo() {
		return nextVideoNo;
	}

	public void setNextVideoNo(int nextVideoNo) {
		this.nextVideoNo = nextVideoNo;
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

	public MultipartFile getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(MultipartFile videoFile) {
		this.videoFile = videoFile;
	}

	public double getSelectedDuration() {
		return selectedDuration;
	}

	public void setSelectedDuration(double selectedDuration) {
		this.selectedDuration = selectedDuration;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public List<String> getTagList() {
		return tagList;
	}

	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}

	@Override
	public String toString() {
		return "VideoUploadForm [videoNo=" + videoNo + ", creatorNo=" + creatorNo + ", nextVideoNo=" + nextVideoNo
				+ ", primaryCategoryNo=" + primaryCategoryNo + ", secondaryCategoryNo=" + secondaryCategoryNo
				+ ", title=" + title + ", detail=" + detail + ", videoFile=" + videoFile + ", selectedDuration="
				+ selectedDuration + ", tagList=" + tagList + "]";
	}

}
