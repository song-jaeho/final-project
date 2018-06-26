package kr.co.ducktube.vo.page;

import java.util.Date;

import kr.co.ducktube.util.DateUtil;
import kr.co.ducktube.util.StringUtil;

public class PopularListSummary {

	private Integer no;
	private Integer userNo;
	private String title;
	private String detail;
	private String previewA2Url;
	private Integer duration;
	private Integer rank;
	private String nick;
	private Integer views;
	private Date createDate;
	private String time;
	private String lastDate;
	private String detailShort;

	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getDetailShort() {
		return detailShort;
	}
	public String getCreateDateStr() {
		return DateUtil.getLastDateFromNow(createDate);
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
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
		if(detail!=null) {
			detailShort = StringUtil.getShortString(148, detail);
		}
		this.detail = detail;
	}
	public String getPreviewA2Url() {
		return previewA2Url;
	}
	public void setPreviewA2Url(String previewA2Url) {
		this.previewA2Url = previewA2Url;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "PopularListSummary [no=" + no + ", title=" + title + ", detail=" + detail + ", previewA2Url="
				+ previewA2Url + ", duration=" + duration + ", rank=" + rank + ", nick=" + nick + ", views=" + views
				+ ", createDate=" + createDate + "]";
	}
	
}
