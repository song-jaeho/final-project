package kr.co.ducktube.vo.table.community;

import java.util.Date;

public class CMWCReply {

	private int no;
	
	private int commentNo;
	
	private int replierNo;
	
	private String contents;
	
	private String status;
	
	private Date createDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getReplierNo() {
		return replierNo;
	}

	public void setReplierNo(int replierNo) {
		this.replierNo = replierNo;
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
		return "CMWCReply [no=" + no + ", commentNo=" + commentNo + ", replierNo=" + replierNo + ", contents="
				+ contents + ", status=" + status + ", createDate=" + createDate + "]";
	}
	
}
