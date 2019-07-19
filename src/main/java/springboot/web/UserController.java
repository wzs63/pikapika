package springboot.web;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.impl.FileOnload;
import service.impl.MailServiceImpl;
import service.impl.Zaiyao;
import springboot.mapper.UserMapper;
import springboot.pojo.User;
/**
 * 
 * @author Wzs63
 *
 */

@Controller
public class UserController {
	@Autowired 
	UserMapper userMapper;
	
	
	/**
	 * 更新user状态(fullUser即为刚刚从数据库中获得的完整user或者是刚刚更新了信息的完整user)
	 * @param request
	 * @param fullUser
	 */
	public void updateUser(HttpServletRequest request, User fullUser) {
		request.getSession().removeAttribute("fullUser");
		request.getSession().setAttribute("fullUser", fullUser);
	}
	
	/**
	 * 到登录页面login 的路由
	 * @return
	 */
	@RequestMapping(path = {"/", "/login.do"})
    public String login() {
    	return "login";
    }
	
	/**
	 * 登录填写信息检查
	 * @param user
	 * @param m
	 * @param request
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping("/login_check.do")
	public String loginCheck(User user, Model m, HttpServletRequest request) throws NoSuchAlgorithmException {
System.out.println("loginCheck() 登录名称: "+user.getUserName());
System.out.println("loginCheck() 登录密码: "+user.getUserPassWord());
		
		//根据form提交userName在数据库查找fullUser
		User fullUser = userMapper.get(user.getUserName());
System.out.println(fullUser);
		//form密码->MD5+SALT->摘要
		user.setUserPassWord(Zaiyao.deal(user.getUserPassWord()));//需要异常处理NoSuchAlgorithmException
		
		//如果数据库没有查到这个用户
		if (fullUser == null) {
			System.out.println("没有此用户");
			m.addAttribute("fail_message", "没有此用户");
			return "login";
		}
		
System.out.println("输入的密码： "+user.getUserPassWord());
System.out.println("数据库的密码： "+fullUser.getUserPassWord());
		//判断和数据库的密码一不一样
		if(user.getUserPassWord().equals(fullUser.getUserPassWord())){
			System.out.println("登陆成功");
System.out.println(user);

			//传入session fullUser(是完整信息的)
			request.getSession().setAttribute("fullUser", fullUser);
			return "redirect:/index.do";
		
		}else{//密码不一样
			
			System.out.println("密码不正确");
			m.addAttribute("fail_message", "密码错误");
			return "login";
		}
    }
	
	/**
	 * 到注册页面register 的路由
	 * @return
	 */
	@RequestMapping("/register.do")
    public String register() {
    	return "register";
    }
	
	/**
	 * 注册信息的检查
	 * @param user
	 * @param m
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping("/register_check.do")
    public String registerCheck(User user, Model m) throws NoSuchAlgorithmException {
System.out.println("loginCheck() 注册名称: "+user.getUserName());
System.out.println("loginCheck() 注册密码: "+user.getUserPassWord());
		//根据userName数据库查这个用户
		User fullUser = userMapper.get(user.getUserName());
		//如果还没有此用户名，成功
		if(fullUser == null){
			//密码设置摘要
			user.setUserPassWord(Zaiyao.deal(user.getUserPassWord()));//需要异常处理NoSuchAlgorithmException
			//保存用户信息到数据库
			userMapper.save(user);
			return "login";
		}else{
			//已经有这个用户名了
			m.addAttribute("fail_message", "用户名已被注册");
			return "register";
		}
    	
    }
	
	/**
	 * 检查邮箱发验证码
	 * @param emailAddress
	 * @return
	 */
	@RequestMapping("/checkEmail.do")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
	public Map<String,Object> checkEmail(@RequestParam(value="emailAddress")String emailAddress) {
System.out.println(emailAddress);
		
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//生成激活码
	    String code = UUID.randomUUID().toString().replaceAll("-", "");
System.out.println(code);
		//发邮件线程启动
	    new MailServiceImpl(emailAddress, code).run();
		
  		resultMap.put("code", code);
		return resultMap;
	}
	
	/**
	 * 到个人中心person 的路由
	 * @param request
	 * @param m
	 * @return
	 */
	@RequestMapping("/person/{userName}")
    public String person(@PathVariable("userName") String userName, Model m) {
		//String userName = request.getSession().getAttribute("userName").toString();
		//User user = userMapper.get(userName);
//System.out.println(userName);

		User user = userMapper.get(userName);
		m.addAttribute("user", user);
//		m.addAttribute("signature", user.getUserSignature());
    	return "person";//返回到person view
    }
	
	/**
	 * 上传头像
	 * @param request
	 * @param file 头像图片文件
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/uploadHeadPortrait.do")
	public void uploadHeadPortrait(HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
			User user = (User) request.getSession().getAttribute("fullUser");
			
	System.out.println(file.getOriginalFilename());
			//上传文件并返回文件名（路径默认）
			String newFileName = FileOnload.onload(file);
			//更新user信息
		    user.setUserImg(newFileName);
		    userMapper.updateTX(user);
		    
		    //更新session user状态
		    updateUser(request, user);
					
	    }
	
}
