package kr.co.ducktube.service.dummy;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ducktube.dao.DummyDao;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;
import kr.co.ducktube.vo.table.video.Video;

@Service
@Transactional
public class DummyService {

	@Autowired
	private DummyDao dummyDao;
	
	public void changeWatchDate() {
		
		List<History> watchHistories = dummyDao.getWatchHistories();
		for(History h : watchHistories) {
			Random rand = new Random(System.currentTimeMillis());
			
			h.setNewDate(Date.from(ZonedDateTime.now().minusDays(rand.nextInt(365)).toInstant()));
			dummyDao.updateWatchHistory(h);
		}
		
	}
	
	public void createWatchHistory() {

		List<User> allUsers = dummyDao.getAllUsers();
		List<Video> allVideos = dummyDao.getAllVideos();
		
		for(User u : allUsers) {
			for(int i=0; i<1000; i++) {
				History history = new History();
				Random rand = new Random(System.currentTimeMillis());
				
				int uno = u.getNo();
				int vno = allVideos.get(rand.nextInt(allVideos.size())).getNo();
				
				history.setUserNo(uno);
				history.setTargetNo(vno);
				
				dummyDao.recordWatchHistory(history);
			}
		}
	}
	
	public void createVideoVoteHistory() {
		
		Random rand = new Random();
		
		List<User> allUsers = dummyDao.getAllUsers();
		List<Video> allVideos = dummyDao.getAllVideos();
		
		for(User u : allUsers) {
			for(int i=0; i<allVideos.size(); i++) {
				
				History history = new History();
				history.setUserNo(u.getNo());
				history.setTargetNo(allVideos.get(i).getNo());
				if(rand.nextBoolean()) {
					history.setVoteSide("n");
				} else {
					history.setVoteSide("p");
				}
				dummyDao.recordVideoVoteHistory(history);
			}
		}
	}
	
	public void createVideoReportHistory() {
		
		Random rand = new Random();
		
		List<User> allUsers = dummyDao.getAllUsers();
		List<Video> allVideos = dummyDao.getAllVideos();
		
		for(User u : allUsers) {
			for(int i=0; i<10; i++) {
				History history = new History();
				
				int uno = u.getNo();
				int rno = rand.nextInt(allVideos.size());
				int vno = allVideos.get(rno).getNo();
				
				History existHistory = dummyDao.getVideoReportHistory(history);
				if(existHistory == null) {
					
					history.setUserNo(uno);
					history.setTargetNo(vno);
					history.setReportContents("신고합니다");
					
					dummyDao.recordVideoReportHistory(history);
					allVideos.remove(rno);
				}
			}
		}
	}
	
	public void changeVideoCreateDate() {
		
		Random rand = new Random();

		List<Video> allVideos = dummyDao.getAllVideos();
		for(Video video : allVideos) {
			Map<String, Object> map = new HashMap<String, Object>();
			LocalDate localDate = LocalDate.now().minusDays(rand.nextInt(1300));
			Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
			System.out.println(date);
			map.put("videoNo", video.getNo());
			map.put("createDate", date);
			dummyDao.changeVideoCreateDate(map);
		}
		
	}
	
	public void changeVideoVoteDate() {
		
		Random rand = new Random();
		
		List<History> histories = dummyDao.getVideoVoteHistories();
		for(History h : histories) {
			
			LocalDate localDate = LocalDate.now().minusDays(rand.nextInt(1300));
			Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
			h.setCreateDate(date);
			
			dummyDao.changeVideoVoteDate(h);
		}
	}
	
	public Video getVideoByNo(int no) {
		return dummyDao.getVideoByNo(no);
	}
	
	public void createSubscriptions() {
			
		List<User> allUsers = dummyDao.getAllUsers();
		System.out.println(allUsers);
		for(User u : allUsers) {
			for(User o : allUsers) {
				Subscription sub = new Subscription();
				if(u.getNo() != o.getNo()) {
					sub.setUserNo(u.getNo());
					sub.setOwnerNo(o.getNo());
					dummyDao.addNewSubscription(sub);
				}
			}
		}
	}
	
}
