package kr.co.ducktube.dao;

import java.util.List;
import java.util.Map;

import kr.co.ducktube.vo.criteria.VideoCriteria;
import kr.co.ducktube.vo.table.video.Category;
import kr.co.ducktube.vo.table.video.Video;

public interface CreatorDao {

	List<Integer> getWatchedVideos(int userNo);
	
	int getVideoSequence();

	void addNewVideo(Video video);
	
	Video getVideoByVideoNo(int videoNo);
	
	List<Category> getVideoCategories();

	void updateVideo(Video video);
	
	void deleteTags(int videoNo);
	
	void addNewTags(Video video);
	
	int getCreatorsVideoSize(VideoCriteria criteria);
	
	Integer getRecentlyWatchedVideo(Integer userNo);
	
	List<Video> getVideos(VideoCriteria criteria);
	
	int getVideoSize(VideoCriteria criteria);
	
	List<Map<String, Object>> getChannels(VideoCriteria criteria);
	
	int getChannelSize(VideoCriteria criteria);
	
	List<Map<String, Object>> getPlaylists(VideoCriteria criteria);

	int getPlaylistSize(VideoCriteria criteria);
	
}