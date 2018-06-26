package kr.co.ducktube.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ducktube.dao.PlayerDao;
import kr.co.ducktube.service.interfaces.PlayerService;
import kr.co.ducktube.util.DateUtil;
import kr.co.ducktube.util.StringUtil;
import kr.co.ducktube.vo.page.CommentsSummary;
import kr.co.ducktube.vo.page.PlayerSummary;
import kr.co.ducktube.vo.page.ReplySummary;
import kr.co.ducktube.vo.page.SubscriptionSummary;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Subscription;

@Service
public class PlayerServiceImpl implements PlayerService {

	@Autowired
	private PlayerDao playerDao;
	
	@Override
	public PlayerSummary getVideoDetailByNo(int videoNo) {
		PlayerSummary video = playerDao.getVideoDetailByNo(videoNo);
		
		Date date = new Date();
		
		String subString = StringUtil.getShortString(15, video.getTitle());
		video.setSubTitle(subString);
		String lastTime = DateUtil.getLastDate(video.getCreateDate(), date);
		String formatDate = DateUtil.getStringDateWithoutTime(video.getCreateDate());
		video.setLastDate(lastTime);
		video.setFormatDate(formatDate);
		return video;
	}

	@Override
	public int getVideoLikesCountByNo(int videoNo) {
		int likeCount = playerDao.getVideoLikesCountByNo(videoNo);
		return likeCount;
	}

	@Override
	public int getVideoHateCountByNo(int videoNo) {
		int hateCount = playerDao.getVideoHateCountByNo(videoNo);
		return hateCount;
	}

	@Override
	public CommentsSummary insertVideoComment(CommentsSummary vComment) {
		int commentNo = playerDao.getVideoCommentsSeq();
		vComment.setNo(commentNo);
		playerDao.insertVideoComment(vComment);
		return playerDao.getVideoCommentByCommentNo(commentNo);
	}

	@Override
	public List<CommentsSummary> getVideoCommentByVideoNo(int videoNo) {
		List<CommentsSummary> comments = playerDao.getVideoCommentByVideoNo(videoNo);
		for(CommentsSummary comment : comments) {
			Date date = new Date();
			
			String lastTime = DateUtil.getLastDate(comment.getCreateDate(), date);
			comment.setLastDate(lastTime);
		}
		return comments;
	}

	@Override
	public int getVideoCommentsSeq() {
		return 0;
	}

	@Override
	public CommentsSummary getVideoCommentByCommentNo(int commentNo) {
		CommentsSummary comment = playerDao.getVideoCommentByCommentNo(commentNo);
		Date date = new Date();
		
		String lastTime = DateUtil.getLastDate(comment.getCreateDate(), date);
		comment.setLastDate(lastTime);
		return comment;
	}

	@Override
	public CommentsSummary getVideoCommentByComenterNo(Map<String, Object> map) {
		CommentsSummary myComment = playerDao.getVideoCommentByComenterNo(map);
		Date date = new Date();
		
		String lastTime = DateUtil.getLastDate(myComment.getCreateDate(), date);
		myComment.setLastDate(lastTime);
		return myComment;
	}

	@Override
	public CommentsSummary updateMyComment(CommentsSummary vComment) {
		playerDao.updateMyComment(vComment);
		return playerDao.getVideoCommentByCommentNo(vComment.getNo());
	}

	@Override
	public int getCountCommentByVideoNo(int videoNo) {
		int count = playerDao.getCountCommentByVideoNo(videoNo);
		return count;
	}


	// 답글
	@Override
	public ReplySummary insertReply(ReplySummary reply) {
		int replyNo = playerDao.getReplySeq();
		reply.setNo(replyNo);
		playerDao.insertReply(reply);
		
		return playerDao.getReplyByReplyNo(replyNo);
	}

	@Override
	public int getReplySeq() {
		return 0;
	}

	@Override
	public ReplySummary getReplyByReplyNo(int replyNo) {
		ReplySummary reply = playerDao.getReplyByReplyNo(replyNo);
		return reply;
	}
	
	@Override
	public List<ReplySummary> getReplyByCommentNo(int commentNo) {
		List<ReplySummary> replies = playerDao.getReplyByCommentNo(commentNo);
		return replies;
	}

	
	// 구독
	@Override
	public List<SubscriptionSummary> getSubOrderCreateDateByUserNo(int userNo) {
		List<SubscriptionSummary> subList = playerDao.getSubOrderCreateDateByUserNo(userNo);
		for(SubscriptionSummary sub : subList) {
			String title = StringUtil.getShortString(15, sub.getTitle());

			Date date = new Date();
			
			String lastTime = DateUtil.getLastDate(sub.getCreateDate(), date);
			String formatDate = DateUtil.getStringDateWithoutTime(sub.getCreateDate());
			sub.setLastDate(lastTime);
			sub.setFormatDate(formatDate);
			sub.setTitle(title);
		}
		
		return subList;
	}

	// videoVote
	@Override
	public History insertVideoVote(History history) {
		History vote = new History();
		playerDao.insertVideoVote(history);
		return vote;
	}

	@Override
	public History deleteVideoVote(History history) {
		History vote = new History();
		playerDao.deleteVideoVote(history);
		return vote;
	}

	@Override
	public History updateVideoVote(History history) {
		History vote = new History();
		playerDao.updateVideoVote(history);
		return vote;
	}

	@Override
	public int getCountVoteByHistory(Map<String, Object> map) {
		int vote = playerDao.getCountVoteByHistory(map);
		
		return vote;
	}

	@Override
	public String getVideoVoteByHistory(Map<String, Object> map) {
		String userVote = playerDao.getVideoVoteByHistory(map);
		return userVote;
	}

	//watch_history

	@Override
	public int getVideoViewCountByNo(int videoNo) {
		int viewCount = playerDao.getVideoViewCountByNo(videoNo);
		return viewCount;
	}

	@Override
	public History insertWatchHistory(History history) {
		History watch = new History();
		playerDao.insertWatchHistory(history);
		return watch;
		
	}

	// playList
	@Override
	public List<PlayerSummary> getPlayListBylistNo(int playNo) {
		List<PlayerSummary> playList = playerDao.getPlayListBylistNo(playNo);
		return playList;
	}
	
	// CommentVote
	@Override
	public History insertCommentVideoVote(History history) {
		History vote = new History();
		playerDao.insertCommentVideoVote(history);
		return vote;
		
	}

	@Override
	public History deleteCommentVote(History history) {
		History vote = new History();
		playerDao.deleteCommentVote(history);
		return vote;
		
	}

	@Override
	public History updateCommentVote(History history) {
		History vote = new History();
		playerDao.updateCommentVote(history);
		return vote;
		
	}

	@Override
	public int getCountCommentVoteByHistory(Map<String, Object> map) {
		int vote = playerDao.getCountCommentVoteByHistory(map);
		
		return vote;
	}

	@Override
	public String getCommentVoteByHistory(Map<String, Object> map) {
		String userVote = playerDao.getCommentVoteByHistory(map);
		return userVote;
	}

	@Override
	public int getCommentLikesCountByNo(int commentNo) {

		int likeCount = playerDao.getCommentLikesCountByNo(commentNo);
		return likeCount;
	}

	@Override
	public int getCommentHateCountByNo(int commentNo) {
		int hateCount = playerDao.getCommentHateCountByNo(commentNo);
		return hateCount;
	}

	@Override
	public CommentsSummary deleteComment(CommentsSummary vComment) {
		CommentsSummary comment = new CommentsSummary();
		playerDao.deleteComment(vComment);
		return comment;
		
	}

	@Override
	public String getSubDateFormat(Date today, Date date) {
		LocalDateTime startL = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
		LocalDateTime endL = today.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();

		long months = ChronoUnit.MONTHS.between(startL, endL);
		if(months < -1) return "이전";
		
		long days = ChronoUnit.DAYS.between(startL, endL);
		if(days < -7) return "이번달";
		if(days < -1) return "이번주";
		
		long hours = ChronoUnit.HOURS.between(startL, endL);
		if(hours < -24) return "어제";
		if(hours < 0) return "오늘";
		
		return null;
	}
	
	/*subscruption 구독*/
	@Override
	public Subscription getSubScriptionByMap(Map<String, Object> map) {
		Subscription subDetail = playerDao.getSubScriptionByMap(map);
		return subDetail;
	}

	@Override
	public int getSubCountByOwnerNo(int ownerNo) {
		int subCount = playerDao.getSubCountByOwnerNo(ownerNo);
		return subCount;
	}

	@Override
	public Subscription insertSubscription(Subscription subscription) {
		Subscription subInsert = new Subscription();
		playerDao.insertSubscription(subscription);
		return subInsert;
	}

	@Override
	public Subscription deleteSubscription(Subscription subscription) {
		Subscription subDelete = new Subscription();
		playerDao.deleteSubscription(subscription);
		return subDelete;
	}


}
