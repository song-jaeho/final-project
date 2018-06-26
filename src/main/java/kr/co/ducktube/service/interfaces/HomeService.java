package kr.co.ducktube.service.interfaces;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.ducktube.vo.criteria.HomeCriteria;
import kr.co.ducktube.vo.criteria.LibraryCriteria;
import kr.co.ducktube.vo.page.LibrarySummary;
import kr.co.ducktube.vo.page.PopularListSummary;
import kr.co.ducktube.vo.table.User;

@Transactional
public interface HomeService {

	void playlistPreviewUpdate(HomeCriteria criteria);
	void addPlaylistVideo(HomeCriteria criteria);
	Integer getPlaylistVideoCount(int playlistNo);
	LibrarySummary checkPlaylistVideo(HomeCriteria criteria);
	void addPlaylist(HomeCriteria criteria);
	void addWatchLater(HomeCriteria criteria);
	LibrarySummary checkWatchLater(HomeCriteria criteria);
	List<PopularListSummary> getPopularList(LibraryCriteria criteria);
	User getUserByEmail(String email);
}
