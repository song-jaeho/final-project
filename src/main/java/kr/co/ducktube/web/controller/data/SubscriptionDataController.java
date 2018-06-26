package kr.co.ducktube.web.controller.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.SubscriptionService;
import kr.co.ducktube.vo.page.ChannelNoticeSummary;
import kr.co.ducktube.vo.page.VideoSummary;
import kr.co.ducktube.vo.table.CommunityComments;
import kr.co.ducktube.vo.table.CommunityReplies;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.User;

@Controller
@RequestMapping("/subscriptions")
public class SubscriptionDataController {
	
	@Autowired
	SubscriptionService subscriptionService;
	
	@SuppressWarnings("null")
	@RequestMapping(value="/subscribe.do")
	public @ResponseBody Map<String, Object> subscribe(@LoginUser User loginUser, Integer ownerNo, boolean whether) {		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (loginUser == null) {
			map.put("errorMessage", "로그인이 필요합니다.");
			return map;
		}
		map.put("ownerNo", ownerNo);
		map.put("userNo", loginUser.getNo());
		Map<String, Object> result = subscriptionService.subscribe(map);
		return result;
	}
	
	@RequestMapping(value="/noticeStatus.do")
	public @ResponseBody String tfvalue(@LoginUser User loginUser, Model model, Integer creatorNo) {
		
		if (loginUser == null) {
			return "로그인이 필요합니다.";
		}

		Map<String, Object> getmap = new HashMap<String, Object>();
		getmap.put("userNo", loginUser.getNo());
		getmap.put("creatorNo", creatorNo);
		ChannelNoticeSummary notice = subscriptionService.getChannelNoticeByMap(getmap);
				
		Map<String, Object> setmap = new HashMap<String, Object>();

		setmap.put("noticeStatus", notice.getNotice().equals("on") ? true : false);
		setmap.put("userNo", loginUser.getNo());
		setmap.put("creatorNo", creatorNo);
		subscriptionService.setChannelNoticeByMap(setmap);
		
		return subscriptionService.getChannelNoticeByMap(getmap).getNotice();
	}
	
	@RequestMapping(value="/report.do")
	public @ResponseBody String report(@LoginUser User loginUser, Model model, String criteria, String reportContents, Integer targetNo) {
		
		if (loginUser == null) {
			return "로그인이 필요합니다.";
		}
		
		String status = "fail";
		Map<String, Object> map = new HashMap<String, Object>();
		if (criteria.equals("writing")) {
			map.put("which", criteria);
			map.put("writingNo", targetNo);
			map.put("userNo", loginUser.getNo());
			map.put("reportContents", reportContents);
			status = "w";
			
		} else if (criteria.equals("comment")) {
			map.put("which", criteria);
			map.put("comment_no", targetNo);
			map.put("userNo", loginUser.getNo());
			map.put("reportContents", reportContents);
			status = "c";
			
		} else if (criteria.equals("reply")) {
			map.put("which", criteria);
			map.put("replyNo", targetNo);
			map.put("userNo", loginUser.getNo());
			map.put("reportContents", reportContents);
			status = "r";
			
		} else if (criteria.equals("video")) {
			map.put("which", criteria);
			map.put("userNo", loginUser.getNo());
			map.put("videoNo", targetNo);
			map.put("reportContents", reportContents);
			status = "v";
			
		} else if (criteria.equals("channel")) {
			map.put("which", criteria);
			map.put("userNo", loginUser.getNo());
			map.put("ownerNo", targetNo);
			map.put("reportContents", reportContents);
			status = "ch";
		}
		
		subscriptionService.setNewReport(map);
		
		return status;
	}
	
	@RequestMapping(value="/addComment.do")
	public @ResponseBody String addComment(@LoginUser User loginUser, Model model, Integer writingNo, String commentContents) {
		
		if (loginUser == null) {
			return "로그인이 필요합니다.";
		}
		
		String status = "fail";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writingNo", writingNo);
		map.put("commenterNo", loginUser.getNo());
		map.put("commentContents", commentContents);
		subscriptionService.setNewComment(map);
		status = "success";
		
		return status;
	}
	
	@RequestMapping(value="/updateComment.do")
	public @ResponseBody CommunityComments updateComment(@LoginUser User loginUser, ModelAndView mav,Model model, Integer writingNo, String commentContents, Integer commentNo, Integer commenterNo) {
		
		if (loginUser == null) {
			return null;
		}
		
		CommunityComments returnComment = new CommunityComments();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentNo", commentNo);
		map.put("writingNo", writingNo);
		map.put("commenterNo", commenterNo);
		
		map.put("commentContents", commentContents);
		subscriptionService.updateComment(map);
		
		List<CommunityComments> ccList = subscriptionService.getCommunityCommentsByWritingNo(map);
		for (CommunityComments cc : ccList) {
			if (cc.getNo().equals(commentNo)) {
				returnComment = cc;
			}
		}
		return returnComment;
	}
	
	@RequestMapping(value="/thumbs.do")
	public @ResponseBody Integer thumbs(@LoginUser User loginUser, Model model, String which, Integer targetNo, String side) {
		
		if (loginUser == null) {
			return 444;
		}
		
		boolean has = false;
		boolean same = false;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("which", which);
		map.put("userNo", loginUser.getNo());
		map.put("side", side);
		map.put("targetNo", targetNo);
		History history = subscriptionService.getVoteHistory(map);
		
		if (history != null) {
			has = true;
			if(history.getVoteSide().equals(side)) {
				same = true;
			}
		}
		map.put("has", has);
		map.put("same", same);
		Integer result = subscriptionService.changeThumbsHistory(map);
		return result;
	}
	
	@RequestMapping(value="/reply.do")
	public @ResponseBody String reply(@LoginUser User loginUser, Integer targetNo, String replyContents) {
		
		if (loginUser == null) {
			return "로그인이 필요합니다.";
		}
		
		String status = "fail";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("replyContents", replyContents);
		map.put("replierNo", loginUser.getNo());
		subscriptionService.setNewReply(map);
		status = "success";
		return status;
	}
	
	@RequestMapping(value="/modifyReply.do")
	public @ResponseBody CommunityReplies modifyReply(@LoginUser User loginUser, Integer targetNo, String replyContents, Integer commentNo, Integer replierNo) {
		
		if (loginUser == null) {
			return null;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("replyContents", replyContents);
		map.put("replierNo", replierNo);
		map.put("commentNo", commentNo);
		subscriptionService.updateReply(map);

		CommunityReplies returnCr = new CommunityReplies();
		
		map.put("userNo", loginUser.getNo());
		map.put("targetNo", commentNo);
		CommunityReplies cr = subscriptionService.getCommunityRepliesByCommentNo(map);
		if (cr.getNo().equals(targetNo)) {
			returnCr = cr;
		}

		return returnCr;
	}

	@RequestMapping(value="/addPlaylist.do")
	public @ResponseBody String addPlaylist(@LoginUser User loginUser, Integer playlistNo, Integer videoNo, String criteria) {
		
		if (loginUser == null) {
			return "로그인이 필요합니다.";
		}
		
		String status = "fail";
		Map<String, Object> map = new HashMap<String, Object>();
		if (criteria.equals("myPlaylist")) {
			map.put("playlistNo", playlistNo);
			map.put("videoNo", videoNo);
			status = subscriptionService.addVideoToPlaylist(map);	
			
		} else if (criteria.equals("watchLater")) {
			map.put("videoNo", videoNo);
			map.put("userNo", loginUser.getNo());
			status = subscriptionService.addToWatchLater(map);
		}
		return status;
	}
	
	@RequestMapping(value="/addPagingVideo.do")
	public @ResponseBody Map<String, Object> addPagingVideo(@LoginUser User loginUser, Model model, String criteria, String playlist, Integer creatorNo
			,Integer updateMin,Integer updateMax,Integer likeMin, Integer likeMax, Integer wholeMin, Integer wholeMax, Integer gap) {

		boolean islikeLastPage = false;
		boolean isUpdateLastPage = false;
		boolean isWholeLastPage = false;
		boolean noMorePage = false;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownerNo", creatorNo);
		map.put("location", "videos");

		if (criteria == null || playlist == null) {
			map.put("criteria", "newest");
			map.put("playlist", "uploaded");
		} else {
			map.put("playlist", playlist);
			map.put("criteria", criteria);			
		}
		
		if (playlist.equals("whole")) {
			map.put("videosMin", wholeMin);
			map.put("videosMax", wholeMax);
			
		} else if (playlist.equals("liked")) {
			map.put("videosMin", likeMin);
			map.put("videosMax", likeMax);
			
		} else if (playlist.equals("uploaded")) {
			map.put("videosMin", updateMin);
			map.put("videosMax", updateMax);
			
		}
	
		Map<String, Object> returnedMap = subscriptionService.getVideosInfoByMap(map);	
		
		@SuppressWarnings("unchecked")
		List<VideoSummary> likeList = (List<VideoSummary>) returnedMap.get("likeList"); 
		model.addAttribute("likeList", likeList);
		
		@SuppressWarnings("unchecked")
		List<VideoSummary> updateList = (List<VideoSummary>) returnedMap.get("updateList"); 
		model.addAttribute("updateList", updateList);
		
		@SuppressWarnings("unchecked")
		List<VideoSummary> wholeList = (List<VideoSummary>) returnedMap.get("wholeList"); 
		model.addAttribute("wholeList", wholeList);
		
		if (playlist.equals("whole") && wholeList.size() <= gap) {
			isWholeLastPage = true;
		}
		if (playlist.equals("liked") && likeList.size() <= gap) {
			islikeLastPage = true;
		}
		if (playlist.equals("uploaded") && updateList.size() <= gap) {
			isUpdateLastPage = true;
		}
		
		if (isWholeLastPage || islikeLastPage || isUpdateLastPage) {
			noMorePage = true;
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("likeList", likeList);
		returnMap.put("updateList", updateList);
		returnMap.put("wholeList", wholeList);
		
		returnMap.put("loginUser", loginUser);
		returnMap.put("noMorePage", noMorePage);
		return returnMap;
	}
	
	@RequestMapping(value="/writing.do")
	public @ResponseBody String insertNewWritings(@LoginUser User loginUser, Model model, String writingContents) {
		String status = "fail";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writingContents", writingContents);
		map.put("writerNo", loginUser.getNo());
		subscriptionService.insertNewWritings(map);
		
		status = "success";
		return status;
	}
	
	@RequestMapping(value="/removeWriting.do")
	public @ResponseBody Map<String, Object> removeWriting(Model model, Integer writingNo, Integer index) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writingNo", writingNo);
		map.put("status", "disabled");
		subscriptionService.removeWriting(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("index", index);
		return returnMap;
	}
}
