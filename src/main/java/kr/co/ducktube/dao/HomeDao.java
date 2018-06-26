package kr.co.ducktube.dao;

import java.util.List;

import kr.co.ducktube.vo.criteria.HomeCriteria;
import kr.co.ducktube.vo.criteria.LibraryCriteria;
import kr.co.ducktube.vo.page.LibrarySummary;
import kr.co.ducktube.vo.page.PopularListSummary;
import kr.co.ducktube.vo.table.User;

public interface HomeDao {

	void playlistPreviewUpdate(HomeCriteria criteria);
	void addPlaylistVideo(HomeCriteria criteria);
	Integer getPlaylistVideoCount(int playlistNo);
	void addPlaylist(HomeCriteria criteria);
	void addWatchLater(HomeCriteria criteria);
	
	LibrarySummary checkPlaylistVideo(HomeCriteria criteria);
	LibrarySummary checkWatchLater(HomeCriteria criteria);
	List<PopularListSummary> getPopularList(LibraryCriteria criteria);
	User getUserByEmail(String email);
}
