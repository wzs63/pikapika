package pikapika.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pikapika.mapper.CommentMapper;
import pikapika.pojo.Comment;
import pikapika.pojo.User;

import java.util.Date;

@Controller
public class CommentController {
	@Autowired
	CommentMapper commentMapper;
	
	@RequestMapping("/addComment/{videoId}")
    public String getVideo(@PathVariable("videoId") String videoId, String commentContent, HttpServletRequest request,  Model m) {
		System.out.println("videoId: " + videoId);
		System.out.println("commentContent: " + commentContent);
		Comment comment = new Comment();
		comment.setCommentContent(commentContent);
		User user = (User)request.getSession().getAttribute("fullUser");
		if(user == null){
			m.addAttribute("fail_message", "登录才能评论哦");
			return "login";
		}
		
		String userImg = user.getUserImg();
		comment.setCommentUserImg(userImg);
		comment.setCommentDate(new Date());
		comment.setCommentUser(user.getUserName());
		comment.setCommentVideo(Integer.parseInt(videoId));
		commentMapper.save(comment);
		
		m.addAttribute("id", 1);
		
		String url="/video/"+videoId+".do";
		System.out.println("nooooooooooooo!!!!!");
    	return "forward:"+url;
    }
}
