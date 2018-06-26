package kr.co.ducktube.vo.table;

import java.util.Date;

public class User {

//{ table : user
	private Integer no;
	
	private String email;
	
	private String name;
	
	private String nick;
	
	private String password;
	
	private String shortIntroduce;
	
	private String address;
	
	private String status;
	
	private String phone;
	
	private String gender;
	
	private Date birthday;
	
	private Date createDate;
	
	private String profileBigImgUrl;
	
	private String profileSmallImgUrl;
//}	
	
	
//{ table : convenient_options
	private String movieNotice;
	
	private String replyNotice;
	
	private String channelNotice;
	
	private String colorTheme;
	
	private String autoPlay;
//}
	

//{ table : creator_options
	private String playlistOpen;
	
	private String subscriptionOpen;
	
	private String communityOpen;
	
	private String channelRecommend;
//}
	
//{ table : channels
	private String channelTitle;
	
	private String channelLongDetail;
	
	private String channelImgUrl;
//{
	
	// sequence
	private int sequence;
	
	// subscriptionCount
	private int subscriptionCount;
	
	public String getChannelTitle() {
		return channelTitle;
	}

	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}

	public String getChannelLongDetail() {
		return channelLongDetail;
	}

	public void setChannelLongDetail(String channelLongDetail) {
		this.channelLongDetail = channelLongDetail;
	}

	public String getChannelImgUrl() {
		return channelImgUrl;
	}

	public void setChannelImgUrl(String channelImgUrl) {
		this.channelImgUrl = channelImgUrl;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getShortIntroduce() {
		return shortIntroduce;
	}

	public void setShortIntroduce(String shortIntroduce) {
		this.shortIntroduce = shortIntroduce;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getProfileBigImgUrl() {
		return profileBigImgUrl;
	}

	public void setProfileBigImgUrl(String profileBigImgUrl) {
		this.profileBigImgUrl = profileBigImgUrl;
	}

	public String getProfileSmallImgUrl() {
		return profileSmallImgUrl;
	}

	public void setProfileSmallImgUrl(String profileSmallImgUrl) {
		this.profileSmallImgUrl = profileSmallImgUrl;
	}

	public String getMovieNotice() {
		return movieNotice;
	}

	public void setMovieNotice(String movieNotice) {
		this.movieNotice = movieNotice;
	}

	public String getReplyNotice() {
		return replyNotice;
	}

	public void setReplyNotice(String replyNotice) {
		this.replyNotice = replyNotice;
	}

	public String getChannelNotice() {
		return channelNotice;
	}

	public void setChannelNotice(String channelNotice) {
		this.channelNotice = channelNotice;
	}

	public String getColorTheme() {
		return colorTheme;
	}

	public void setColorTheme(String colorTheme) {
		this.colorTheme = colorTheme;
	}

	public String getAutoPlay() {
		return autoPlay;
	}

	public void setAutoPlay(String autoPlay) {
		this.autoPlay = autoPlay;
	}

	public String getPlaylistOpen() {
		return playlistOpen;
	}

	public void setPlaylistOpen(String playlistOpen) {
		this.playlistOpen = playlistOpen;
	}

	public String getSubscriptionOpen() {
		return subscriptionOpen;
	}

	public void setSubscriptionOpen(String subscriptionOpen) {
		this.subscriptionOpen = subscriptionOpen;
	}

	public String getCommunityOpen() {
		return communityOpen;
	}

	public void setCommunityOpen(String communityOpen) {
		this.communityOpen = communityOpen;
	}

	public String getChannelRecommend() {
		return channelRecommend;
	}

	public void setChannelRecommend(String channelRecommend) {
		this.channelRecommend = channelRecommend;
	}
	
	
//{	convenient_options
	public boolean isMovieNoticeEnabled() {
		return "on".equals(movieNotice) ? true : false;
	}
	
	public boolean isReplayNoticeEnabled() {
		return "on".equals(replyNotice) ? true : false;
	}

	public boolean isChannelNoticeEnabled() {
		return "on".equals(channelNotice) ? true : false;
	}
	
	public boolean isLightenColorTheme() {
		return "lighten".equals(colorTheme) ? true : false;
	}
	
	public boolean isAutoPlayEnabled() {
		return "on".equals(autoPlay) ? true : false;
	}
//}	
	
	
//{ creator_options
	public boolean isPlaylistOpenEnabled() {
		return "on".equals(playlistOpen) ? true : false;
	}
	
	public boolean isSubscriptionOpenEnabled() {
		return "on".equals(subscriptionOpen) ? true : false;
	}
	
	public boolean isCommunityOpenEnabled() {
		return "on".equals(communityOpen) ? true : false;
	}
	
	public boolean isChannelRecommendEnabled() {
		return "on".equals(channelRecommend) ? true : false;
	}
//}	
	public int getSubscriptionCount() {
		return subscriptionCount;
	}

	public void setSubscriptionCount(int subscriptionCount) {
		this.subscriptionCount = subscriptionCount;
	}

	@Override
	public String toString() {
		return "User [no=" + no + ", email=" + email + ", name=" + name + ", nick=" + nick + ", password=" + password
				+ ", shortIntroduce=" + shortIntroduce + ", address=" + address + ", status=" + status + ", phone="
				+ phone + ", gender=" + gender + ", birthday=" + birthday + ", createDate=" + createDate
				+ ", profileBigImgUrl=" + profileBigImgUrl + ", profileSmallImgUrl=" + profileSmallImgUrl
				+ ", movieNotice=" + movieNotice + ", replyNotice=" + replyNotice + ", channelNotice=" + channelNotice
				+ ", colorTheme=" + colorTheme + ", autoPlay=" + autoPlay + ", playlistOpen=" + playlistOpen
				+ ", subscriptionOpen=" + subscriptionOpen + ", communityOpen=" + communityOpen + ", channelRecommend="
				+ channelRecommend + ", channelTitle=" + channelTitle + ", channelLongDetail=" + channelLongDetail
				+ ", channelImgUrl=" + channelImgUrl + ", sequence=" + sequence + ", subscriptionCount="
				+ subscriptionCount + "]";
	}

	
}
