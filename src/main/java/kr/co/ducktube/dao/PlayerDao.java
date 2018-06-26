package kr.co.ducktube.dao;

import java.util.List;
import java.util.Map;

import kr.co.ducktube.vo.page.CommentsSummary;
import kr.co.ducktube.vo.page.PlayerSummary;
import kr.co.ducktube.vo.page.ReplySummary;
import kr.co.ducktube.vo.page.SubscriptionSummary;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Subscription;

public interface PlayerDao {
	
	PlayerSummary getVideoDetailByNo(int videoNo);
	
	// count
	int getVideoLikesCountByNo(int videoNo);
	int getVideoHateCountByNo(int videoNo);
	int getVideoViewCountByNo(int videoNo);
	int getCommentLikesCountByNo(int commentNo);
	int getCommentHateCountByNo(int commentNo);
	
	// comment
	void insertVideoComment(CommentsSummary vComment);
	CommentsSummary getVideoCommentByCommentNo(int commentNo);
	CommentsSummary getVideoCommentByComenterNo(Map<String, Object> map);
	List<CommentsSummary> getVideoCommentByVideoNo(int videoNo);
	int getVideoCommentsSeq();
	int getCountCommentByVideoNo(int videoNo);
	void updateMyComment(CommentsSummary vComment);
	void deleteComment(CommentsSummary vComment);
	// reply
	void insertReply(ReplySummary reply);
	int getReplySeq();
	ReplySummary getReplyByReplyNo(int replyNo);
	List<ReplySummary> getReplyByCommentNo(int commentNo);
	
	// subsciption
	List<SubscriptionSummary> getSubOrderCreateDateByUserNo(int userNo);
	Subscription getSubScriptionByMap(Map<String, Object> map);
	int getSubCountByOwnerNo(int ownerNo);
	void insertSubscription(Subscription subscription);
	void deleteSubscription(Subscription subscription);
	
	//VideoVote
	void insertVideoVote(History history);
	void deleteVideoVote(History history);
	void updateVideoVote(History history);
	int getCountVoteByHistory(Map<String, Object> map);
	String getVideoVoteByHistory(Map<String, Object> map);
	
	//CommentVote
	void insertCommentVideoVote(History history);
	void deleteCommentVote(History history);
	void updateCommentVote(History history);
	int getCountCommentVoteByHistory(Map<String, Object> map);
	String getCommentVoteByHistory(Map<String, Object> map);
	
	//watch_history
	int getWatchHistoryByVideoNo(int videoNo);
	void insertWatchHistory(History history);
	
	// playList
	List<PlayerSummary> getPlayListBylistNo(int playNo);
}
