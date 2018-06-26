package kr.co.ducktube.dao;

import java.util.List;
import java.util.Map;

import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;
import kr.co.ducktube.vo.table.video.Video;

public interface DummyDao {

	Video getVideoByNo(int no);
	
	List<Video> getAllVideos();
	
	List<User> getAllUsers();
	
	void recordWatchHistory(History history);
	
	void recordVideoVoteHistory(History history);
	
	void recordVideoReportHistory(History history);
	
	History getVideoVoteHistory(History history);
	
	History getVideoReportHistory(History history);
	
	void addNewSubscription(Subscription subscription);
	
	Subscription getSubscriptionsByUserNo(int no);
	
	void changeVideoCreateDate(Map<String, Object> map);
	
	void changeVideoVoteDate(Map<String, Object> map);
	
	List<History> getVideoVoteHistories();
	
	void changeVideoVoteDate(History history);
	
	List<History> getWatchHistories();
	
	void updateWatchHistory(History history);
	
}