package kr.co.ducktube.web.controller.div;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ducktube.service.interfaces.LibraryService;
import kr.co.ducktube.vo.page.LibrarySummary;
import kr.co.ducktube.vo.table.User;

@Controller
@RequestMapping("/library")
public class LibraryDivController {

	@Autowired
	private LibraryService libraryService;
	
	@RequestMapping("/history")
	public String libraryHistoryTest() {
		//User user = (User) session.getAttribute("LOGIN_USER");
		//List<LibrarySummary> watchList = libraryService.getWatchList(user.getNo());
//		for(LibrarySummary L : watchList) {
//			System.out.println(L);
//		}
		//model.addAttribute("watchList", watchList);
		
		return "library/history.jsp";
	}
	
	@RequestMapping("/likes-movies")
	public String likesMovies() {
		
		return "library/likes-movies.jsp";
	}
	
	@RequestMapping("/playlist")
	public String playlist(int plno, Model model, HttpSession session) {
		User user = (User)session.getAttribute("LOGIN_USER");
		
		List<LibrarySummary> playListVideos = new ArrayList<LibrarySummary>();
		LibrarySummary oneplayList = new LibrarySummary();
		List<LibrarySummary> playList = libraryService.getplaylistData(user.getNo());
		if(plno==0) {
			model.addAttribute("playList", playList);
			model.addAttribute("plno",plno);
			return "library/playlist.jsp";
		}
		playListVideos = libraryService.getPlayListVideoList(plno);
		oneplayList = libraryService.getPlayListByPlno(plno);
		
		oneplayList.setVideoCount(playListVideos.size());
		model.addAttribute("oneplayList", oneplayList);
		model.addAttribute("playList", playList);
		model.addAttribute("plno",plno);

		return "library/playlist.jsp";
	}
	
	@RequestMapping("watch-later")
	public String watchLater() {
		
		return "library/watch-later.jsp";
	}
	
}