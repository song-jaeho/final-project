package kr.co.ducktube.web.controller.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ducktube.service.interfaces.PlayerService;
import kr.co.ducktube.vo.page.CommentsSummary;
import kr.co.ducktube.vo.page.ReplySummary;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Subscription;


@Controller
@RequestMapping("/video")
public class PlayerDataController {

	@Autowired
	private PlayerService playerService;

	/*댓글 관련 AJAX*/
	@RequestMapping(path="/incomments/", method=RequestMethod.POST)
	@ResponseBody
	public CommentsSummary insertVideoComment(@RequestBody CommentsSummary vComment) {
		CommentsSummary newComment =  playerService.insertVideoComment(vComment);
		return newComment;
	}	
	
	@RequestMapping(path="/incomments/{no}", method=RequestMethod.GET)
	@ResponseBody
	public int getInsertCountCommentByVideoNo(@PathVariable("no") int no) {
		int inComment =  playerService.getCountCommentByVideoNo(no);
		return inComment;
	}
	
	@RequestMapping(path="/upComments/", method=RequestMethod.POST)
	@ResponseBody
	public CommentsSummary updateMyComment(@RequestBody CommentsSummary vComment) {
		CommentsSummary upComment =  playerService.updateMyComment(vComment);
		return upComment;
	}
	@RequestMapping(path="/upComments/{no}", method=RequestMethod.GET)
	@ResponseBody
	public CommentsSummary getUpdateMyComment(@PathVariable("no") int no) {
		CommentsSummary upComment =  playerService.getVideoCommentByCommentNo(no);
		return upComment;
	}
	@RequestMapping(path="/deComments/", method=RequestMethod.POST)
	@ResponseBody
	public CommentsSummary deleteComment(@RequestBody CommentsSummary vComment) {
		System.out.println("delete"+vComment);
		CommentsSummary comment =  playerService.deleteComment(vComment);
		return comment;
	}	
	@RequestMapping(path="/decomments/{no}", method=RequestMethod.GET)
	@ResponseBody
	public int getDeleteCountCommentByVideoNo(@PathVariable("no") int no) {
		int inComment =  playerService.getCountCommentByVideoNo(no);
		return inComment;
	}
	@RequestMapping(path="/seComments/{videoNo}",method=RequestMethod.GET)
	public @ResponseBody List<CommentsSummary> getVideoCommentByVideoNo(@PathVariable("videoNo") int videoNo) {
		
		List<CommentsSummary> comments = playerService.getVideoCommentByVideoNo(videoNo);
		
		return comments;
	}
	@RequestMapping(path="/upComments/{videoNo}/{userNo}",method=RequestMethod.GET)
	public @ResponseBody CommentsSummary getVideoCommentByComenterNo(@PathVariable("videoNo") int videoNo, @PathVariable("userNo") int userNo) {
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("videoNo", videoNo);
		map.put("commenterNo", userNo);
		CommentsSummary comments = playerService.getVideoCommentByComenterNo(map);
		return comments;
	}
	
	/*답글 관련 AJAX*/
	@RequestMapping(path="/inreply/", method=RequestMethod.POST)
	@ResponseBody
	public ReplySummary insertReply(@RequestBody ReplySummary reply) {
		ReplySummary newReply =  playerService.insertReply(reply);
		return newReply;
	}	
	
	@RequestMapping(path="/inreply/{no}", method=RequestMethod.GET)
	@ResponseBody
	public ReplySummary getInsertReply(@PathVariable("no") int no) {
		ReplySummary inReply =  playerService.getReplyByReplyNo(no);
		return inReply;
	}
	
	@RequestMapping(path="/sereply/{commentNo}",method=RequestMethod.GET)
	public @ResponseBody List<ReplySummary> getReplyByCommentNo(@PathVariable("commentNo") int commentNo) {
		
		List<ReplySummary> replies = playerService.getReplyByCommentNo(commentNo);
		return replies;
	}
	
	/*플레이 리스트 관련 AJAX*/
/*	@RequestMapping(path="/playList/{userNo}", method=RequestMethod.GET) 
	public @ResponseBody List<LibrarySummary> getPlayListByUserNo(@PathVariable("userNo") int userNo) {
		
		List<LibrarySummary> playList = libraryService.getLikeList(userNo);
		return playList;
	}*/
	
	/* 영상 좋아요 관련 AJAX */
	@RequestMapping(path="/invote/", method=RequestMethod.POST)
	@ResponseBody
	public History insertVideoVote(@RequestBody History history) {
		History vote =  playerService.insertVideoVote(history);
		return vote;
	}	
	@RequestMapping(path="/invote/{targetNo}/{voteSide}", method=RequestMethod.GET)
	@ResponseBody
	public int getInCountVoteByHistory(@PathVariable("targetNo") int targetNo, @PathVariable("voteSide") String voteSide) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("voteSide", voteSide);
		
		int vote=  playerService.getCountVoteByHistory(map);
		return vote;
	}
	
	
	@RequestMapping(path="/devote/", method=RequestMethod.POST)
	@ResponseBody
	public History deleteVideoVote(@RequestBody History history) {
		History vote =  playerService.deleteVideoVote(history);
		
		return vote;
	}	
	
	@RequestMapping(path="/devote/{targetNo}/{voteSide}", method=RequestMethod.GET)
	@ResponseBody
	public int getDeCountVoteByHistory(@PathVariable("targetNo") int targetNo, @PathVariable("voteSide") String voteSide) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("voteSide", voteSide);
		
		int vote=  playerService.getCountVoteByHistory(map);
		return vote;
	}
	
	
	@RequestMapping(path="/upvote/", method=RequestMethod.POST)
	@ResponseBody
	public History updateVideoVote(@RequestBody History history) {
		History vote =  playerService.updateVideoVote(history);
		
		return vote;
	}	
	
	@RequestMapping(path="/upvote/{targetNo}/{voteSide}", method=RequestMethod.GET)
	@ResponseBody
	public int getUpCountVoteByHistory(@PathVariable("targetNo") int targetNo, @PathVariable("voteSide") String voteSide) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("voteSide", voteSide);
		
		int vote=  playerService.getCountVoteByHistory(map);
		return vote;
	}
	
	/* 댓글 좋아요 관련 AJAX */
	@RequestMapping(path="/inCvote/", method=RequestMethod.POST)
	@ResponseBody
	public History insertCommentVote(@RequestBody History history) {
		History vote =  playerService.insertCommentVideoVote(history);
		return vote;
	}	
	@RequestMapping(path="/inCvote/{targetNo}/{voteSide}", method=RequestMethod.GET)
	@ResponseBody
	public int getInCountCommentVoteByHistory(@PathVariable("targetNo") int targetNo, @PathVariable("voteSide") String voteSide) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("voteSide", voteSide);
		
		int vote=  playerService.getCountCommentVoteByHistory(map);
		return vote;
	}
	
	
	@RequestMapping(path="/deCvote/", method=RequestMethod.POST)
	@ResponseBody
	public History deleteCommentVote(@RequestBody History history) {
		History vote =  playerService.deleteCommentVote(history);
		
		return vote;
	}	
	
	@RequestMapping(path="/deCvote/{targetNo}/{voteSide}", method=RequestMethod.GET)
	@ResponseBody
	public int getDeCountCommentVoteByHistory(@PathVariable("targetNo") int targetNo, @PathVariable("voteSide") String voteSide) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("voteSide", voteSide);
		
		int vote=  playerService.getCountCommentVoteByHistory(map);
		return vote;
	}
	
	
	@RequestMapping(path="/upCvote/", method=RequestMethod.POST)
	@ResponseBody
	public History updateCommentVote(@RequestBody History history) {
		History vote =  playerService.updateCommentVote(history);
		
		return vote;
	}	
	
	@RequestMapping(path="/upCvote/{targetNo}/{voteSide}", method=RequestMethod.GET)
	@ResponseBody
	public int getUpCountCommentVoteByHistory(@PathVariable("targetNo") int targetNo, @PathVariable("voteSide") String voteSide) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("targetNo", targetNo);
		map.put("voteSide", voteSide);
		
		int vote=  playerService.getCountCommentVoteByHistory(map);
		return vote;
	}
	
	
	
	// 조회수

	@RequestMapping(path="/inwatch/", method=RequestMethod.POST)
	@ResponseBody
	public History insertWatchHistory(@RequestBody History history) {
		History watch =  playerService.insertWatchHistory(history);
		
		return watch;
	}	
	
	@RequestMapping(path="/inwatch/{targetNo}", method=RequestMethod.GET)
	@ResponseBody
	public int getVideoViewCountByNo(@PathVariable("targetNo") int targetNo) {
		int watch=  playerService.getVideoViewCountByNo(targetNo);
		return watch;
	}
	
	// 구독
	@RequestMapping(path="/insub/", method=RequestMethod.POST)
	@ResponseBody
	public Subscription insertSubscription(@RequestBody Subscription subscription) {
		Subscription newsub =  playerService.insertSubscription(subscription);
		return newsub;
	}	
	
	@RequestMapping(path="/insub/{ownerNo}", method=RequestMethod.GET)
	@ResponseBody
	public int getInsertSubscription(@PathVariable("ownerNo") int ownerNo) {
		int newsub =  playerService.getSubCountByOwnerNo(ownerNo);
		return newsub;
	}
	@RequestMapping(path="/desub/", method=RequestMethod.POST)
	@ResponseBody
	public Subscription deleteSubscription(@RequestBody Subscription subscription) {
		Subscription desub =  playerService.deleteSubscription(subscription);
		return desub;
	}	
	
	@RequestMapping(path="/desub/{ownerNo}", method=RequestMethod.GET)
	@ResponseBody
	public int getDeleteSubscription(@PathVariable("ownerNo") int ownerNo) {
		int desub =  playerService.getSubCountByOwnerNo(ownerNo);
		return desub;
	}
	
	
}
