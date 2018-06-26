package kr.co.ducktube.service.interfaces;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.ducktube.vo.page.ChannelNoticeSummary;
import kr.co.ducktube.vo.page.ChannelSummary;
import kr.co.ducktube.vo.page.PlayListSummary;
import kr.co.ducktube.vo.table.CommunityComments;
import kr.co.ducktube.vo.table.CommunityReplies;
import kr.co.ducktube.vo.table.CommunityWritings;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Playlist;
import kr.co.ducktube.vo.table.Subscription;

@Transactional
public interface SubscriptionService {
	
	PlayListSummary getPlaylistFullInfoByMapForOwner(Map<String, Object> map);
	
	PlayListSummary getPlaylistFullInfoByMapForUser(Map<String, Object> map);
	
	Map<String, Object> getVideosInfoByMap(Map<String, Object> map);
	
	List<Playlist> getPlaylistByCondition(Map<String, Object> map);
	
	List<Subscription> getAllSubscribeByUserNo(Integer userNo);
	
	Integer getVideoCountByPlaylistNo(Integer playlistNo);
	
	Date getRecentUpdateDateByPlaylistNo(Integer playlistNo); 
	
	List<Integer> getSubscribingOwnerNoByUserNo(Integer userNo);

	List<ChannelSummary> getChannelInfoByCreatorNo(Map<String, Object> map);
	
	ChannelSummary getChannelInfoByOwnerNo(Integer ownerNo);
	
	ChannelNoticeSummary getChannelNoticeByMap(Map<String, Object> map);
	
	void setChannelNoticeByMap(Map<String, Object> map);
	
	List<CommunityWritings> getCommunityWritingsByOwnerNo(Map<String, Object> map);
	
	List<CommunityComments> getCommunityCommentsByWritingNo(Map<String, Object> map);
	
	void setNewReport(Map<String, Object> map);
	
	void setNewComment(Map<String, Object> map);
	
	void updateComment(Map<String, Object> map);
	
	Integer changeThumbsHistory(Map<String, Object> map);
	
	void setNewReply(Map<String, Object> map);
	
	void updateReply(Map<String, Object> map);
	
	CommunityReplies getCommunityRepliesByCommentNo(Map<String, Object> map);
	
	Map<String, Object> subscribe(Map<String, Object> map);
	
	String addVideoToPlaylist(Map<String, Object> map);
	
	String addToWatchLater(Map<String, Object> map);
	
	History getVoteHistory(Map<String, Object> map);
	
	List<Subscription> getSubscriptionByCondition(Map<String, Object> map);
	
	Integer getVideoCountByCreatorNo(Integer creatorNo);
	
	void insertNewWritings(Map<String, Object> map);
	
	void removeWriting(Map<String, Object> map);
}
