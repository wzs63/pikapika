package pikapika.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pikapika.pojo.User;
import pikapika.pojo.Video;
import pikapika.pojo.VideoHits;
import pikapika.service.FocusService;
import pikapika.service.UserService;
import pikapika.service.VideoHitsService;
import pikapika.service.VideoService;

@Controller
public class PersonController {
	 
	@Autowired
	VideoHitsService videoHitsService;
	@Autowired
	VideoService videoService;
	@Autowired
	FocusService focusService;
	@Autowired
	UserService userService;
	
    @RequestMapping("/person/history/{userName}")
    public String history(Model m,
    		@PathVariable("userName") String userName) {
    	User user = userService.get(userName);
    	
    	List<Integer> videoIdList = videoHitsService.get(user.getUserName());
    	List<Video> videosList = new ArrayList<>();
    	for(Integer videoId:videoIdList){
    		videosList.add(videoService.get(videoId));
    	}
    	m.addAttribute("videosList", "videosList");
        return "haha";
    }
    
    /**
     * 获取关注列表
     * @param m
     * @param request
     * @return
     */
    @RequestMapping("/person/focus/{userName}")
    public String focus(Model m, @PathVariable("userName") String userName) {
    	User user = userService.get(userName);
    	
    	List<String> focusNameList = focusService.getfocus(userName);
    	List<User> usersList = new ArrayList<>();
    	for(String focusName:focusNameList){
    		usersList.add(userService.get(focusName));
    	}
//关注者列表
    	m.addAttribute("usersList", "usersList");
        return "haha";
    }
    
    /**
     * 获取粉丝列表
     * @param m
     * @param request
     * @return
     */
    @RequestMapping("/person/fans/{userName}")
    public String fans(Model m, @PathVariable("userName") String userName) {
		User user = userService.get(userName);
    	List<String> fansNameList = focusService.getfans(userName);
    	List<User> usersList = new ArrayList<>();
    	for(String fansName:fansNameList){
    		usersList.add(userService.get(fansName));
    	}
    	
    	m.addAttribute("usersList", "usersList");
        return "haha";
    }

}
