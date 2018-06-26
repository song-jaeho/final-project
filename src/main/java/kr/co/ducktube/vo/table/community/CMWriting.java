package kr.co.ducktube.vo.table.community;

import java.util.Date;

public class CMWriting {

	private int no;
	
	private int ownerNo;
	
	private String contents;
	
	private String status;
	
	private Date createDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
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
		return "CMWriting [no=" + no + ", ownerNo=" + ownerNo + ", contents=" + contents + ", status=" + status
				+ ", createDate=" + createDate + "]";
	}
	
}
