package kr.co.ducktube.vo.criteria;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class VideoCriteria {

	private Integer creatorNo;
	
	private Integer startRownum;
	
	private Integer endRownum;
	
	private String orderColumn;
	
	private String orderDirection;

	private Integer primaryCategoryNo;
	
	private Boolean relationCategorySearch;
	
	private String status;
	
	private Date fromDate;
	
	private Date toDate;
	
	private String keywords;
	
	private List<String> keywordList = new ArrayList<String>();

	private String playTimeStand;
	
	private String frameStand;
	
	private List<Integer> exVideoNoList = new ArrayList<Integer>();

	private Integer pno;

	public Integer getCreatorNo() {
		return creatorNo;
	}

	public void setCreatorNo(Integer creatorNo) {
		this.creatorNo = creatorNo;
	}

	public Integer getStartRownum() {
		return startRownum;
	}

	public void setStartRownum(Integer startRownum) {
		this.startRownum = startRownum;
	}

	public Integer getEndRownum() {
		return endRownum;
	}

	public void setEndRownum(Integer endRownum) {
		this.endRownum = endRownum;
	}

	public String getOrderColumn() {
		return orderColumn;
	}

	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}

	public String getOrderDirection() {
		return orderDirection;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	public Integer getPrimaryCategoryNo() {
		return primaryCategoryNo;
	}

	public void setPrimaryCategoryNo(Integer primaryCategoryNo) {
		this.primaryCategoryNo = primaryCategoryNo;
	}

	public Boolean getRelationCategorySearch() {
		return relationCategorySearch;
	}

	public void setRelationCategorySearch(Boolean relationCategorySearch) {
		this.relationCategorySearch = relationCategorySearch;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Integer> getExVideoNoList() {
		return exVideoNoList;
	}

	public void setExVideoNoList(List<Integer> exVideoNoList) {
		this.exVideoNoList = exVideoNoList;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	
	public String getPlayTimeStand() {
		return playTimeStand;
	}

	public void setPlayTimeStand(String playTimeStand) {
		this.playTimeStand = playTimeStand;
	}

	public String getFrameStand() {
		return frameStand;
	}

	public void setFrameStand(String frameStand) {
		this.frameStand = frameStand;
	}

	public Integer getPno() {
		return pno;
	}

	public void setPno(Integer pno) {
		this.pno = pno;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		String[] str = keywords.split("_");
		for(String s : str) {
			if(!"".equals(s)) {
				keywordList.add(s);
			}
		}
		this.keywords = keywords;
	}

	public List<String> getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List<String> keywordList) {
		this.keywordList = keywordList;
	}

	@Override
	public String toString() {
		return "VideoCriteria [creatorNo=" + creatorNo + ", startRownum=" + startRownum + ", endRownum=" + endRownum
				+ ", orderColumn=" + orderColumn + ", orderDirection=" + orderDirection + ", primaryCategoryNo="
				+ primaryCategoryNo + ", relationCategorySearch=" + relationCategorySearch + ", status=" + status
				+ ", fromDate=" + fromDate + ", toDate=" + toDate + ", keywords=" + keywords + ", keywordList="
				+ keywordList + ", playTimeStand=" + playTimeStand + ", frameStand=" + frameStand + ", exVideoNoList="
				+ exVideoNoList + ", pno=" + pno + "]";
	}

}