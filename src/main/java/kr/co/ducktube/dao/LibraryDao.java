package kr.co.ducktube.dao;

import java.util.List;
import java.util.Map;

import kr.co.ducktube.vo.criteria.HomeCriteria;
import kr.co.ducktube.vo.criteria.LibraryCriteria;
import kr.co.ducktube.vo.page.CommentReplySummary;
import kr.co.ducktube.vo.page.LibrarySummary;

public interface LibraryDao {

	Integer getWatchCount(LibraryCriteria criteria);
	
	void insertWritingCommentSide(Map<String, Object> sideMap);
	void insertCmComment(LibraryCriteria criteria);
	
	void updateCmComment(LibraryCriteria criteria);
	void writingDelete(Integer writingNo);
	void writingCommentDelete(Integer commentNo);
	void updateWritingCommentSide(Map<String, Object> sideMap);
	void plAllOrderUpdate(LibrarySummary plInfo);
	void cvcrUpdate(Map<String, Object> commentInfo);
	void cmWritingContentUpdate(LibraryCriteria criteria);
	void playlistOrderUpdate(HomeCriteria criteria);
	void playlistImgUpdate(HomeCriteria criteria);
	void changePlaylistStatus(HomeCriteria criteria);
	void changePlaylistContent(HomeCriteria criteria);
	void changePlaylistTitle(HomeCriteria criteria);
	
	void deleteWritingCommentSide(Map<String, Object> sideMap);
	void commentsReplysRemove(Map<String, Object> map);
	void deleteAllHistory(int userNo);
	void deleteWatchHistory(HomeCriteria criteria);
	void deletePlaylistVideo(HomeCriteria criteria);
	void deleteAllPlaylistVideo(int plno);
	void deletePlaylist(int plno);
	void deleteWatchLater(HomeCriteria criteria);
	void deleteLike(HomeCriteria criteria);
	
	LibrarySummary getWritingCommentSide(Map<String, Object> sideMap);
	LibrarySummary getVideoByNo(Integer videoNo);
	LibraryCriteria getcmCommentByUserNo(LibraryCriteria criteria);
	List<CommentReplySummary> getcvCommentsReplys(LibraryCriteria criteria);
	List<LibrarySummary> getCommunityCommentList(LibraryCriteria criteria);
	List<LibrarySummary> getCommunityList(LibraryCriteria criteria);
	List<LibrarySummary> getWatchList(LibraryCriteria criteria);
	LibrarySummary getPlayListByPlno(int plno);
	List<LibrarySummary> getPlayListVideoList(int plno);
	List<LibrarySummary> getPlayList(int userNo);
	List<LibrarySummary> getLaterList(int userNo);
	List<LibrarySummary> getLikeList(int userNo);
}
