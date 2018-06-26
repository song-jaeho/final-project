package kr.co.ducktube.web.controller.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.LibraryService;
import kr.co.ducktube.vo.criteria.HomeCriteria;
import kr.co.ducktube.vo.criteria.LibraryCriteria;
import kr.co.ducktube.vo.page.CommentReplySummary;
import kr.co.ducktube.vo.page.LibrarySummary;
import kr.co.ducktube.vo.table.User;

@Controller
@RequestMapping("/library")
public class LibraryDataController {

	@Autowired
	private LibraryService libraryService;
	
	@RequestMapping("/writingDelete")
	public @ResponseBody Map<String, Object> writingDelete(Integer writingNo){
		Map<String, Object> map = new HashMap<String, Object>();
		libraryService.writingDelete(writingNo);
		map.put("success", true);
		return map;
	}
	
	@RequestMapping("/writingCommentDelete")
	public @ResponseBody Map<String, Object> commentDelete(Integer commentNo){
		Map<String, Object> map = new HashMap<String, Object>();
		libraryService.writingCommentDelete(commentNo);
		map.put("success", true);
		return map;
	}
	
	@RequestMapping("/communityCommentVote")
	public @ResponseBody Map<String, Object> likeVote(Integer commentNo, String sideValue, @LoginUser User loginUser){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentNo", commentNo);
		map.put("userNo", loginUser.getNo());
		map.put("side", sideValue);
		//System.out.println("클릭한 사이드 값: " + sideValue);
		LibrarySummary dbValue = libraryService.getWritingCommentSide(map);
		map.put("success", true);
		if(dbValue == null) {
			libraryService.insertWritingCommentSide(map);
			return map;
		}
		String dbSide = dbValue.getSide();
		//System.out.println("DB 사이드 값: "+ dbSide);
		if(sideValue.equals(dbSide)) {
			libraryService.deleteWritingCommentSide(map);
		} else {
			libraryService.updateWritingCommentSide(map);
		}
		return map;
	}
	
	@RequestMapping("/allCommentUpdate")
	public @ResponseBody void allCommentUpdate(String gubun, Integer commentNo, String comment) {
		System.out.println(gubun + ", " + commentNo + ", " + comment);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gubun", gubun);
		map.put("commentNo", commentNo);
		map.put("comment", comment);
		libraryService.cvcrUpdate(map);
	}
	
	@RequestMapping("/sortCmComment")
	public @ResponseBody Map<String, Object> sortCmComment(Integer cmWritingNo, String sortValue, @LoginUser User loginUser){
		Map<String, Object> map = new HashMap<String, Object>();
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setCmSortValue(sortValue);
		criteria.setCmWritingNo(cmWritingNo);
		criteria.setUserNo(loginUser.getNo());
		List<LibrarySummary> cmCommentList = libraryService.getCommunityCommentList(criteria);
		
		if(cmCommentList.isEmpty()) {
			map.put("success", false);
			return map;
		}
		
		map.put("list", cmCommentList);
		map.put("success", true);
		
		return map;
	}
	
	@RequestMapping("/cmCommentInsert")
	public @ResponseBody Map<String, Object> cmComentInsert(Integer writingNo, String comment, @LoginUser User loginUser) {
		Map<String, Object> map = new HashMap<String, Object>();
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setCmWritingNo(writingNo);
		criteria.setCmComment(comment);
		criteria.setUserNo(loginUser.getNo());
		
		LibraryCriteria userComment = libraryService.getcmCommentByUserNo(criteria);
		if(userComment != null) {
			map.put("success", false);
			return map;
		}
		
		libraryService.insertCmComment(criteria);
		
		List<LibrarySummary> cmCommentList = libraryService.getCommunityCommentList(criteria);
		int commentCount = cmCommentList.size();
		
		map.put("commentCount", commentCount);
		map.put("success", true);
		
		return map;
	}
	
	@RequestMapping("/communityTitleUpdate")
	public @ResponseBody String cmTitleUpdate(int cmWritingNo, String cmWritingContent) {
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setCmWritingNo(cmWritingNo);
		criteria.setCmWritingContent(cmWritingContent);
		libraryService.cmWritingContentUpdate(criteria);
		
		return "success";
	}
	
	@RequestMapping("/communityComment")
	public @ResponseBody Map<String, Object> communityComment(int communityNo, @LoginUser User loginUser){
		Map<String, Object> map = new HashMap<String, Object>();
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setCmWritingNo(communityNo);
		criteria.setUserNo(loginUser.getNo());
//		List<LibrarySummary> comments = new ArrayList<LibrarySummary>();
		List<LibrarySummary> comments = libraryService.getCommunityCommentList(criteria);
		if(comments.isEmpty()) {
			map.put("success", false);
			return map;
		}
		map.put("success", true);
		map.put("list", comments);
		
		return map;
	}
	
	@RequestMapping("/communityList")
	public @ResponseBody Map<String, Object> communityList(HttpSession session, Integer pageNo){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User)session.getAttribute("LOGIN_USER");
		
		int pno = pageNo;
		int rows = 20;
		int beginIndex = (pno - 1) * rows + 1;
		int endIndex = pno * rows;
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		criteria.setUserNo(user.getNo());
		
//		List<LibrarySummary> communityList = new ArrayList<LibrarySummary>();
		List<LibrarySummary> communityList = libraryService.getCommunityList(criteria);
		if(communityList.isEmpty()) {
			map.put("success", false);
			map.put("user", user);
			return map;
		}
		int totalCount = communityList.size();
		map.put("total", totalCount);
		map.put("success", true);
		map.put("user", user);
		map.put("list", communityList);
		
		return map;
	}
	
	@RequestMapping("/commentsReplysRemove")	
	public @ResponseBody void commentsReplysRemove(String gubun, Integer commentNo) {
		System.out.println(gubun + ", " + commentNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gubun", gubun);
		map.put("commentNo", commentNo);
		
		libraryService.commentsReplysRemove(map);
	}
	
	@RequestMapping("/commentList")
	public @ResponseBody Map<String, Object> commentList(HttpSession session, Integer pageNo){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User)session.getAttribute("LOGIN_USER");

		int pno = pageNo;
		int rows = 20;
		int beginIndex = (pno - 1) * rows + 1;
		int endIndex = pno * rows;
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		criteria.setUserNo(user.getNo());
		
		List<CommentReplySummary> cvcrList = libraryService.getcvCommentsReplys(criteria);
		for(CommentReplySummary crs : cvcrList) {
			if(crs.getType().equals("cc")) {
				crs.setVideoTitle("커뮤니티에 달린 댓글");
				crs.setStrNo("cc-"+crs.getCommentNo());
			}
			if(crs.getType().equals("cr")) {
				crs.setVideoTitle("커뮤니티의 댓글에 달린 답글");
				crs.setStrNo("cr-"+crs.getCommentNo());
			}
			if(crs.getType().equals("vc")) {
				crs.setVideoSub("에 달린 댓글");
				crs.setStrNo("vc-"+crs.getCommentNo());
			}
			if(crs.getType().equals("vr")) {
				crs.setVideoSub("의 댓글에 답글");
				crs.setStrNo("vr-"+crs.getCommentNo());
			}
		}

		if(cvcrList.isEmpty()) {
			map.put("success", false);
			return map;
		}

		map.put("list", cvcrList);
		map.put("success", true);
		map.put("user", user);
		
		return map;
	}
	
	@RequestMapping("/deleteAllHistory")
	public @ResponseBody void delAllHistory(@LoginUser User loginUser) {
		System.out.println("모두 지운다.");
		libraryService.deleteAllHistory(loginUser.getNo());
	}
	
	@RequestMapping("/watchRemove")
	public @ResponseBody void watchRemove(int videoNo, @LoginUser User loginUser) {
		HomeCriteria criteria = new HomeCriteria();
		criteria.setUserNo(loginUser.getNo());
		criteria.setVideoNo(videoNo);
		
		libraryService.deleteWatchHistory(criteria);
	}
	
	@RequestMapping("/watchHistoryList")
	public @ResponseBody Map<String, Object> watchHistoryList(HttpSession session, Integer pageNo, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User)session.getAttribute("LOGIN_USER");
		
		int pno = pageNo;
		int rows = 20;
		int beginIndex = (pno - 1) * rows + 1;
		int endIndex = pno * rows;
		LibraryCriteria criteria = new LibraryCriteria();
		criteria.setBeginIndex(beginIndex);
		criteria.setEndIndex(endIndex);
		criteria.setUserNo(user.getNo());
		criteria.setKeyword(keyword);
//		List<LibrarySummary> watchList = new ArrayList<LibrarySummary>();
		List<LibrarySummary> watchList = libraryService.getWatchList(criteria);
		if(watchList.isEmpty()) {
			map.put("success", false);
			return map;
		}
		//int watchCount = libraryService.getWatchCount(criteria);
		
		//map.put("total", watchCount);
		map.put("success", true);
		map.put("list", watchList);
		map.put("user", user);
		map.put("keyword", keyword);
		
		return map;
	}
	
	@RequestMapping("/playlistOrderUpdate")
	public @ResponseBody void playlistOrderUpdate(@RequestBody HomeCriteria nums) {
		//System.out.println(nums);
		libraryService.playlistOrderUpdate(nums);
	}
	
	@RequestMapping("/playlistImgUpdate")
	public @ResponseBody void playlistImgUpdate(int plno, String titleImg) {
		HomeCriteria criteria = new HomeCriteria();
		criteria.setPlaylistNo(plno);
		criteria.setPlaylistRepImg(titleImg);
		
		libraryService.playlistImgUpdate(criteria);
	}
	
	@RequestMapping("/statusUpdate")
	public @ResponseBody void statusUpdate(String status, int plno) {
		HomeCriteria criteria = new HomeCriteria();
		criteria.setPlaylistStatus(status);
		criteria.setPlaylistNo(plno);
		libraryService.changePlaylistStatus(criteria);
	}
	
	@RequestMapping("/playlistContentUpdate")
	public @ResponseBody void plContentUpdate(Integer plno, String content) {
		HomeCriteria criteria = new HomeCriteria();
		criteria.setPlaylistNo(plno);
		criteria.setPlaylistContent(content);
		libraryService.changePlaylistContent(criteria);
	}
	
	@RequestMapping("/playlistTitleUpdate")
	public @ResponseBody void pltitleUpdate(Integer plno, String title) {
		HomeCriteria criteria = new HomeCriteria();
		criteria.setPlaylistNo(plno);
		criteria.setPlaylistTitle(title);
		libraryService.changePlaylistTitle(criteria);
	}
	
	@RequestMapping("playlistVideoRemove")
	public @ResponseBody Map<String, Object> playlistVideoRemove(int plno, int videoNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		HomeCriteria criteria = new HomeCriteria();
		criteria.setPlaylistNo(plno);
		criteria.setVideoNo(videoNo);
		libraryService.deletePlaylistVideo(criteria);
		
		//order값을 변경후 정렬
		List<LibrarySummary> vListResult = libraryService.getPlayListVideoList(plno);
		for(LibrarySummary ls : vListResult) {
			Integer rk = ls.getRank();
			ls.setPlaylistOrder(rk);
			libraryService.plAllOrderUpdate(ls);
		}
		map.put("list", vListResult);
		
		//타이틀 비디오를 삭제할 경우
		LibrarySummary playlist = libraryService.getPlayListByPlno(plno);
		LibrarySummary video = libraryService.getVideoByNo(videoNo);
		String plImg = playlist.getPlaylistRepImg();
		String vImg = video.getPreviewA3Url();
		//System.out.println( plImg + ", " + vImg);
		if(plImg.equals(vImg)) {
			List<LibrarySummary> vList = libraryService.getPlayListVideoList(plno);
			System.out.println(vList);
			if(vList.isEmpty()) {
				//System.out.println("더이상 비디오가 없어서 이미지를 저장하지 못한다.noImg로 저장한다.");
				String videoImg = "/resources/temp/junsung/images/no-image.png";
				HomeCriteria hCriteria = new HomeCriteria();
				hCriteria.setPlaylistNo(plno);
				hCriteria.setPlaylistRepImg(videoImg);
				libraryService.playlistImgUpdate(hCriteria);
				
				map.put("videoImg", videoImg);
				map.put("saveTitleImg", true);
			} else {
				//System.out.println("플레이리스트 이미지를 비디오 첫번째 이미지로 교체한다.");
				LibrarySummary firstVideo = vList.get(0);
				String videoImg = firstVideo.getPreview_a1_url();
				
				//플레이리스트에 넣는다.
				HomeCriteria hCriteria = new HomeCriteria();
				hCriteria.setPlaylistNo(plno);
				hCriteria.setPlaylistRepImg(videoImg);
				libraryService.playlistImgUpdate(hCriteria);
				
				map.put("videoImg", videoImg);
				map.put("saveTitleImg", true);
			}
		}
		return map;
	}
	
	@RequestMapping("/playlistRemove")
	public @ResponseBody void playlistRemove(int plno) {
		libraryService.deleteAllPlaylistVideo(plno);
		libraryService.deletePlaylist(plno);
	}
	
	@RequestMapping("/playlistData")
	public @ResponseBody Map<String, Object> playlistData(Integer plno, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User)session.getAttribute("LOGIN_USER");
//		List<LibrarySummary> playlist = new ArrayList<LibrarySummary>();
		//System.out.println("kaka: "+plno);
		if(plno==0) {
			map.put("success", false);
			map.put("user", user);
			return map;
		}
		List<LibrarySummary> playlist = libraryService.getPlayListVideoList(plno);
		if(playlist.isEmpty() || user==null) {
			map.put("success", false);
			map.put("user", user);
			return map;
		}
		map.put("success", true);
		map.put("user", user);
		map.put("list", playlist);
		
		return map;
	}
	
	@RequestMapping("/laterRemove")
	public @ResponseBody void laterRemove(int videoNo, HttpSession session) {
		User user = (User)session.getAttribute("LOGIN_USER");
		System.out.println(videoNo + ", "+user.getNo());
		//유저 no에 맞는 videoNo를 삭제한다.
		HomeCriteria criteria = new HomeCriteria();
		criteria.setUserNo(user.getNo());
		criteria.setVideoNo(videoNo);
		
		libraryService.deleteWatchLater(criteria);
	}
	
	@RequestMapping("/laterList")
	public @ResponseBody Map<String, Object> laterList(HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("LOGIN_USER");
//		List<LibrarySummary> laterList = new ArrayList<LibrarySummary>();
		List<LibrarySummary> laterList = libraryService.getLaterList(user.getNo());
		if(laterList.isEmpty() || user==null) {
			map.put("laterSuccess", false);
			map.put("user", user);
			return map;
		}
		map.put("laterSuccess", true);
		map.put("user", user);
		map.put("laterList", laterList);

		return map;
	}
	
	@RequestMapping("/likeRemove")
	public @ResponseBody Map<String, Object> likeRemove(int videoNo, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User)session.getAttribute("LOGIN_USER");
		List<LibrarySummary> likeList = libraryService.getLikeList(user.getNo());
		Integer likeCount = likeList.size();
		
		System.out.println(videoNo + ", "+user.getNo());
		//유저 no에 맞는 videoNo를 삭제한다.
		HomeCriteria criteria = new HomeCriteria();
		criteria.setVideoNo(videoNo);
		criteria.setUserNo(user.getNo());
		
		libraryService.deleteLike(criteria);
		return map;
	}
	
	@RequestMapping("/likeList")
	public @ResponseBody Map<String, Object> likeList(HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("LOGIN_USER");
//		List<LibrarySummary> likeList = new ArrayList<LibrarySummary>();
		List<LibrarySummary> likeList = libraryService.getLikeList(user.getNo());
		if(likeList.isEmpty() || user==null) {
			map.put("success", false);
			map.put("user", user);
			return map;
		}
		map.put("success", true);
		map.put("user", user);
		map.put("list", likeList);
		
		return map;
	}
}
