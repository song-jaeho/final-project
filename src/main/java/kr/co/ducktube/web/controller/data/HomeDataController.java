package kr.co.ducktube.web.controller.data;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.CreatorService;
import kr.co.ducktube.service.interfaces.HomeService;
import kr.co.ducktube.service.interfaces.LibraryService;
import kr.co.ducktube.service.interfaces.SubscriptionService;
import kr.co.ducktube.vo.criteria.HomeCriteria;
import kr.co.ducktube.vo.criteria.LibraryCriteria;
import kr.co.ducktube.vo.criteria.VideoCriteria;
import kr.co.ducktube.vo.form.VideoSearchForm;
import kr.co.ducktube.vo.page.LibrarySummary;
import kr.co.ducktube.vo.page.PopularListSummary;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;

@Controller
@RequestMapping("/home")
public class HomeDataController {

	@Autowired
	private HomeService homeService;
	
	@Autowired
	private LibraryService libraryService;
	
	@Autowired
	private SubscriptionService subscriptionService;
	
	@Autowired
	private CreatorService creatorService;
	
	@ResponseBody
	@RequestMapping("/video-search")
	public Map<String, Object> search(VideoSearchForm form){

		Map<String, Object> map = new HashMap<String, Object>();
		
		VideoCriteria videoCriteria = new VideoCriteria();
		VideoCriteria channelCriteria = new VideoCriteria();
		VideoCriteria playlistCriteria = new VideoCriteria();
		
		BeanUtils.copyProperties(form, videoCriteria);
		BeanUtils.copyProperties(form, channelCriteria);
		BeanUtils.copyProperties(form, playlistCriteria);
		
		videoCriteria.setStatus("enabled");
		channelCriteria.setStatus("enabled");
		playlistCriteria.setStatus("enabled");

		Date toDate = new Date();
		Date fromDate = new Date();
		LocalDateTime nowL = toDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
		
		String createDate = form.getCreateDate();
		if("total".equals(createDate)) {
			
			toDate = null;
			fromDate = null;
			
		} else if("hour".equals(createDate)) {
			
			LocalDateTime fromDateL = nowL.minusHours(1);
			fromDate = Date.from(fromDateL.atZone(ZoneId.systemDefault()).toInstant());
			
		} else if("today".equals(createDate)) {
			
			fromDate = Date.from(nowL.toLocalDate().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
			
		} else if("week".equals(createDate)) {

			LocalDate fromDateL = nowL.with((DayOfWeek.MONDAY)).toLocalDate();
			fromDate = Date.from(fromDateL.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
			
		} else if("month".equals(createDate)) {
			
			LocalDate fromDateL = nowL.with(TemporalAdjusters.firstDayOfMonth()).toLocalDate();
			fromDate = Date.from(fromDateL.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
			
		} else if("year".equals(createDate)) {
			
			LocalDate fromDateL = nowL.with(TemporalAdjusters.firstDayOfYear()).toLocalDate();
			fromDate = Date.from(fromDateL.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
			
		}
		
		videoCriteria.setFromDate(fromDate);
		videoCriteria.setToDate(toDate);
		
		channelCriteria.setFromDate(fromDate);
		channelCriteria.setToDate(toDate);
		
		playlistCriteria.setFromDate(fromDate);
		playlistCriteria.setToDate(toDate);
		
		
		String function = form.getFunction();
		if("total".equals(function)) {
			// do nothing
		} else if("short-time".equals(function)) {
			
			videoCriteria.setPlayTimeStand("short");
			channelCriteria.setPlayTimeStand("short");
			playlistCriteria.setPlayTimeStand("short");
			
		} else if("long-time".equals(function)) {
			
			videoCriteria.setPlayTimeStand("long");
			channelCriteria.setPlayTimeStand("long");
			playlistCriteria.setPlayTimeStand("long");
			
		} else if("high-fps".equals(function)) {
			
			videoCriteria.setFrameStand("high");
			channelCriteria.setFrameStand("high");
			playlistCriteria.setFrameStand("high");
			
		}
		
		
		String sortBy = form.getSortBy();
		if("relation".equals(sortBy)) {
			
			videoCriteria.setOrderColumn("proximityPoint");
			videoCriteria.setOrderDirection("desc");
			
			channelCriteria.setOrderColumn("proximityPoint");
			channelCriteria.setOrderDirection("desc");
			
			playlistCriteria.setOrderColumn("proximityPoint");
			playlistCriteria.setOrderDirection("desc");
			
		} else if("create-date".equals(sortBy)) {
			
			videoCriteria.setOrderColumn("createDate");
			videoCriteria.setOrderDirection("desc");
			
			channelCriteria.setOrderColumn("createDate");
			channelCriteria.setOrderDirection("desc");
			
			playlistCriteria.setOrderColumn("createDate");
			playlistCriteria.setOrderDirection("desc");
			
		} else if("watch-count".equals(sortBy)) {
			
			videoCriteria.setOrderColumn("watchCount");
			videoCriteria.setOrderDirection("desc");
			
			channelCriteria.setOrderColumn("watchCount");
			channelCriteria.setOrderDirection("desc");
			
			playlistCriteria.setOrderColumn("watchCount");
			playlistCriteria.setOrderDirection("desc");
			
		} else if("like-count".equals(sortBy)) {
			
			videoCriteria.setOrderColumn("(likeCount * 0.03) - (hateCount * 0.01)");
			videoCriteria.setOrderDirection("desc");
			
			channelCriteria.setOrderColumn("((likeCount * 0.03) - (hateCount * 0.01)) * similarVideoCount");
			channelCriteria.setOrderDirection("desc");
			
			playlistCriteria.setOrderColumn("(likeCount * 0.03) - (hateCount * 0.01)");
			playlistCriteria.setOrderDirection("desc");
			
		} else if("long-time".equals(sortBy)) {
			
			videoCriteria.setOrderColumn("duration");
			videoCriteria.setOrderDirection("desc");
			
			channelCriteria.setOrderColumn("duration");
			channelCriteria.setOrderDirection("desc");
			
			playlistCriteria.setOrderColumn("duration");
			playlistCriteria.setOrderDirection("desc");
			
		} else if("short-time".equals(sortBy)) {
			
			videoCriteria.setOrderColumn("duration");
			videoCriteria.setOrderDirection("asc");
			
			channelCriteria.setOrderColumn("duration");
			channelCriteria.setOrderDirection("asc");
			
			playlistCriteria.setOrderColumn("duration");
			playlistCriteria.setOrderDirection("asc");
		}
		
		
		String type = form.getType();
		if("total".equals(type)) {
			
			videoCriteria.setStartRownum(form.getVideoStartRn());
			videoCriteria.setEndRownum(form.getVideoEndRn());
			map = creatorService.videoSearch(videoCriteria, map);

			channelCriteria.setStartRownum(form.getChannelStartRn());
			channelCriteria.setEndRownum(form.getChannelEndRn());
			map = creatorService.channelSearch(channelCriteria, map);
			
			playlistCriteria.setStartRownum(form.getPlaylistStartRn());
			playlistCriteria.setEndRownum(form.getPlaylistEndRn());
			map = creatorService.playlistSearch(playlistCriteria, map);
			
		} else if("video".equals(type)) {
			
			videoCriteria.setStartRownum(form.getVideoStartRn());
			videoCriteria.setEndRownum(form.getVideoEndRn());
			map = creatorService.videoSearch(videoCriteria, map);
			
		} else if("channel".equals(type)) {
			
			channelCriteria.setStartRownum(form.getChannelStartRn());
			channelCriteria.setEndRownum(form.getChannelEndRn());
			map = creatorService.channelSearch(channelCriteria, map);
			
		} else if("playlist".equals(type)) {
			
			playlistCriteria.setStartRownum(form.getPlaylistStartRn());
			playlistCriteria.setEndRownum(form.getPlaylistEndRn());
			map = creatorService.playlistSearch(playlistCriteria, map);
			
		}
		return map;
	}
	
	@RequestMapping("/watchlaterInsert")
	public @ResponseBody String wInsert(Integer videoNo, @LoginUser User loginUser) {
		System.out.println(videoNo +", " + loginUser.getNo());
		//watchlater에 이 비디오가 있는지 없는지 확인 있으면 리턴.
		HomeCriteria criteria = new HomeCriteria();
		criteria.setUserNo(loginUser.getNo());
		criteria.setVideoNo(videoNo);
		LibrarySummary obj = homeService.checkWatchLater(criteria);
		System.out.println(obj);
		if(obj != null) {
			return "fail";
		}
		homeService.addWatchLater(criteria);
		return "success";
	}
	
	@RequestMapping("/videosInsert")
	public @ResponseBody void vInsert(HomeCriteria criteria, @LoginUser User loginUser){
		List<Integer> group = criteria.getPlaylistGroup();
		if(group==null) {
			return;
		}
		int vNo = criteria.getVideoNo();
		System.out.println("플리스트 비디오 no: "+vNo);
		LibrarySummary video = libraryService.getVideoByNo(vNo);
		System.out.println(video);
		
		List<Integer> playlistNos = criteria.getPlaylistGroup();
		HomeCriteria hCriteria = new HomeCriteria();
		hCriteria.setVideoNo(criteria.getVideoNo());
		hCriteria.setPreview(video.getPreviewA3Url());
		
		for(Integer pl : playlistNos) {
			hCriteria.setPlaylistNo(pl);
			LibrarySummary pls = homeService.checkPlaylistVideo(hCriteria);
			if(pls != null) {
				System.out.println("!중복 playlistNo:" + pls.getPlaylistNo() + "videoNo:" + pls.getVideoNo());
				continue;
			}
			
			int videoCount = homeService.getPlaylistVideoCount(pl);
			//System.out.println("현재리스트에있는 비디오 갯수: " + videoCount);
			hCriteria.setVideoCount(videoCount+1);
			homeService.addPlaylistVideo(hCriteria);
			if(videoCount == 0) {
				//hCriteria.setPreview(criteria.getPreview());
				//System.out.println("이미지를 플레이리스트대표이미지에 저장한다.");
				//System.out.println(hCriteria);
				homeService.playlistPreviewUpdate(hCriteria);
			}
		}
	}
	
	@RequestMapping("/playlistInsert")
	public @ResponseBody Map<String, Object> plInsert(HomeCriteria criteria, @LoginUser User loginUser){
		Map<String, Object> map = new HashMap<String, Object>();
		criteria.setUserNo(loginUser.getNo());
		homeService.addPlaylist(criteria);
		//플레이리스트를 다시 받아서 내려준다.
		List<LibrarySummary> playlist = libraryService.getplaylistData(loginUser.getNo());
		map.put("success", true);
		map.put("list", playlist);
		
		return map;
	}
	
	@RequestMapping("/plModalOpenEvent")
	public @ResponseBody Map<String, Object> modalOpenEvent(@LoginUser User loginUser, Integer videoNo){
		Map<String, Object> map = new HashMap<String, Object>();
		List<LibrarySummary> playlist = libraryService.getplaylistData(loginUser.getNo());
		if(playlist.isEmpty()) {
			map.put("success", false);
			return map;
		}
		for(LibrarySummary pl : playlist) {
			int plno = pl.getPlaylistNo();
			List<LibrarySummary> videos = libraryService.getPlayListVideoList(plno);
			if(videos.isEmpty()) {
				continue;
			}
			for(LibrarySummary vs : videos) {
				int vno = vs.getVideoNo();
				if(vno == videoNo) {
					pl.setCheckPlaylistVideo("true");
					break;
				}
			}
		}
		map.put("success", true);
		map.put("playlist", playlist);
		return map;
	}
	
	@RequestMapping("/popularlist")
	public @ResponseBody Map<String, Object> list(Integer pageNo, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("LOGIN_USER");
		
		int pno = pageNo;
		int rows = 20;
		int beginIndex = (pno - 1) * rows + 1;
		int endIndex = pno * rows;
		
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
//		List<PopularListSummary> popularList = new ArrayList<PopularListSummary>();
		List<PopularListSummary> popularList = homeService.getPopularList(criteria);
		
		if(popularList.isEmpty()) {
			map.put("success", false);
			map.put("user", user);
			return map;
		}
		
		map.put("user", user);
		map.put("success", true);
		map.put("items", popularList);
		
		return map;
	}
	
	@RequestMapping("/logout")
	public @ResponseBody String logout(HttpSession session) {
		session.invalidate();
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String login(String loginEmail, String loginPwd, HttpSession session) {
		User user = homeService.getUserByEmail(loginEmail);
//		User user = new User();
//		user.setEmail(loginEmail);
//		user.setPassword(loginPwd);
//		user.setNick("김파닭");
		if(user == null) {
			return "error";
		}
		if(!loginPwd.equals(user.getPassword())) {
			return "error";
		}
		session.setAttribute("LOGIN_USER", user);
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/sublistShowMore")
	public Map<String, Object> sublistShowMore(@LoginUser User loginUser, String which) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		map.put("userNo", loginUser.getNo());
		List<Subscription> sublist = subscriptionService.getSubscriptionByCondition(map);
		returnMap.put("totalLength", sublist.size() - 7);
		
		if (which.equals("hide")) {
			map.put("maxIndex", 7);
			sublist = subscriptionService.getSubscriptionByCondition(map);
		}
		
		returnMap.put("sublist", sublist);
		return returnMap;
	}
}
