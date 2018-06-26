package kr.co.ducktube.service.interfaces;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.ducktube.vo.page.CommentsSummary;
import kr.co.ducktube.vo.page.PlayerSummary;
import kr.co.ducktube.vo.page.ReplySummary;
import kr.co.ducktube.vo.page.SubscriptionSummary;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Subscription;

@Transactional
public interface PlayerService {

	PlayerSummary getVideoDetailByNo(int videoNo);

	// count
	int getVideoLikesCountByNo(int videoNo);
	int getVideoHateCountByNo(int videoNo);
	int getCommentLikesCountByNo(int commentNo);
	int getCommentHateCountByNo(int commentNo);
	
	// comment
	CommentsSummary insertVideoComment(CommentsSummary vComment);
	CommentsSummary getVideoCommentByCommentNo(int commentNo);
	CommentsSummary getVideoCommentByComenterNo(Map<String, Object> map);
	List<CommentsSummary> getVideoCommentByVideoNo(int videoNo);
	int getVideoCommentsSeq();
	int getCountCommentByVideoNo(int videoNo);
	CommentsSummary updateMyComment(CommentsSummary vComment);
	CommentsSummary deleteComment(CommentsSummary vComment);
	
	// reply
	ReplySummary insertReply(ReplySummary reply);
	int getReplySeq();
	ReplySummary getReplyByReplyNo(int replyNo);
	List<ReplySummary> getReplyByCommentNo(int commentNo);

	// subsciption
	List<SubscriptionSummary> getSubOrderCreateDateByUserNo(int userNo);
	Subscription getSubScriptionByMap(Map<String, Object> map);
	int getSubCountByOwnerNo(int ownerNo);
	Subscription insertSubscription(Subscription subscription);
	Subscription deleteSubscription(Subscription subscription);
	
	//VideoVote
	History insertVideoVote(History history);
	History deleteVideoVote(History history);
	History updateVideoVote(History history);
	int getCountVoteByHistory(Map<String, Object> map);
	String getVideoVoteByHistory(Map<String, Object> map);

	//CommentVote
	History insertCommentVideoVote(History history);
	History deleteCommentVote(History history);
	History updateCommentVote(History history);
	int getCountCommentVoteByHistory(Map<String, Object> map);
	String getCommentVoteByHistory(Map<String, Object> map);
	
	//watch_history
	int getVideoViewCountByNo(int videoNo);
	History insertWatchHistory(History history);
	
	// playList
	List<PlayerSummary> getPlayListBylistNo(int playNo);
	
	// 날짜 변환.
	String getSubDateFormat(Date today, Date date);
}
