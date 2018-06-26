package kr.co.ducktube.service;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.imageio.ImageIO;
import org.jcodec.api.FrameGrab;
import org.jcodec.api.JCodecException;
import org.jcodec.common.DemuxerTrackMeta;
import org.jcodec.common.NIOUtils;
import org.jcodec.common.SeekableByteChannel;
import org.jcodec.common.model.Picture;
import org.jcodec.containers.mp4.demuxer.MP4Demuxer;
import org.jcodec.scale.AWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import kr.co.ducktube.dao.CreatorDao;
import kr.co.ducktube.service.interfaces.CreatorService;
import kr.co.ducktube.vo.criteria.VideoCriteria;
import kr.co.ducktube.vo.table.video.Category;
import kr.co.ducktube.vo.table.video.Video;

@Service
public class CreatorServiceImpl implements CreatorService {

	@Value("#{config['defaultCharacterSet']}")
	private String defaultCharacterSet;
	
	@Value("#{config['fileServerHost']}")
	private String fileServerHost;
	
	@Value("#{config['videoPreviewStandardA1']}")
	private String videoPreviewStandardA1;
	
	@Value("#{config['videoPreviewStandardA2']}")
	private String videoPreviewStandardA2;
	
	@Value("#{config['videoPreviewStandardA3']}")
	private String videoPreviewStandardA3;
	
	@Value("#{config['videoPreviewStandardA4']}")
	private String videoPreviewStandardA4;

	@Autowired
	private CreatorDao creatorDao;
	
	@Override
	public List<Category> getAllVideoCategories() {
		return creatorDao.getVideoCategories();
	}

	@Override
	public int getVideoSequence() {
		return creatorDao.getVideoSequence();
	}
	
	@Override
	public List<Video> getVideos(VideoCriteria criteria) {
		return creatorDao.getVideos(criteria);
	}
	
	@Override
	public Integer getRecentlyWatchedVideo(Integer userNo) {
		return creatorDao.getRecentlyWatchedVideo(userNo);
	}
	
	@Override
	public String deleteVideo(Integer vno) {
		creatorDao.deleteTags(vno);
		Video video = creatorDao.getVideoByVideoNo(vno);

		if(video != null) {
			video.setStatus("disabled");
			String folderPath = "C:/upload/ducktube"
					+ "/user" + video.getCreatorNo()
					+ "/video" + video.getNo();
			
			File workDir = new File(folderPath);
			File errorDir = new File(folderPath + "_deleted");
			workDir.renameTo(errorDir);
			
			creatorDao.updateVideo(video);
			return "success";
		} else {
			return "notExist";
		}
	}

	@Override
	public Map<String, Object> videoSearch(VideoCriteria criteria, Map<String, Object> map){
		if(criteria.getPno() == 0) {
			map.put("videoSize", creatorDao.getVideoSize(criteria));
		}
		if(criteria.getStartRownum() != 0 && criteria.getEndRownum() != 0) {
			map.put("videos", creatorDao.getVideos(criteria));
		}
		return map;
	}
	
	@Override
	public Map<String, Object> channelSearch(VideoCriteria criteria, Map<String, Object> map){
		if(criteria.getPno() == 0) {
			map.put("channelSize", creatorDao.getChannelSize(criteria));
		}
		if(criteria.getStartRownum() != 0 && criteria.getEndRownum() != 0) {
			map.put("channels", creatorDao.getChannels(criteria));
		}
		return map;
	}

	@Override
	public Map<String, Object> playlistSearch(VideoCriteria criteria, Map<String, Object> map){
		if(criteria.getPno() == 0) {
			map.put("playlistSize", creatorDao.getPlaylistSize(criteria));
		}
		if(criteria.getStartRownum() != 0 && criteria.getEndRownum() != 0) {
			map.put("playlists", creatorDao.getPlaylists(criteria));
		}
		return map;
	}
	
	@SuppressWarnings("unlikely-arg-type")
	public List<Video> getRelationVideos(Integer userNo, int videoNo, int count){
		if(userNo == null) {
			userNo = 29;
		}
		
		Video currVideo = creatorDao.getVideoByVideoNo(videoNo);
		
		VideoCriteria criteria = new VideoCriteria();
		criteria.setStatus("enabled");
		
		String whiteSpaces = "(\\s)+";
		String oneSpace = "$1";
		String specialChar = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
				
		List<String> keywordList = new ArrayList<String>();
		
		String[] titleWords = currVideo.getTitle().trim()
				.replaceAll(whiteSpaces, oneSpace)
				.replaceAll(specialChar, "")
				.replaceAll(" ", "_")
				.split("_");
		
		String[] tagWords = null;
		String tags = currVideo.getTags();
		if(tags != null) {
			tagWords = currVideo.getTags().split(",");
			for(String word : tagWords) {
				keywordList.add(word);
			}
		}
		
		List<Integer> exVideoNoList = criteria.getExVideoNoList();
		List<Integer> watchVideosNo = creatorDao.getWatchedVideos(userNo);
		if(watchVideosNo.size() > 0) {
			exVideoNoList.addAll(watchVideosNo);
		}
		
		exVideoNoList.add(currVideo.getNo());
		
		for(String word : titleWords) {
			if(word.length() >= 2) {
				keywordList.add(word);
			}
		}

		criteria.setKeywordList(keywordList);
		criteria.setPrimaryCategoryNo(currVideo.getPrimaryCategoryNo());
		criteria.setRelationCategorySearch(true);
		criteria.setExVideoNoList(exVideoNoList);
		criteria.setStartRownum(1);
		criteria.setEndRownum(count);
		criteria.setOrderColumn("watchCount");
		criteria.setOrderDirection("desc");

		List<Video> relationVideoList = creatorDao.getVideos(criteria);

		for(Video foundVids : relationVideoList) {
			exVideoNoList.add(foundVids.getNo());
		}
		criteria.setExVideoNoList(exVideoNoList);
		
		if(relationVideoList.size() < count) {
			if(titleWords != null) {
				keywordList.remove(Arrays.asList(titleWords));
			}
			criteria.setKeywordList(keywordList);
			criteria.setEndRownum(count - relationVideoList.size());
			List<Video> newList = creatorDao.getVideos(criteria);
			relationVideoList.addAll(newList);
			for(Video foundVids : newList) {
				exVideoNoList.add(foundVids.getNo());
			}
			criteria.setExVideoNoList(exVideoNoList);
		}

		if(relationVideoList.size() < count) {
			if(tagWords != null) {
				keywordList.remove(Arrays.asList(tagWords));
			}
			criteria.setKeywordList(keywordList);
			criteria.setEndRownum(count - relationVideoList.size());
			List<Video> newList = creatorDao.getVideos(criteria);
			relationVideoList.addAll(newList);
			for(Video foundVids : newList) {
				exVideoNoList.add(foundVids.getNo());
			}
			criteria.setExVideoNoList(exVideoNoList);
		}

		if(relationVideoList.size() < count) {
			criteria.setPrimaryCategoryNo(null);
			criteria.setRelationCategorySearch(null);
			criteria.setEndRownum(count - relationVideoList.size());
			List<Video> newList = creatorDao.getVideos(criteria);
			relationVideoList.addAll(newList);
			for(Video foundVids : newList) {
				exVideoNoList.add(foundVids.getNo());
			}
			criteria.setExVideoNoList(exVideoNoList);
		}
		
		if(relationVideoList.size() < count) {
			keywordList.clear();
			criteria.setKeywordList(keywordList);
			criteria.setEndRownum(count - relationVideoList.size());
			List<Video> newList = creatorDao.getVideos(criteria);
			relationVideoList.addAll(newList);
			for(Video foundVids : newList) {
				exVideoNoList.add(foundVids.getNo());
			}
			criteria.setExVideoNoList(exVideoNoList);
		}

		return relationVideoList;
	}
	
	@Override
	public Video addNewVideo(Video video, MultipartFile mpf, double selectedDuration) {
		
		int videoSeq = getVideoSequence();
		video.setNo(videoSeq);
		
		String folderPath = "C:/upload/ducktube"
				+ "/user" + video.getCreatorNo()
				+ "/video" + videoSeq;
		
		String originFilename = mpf.getOriginalFilename();
		String fixedFilename = "video_" + System.currentTimeMillis() + "_" + originFilename;
		
		try {

			File directory = new File(folderPath);
			if(!directory.exists()) {
				directory.mkdirs();
			}

			FileCopyUtils.copy(mpf.getBytes(), new File(folderPath, fixedFilename));
			File file = new File(folderPath, fixedFilename);

			SeekableByteChannel bc = NIOUtils.readableFileChannel(file);
			DemuxerTrackMeta dtm = new MP4Demuxer(bc).getVideoTrack().getMeta();
			
			int totalFrame = dtm.getTotalFrames();

			double videoDuration = dtm.getTotalDuration();
			int videoFps = (int)(totalFrame / videoDuration);
			
			String status = "enabled";
			String videoUrl = fileServerHost + "/creator/file?path=" + file.getAbsolutePath();

			video.setDuration(videoDuration);
			video.setFps(videoFps);
			video.setFilename(originFilename);
			video.setUrl(videoUrl.replace("\\", "/"));
			video.setStatus(status);
			
			video.setTitle(URLDecoder.decode(video.getTitle(), defaultCharacterSet));
			video.setDetail(URLDecoder.decode(video.getDetail(), defaultCharacterSet));
			
			List<String> imgRequestUrls = writeImageFromSelectedDuration(selectedDuration, folderPath, file);
			
			video.setPreviewA1Url(imgRequestUrls.get(0));
			video.setPreviewA2Url(imgRequestUrls.get(1));
			video.setPreviewA3Url(imgRequestUrls.get(2));
			video.setPreviewA4Url(imgRequestUrls.get(3));

			creatorDao.addNewVideo(video);
			if(video.getTagList() != null) {
				List<String> tagList = new ArrayList<String>();
				for(String tag : video.getTagList()) {
					tagList.add(URLDecoder.decode(tag, defaultCharacterSet));
				}
				System.out.println(tagList);
				video.setTagList(tagList);
				creatorDao.addNewTags(video);
			}
		} catch (IOException e) {
			e.printStackTrace();
			File workDir = new File(folderPath);
			File errorDir = new File(folderPath + "_error");
			workDir.renameTo(errorDir);
			
			throw new RuntimeException("io exception - 생성오류");
		}

		return creatorDao.getVideoByVideoNo(video.getNo());
	}


	@Override
	public Video updateVideo(Video video, MultipartFile mpf, double selectedDuration) {
		
		Video originVideo = creatorDao.getVideoByVideoNo(video.getNo());
		
		String folderPath = "C:/upload/ducktube"
				+ "/user" + video.getCreatorNo()
				+ "/video" + video.getNo();
		
		try {
			
			if(mpf != null) {
				
				String originFilename = mpf.getOriginalFilename();
				String fixedFilename = "video_" + System.currentTimeMillis() + "_" + originFilename;
				
				// video file change
				FileCopyUtils.copy(mpf.getBytes(), new File(folderPath, fixedFilename));
				File file = new File(folderPath, fixedFilename);

				SeekableByteChannel bc = NIOUtils.readableFileChannel(file);
				DemuxerTrackMeta dtm = new MP4Demuxer(bc).getVideoTrack().getMeta();
				
				int totalFrame = dtm.getTotalFrames();
				double videoDuration = dtm.getTotalDuration();
				List<String> imgRequestUrls = writeImageFromSelectedDuration(selectedDuration, folderPath, file);
			
				originVideo.setPreviewA1Url(imgRequestUrls.get(0));
				originVideo.setPreviewA2Url(imgRequestUrls.get(1));
				originVideo.setPreviewA3Url(imgRequestUrls.get(2));
				originVideo.setPreviewA4Url(imgRequestUrls.get(3));
				
				int videoFps = (int)(totalFrame / videoDuration);
				
				String status = "enabled";
				String videoUrl = fileServerHost + "/creator/file?path=" + file.getAbsolutePath();

				originVideo.setDuration(videoDuration);
				originVideo.setFps(videoFps);
				originVideo.setFilename(originFilename);
				originVideo.setUrl(videoUrl.replace("\\", "/"));
				originVideo.setStatus(status);

			} else {
				
				if(selectedDuration >= 0) {
					File file = new File(folderPath, "video_" + originVideo.getFilename());

					List<String> imgRequestUrls = writeImageFromSelectedDuration(selectedDuration, folderPath, file);
					System.out.println(selectedDuration);
					originVideo.setPreviewA1Url(imgRequestUrls.get(0));
					originVideo.setPreviewA2Url(imgRequestUrls.get(1));
					originVideo.setPreviewA3Url(imgRequestUrls.get(2));
					originVideo.setPreviewA4Url(imgRequestUrls.get(3));
				}

			}
			
			originVideo.setTitle(URLDecoder.decode(video.getTitle(), defaultCharacterSet));
			originVideo.setDetail(URLDecoder.decode(video.getDetail(), defaultCharacterSet));
			originVideo.setPrimaryCategoryNo(video.getPrimaryCategoryNo());
			originVideo.setSecondaryCategoryNo(video.getSecondaryCategoryNo());
			originVideo.setUpdateDate(new Date());
			List<String> tagList = new ArrayList<String>();
			List<String> formTagList = video.getTagList();
			if(formTagList != null) {
				if(formTagList.size() > 0) {
					for(String tag : formTagList) {
						tagList.add(URLDecoder.decode(tag, defaultCharacterSet));
					}
					originVideo.setTagList(tagList);
					creatorDao.deleteTags(originVideo.getNo());
					creatorDao.addNewTags(originVideo);
				}
			} else { System.out.println("null"); }
			
			System.out.println("result : " + originVideo);
			creatorDao.updateVideo(originVideo);
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("io exception - 수정 오류");
		}
		
		return creatorDao.getVideoByVideoNo(originVideo.getNo());
	}

	private List<String> writeImageFromSelectedDuration(double duration, String folderPath, File videoFile) throws IOException {

		List<String> urls = new ArrayList<String>();
		
		try {
			
			Picture frame = FrameGrab.getNativeFrame(videoFile, duration);
			BufferedImage img = AWTUtil.toBufferedImage(frame);
			String delim = "X";
			
			String[][] standards = new String[4][];
			standards[0] = videoPreviewStandardA1.split(delim);
			standards[1] = videoPreviewStandardA2.split(delim);
			standards[2] = videoPreviewStandardA3.split(delim);
			standards[3] = videoPreviewStandardA4.split(delim);

			for(int i=0; i<standards.length; i++) {
				
				File poster = new File(folderPath, "previewA" + (i+1) + "_image_" + System.currentTimeMillis() + ".png");
				if (!poster.exists()) {
					poster.createNewFile();
				}
				
				String imgUrl = fileServerHost + "/creator/file?path=" + poster.getAbsolutePath();
				urls.add(imgUrl.replace("\\","/"));

				int width = Integer.parseInt(standards[i][0]);
				int height = Integer.parseInt(standards[i][1]);
				
				BufferedImage resizedImg = resize(img, height, width);
				ImageIO.write(resizedImg, "png", poster);
				
				resizedImg.flush();
				img.flush();
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (JCodecException e) {
			e.printStackTrace();
		}
		
		return urls;
	}
	
    private BufferedImage resize(BufferedImage img, int height, int width) {
    	
    	double hRate = img.getHeight() / (double)height;
    	double wRate = img.getWidth()  / (double)width;
    	
    	if(wRate < 1) {
    	
    	} else {
    		
    	}

    	int imgW = (int) (img.getWidth() / hRate);
    	int imgH = (int) (img.getHeight() / hRate);
    	
    	double wDiff = width - imgW;
    	double half = wDiff / 2;
    	
    	BufferedImage resized = new BufferedImage(width, height, img.getType());
    	Image temp = img.getScaledInstance(imgW, imgH, img.getType());
    	Graphics2D g2d = resized.createGraphics();
    	g2d.setColor(Color.black);
    	g2d.fillRect(0, 0, (int)(imgW + wDiff), imgH);
    	g2d.drawImage(temp, (int)half, 0, null);
    	
    	g2d.dispose();
    	temp.flush();
    	
    	return resized;

    }

}
