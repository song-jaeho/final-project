package kr.co.ducktube.vo.table;

import java.util.Date;
import java.util.List;

public class CommunityWritings {
	
	private Date createDate;
	private Integer no;
	private Integer writerNo;
	private String status;
	private String contents;
	
	private String writerImgURL;
	private String writerNick;
	
	private Integer likeCount;
	private Integer dislikeCount;
	private Integer sumCount;
	private Integer	reportCount;
	private Integer	commentCount;
	
	private String formattedDate;
	
	private List<CommunityComments> comments;
	
	private CommunityComments writtenComments;
	
	private User user;
	
	private History history;

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(Integer writerNo) {
		this.writerNo = writerNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriterImgURL() {
		return writerImgURL;
	}

	public void setWriterImgURL(String writerImgURL) {
		this.writerImgURL = writerImgURL;
	}

	public String getWriterNick() {
		return writerNick;
	}

	public void setWriterNick(String writerNick) {
		this.writerNick = writerNick;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getDislikeCount() {
		return dislikeCount;
	}

	public void setDislikeCount(Integer dislikeCount) {
		this.dislikeCount = dislikeCount;
	}

	public Integer getSumCount() {
		return sumCount;
	}

	public void setSumCount(Integer sumCount) {
		this.sumCount = sumCount;
	}

	public Integer getReportCount() {
		return reportCount;
	}

	public void setReportCount(Integer reportCount) {
		this.reportCount = reportCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

	public List<CommunityComments> getComments() {
		return comments;
	}

	public void setComments(List<CommunityComments> comments) {
		this.comments = comments;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public History getHistory() {
		return history;
	}

	public void setHistory(History history) {
		this.history = history;
	}

	@Override
	public String toString() {
		return "CommunityWritings [createDate=" + createDate + ", no=" + no + ", writerNo=" + writerNo + ", status="
				+ status + ", contents=" + contents + ", writerImgURL=" + writerImgURL + ", writerNick=" + writerNick
				+ ", likeCount=" + likeCount + ", dislikeCount=" + dislikeCount + ", sumCount=" + sumCount
				+ ", reportCount=" + reportCount + ", commentCount=" + commentCount + ", formattedDate=" + formattedDate
				+ ", comments=" + comments + ", user=" + user + ", history=" + history + "]";
	}

	public CommunityComments getWrittenComments() {
		return writtenComments;
	}

	public void setWrittenComments(CommunityComments writtenComments) {
		this.writtenComments = writtenComments;
	}

	
}
