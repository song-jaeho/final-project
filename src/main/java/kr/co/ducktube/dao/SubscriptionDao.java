package kr.co.ducktube.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.co.ducktube.vo.page.ChannelNoticeSummary;
import kr.co.ducktube.vo.page.ChannelSummary;
import kr.co.ducktube.vo.page.VideoSummary;
import kr.co.ducktube.vo.table.CommunityComments;
import kr.co.ducktube.vo.table.CommunityReplies;
import kr.co.ducktube.vo.table.CommunityWritings;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Playlist;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;

public interface SubscriptionDao {
	
	User getUserByNo(Integer userNo);
	
	List<Playlist> getPlaylistsByUserNo(Integer userNo);
	
	List<VideoSummary> getVideosByUserNo(Integer userNo);
	
	List<VideoSummary> getVideosInfoByMap(Map<String, Object> map);
	
	Integer getVideoLikeByVideoNo(Integer videoNo);
	
	List<VideoSummary> getVideosInfoByMapFull(Map<String, Object> map);
	
	List<VideoSummary> getVideosInfoByMapLiked(Map<String, Object> map);
	
	List<Playlist> getPlaylistByCondition(Map<String, Object> map);
	
	List<Subscription> getAllSubscribeByUserNo(Integer userNo);
	
	Integer getVideoCountByPlaylistNo(Integer playlistNo);
	
	List<VideoSummary> getVideosByMap(Map<String, Object> map);
	
	Date getRecentUpdateDateByPlaylistNo(Integer playlistNo);
	
	Integer getCommunityLikeByWritingNo(Integer writingNo);
	
	Integer getCommunityDislikeByWritingNo(Integer writingNo);
	
	Integer getCommentLikeCountByCommentNo(Integer commentNo);
	
	Integer getCommentDislikeCountByCommentNo(Integer commentNo);
	
	Integer getCommentReportCountByCommentNo(Integer commentNo);
	
	Integer getCommentReplyLikeCountByReplyNo(Integer replyNo);
	
	Integer getCommentReplyDislikeCountByReplyNo(Integer replyNo);
	
	Integer getCommentReplyReportCountByCommentNo(Integer commentNo);
	
	List<ChannelSummary> getChannelInfoByCreatorNo(Integer creatorNo);
	
	Integer getSubscribeCountByOwnerNo(Integer ownerNo);
	
	List<Integer> getSubscribingOwnerNoByUserNo(Integer userNo);
	
	ChannelSummary getChannelInfoByOwnerNo(Integer ownerNo);
	
	ChannelNoticeSummary getChannelNoticeByMap(Map<String, Object> map);
	
	void setChannelNoticeByMap(Map<String, Object> map);
	
	List<CommunityWritings> getCommunityWritingsByOwnerNo(Integer writingNo);
	
	List<CommunityComments> getCommunityCommentsByWritingNo(Integer writingNo);
	
	CommunityReplies getCommunityRepliesByCommentNo(Integer commentNo);
	
	void setNewReport(Map<String, Object> map);
	
	void setNewComment(Map<String, Object> map);
	
	void insertThumbsHistory(Map<String, Object> map);
	
	void updateThumbsHistory(Map<String, Object> map);
	
	void deleteThumbsHistory(Map<String, Object> map);
	
	Integer selectThumbsHistory(Map<String, Object> map);
	
	void setNewReply(Map<String, Object> map);
	
	void updateReply(Map<String, Object> map);

	Map<String, Object> getSubscribeByUserandOwnerNo(Map<String, Object> map);
	
	void addNewSubscribe(Map<String, Object> map);
	
	void deleteSubscribe(Map<String, Object> map);
	
	void addVideoToPlaylist(Map<String, Object> map);
	
	Integer getPlaylistVideoLastOrder(Integer playlistNo);
	
	List<Integer> getWatchLaterVideoNo(Integer userNo);
	
	void addToWatchLater(Map<String, Object> map);
	
	Integer getVideoWatchCount(Integer videoNo);
	
	History getVoteHistory(Map<String, Object> map);
	
	Integer getUnsightVideoCount(Map<String, Object> map);
	
	List<Subscription> getSubscriptionByCondition(Map<String, Object> map);
	
	Integer getVideoCountByCreatorNo(Integer creatorNo);
	
	void updateComment(Map<String, Object> map);
	
	void insertNewWritings(Map<String, Object> map);
	
	void removeWriting(Map<String, Object> map);
}

