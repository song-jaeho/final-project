package kr.co.ducktube.web.controller.div;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.CreatorService;
import kr.co.ducktube.service.interfaces.LibraryService;
import kr.co.ducktube.service.interfaces.PlayerService;
import kr.co.ducktube.service.interfaces.SubscriptionService;
import kr.co.ducktube.vo.criteria.VideoCriteria;
import kr.co.ducktube.vo.page.LibrarySummary;
import kr.co.ducktube.vo.page.SubscriptionSummary;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;
import kr.co.ducktube.vo.table.video.Category;
import kr.co.ducktube.vo.table.video.Video;

@Controller
@RequestMapping("/home")
public class HomeDivController {

	@Autowired
	private LibraryService libraryService;
	
	@Autowired
	private PlayerService playerService;
	
	@Autowired
	private CreatorService creatorService;
	
	@Autowired
	private SubscriptionService subscriptionService;
	
	@RequestMapping("/list")
	public String launch(Model model, @LoginUser User loginUser , String divURL) {
		
		String startingDiv = "/home/home";
		if(divURL != null && !"null".equals(divURL)) {
			startingDiv = divURL;
		}
		if(loginUser != null) {
//			List<LibrarySummary> playlist = new ArrayList<LibrarySummary>();
			List<LibrarySummary> playlist = libraryService.getplaylistData(loginUser.getNo());
			List<Subscription> subscriptionList = subscriptionService.getAllSubscribeByUserNo(loginUser.getNo());

			model.addAttribute("subscriptionList", subscriptionList);
			model.addAttribute("subscriptionListLength", subscriptionList.size());
			model.addAttribute("playlist", playlist);
		}
		model.addAttribute("divURL", startingDiv);
		
		return "home/list.jsp";
	}
	
	@RequestMapping("/search-page")
	public String searchDiv(Model model, String keywords) {
		model.addAttribute("categories", creatorService.getAllVideoCategories());
		return "home/search.jsp";
	}
	
	@RequestMapping("/home")
	public String home(@LoginUser User loginUser, Model model, String divURL) {
		
		// *** 기본 제공 메뉴 [시작]
		List<Category> categories = creatorService.getAllVideoCategories();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		int videosPerCat = 12;

		for(Category c : categories) {
			Map<String, Object> map = new HashMap<String, Object>();
			VideoCriteria criteria = new VideoCriteria();
			criteria.setStatus("enabled");
			criteria.setPrimaryCategoryNo(c.getNo());
			criteria.setRelationCategorySearch(true);
			criteria.setOrderColumn("createDate");
			criteria.setOrderDirection("desc");
			criteria.setStartRownum(1);
			criteria.setEndRownum(videosPerCat);
			List<Video> videos = creatorService.getVideos(criteria);
			if(videos.size() > 0) {
				map.put("category", c);
				map.put("videos", videos);
				result.add(map);
			}
		}
		
		model.addAttribute("result", result);
		// *** 기본 제공 메뉴 [끝]
		
		// *** 유져 최근 시청 분석 및 연관 영상 제공 [시작]
		Map<String, Object> recentRelation = new HashMap<String, Object>();
		
		if(loginUser != null) {
			Integer recentVideoNo = creatorService.getRecentlyWatchedVideo(loginUser.getNo());
			if(recentVideoNo != null) {
				List<Video> videos = creatorService.getRelationVideos(loginUser.getNo() , recentVideoNo, videosPerCat);
				recentRelation.put("categoryName", "최근 시청 연관 동영상");
				recentRelation.put("videos", videos);
				model.addAttribute("recentRelation", recentRelation);
			}
		}
		// *** 유져 최근 시청 분석 및 연관 영상 제공 [끝]
		
		return "home/home.jsp";
	}
	
	@RequestMapping("/popular")
	public String popular() {
		return "home/popular.jsp";
	}
	
	@RequestMapping("/subscription")
	public String subscription(Model model, int userNo) {
		List<SubscriptionSummary> subList = playerService.getSubOrderCreateDateByUserNo(userNo);
		model.addAttribute("subList",subList);
		
		for(SubscriptionSummary sub : subList) {
			String date = playerService.getSubDateFormat(sub.getCreateDate(), new Date());
			sub.setWhenToday(date);
			System.out.println(sub.getWhenToday());
			int count = playerService.getVideoViewCountByNo(sub.getVideoNo());
			sub.setViewCount(count);
		}
		
		return "home/subscription.jsp";
	}

}