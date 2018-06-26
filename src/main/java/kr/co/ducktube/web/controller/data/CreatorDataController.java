package kr.co.ducktube.web.controller.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ducktube.annotation.LoginUser;
import kr.co.ducktube.service.interfaces.CreatorService;
import kr.co.ducktube.vo.criteria.VideoCriteria;
import kr.co.ducktube.vo.form.VideoUploadForm;
import kr.co.ducktube.vo.table.User;
import kr.co.ducktube.vo.table.video.Video;
import kr.co.ducktube.web.handler.ResourceHandler;

@Controller
@RequestMapping("/creator")
public class CreatorDataController {

	@Autowired
	private CreatorService creatorService;
	
    @Autowired
    private ResourceHandler handler;

	@RequestMapping("/file")
	public void getFile(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String path) throws ServletException, IOException {
		
		File file = new File(path);
		request.setAttribute(ResourceHandler.ATTR_FILE, file);
        handler.handleRequest(request, response);
	}
	
	@ResponseBody
	@RequestMapping("/videos")
	public List<Video> getCreatedVideos(@LoginUser User loginUser, Integer pno){
		
		int rowsPerPage = 4;
		int colsPerPage = 3;
		
		int startRownum = ((pno - 1) * (rowsPerPage * colsPerPage)) + 1;
		int endRownum = startRownum + (rowsPerPage * colsPerPage) - 1;
		
		VideoCriteria criteria = new VideoCriteria();
		criteria.setCreatorNo(loginUser.getNo());
		criteria.setStatus("enabled");
		criteria.setOrderColumn("createDate");
		criteria.setOrderDirection("asc");
		criteria.setStartRownum(startRownum);
		criteria.setEndRownum(endRownum);
		
		return creatorService.getVideos(criteria);
	}
	
	@ResponseBody
	@CrossOrigin(origins = "*")
	@RequestMapping("/video-upload")
	public Video uploadVideo(VideoUploadForm videoForm) {
		Video video = new Video();
		BeanUtils.copyProperties(videoForm, video);

		return creatorService.addNewVideo(video, videoForm.getVideoFile(), videoForm.getSelectedDuration());
	}

	@ResponseBody
	@CrossOrigin(origins = "*")
	@RequestMapping("/video-update")
	public Video updateVideo(VideoUploadForm videoForm) {
		Video video = new Video();
		BeanUtils.copyProperties(videoForm, video);
		video.setNo(videoForm.getVideoNo());

		return creatorService.updateVideo(video, videoForm.getVideoFile(), videoForm.getSelectedDuration());
	}
	
	@ResponseBody
	@CrossOrigin(origins = "*")
	@RequestMapping("/video-delete")
	public String deleteVideo(Integer vno) {
		return creatorService.deleteVideo(vno);
	}
	
}