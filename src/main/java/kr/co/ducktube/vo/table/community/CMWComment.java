package kr.co.ducktube.vo.table.community;

import java.util.Date;

public class CMWComment {

	private int no;
	
	private int writingNo;
	
	private int commenterNo;
	
	private String contents;
	
	private String status;
	
	private Date createDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getWritingNo() {
		return writingNo;
	}

	public void setWritingNo(int writingNo) {
		this.writingNo = writingNo;
	}

	public int getCommenterNo() {
		return commenterNo;
	}

	public void setCommenterNo(int commenterNo) {
		this.commenterNo = commenterNo;
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
		return "CMWComment [no=" + no + ", writingNo=" + writingNo + ", commenterNo=" + commenterNo + ", contents="
				+ contents + ", status=" + status + ", createDate=" + createDate + "]";
	}
	
}
