package kr.co.ducktube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ducktube.dao.LibraryDao;
import kr.co.ducktube.service.interfaces.LibraryService;
import kr.co.ducktube.vo.criteria.HomeCriteria;
import kr.co.ducktube.vo.criteria.LibraryCriteria;
import kr.co.ducktube.vo.page.CommentReplySummary;
import kr.co.ducktube.vo.page.LibrarySummary;

@Service
public class LibraryServiceImpl implements LibraryService {

	@Autowired
	private LibraryDao libraryDao;
	
	@Override
	public void updateCmComment(LibraryCriteria criteria) {
		libraryDao.updateCmComment(criteria);
	}
	@Override
	public void writingDelete(Integer writingNo) {
		libraryDao.writingDelete(writingNo);
	}
	@Override
	public void writingCommentDelete(Integer commentNo) {
		libraryDao.writingCommentDelete(commentNo);
	}
	@Override
	public void insertWritingCommentSide(Map<String, Object> sideMap) {
		libraryDao.insertWritingCommentSide(sideMap);
	}
	
	@Override
	public void updateWritingCommentSide(Map<String, Object> sideMap) {
		libraryDao.updateWritingCommentSide(sideMap);
	}
	
	@Override
	public void deleteWritingCommentSide(Map<String, Object> sideMap) {
		libraryDao.deleteWritingCommentSide(sideMap);
	}
	
	@Override
	public LibrarySummary getWritingCommentSide(Map<String, Object> sideMap) {
		LibrarySummary side = libraryDao.getWritingCommentSide(sideMap);
		return side;
	}
	@Override
	public void plAllOrderUpdate(LibrarySummary plInfo) {
		libraryDao.plAllOrderUpdate(plInfo);
	}
	@Override
	public LibrarySummary getVideoByNo(Integer videoNo) {
		LibrarySummary video = libraryDao.getVideoByNo(videoNo);
		return video;
	}
	@Override
	public void commentsReplysRemove(Map<String, Object> map) {
		libraryDao.commentsReplysRemove(map);
	}
	@Override
	public void cvcrUpdate(Map<String, Object> commentInfo) {
		libraryDao.cvcrUpdate(commentInfo);
	}
	@Override
	public List<CommentReplySummary> getcvCommentsReplys(LibraryCriteria criteria) {
		List<CommentReplySummary> list = libraryDao.getcvCommentsReplys(criteria);
		return list;
	}
	
	@Override
	public LibraryCriteria getcmCommentByUserNo(LibraryCriteria criteria) {
		LibraryCriteria comment = libraryDao.getcmCommentByUserNo(criteria);
		return comment;
	}
	
	@Override
	public void insertCmComment(LibraryCriteria criteria) {
		libraryDao.insertCmComment(criteria);
	}
	
	@Override
	public void cmWritingContentUpdate(LibraryCriteria criteria) {
		libraryDao.cmWritingContentUpdate(criteria);
	}
	
	@Override
	public void deleteAllHistory(int userNo) {
		libraryDao.deleteAllHistory(userNo);
	}
	
	@Override
	public void deleteWatchHistory(HomeCriteria criteria) {
		libraryDao.deleteWatchHistory(criteria);
	}
	
	@Override
	public void playlistOrderUpdate(HomeCriteria criteria) {
		libraryDao.playlistOrderUpdate(criteria);
	}
	
	@Override
	public void playlistImgUpdate(HomeCriteria criteria) {
		libraryDao.playlistImgUpdate(criteria);
	}
	
	@Override
	public void changePlaylistStatus(HomeCriteria criteria) {
		libraryDao.changePlaylistStatus(criteria);
	}
	
	@Override
	public void deletePlaylistVideo(HomeCriteria criteria) {
		libraryDao.deletePlaylistVideo(criteria);
	}
	
	@Override
	public void deleteAllPlaylistVideo(int plno) {
		libraryDao.deleteAllPlaylistVideo(plno);
	}
	
	@Override
	public void deletePlaylist(int plno) {
		libraryDao.deletePlaylist(plno);
	}
	
	@Override
	public void changePlaylistContent(HomeCriteria criteria) {
		libraryDao.changePlaylistContent(criteria);
	}
	
	@Override
	public void changePlaylistTitle(HomeCriteria criteria) {
		libraryDao.changePlaylistTitle(criteria);
	}
	
	@Override
	public void deleteWatchLater(HomeCriteria criteria) {
		libraryDao.deleteWatchLater(criteria);
	}
	
	@Override
	public void deleteLike(HomeCriteria criteria) {
		libraryDao.deleteLike(criteria);
	}
	
	@Override
	public Integer getWatchCount(LibraryCriteria criteria) {
		Integer count = libraryDao.getWatchCount(criteria);
		return count;
	}
	
	@Override
	public List<LibrarySummary> getCommunityCommentList(LibraryCriteria criteria) {
		List<LibrarySummary> commentList = libraryDao.getCommunityCommentList(criteria);
		return commentList;
	}
	
	@Override
	public List<LibrarySummary> getCommunityList(LibraryCriteria criteria) {
		List<LibrarySummary> communityList = libraryDao.getCommunityList(criteria);
		return communityList;
	}
	
	@Override
	public List<LibrarySummary> getWatchList(LibraryCriteria criteria) {
		List<LibrarySummary> watchList = libraryDao.getWatchList(criteria);
		return watchList;
	}
	
	@Override
	public LibrarySummary getPlayListByPlno(int plno) {
		LibrarySummary playList = libraryDao.getPlayListByPlno(plno);
		return playList;
	}
	
	@Override
	public List<LibrarySummary> getPlayListVideoList(int plno) {
		List<LibrarySummary> playListVideo = libraryDao.getPlayListVideoList(plno);
		return playListVideo;
	}
	
	@Override
	public List<LibrarySummary> getplaylistData(int userNo) {
		List<LibrarySummary> playList = libraryDao.getPlayList(userNo);
		return playList;
	}
	
	@Override
	public List<LibrarySummary> getLaterList(int userNo) {
		List<LibrarySummary> laterList = libraryDao.getLaterList(userNo);
		return laterList;
	}
	
	@Override
	public List<LibrarySummary> getLikeList(int userNo) {
		List<LibrarySummary> likeList = libraryDao.getLikeList(userNo);
		return likeList;
	}
}
