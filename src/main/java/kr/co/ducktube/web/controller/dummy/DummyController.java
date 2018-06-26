package kr.co.ducktube.web.controller.dummy;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.ducktube.service.dummy.DummyService;

@Controller
@RequestMapping("/dummy")
public class DummyController {

	@Autowired
	private DummyService dummyService;
	
	@RequestMapping("/watch-history")
	public void createWatchHistory() {
		dummyService.createWatchHistory();
	}
	
	@RequestMapping("/report-history")
	public void createReportHistory() {
		dummyService.createVideoReportHistory();
	}
	
	@RequestMapping("/vote-history")
	public void createVoteHistory() {
		dummyService.createVideoVoteHistory();
	}
	
	@RequestMapping("/subscription")
	public void createSubscriptions(){
		dummyService.createSubscriptions();
	}
	
	@RequestMapping("/change-video-create-date")
	public void changeCreateDate() {
		dummyService.changeVideoCreateDate();
	}
	
	@RequestMapping("/change-video-vote-date")
	public void changeVoteDate() {
		dummyService.changeVideoVoteDate();
	}
	
	@RequestMapping("/change-watch-date")
	public void changeWatchDate() {
		dummyService.changeWatchDate();
	}
	
	@RequestMapping("/test")
	public void test() {
		
	}

}