package kr.co.ducktube.vo.criteria;

public class LibraryCriteria {

	private String keyword;
	private Integer beginIndex;
	private Integer endIndex;
	private Integer userNo;
	private Integer cmWritingNo;
	private String cmWritingContent;
	private String cmComment;
	private Integer cmCommentNo;
	private String cmSideValue;
	private String cmSortValue;
	
	public String getCmSideValue() {
		return cmSideValue;
	}
	public void setCmSideValue(String cmSideValue) {
		this.cmSideValue = cmSideValue;
	}
	public String getCmSortValue() {
		return cmSortValue;
	}
	public void setCmSortValue(String cmSortValue) {
		this.cmSortValue = cmSortValue;
	}
	public Integer getCmCommentNo() {
		return cmCommentNo;
	}
	public void setCmCommentNo(Integer cmCommentNo) {
		this.cmCommentNo = cmCommentNo;
	}
	public String getCmComment() {
		return cmComment;
	}
	public void setCmComment(String cmComment) {
		this.cmComment = cmComment;
	}
	public Integer getCmWritingNo() {
		return cmWritingNo;
	}
	public void setCmWritingNo(Integer cmWritingNo) {
		this.cmWritingNo = cmWritingNo;
	}
	public String getCmWritingContent() {
		return cmWritingContent;
	}
	public void setCmWritingContent(String cmWritingContent) {
		this.cmWritingContent = cmWritingContent;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getBeginIndex() {
		return beginIndex;
	}
	public void setBeginIndex(Integer beginIndex) {
		this.beginIndex = beginIndex;
	}
	public Integer getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(Integer endIndex) {
		this.endIndex = endIndex;
	}
	@Override
	public String toString() {
		return "LibraryCriteria [keyword=" + keyword + ", beginIndex=" + beginIndex + ", endIndex=" + endIndex
				+ ", userNo=" + userNo + ", cmWritingNo=" + cmWritingNo + ", cmWritingContent=" + cmWritingContent
				+ ", cmComment=" + cmComment + ", cmCommentNo=" + cmCommentNo + ", cmSortValue=" + cmSortValue + "]";
	}
	
}
