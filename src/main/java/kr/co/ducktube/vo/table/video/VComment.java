package kr.co.ducktube.vo.table.video;

import java.util.Date;

public class VComment {

	private int no;
	
	private int commenterNo;
	
	private int videoNo;
	
	private String contents;
	
	private String status;
	
	private Date createDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCommenterNo() {
		return commenterNo;
	}

	public void setCommenterNo(int commenterNo) {
		this.commenterNo = commenterNo;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "VComment [no=" + no + ", commenterNo=" + commenterNo + ", videoNo=" + videoNo + ", contents=" + contents
				+ ", status=" + status + ", createDate=" + createDate + "]";
	}
	
}
