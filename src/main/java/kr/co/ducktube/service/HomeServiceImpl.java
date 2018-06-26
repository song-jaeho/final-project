package kr.co.ducktube.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ducktube.dao.HomeDao;
import kr.co.ducktube.service.interfaces.HomeService;
import kr.co.ducktube.util.DateUtil;
import kr.co.ducktube.util.TimeUtil;
import kr.co.ducktube.vo.criteria.HomeCriteria;
import kr.co.ducktube.vo.criteria.LibraryCriteria;
import kr.co.ducktube.vo.page.LibrarySummary;
import kr.co.ducktube.vo.page.PopularListSummary;
import kr.co.ducktube.vo.table.User;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeDao homeDao;

	@Override
	public void playlistPreviewUpdate(HomeCriteria criteria) {
		homeDao.playlistPreviewUpdate(criteria);
	}
	
	@Override
	public void addPlaylistVideo(HomeCriteria criteria) {
		homeDao.addPlaylistVideo(criteria);
	}
	
	@Override
	public Integer getPlaylistVideoCount(int playlistNo) {
		Integer count = homeDao.getPlaylistVideoCount(playlistNo);
		//System.out.println("비디오갯수: " + count);
		if(count==null) {
			count = 0;
		}
		return count;
	}
	
	@Override
	public LibrarySummary checkPlaylistVideo(HomeCriteria criteria) {
		LibrarySummary checkList = homeDao.checkPlaylistVideo(criteria);
		return checkList;
	}
	
	@Override
	public void addPlaylist(HomeCriteria criteria) {
		homeDao.addPlaylist(criteria);
	}
	
	@Override
	public void addWatchLater(HomeCriteria criteria) {
		homeDao.addWatchLater(criteria);
	}
	
	@Override
	public LibrarySummary checkWatchLater(HomeCriteria criteria) {
		LibrarySummary list = homeDao.checkWatchLater(criteria);
		return list;
	}
	
	@Override
	public List<PopularListSummary> getPopularList(LibraryCriteria criteria) {
		List<PopularListSummary> popularlistVideo = homeDao.getPopularList(criteria);
		
		Date date = new Date();
		for(PopularListSummary p : popularlistVideo) {
			p.setTime(TimeUtil.getTime(p.getDuration())); 
			
			String lastDate = DateUtil.getLastDate(p.getCreateDate(), date);
			p.setLastDate(lastDate);
		}
		return popularlistVideo;
	}
	
	@Override
	public User getUserByEmail(String email) {
		User user = homeDao.getUserByEmail(email);
		return user;
	}
}
