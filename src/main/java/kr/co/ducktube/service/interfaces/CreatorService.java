package kr.co.ducktube.service.interfaces;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ducktube.vo.criteria.VideoCriteria;
import kr.co.ducktube.vo.table.video.Category;
import kr.co.ducktube.vo.table.video.Video;

@Transactional
public interface CreatorService {
	
	int getVideoSequence();
	
	List<Category> getAllVideoCategories();
	
	Video updateVideo(Video video, MultipartFile mpf, double selectedDuration);
	
	Video addNewVideo(Video video, MultipartFile mpf, double selectedDuration);

	String deleteVideo(Integer vno);

	List<Video> getVideos(VideoCriteria criteria);
	
	List<Video> getRelationVideos(Integer userNo, int videoNo, int count);

	Integer getRecentlyWatchedVideo(Integer userNo);

	Map<String, Object> videoSearch(VideoCriteria criteria, Map<String, Object> map);
	
	Map<String, Object> channelSearch(VideoCriteria criteria, Map<String, Object> map);
	
	Map<String, Object> playlistSearch(VideoCriteria criteria, Map<String, Object> map);

}