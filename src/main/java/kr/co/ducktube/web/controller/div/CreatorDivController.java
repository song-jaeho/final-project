package kr.co.ducktube.web.controller.div;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.CreatorService;
import kr.co.ducktube.vo.criteria.VideoCriteria;
import kr.co.ducktube.vo.table.User;
import kr.co.ducktube.vo.table.video.Category;
import kr.co.ducktube.vo.table.video.Video;

@Controller
@RequestMapping("/creator")
public class CreatorDivController {

	@Autowired
	private CreatorService creatorService;
	
	@RequestMapping("/movie-upload-form")
	public String movieUploadForm(@LoginUser User loginUser, Model model) {
		
		VideoCriteria criteria = new VideoCriteria();
		criteria.setCreatorNo(loginUser.getNo());
		criteria.setStatus("enabled");

		criteria.setOrderColumn("createDate");
		criteria.setOrderDirection("desc");
		criteria.setStartRownum(1);
		criteria.setEndRownum(1000);
		
		List<Video> videos = creatorService.getVideos(criteria);
		List<Category> categories = creatorService.getAllVideoCategories();

		model.addAttribute("videos", videos);
		model.addAttribute("categories", categories);
		
		return "creator/movie-upload-form.jsp";
	}
	
}
