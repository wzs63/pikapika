package springboot.web;


import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import net.sf.jsqlparser.statement.create.table.Index;
import service.impl.FileOnload;
import springboot.mapper.CommentMapper;
import springboot.mapper.UserMapper;
import springboot.mapper.VideoMapper;
import springboot.pojo.Comment;
import springboot.pojo.User;
import springboot.pojo.Video;
import springboot.service.impl.LikeService;
import springboot.service.impl.VideoService;

/**
 * 
 * @author Wzs63 5.30 14:39
 *
 */
@Controller
public class VideoController {
	@Autowired
	UserMapper userMapper;
	@Autowired
	CommentMapper commentMapper;
	@Autowired
	VideoMapper videoMapper;
	@Autowired
	VideoService videoService;
	@Autowired
	LikeService likeService;

	int videoType = 1;
	/**
	 * 主页路由
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model){
		//分区添加视频list 
		
		List<Video> videosOfVlog = videoMapper.getByType("Vlog");
		model.addAttribute("videosOfVlog", videosOfVlog);
		List<Video> videosOfwd = videoMapper.getByType("舞蹈");
		model.addAttribute("videosOfwd", videosOfwd);
		List<Video> videosOfjx = videoMapper.getByType("教学");
		model.addAttribute("videosOfjx", videosOfjx);
		List<Video> videosOfjy = videoMapper.getByType("教育");
		model.addAttribute("videosOfjy", videosOfjy);
		List<Video> videosOfgc = videoMapper.getByType("鬼畜");
		model.addAttribute("videosOfgc", videosOfgc);
		List<Video> videosOffj = videoMapper.getByType("番剧");
		model.addAttribute("videosOffj", videosOffj);
		
		return "index";

	}
	
	/**
	 * 视频路由
	 * @param videoId
	 * @param m
	 * @return
	 */
	@RequestMapping("/video/{videoId}")
    public String video(@PathVariable("videoId") int videoId, Model m, HttpServletRequest request) {
System.out.println("videoId: " + videoId);
		m.addAttribute("videoId", videoId);
		User user = (User) request.getSession().getAttribute("fullUser");

		Video video = videoService.get(videoId);
		//String videoUrl = video.getVideoUrl();
		//long likeCount = likeService.disLike(fullUser.getUserName(), videoType, videoId);redis有就用这个 没有就用MySQL数据
		m.addAttribute("video", video);

		int status = likeService.getLikeStatus(user.getUserName() ,videoType, videoId);
		System.out.println("status:"+ status );
		m.addAttribute("status", status);
		System.out.println("video: " + video.getVideoUrl());
		//与此视频id有关的评论
		List<Comment> comments = commentMapper.get(videoId);
		for (Comment comment:comments) {
			comment.setCommentUserImg(userMapper.get(comment.getCommentUser()).getUserImg());//评论图片换为此时相应用户的头像
		}
		m.addAttribute("comments", comments);
		
    	return "video";
    }
	
	@RequestMapping("/videoUnload.do")
    public String videoUnload() {
    	return "unload_video";
    }
	
	/**
	 * 添加视频填写表路由
	 * @return
	 */
	@RequestMapping("/addVideo.do")
    public String addVideo() {
    	return "addVideo";
    }
	
	/**
	 * 保存视频
	 * @param videoName
	 * @param videoAuthor
	 * @param videoImg
	 * @param videoHits
	 * @param videoType
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/addVideo_save.do")
    public void saveVideo(HttpServletRequest request, String video_title,  MultipartFile image_file, MultipartFile video_file, String video_content, String video_type) throws IllegalStateException, IOException {
System.out.println(">>>arrive");
		User user = (User)request.getSession().getAttribute("fullUser");

		String videoAuthor = user.getUserName();
System.out.println(videoAuthor);
		
		//获取当前时间
		Date videoDate = new Date();
		//保存video
System.out.println(">>>arrive2");		
		String videoName = video_title;
		String videoImg = FileOnload.onload(image_file);
		int videoHits = 0;
		String videoType = video_type;
		String videoUrl = FileOnload.onload(video_file);
System.out.println(">>>arrive3");
		String videoIntro = video_content;
		videoMapper.save(new Video(videoName, videoAuthor, videoImg, videoHits, videoDate, videoType, videoUrl, videoIntro));
		
    	//return "ok";
    }

	@RequestMapping("/search.do")
	public String search(@RequestParam(value="searchText")String searchText, Model m) {
		System.out.println(searchText);
		List<Video> videos = videoMapper.search(searchText);
		m.addAttribute("videos", videos);
		List<User> users = userMapper.search(searchText);
		m.addAttribute("users", users);
		return "search";
	}

	@RequestMapping(path = {"/like"}, method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String,Object>  like(@RequestParam(value="videoId")int videoId, HttpServletRequest request) {
		//key set增加用户id，并返回现在的like数
		User fullUser = (User)request.getSession().getAttribute("fullUser");

		long likeCount = likeService.like(fullUser.getUserName(), videoType, videoId);

		Video video = videoMapper.get(videoId);
		// 数据库更新喜欢数
		/**
		 * 数据库只是更新likecount，而存userName的set在内存进行，即redis
		 * 后期可以没隔几秒钟更新mysql，这样虽然可能有几秒钟的延迟，数据库的压力却少了很多。
		 */
		videoService.updateLikeCount(videoId, (int) likeCount);

//		eventProducer.fireEvent(new EventModel(EventType.LIKE)
//				.setActorId(hostHolder.getUser().getId()).setEntityId(newsId)
//				.setEntityType(EntityType.ENTITY_NEWS).setEntityOwnerId(news.getUserId()));
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("likeCount", likeCount);
		return resultMap;
	}

	@RequestMapping(path = {"/dislike"}, method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String,Object>  dislike(@RequestParam(value="videoId")int videoId, HttpServletRequest request) {
		User fullUser = (User)request.getSession().getAttribute("fullUser");

		long likeCount = likeService.disLike(fullUser.getUserName(), videoType, videoId);
		// 更新喜欢数
		Video video = videoMapper.get(videoId);
		videoService.updateLikeCount(videoId, (int) likeCount);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("likeCount", likeCount);
		return resultMap;
	}

	/**
	 * 排行榜路由
	 * @return
	 */
	@RequestMapping("/top.do")
	public String top(Model m) {
		List<Video> videos = videoMapper.top();

		m.addAttribute("videos", videos);

		return "top";
	}

	/**
	 * 搜索界面路由
	 * @return
	 */
//	public String search() {
//		List<Video> videos = videoMapper.top();
//
//
//		return "top";
//	}
	 /*
	 * TEST
	 */
	public static void main(String[] args) {
		java.util.Date ctime = new java.sql.Date(new java.util.Date().getTime());
		System.out.println( ctime );
	}
	
}
