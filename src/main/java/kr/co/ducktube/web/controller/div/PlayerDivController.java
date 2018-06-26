package kr.co.ducktube.web.controller.div;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.CreatorService;
import kr.co.ducktube.service.interfaces.PlayerService;
import kr.co.ducktube.util.StringUtil;
import kr.co.ducktube.vo.page.CommentsSummary;
import kr.co.ducktube.vo.page.PlayerSummary;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;
import kr.co.ducktube.vo.table.video.Video;

@Controller
@RequestMapping("/video")
public class PlayerDivController {

	@Autowired
	private CreatorService creatorService;
	@Autowired
	private PlayerService playerService;

	@SuppressWarnings("unused")
	@RequestMapping("/player")
	public String mediaPlayer(Model model, Integer videoNo, @LoginUser User loginUser, Integer subListNo, String allList) {

		if(loginUser == null) {
			loginUser = new User();
			loginUser.setNo(29);
		}
		
		if(subListNo != null) {
			List<PlayerSummary> subPlayList = playerService.getPlayListBylistNo(subListNo);
			if(videoNo == null) {
				videoNo = subPlayList.get(0).getVideoNo();
			}
			String sublistTitle = subPlayList.get(0).getPlaylistTitle();
			int sublistNo = subPlayList.get(0).getPlaylistNo();
			int sublistSize = subPlayList.size();
			model.addAttribute("SUB_PLAY_LIST",subPlayList);
			// 재생목록 번호
			model.addAttribute("SUB_PLAY_LIST_TITLE",sublistTitle);			
			model.addAttribute("SUB_PLAY_LIST_NO",sublistNo);			
			model.addAttribute("SUB_PLAY_LIST_SIZE",sublistSize);			
		}
		if(allList != null) {
			String allString = allList.replace("[", "").replace("]", "").replaceAll("\"", "");
			List<String> allListNo = Arrays.asList(allString.split(","));
			List<PlayerSummary> allPlayList = new ArrayList<PlayerSummary>();
			
			for (String allNo : allListNo) {
				Integer no = Integer.parseInt(allNo);
				allPlayList.add(playerService.getVideoDetailByNo(no));
			}
			System.out.println("1"+videoNo);
			if(videoNo == null) {
				videoNo = allPlayList.get(0).getVideoNo();
			}
			System.out.println("2"+videoNo);
			int alllistSize = allPlayList.size();
			// 모든 playList
			model.addAttribute("ALL_LIST",allPlayList);
			// 재생목록 리스트 Text
			model.addAttribute("LIST_STRING",allList);	
			model.addAttribute("ALL_PLAY_LIST_SIZE",alllistSize);	
		}
		if(videoNo == null) {
			videoNo = 202;
		}
		
		/*
		Map<String, Object> resultMap = creatorService.getPlayerPageInfo(videoNo);
		model.addAttribute("currentVideo", resultMap.get("currentVideo"));
		model.addAttribute("nextVideo", resultMap.get("nextVideo"));
		model.addAttribute("relationVideos", resultMap.get("relationVideos"));
		*/
		
		PlayerSummary video = playerService.getVideoDetailByNo(videoNo);
		int likeCount = playerService.getVideoLikesCountByNo(videoNo);
		int hateCount = playerService.getVideoHateCountByNo(videoNo);
		int viewCount = playerService.getVideoViewCountByNo(videoNo);
		int commentCount = playerService.getCountCommentByVideoNo(videoNo);
		
		model.addAttribute("VIDEO_DETAILE",video);
		model.addAttribute("VIDEO_LIKE_COUNT", likeCount);
		model.addAttribute("VIDEO_HATE_COUNT", hateCount);
		model.addAttribute("VIDEO_VIEW_COUNT", viewCount);
		model.addAttribute("COMMENTS_VIEW_COUNT",commentCount);
		
		List<CommentsSummary> comments = playerService.getVideoCommentByVideoNo(videoNo);
		System.out.println(comments);
		model.addAttribute("VIDEO_COMMENTS",comments);
		

		
		if(loginUser != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("targetNo",videoNo);
			map.put("userNo", loginUser.getNo());
			// 유저의 영상 좋아요 싫어요 정보
			String userVideoVote = playerService.getVideoVoteByHistory(map);
			model.addAttribute("VIDEO_VOTE_BY_USER",userVideoVote);
/*			// 유저의 댓글 좋아요 싫어요 정보
			String userCommentVote = playerService.getCommentVoteByHistory(map);
			model.addAttribute("VIDEO_COMMENT_BY_USER",userCommentVote);*/

			Map<String, Object> subMap = new HashMap<String, Object>();
			subMap.put("userNo",loginUser.getNo());
			subMap.put("ownerNo",video.getCreatorNo());
			Subscription subDetail = playerService.getSubScriptionByMap(subMap);
			model.addAttribute("SUB_DETAIL",subDetail);
		}

		List<Video> videos = creatorService.getRelationVideos(loginUser.getNo(), videoNo, 21);
		List<Video> leftVideos = new ArrayList<Video>();
		Video nextVideo = new Video();

		int relationSize = videos.size();		

		if(relationSize > 1) {
			nextVideo = videos.get(0);
			videos.remove(nextVideo);
			

			if(relationSize <= 12) {
				leftVideos = videos;
			} else {
				leftVideos = videos.subList(0, 12);
			}
		}
		String subString = StringUtil.getShortString(20, nextVideo.getTitle());
		nextVideo.setTitle(subString);
		model.addAttribute("NEXT_VIDEO", nextVideo);
		model.addAttribute("PLAY_LIST",videos);
		model.addAttribute("END_LIST",leftVideos);

		int subCount = playerService.getSubCountByOwnerNo(video.getCreatorNo());
		model.addAttribute("SUB_COUNT",subCount);
		
		
		return "video/player.jsp";
	}
	
}
