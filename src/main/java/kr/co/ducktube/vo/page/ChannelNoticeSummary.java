package kr.co.ducktube.vo.page;

public class ChannelNoticeSummary {

	private Integer userNo;
	private Integer ownerNo;
	private String notice;
	
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public Integer getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(Integer ownerNo) {
		this.ownerNo = ownerNo;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	@Override
	public String toString() {
		return "ChannelNoticeSummary [userNo=" + userNo + ", ownerNo=" + ownerNo + ", notice=" + notice + "]";
	}
	
	
}
