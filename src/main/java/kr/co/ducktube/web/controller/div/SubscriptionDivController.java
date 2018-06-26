package kr.co.ducktube.web.controller.div;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.SubscriptionService;
import kr.co.ducktube.service.interfaces.UserService;
import kr.co.ducktube.vo.page.ChannelNoticeSummary;
import kr.co.ducktube.vo.page.ChannelSummary;
import kr.co.ducktube.vo.page.PlayListSummary;
import kr.co.ducktube.vo.page.VideoSummary;
import kr.co.ducktube.vo.table.CommunityComments;
import kr.co.ducktube.vo.table.CommunityReplies;
import kr.co.ducktube.vo.table.CommunityWritings;
import kr.co.ducktube.vo.table.Playlist;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;

@Controller
@RequestMapping("/subscriptions")
public class SubscriptionDivController {
	
	@Autowired
	SubscriptionService subscriptionService;
	@Autowired
	UserService userService;

	@RequestMapping("/subscribe")
	public String subscribe(@LoginUser User loginUser, Model model) {
		
		List<Subscription> list = subscriptionService.getAllSubscribeByUserNo(loginUser.getNo());
		model.addAttribute("subscribeList", list);
		return "subscriptions/subscribe.jsp";
	}
	
	@RequestMapping("/main")
	public String subscribtionHome(@LoginUser User loginUser, Model model, Integer creatorNo, 
									Integer min, Integer max, Integer pagingPlaylistNo, Integer playlistMin, Integer playlistMax) {

		boolean isSubscribe = false;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownerNo", creatorNo);	
		map.put("location", "main");

		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
			List<Integer> owners = subscriptionService.getSubscribingOwnerNoByUserNo(loginUser.getNo());
			for (Integer owner : owners) {
				if (owner.equals(creatorNo)) {
					isSubscribe = true;
				}
			}	
			map.put("userNo", loginUser.getNo());
			map.put("creatorNo", map.get("ownerNo"));
			
			List<ChannelSummary> list = subscriptionService.getChannelInfoByCreatorNo(map);
			ChannelNoticeSummary cns = subscriptionService.getChannelNoticeByMap(map);
			String str = "";
			if (cns == null) {
				str = "off";
			} else if (cns != null) {
				str = cns.getNotice();
			}
			
			model.addAttribute("noticeStatus", str);
			model.addAttribute("recommendChannels", list);
			
			PlayListSummary loginUserPS = subscriptionService.getPlaylistFullInfoByMapForUser(map);
			model.addAttribute("loginUserPlaylists", loginUserPS.getPlaylists());
		}

		PlayListSummary playlistSummary =  subscriptionService.getPlaylistFullInfoByMapForOwner(map);
		User user =  playlistSummary.getUser();
		ChannelSummary thisUserChannel =  subscriptionService.getChannelInfoByOwnerNo(user.getNo());

		Map<String, Object> returnedMap = subscriptionService.getVideosInfoByMap(map);	
		@SuppressWarnings("unchecked")
		List<VideoSummary> subVideos = (List<VideoSummary>) returnedMap.get("updateList");
		
		model.addAttribute("isSubscribe", isSubscribe);
		model.addAttribute("playlists", playlistSummary.getPlaylists());
		model.addAttribute("subVideos", subVideos);
		model.addAttribute("user", user);
		model.addAttribute("thisUserChannel", thisUserChannel);
		return "subscriptions/main.jsp";
	}
	
	
	@RequestMapping("/community")
	public String community(@LoginUser User loginUser, Model model, Integer creatorNo, String location) {

		boolean isOwner = false;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownerNo", creatorNo);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
			map.put("userNo", loginUser.getNo());
			List<ChannelSummary> channels = subscriptionService.getChannelInfoByCreatorNo(map);
			model.addAttribute("recommendChannels", channels);
		}
		List<CommunityWritings> list = subscriptionService.getCommunityWritingsByOwnerNo(map);
		model.addAttribute("communityWritingsList", list);

		Map<String, Object> commentMap = new HashMap<String, Object>();
		for (CommunityWritings cw : list) {
			
			commentMap.putAll(map);
			commentMap.put("writingNo", cw.getNo());
			List<CommunityComments> communityCommentsList = subscriptionService.getCommunityCommentsByWritingNo(commentMap);
			
			for (CommunityComments cc : communityCommentsList) {	
				
				if (cc.getCommenterNo().equals(loginUser.getNo())) {
					cw.setWrittenComments(cc);
				}
			}
		}
		if (creatorNo.equals(loginUser.getNo())) {
			isOwner = true;
		}
		model.addAttribute("creatorNo", creatorNo);
		model.addAttribute("location", location);
		model.addAttribute("isOwner", isOwner);
		return "subscriptions/community.jsp";
	}
	
	@RequestMapping("/channels")
	public String channels(@LoginUser User loginUser, Model model, Integer creatorNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownerNo", creatorNo);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
			map.put("userNo", loginUser.getNo());			
		}
		List<ChannelSummary> list = subscriptionService.getChannelInfoByCreatorNo(map);
		model.addAttribute("channels", list);			

		return "subscriptions/channels.jsp";
	}
	
	@RequestMapping("/playlist")
	public String createdPlaylists(@LoginUser User loginUser, Model model, Integer playlistNo, 
									Integer creatorNo, String criteria, String location, Integer min, Integer max) {
		
		if (min == null && max == null) {
			min = 1;
			max = 10;
		}
		
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}
		
		model.addAttribute("creatorNo", creatorNo);
		
		if (criteria == null) {
			criteria = "recent";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownerNo", creatorNo);
		
		map.put("playlistNo", playlistNo);
		map.put("criteria", criteria);
		map.put("min", min);
		map.put("max", max);
		List<Playlist> list =  subscriptionService.getPlaylistByCondition(map);
		model.addAttribute("playlists", list);
		model.addAttribute("listLength", list.size());
		
		if (location != null && location.equals("playlists")) {
			return "subscriptions/playlists/allPlaylists.jsp";
		}
		return "subscriptions/playlists/playlists.jsp";
	}
	
	@RequestMapping("/videos")
	public String changeVideos(@LoginUser User loginUser, Model model, String criteria, String playlist, Integer creatorNo
								,Integer min, Integer max, Integer newIndex) {

		if (min == null && max == null) {
			min = 1;
			max = 30;
		}
		
		Integer index = 1;
		if (newIndex != null) {
			index = newIndex;
		}
		boolean noMorePage = false;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownerNo", creatorNo);
		map.put("location", "videos");
		map.put("videosMin", min);
		map.put("videosMax", max);	

		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			map.put("userNo", loginUser.getNo());
		}
			
		if (criteria == null || playlist == null) {
			map.put("criteria", "newest");
			map.put("playlist", "uploaded");
			
			@SuppressWarnings("unchecked")
			List<VideoSummary> updateList = (List<VideoSummary>) subscriptionService.getVideosInfoByMap(map).get("updateList"); 
			Integer updateListTotalLength = (Integer) subscriptionService.getVideosInfoByMap(map).get("updateListTotalLength");
			
			model.addAttribute("criteria", "newest");
			model.addAttribute("playlist", "uploaded");
			model.addAttribute("creatorNo", creatorNo);
			model.addAttribute("subVideos", updateList);
			if (updateList.size() >= updateListTotalLength) {
				noMorePage = true;
			}
			model.addAttribute("initUpdateListSize", updateList.size());
			
			if (loginUser != null) {
				PlayListSummary loginUserPS = subscriptionService.getPlaylistFullInfoByMapForUser(map);
				model.addAttribute("loginUserPlaylists", loginUserPS.getPlaylists());
			}
			model.addAttribute("noMorePage", noMorePage);
			model.addAttribute("index", index);
			index ++;
			return "subscriptions/videos/videos.jsp";
		}
		map.put("playlist", playlist);
		map.put("criteria", criteria);
		model.addAttribute("criteria", criteria);
		model.addAttribute("playlist", playlist);
		model.addAttribute("creatorNo", creatorNo);
		
		Map<String,Object> returnedMap = subscriptionService.getVideosInfoByMap(map);
		
		@SuppressWarnings("unchecked")
		List<VideoSummary> likeList = (List<VideoSummary>) returnedMap.get("likeList"); 
		Integer likeListTotalLength = (Integer) returnedMap.get("likeListTotalLength");
		
		@SuppressWarnings("unchecked")
		List<VideoSummary> updateList = (List<VideoSummary>) returnedMap.get("updateList");
		Integer updateListTotalLength = (Integer) returnedMap.get("updateListTotalLength");
		
		@SuppressWarnings("unchecked")
		List<VideoSummary> wholeList = (List<VideoSummary>) returnedMap.get("wholeList"); 
		Integer wholeListTotalLength = (Integer) returnedMap.get("wholeListTotalLength");
		
		List<VideoSummary> subVideos = new ArrayList<VideoSummary>();
		subVideos.addAll(likeList);
		subVideos.addAll(updateList);
		subVideos.addAll(wholeList);
		
		model.addAttribute("subVideos", subVideos);
		if (playlist.equals("whole") && wholeList.size() >= wholeListTotalLength) {
			noMorePage = true;
			
		} else if(playlist.equals("liked") && likeList.size() >= likeListTotalLength) {
			noMorePage = true;
			
		} else if(playlist.equals("uploaded") && updateList.size() >= updateListTotalLength) {
			noMorePage = true;
			
		}
		model.addAttribute("noMorePage", noMorePage);
		model.addAttribute("likeListSize", likeList.size());
		model.addAttribute("updateListSize", updateList.size());
		model.addAttribute("wholeListSize", wholeList.size());
		model.addAttribute("index", index);
		index ++;
		return "subscriptions/videos/allVideos.jsp";
	}
	
	@RequestMapping("/comments")
	public String comment(@LoginUser User loginUser, Model model, Integer writingNo, Integer ownerNo, Integer commentIndex) {
		
		Integer newIndex = 1;
		if (commentIndex != null) {
			newIndex = commentIndex;
		}
		
		boolean isOwner = false;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writingNo", writingNo);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
			map.put("userNo", loginUser.getNo());
			if (loginUser.getNo() == ownerNo) {
				isOwner = true;
			}
		}		
		List<CommunityComments> communityCommentsList = subscriptionService.getCommunityCommentsByWritingNo(map);
		model.addAttribute("ownerNo", ownerNo);
		model.addAttribute("communityCommentsList", communityCommentsList);
		model.addAttribute("isOwner", isOwner);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("newIndex", newIndex);
		newIndex ++;
		return "subscriptions/comments.jsp";
	}

	@RequestMapping("/search")
	public String search(@LoginUser User loginUser, Model model, String keyword, Integer creatorNo
							,Integer min, Integer max) {
		
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}
		
		if (min == null && max == null) {
			min = 1;
			max = 30;
		}
		
		String searchKeyword = keyword.replace(" ", "");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("location", "search");
		map.put("ownerNo", creatorNo);
		map.put("searchKeyword", searchKeyword);
		map.put("videosMin", min);
		map.put("videosMax", max);
		
		Map<String, Object> returnedMap = subscriptionService.getVideosInfoByMap(map);
		@SuppressWarnings("unchecked")
		List<VideoSummary> searchVideos = (List<VideoSummary>) returnedMap.get("updateList");

		model.addAttribute("searchVideos", searchVideos);
		return "subscriptions/search.jsp";
	}
	
	@RequestMapping("/info")
	public String info(@LoginUser User loginUser, Model model, Integer creatorNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownerNo", creatorNo);
		
		if (loginUser != null) {
			
			model.addAttribute("loginUser", loginUser);
			
			map.put("userNo", loginUser.getNo());
			List<ChannelSummary> list = subscriptionService.getChannelInfoByCreatorNo(map);
			model.addAttribute("recommendChannels", list);
			
		}		
		
		ChannelSummary channelInfo = subscriptionService.getChannelInfoByOwnerNo(creatorNo);
		model.addAttribute("channelInfo", channelInfo);
		return "subscriptions/info.jsp";
	}
	
	@RequestMapping("/reply")
	public String reply(@LoginUser User loginUser, Model model, Integer targetNo, Integer first, Integer second) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
			map.put("userNo", loginUser.getNo());
		}
		
		boolean isOwner = false;
		
		CommunityReplies cr = subscriptionService.getCommunityRepliesByCommentNo(map);
		
		if (cr.getReplyerNo().equals(loginUser.getNo())) {
			isOwner = true;
		}
		model.addAttribute("communityReplies", cr);
		model.addAttribute("isOwner", isOwner);
		if (first == null && second == null) {
			first = 1;
			second = 1;
		}
		model.addAttribute("first", first);			
		model.addAttribute("second", second);			
		return "subscriptions/reply.jsp";
	}
}