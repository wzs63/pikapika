package pikapika.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pikapika.pojo.Focus;
import pikapika.pojo.User;
import pikapika.service.FocusService;

@Controller
public class FocusController {
	@Autowired
	FocusService focusService;
	@RequestMapping("/focus")
	public String addFocus(HttpServletRequest request, @RequestParam(value="focusedName")String focusedName, Model m) {
		User fullUser = (User)request.getSession().getAttribute("fullUser");
		String focusName = fullUser.getUserName();
		Focus focus = new Focus(focusName, focusedName, new Date(),"user");
	   	focusService.save(focus);
	       return "person/"+focusedName;
	}
	
	@RequestMapping("/focusVideo")
	public String addFocusVideo(HttpServletRequest request, @RequestParam(value="focusVideoId")String focusVideoId, Model m) {
		User fullUser = (User)request.getSession().getAttribute("fullUser");
		String focusName = fullUser.getUserName();
		Focus focus = new Focus(focusName, focusVideoId, new Date(),"video");
	   	focusService.save(focus);
	       return "/";
	   }
}
