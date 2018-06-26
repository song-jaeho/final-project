package kr.co.ducktube.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ducktube.dao.SubscriptionDao;
import kr.co.ducktube.service.interfaces.SubscriptionService;
import kr.co.ducktube.util.DateUtil;
import kr.co.ducktube.util.ThumbUtil;
import kr.co.ducktube.util.TimeUtil;
import kr.co.ducktube.vo.page.ChannelNoticeSummary;
import kr.co.ducktube.vo.page.ChannelSummary;
import kr.co.ducktube.vo.page.PlayListSummary;
import kr.co.ducktube.vo.page.VideoSummary;
import kr.co.ducktube.vo.table.CommunityComments;
import kr.co.ducktube.vo.table.CommunityReplies;
import kr.co.ducktube.vo.table.CommunityWritings;
import kr.co.ducktube.vo.table.History;
import kr.co.ducktube.vo.table.Playlist;
import kr.co.ducktube.vo.table.Subscription;
import kr.co.ducktube.vo.table.User;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

	@Autowired
	SubscriptionDao subscriptionDao;

	@Override
	public PlayListSummary getPlaylistFullInfoByMapForOwner(Map<String, Object> map) {
		
		PlayListSummary pls = new PlayListSummary();
		
		User user = new User();
		List<Playlist> playlists = new ArrayList<Playlist>();

		if (map.get("ownerNo") != null) {
			user = subscriptionDao.getUserByNo((Integer) map.get("ownerNo"));
			playlists = subscriptionDao.getPlaylistsByUserNo((Integer) map.get("ownerNo"));
			
			for (Playlist pl : playlists) {
				map.put("playlistNo", pl.getNo());
	
				pl.setVideos(subscriptionDao.getVideosByMap(map));
				for (VideoSummary vs : pl.getVideos()) {
					vs.setFormattedDuration(TimeUtil.getTime((int) vs.getVideo().getDuration()));
					vs.setFormattedDate(DateUtil.getLastDate(vs.getVideo().getCreateDate(), new Date()));
					vs.setWatchCount(subscriptionDao.getVideoWatchCount(vs.getVideo().getNo()));
				}
			}
		}
		pls.setUser(user);
		pls.setPlaylists(playlists);
		return pls;
	}
	
	@Override
	public PlayListSummary getPlaylistFullInfoByMapForUser(Map<String, Object> map) {
		
		PlayListSummary pls = new PlayListSummary();
		
		User user = new User();
		List<Playlist> playlists = new ArrayList<Playlist>();
		
		if (map.get("userNo") != null) {
			user = subscriptionDao.getUserByNo((Integer) map.get("userNo"));
			playlists = subscriptionDao.getPlaylistsByUserNo((Integer) map.get("userNo"));
			
			for (Playlist pl : playlists) {
				map.put("playlistNo", pl.getNo());

				pl.setVideos(subscriptionDao.getVideosByMap(map));
				for (VideoSummary vs : pl.getVideos()) {
					vs.setFormattedDuration(TimeUtil.getTime((int) vs.getVideo().getDuration()));
					vs.setFormattedDate(DateUtil.getLastDate(vs.getVideo().getCreateDate(), new Date()));
					vs.setWatchCount(subscriptionDao.getVideoWatchCount(vs.getVideo().getNo()));
				}
			}
		}	
		pls.setUser(user);
		pls.setPlaylists(playlists);
		return pls;
	}

	@Override
	public Map<String, Object> getVideosInfoByMap(Map<String, Object> map) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		if (map.get("criteria") == null) {
			map.put("criteria", "newest");
		}
		
		String playlist = "";
		
		if (map.get("playlist") == null) {
			playlist = "uploaded";
		} else {
			playlist = (String)map.get("playlist");
		}

		List<VideoSummary> likeList = new ArrayList<VideoSummary>();
		List<VideoSummary> updateList = new ArrayList<VideoSummary>();
		List<VideoSummary> wholeList = new ArrayList<VideoSummary>();
		Integer likeListTotalLength = 1;
		Integer updateListTotalLength = 1;
		Integer wholeListTotalLength = 1;

		if (playlist.equals("whole")) {

			wholeList = subscriptionDao.getVideosInfoByMapFull(map);
			map.remove("videosMin");
			map.remove("videosMax");
			wholeListTotalLength = subscriptionDao.getVideosInfoByMapFull(map).size();
			
		} else if (playlist.equals("liked")) {

			likeList = subscriptionDao.getVideosInfoByMapLiked(map);		
			map.remove("videosMin");
			map.remove("videosMax");
			likeListTotalLength = subscriptionDao.getVideosInfoByMapLiked(map).size();	
			
		} else if (playlist.equals("uploaded")){

			updateList = subscriptionDao.getVideosInfoByMap(map);
			map.remove("videosMin");
			map.remove("videosMax");
			updateListTotalLength = subscriptionDao.getVideosInfoByMap(map).size();
		}
		
		if (!likeList.isEmpty()) {
			for (VideoSummary video : likeList) {
				video.setFormattedDate(DateUtil.getLastDate(video.getVideo().getCreateDate(), new Date()));
				video.setFormattedDuration(TimeUtil.getTime((int) video.getVideo().getDuration()));
				video.setWatchCount(subscriptionDao.getVideoWatchCount(video.getVideo().getNo()));
			}					
		}
		if (!updateList.isEmpty()) {
			for (VideoSummary video : updateList) {
				video.setFormattedDate(DateUtil.getLastDate(video.getVideo().getCreateDate(), new Date()));
				video.setFormattedDuration(TimeUtil.getTime((int) video.getVideo().getDuration()));
				video.setWatchCount(subscriptionDao.getVideoWatchCount(video.getVideo().getNo()));
			}			
		}
		if (!wholeList.isEmpty()) {
			for (VideoSummary video : wholeList) {
				video.setFormattedDate(DateUtil.getLastDate(video.getVideo().getCreateDate(), new Date()));
				video.setFormattedDuration(TimeUtil.getTime((int) video.getVideo().getDuration()));
				video.setWatchCount(subscriptionDao.getVideoWatchCount(video.getVideo().getNo()));
			}
		}
		returnMap.put("likeList", likeList);
		returnMap.put("updateList", updateList);
		returnMap.put("wholeList", wholeList);
		
		returnMap.put("likeListTotalLength", likeListTotalLength);
		returnMap.put("updateListTotalLength", updateListTotalLength);
		returnMap.put("wholeListTotalLength", wholeListTotalLength);
		return returnMap;
	}

	@Override
	public List<Playlist> getPlaylistByCondition(Map<String, Object> map) {
		List<Playlist> list = subscriptionDao.getPlaylistByCondition(map);
		for (Playlist play : list) {
			Map<String, Object> submap = new HashMap<String, Object>();
			submap.put("playlistsMin", map.get("min"));
			submap.put("playlistsMax", map.get("max"));
			submap.put("playlistNo", play.getNo());
			play.setFormattedRecentUpdateDate(DateUtil.getLastDate(play.getUpdateDate(), new Date()));
			play.setVideoCount(subscriptionDao.getVideoCountByPlaylistNo(play.getNo()));
			play.setVideos(subscriptionDao.getVideosByMap(submap));
		}
		return list;
	}
	
	@Override
	public List<Subscription> getAllSubscribeByUserNo(Integer userNo) {
		List<Subscription> list = subscriptionDao.getAllSubscribeByUserNo(userNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		
		for (Subscription sub : list) {
			sub.setTitle(sub.getTitle().replace("님의 채널", ""));
			map.put("ownerNo", sub.getOwnerNo());
			sub.setUnsightVideoCount(subscriptionDao.getUnsightVideoCount(map));
		}
		return list;
	}

	@Override
	public Integer getVideoCountByPlaylistNo(Integer playlistNo) {
		return subscriptionDao.getVideoCountByPlaylistNo(playlistNo);
	}

	@Override
	public Date getRecentUpdateDateByPlaylistNo(Integer playlistNo) {
		return subscriptionDao.getRecentUpdateDateByPlaylistNo(playlistNo);
	}

	@Override
	public List<CommunityWritings> getCommunityWritingsByOwnerNo(Map<String, Object> map) {
		List<CommunityWritings> list = subscriptionDao.getCommunityWritingsByOwnerNo((Integer) map.get("ownerNo"));
		for (CommunityWritings com : list) {		
			com.setFormattedDate(DateUtil.getLastDate(com.getCreateDate(), new Date()));	
			com.setSumCount(ThumbUtil.getSum(com.getLikeCount(), com.getDislikeCount()));
			if (map.get("userNo") != null) {
				map.put("targetNo", com.getNo());
				map.put("which", "writing");				
				com.setHistory(subscriptionDao.getVoteHistory(map));
			}
		}
		return list;
	}
	
	@Override
	public List<CommunityComments> getCommunityCommentsByWritingNo(Map<String, Object> map) {
		List<CommunityComments> list = subscriptionDao.getCommunityCommentsByWritingNo((Integer) map.get("writingNo"));
		
		for (CommunityComments comment : list) {
			comment.setFormattedDate(DateUtil.getLastDate(comment.getCreateDate(), new Date()));
			comment.setCommentSumCount(ThumbUtil.getSum(comment.getCommentLikeCount(), comment.getCommentDislikeCount()));
				
			if (map.get("userNo") != null) {
				map.put("targetNo", comment.getNo());
				map.put("which", "comment");
				comment.setHistory(subscriptionDao.getVoteHistory(map));				
			}
			if (comment.getReplies() != null) {
				comment.getReplies().setFormattedDate(DateUtil.getLastDate(comment.getReplies().getCreateDate(), new Date()));
				comment.getReplies().setCommentReplySumCount(ThumbUtil.getSum(comment.getReplies().getCommentReplyLikeCount(), comment.getReplies().getCommentReplyDislikeCount()));
				if (map.get("userNo") != null) {
					Map<String, Object> replymap = new HashMap<String, Object>();
					replymap.put("userNo", (Integer)map.get("userNo"));
					replymap.put("targetNo", comment.getReplies().getNo());
					replymap.put("which", "reply");
					comment.getReplies().setHistory(subscriptionDao.getVoteHistory(replymap));					
				}
			}
		}
		return list;	
	}

	@Override
	public List<ChannelSummary> getChannelInfoByCreatorNo(Map<String, Object> map) {
		
		List<Integer> owners = null;
		List<ChannelSummary> list = subscriptionDao.getChannelInfoByCreatorNo((Integer) map.get("ownerNo"));
		
		if (map.get("userNo") != null) {
			owners = getSubscribingOwnerNoByUserNo((Integer) map.get("userNo"));			
		}
		
		for (ChannelSummary cs : list) {
			cs.setSubscribeCount(subscriptionDao.getSubscribeCountByOwnerNo(cs.getOwnerNo()));				
			cs.setSubscribe("false");
			cs.setTitle(cs.getTitle().replace("님의 채널", ""));
			if (map.get("userNo") != null) {
				for (Integer ownerNo : owners) {
					if (ownerNo.equals(cs.getOwnerNo())) {
						cs.setSubscribe("true");
					}
				}
			}
		}
		return list;
	}

	@Override
	public List<Integer> getSubscribingOwnerNoByUserNo(Integer userNo) {
		return subscriptionDao.getSubscribingOwnerNoByUserNo(userNo);
	}

	@Override
	public ChannelSummary getChannelInfoByOwnerNo(Integer ownerNo) {
		ChannelSummary cs = subscriptionDao.getChannelInfoByOwnerNo(ownerNo);
		cs.setFormattedDate(DateUtil.getStringDateWithoutTime(cs.getCreateDate()));
		return cs;
	}

	@Override
	public ChannelNoticeSummary getChannelNoticeByMap(Map<String, Object> map) {
		return subscriptionDao.getChannelNoticeByMap(map);
	}

	@Override
	public void setChannelNoticeByMap(Map<String, Object> map) {
		subscriptionDao.setChannelNoticeByMap(map);
	}

	@Override
	public void setNewReport(Map<String, Object> map) {
		subscriptionDao.setNewReport(map);
	}

	@Override
	public void setNewComment(Map<String, Object> map) {
		subscriptionDao.setNewComment(map);
	}
	
	@Override
	public void updateComment(Map<String, Object> map) {
		subscriptionDao.updateComment(map);
	}
	
	@Override
	public Integer changeThumbsHistory(Map<String, Object> map) {
		String which = (String) map.get("which");
		boolean has = (Boolean) map.get("has");
		boolean same = (Boolean) map.get("same");
	
		Integer like = 0;
		Integer dislike = 0;

		if (has) {
			if (same) {
				subscriptionDao.deleteThumbsHistory(map);
			} else {
				subscriptionDao.updateThumbsHistory(map);				
			}
		} else {
			subscriptionDao.insertThumbsHistory(map);			
		}
		
		if (which.equals("writing")) {
			like = subscriptionDao.getCommunityLikeByWritingNo((Integer) map.get("targetNo"));
			dislike = subscriptionDao.getCommunityDislikeByWritingNo((Integer) map.get("targetNo"));				
		} else if (which.equals("comment")) {
			like = subscriptionDao.getCommentLikeCountByCommentNo((Integer) map.get("targetNo"));
			dislike = subscriptionDao.getCommentDislikeCountByCommentNo((Integer) map.get("targetNo"));
		} else {
			like = subscriptionDao.getCommentReplyLikeCountByReplyNo((Integer) map.get("targetNo"));
			dislike = subscriptionDao.getCommentReplyDislikeCountByReplyNo((Integer) map.get("targetNo"));
		}
		return ThumbUtil.getSum(like, dislike);
	}

	@Override
	public void setNewReply(Map<String, Object> map) {
		subscriptionDao.setNewReply(map);
	}
	
	@Override
	public void updateReply(Map<String, Object> map) {
		subscriptionDao.updateReply(map);
	}

	@Override
	public CommunityReplies getCommunityRepliesByCommentNo(Map<String, Object> map) {
		CommunityReplies cr = subscriptionDao.getCommunityRepliesByCommentNo((Integer) map.get("targetNo"));
		cr.setFormattedDate(DateUtil.getLastDate(cr.getCreateDate(), new Date()));
		cr.setCommentReplySumCount(ThumbUtil.getSum(cr.getCommentReplyLikeCount(), cr.getCommentReplyDislikeCount()));
		
		if (map.get("userNo") != null) {
			Map<String, Object> replymap = new HashMap<String, Object>();
			replymap.put("userNo", (Integer)map.get("userNo"));
			replymap.put("targetNo", cr.getNo());
			replymap.put("which", "reply");
			cr.setHistory(subscriptionDao.getVoteHistory(replymap));			
		}
		return cr;
	}

	@Override
	public Map<String, Object> subscribe(Map<String, Object> map) {
		Map<String, Object> result = subscriptionDao.getSubscribeByUserandOwnerNo(map);
		Integer cnt = ((BigDecimal)result.get("cnt")).intValue();	
		if (cnt != 0) {
			subscriptionDao.deleteSubscribe(map);
		} else {
			subscriptionDao.addNewSubscribe(map);			
		}
		Integer ownerNo = (Integer) map.get("ownerNo");
		User user = subscriptionDao.getUserByNo(ownerNo);
		List<Subscription> sublist = subscriptionDao.getAllSubscribeByUserNo((Integer) map.get("userNo"));
		for (Subscription sub : sublist) {
			sub.setUnsightVideoCount(subscriptionDao.getUnsightVideoCount(map));
		}
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("user", user);
		returnMap.put("subscriptionList", sublist);
		return returnMap;
	}

	@Override
	public String addVideoToPlaylist(Map<String, Object> map) {
		map.put("min", 1);
		map.put("max", 5);		
		List<VideoSummary> vsl = subscriptionDao.getVideosByMap(map);
		Integer videoNo = (Integer) map.get("videoNo");
		for (VideoSummary video : vsl) {
			if(video.getVideo().getNo() == videoNo) {
				return "already";
			}
		}
		Integer lastOrder = subscriptionDao.getPlaylistVideoLastOrder((Integer) map.get("playlistNo"));
		if (lastOrder == null) {
			lastOrder = 1;
		}
		map.put("videoOrder", lastOrder);
		subscriptionDao.addVideoToPlaylist(map);
		return "success";
	}

	@Override
	public String addToWatchLater(Map<String, Object> map) {
		List<Integer> videoNumbers = subscriptionDao.getWatchLaterVideoNo((Integer) map.get("userNo"));
		Integer videoNo = (Integer) map.get("videoNo");
		for (Integer no : videoNumbers) {
			if (videoNo.equals(no)) {
				return "already";
			}
		}
		subscriptionDao.addToWatchLater(map);
		return "success";
	}

	@Override
	public History getVoteHistory(Map<String, Object> map) {
		return subscriptionDao.getVoteHistory(map);
	}

	@Override
	public List<Subscription> getSubscriptionByCondition(Map<String, Object> map) {
		List<Subscription> list = subscriptionDao.getSubscriptionByCondition(map);
		for(Subscription sb : list) {
			map.put("ownerNo", sb.getOwnerNo());
			sb.setUnsightVideoCount(subscriptionDao.getUnsightVideoCount(map));
		}
		return list;
	}

	@Override
	public Integer getVideoCountByCreatorNo(Integer creatorNo) {
		return subscriptionDao.getVideoCountByCreatorNo(creatorNo);
	}

	@Override
	public void insertNewWritings(Map<String, Object> map) {
		subscriptionDao.insertNewWritings(map);
	}

	@Override
	public void removeWriting(Map<String, Object> map) {
		subscriptionDao.removeWriting(map);
	}
}
