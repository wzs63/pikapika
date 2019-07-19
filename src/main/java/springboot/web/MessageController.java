package springboot.web;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import springboot.mapper.UserMapper;
import springboot.model.ViewObject;
import springboot.pojo.Message;
import springboot.pojo.User;
import springboot.service.impl.MessageService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MessageController {

    @Autowired
    MessageService messageService;

    @Autowired
    UserMapper userMapper;

    @RequestMapping("/message/list")
    public String conversationList(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("fullUser");
        String userName = user.getUserName();
        List<ViewObject> conversations = new ArrayList<ViewObject>();
        //获取会话列表（以根据conversationId分组）
        List<Message> messages = messageService.getConversationList(userName, 0, 10);
        System.out.println(messages == null);
        //遍历每一组消息
        for (Message message : messages) {
            System.out.println(message.getConversationId());
            System.out.println(message.getFromName());
            System.out.println(message.getToName());
            System.out.println(message.getContent());


            //此对象用于与前端交互信息
            ViewObject vo = new ViewObject();
            vo.setMessage("message", message);
            User otherUser = null;
            //如果此用户是收方
            if (message.getToName().equals(userName)) {
                //获得此对话未读消息
                vo.set("unread", messageService.getConvesationUnreadCount(userName, message.getConversationId()));
                vo.set("otherUserName", message.getFromName());
                otherUser = (User) userMapper.get(message.getFromName());
                vo.set("userImg", otherUser.getUserImg());
            } else {
                vo.set("unread", 0);
                vo.set("otherUserName", message.getToName());
                otherUser = (User) userMapper.get(message.getToName());
                vo.set("userImg", otherUser.getUserImg());
            }
            System.out.println(otherUser.getUserImg());
            conversations.add(vo);
        }
        model.addAttribute("conversations", conversations);
        System.out.println("return");
        return "letter";
    }

    @RequestMapping("/message/detail")
    public String messageDetail(HttpServletRequest request, Model model, @Param("conversationId") String conversationId) {
        //此conversationId标示为已读 hasRead=1
        messageService.read(conversationId);
        //取出此conversationId的所有条message
        List<Message> messageList = messageService.getConversationDetail(conversationId, 0, 10);
        List<ViewObject> conversations = new ArrayList<>();
        User user = (User) request.getSession().getAttribute("fullUser");
        for (Message message : messageList) {
            ViewObject vo = new ViewObject();
            vo.setMessage("message", message);
            User fromUser = (User) userMapper.get(message.getFromName());
            vo.set("userImg", fromUser.getUserImg());
            //vo.set("userName", user.getId());
            conversations.add(vo);
        }
        System.out.println("userName: "+user.getUserName());
        //得到会话对方的name
//        if(messageList.get(0).getToName().equals()user.getUserName()) {
//            otherName = messageList.get(0).getFromName();
//        }else {
//            otherName = messageList.get(0).
//        }
        String otherName = (messageList.get(0).getToName().equals(user.getUserName())) ? messageList.get(0).getFromName() : messageList.get(0).getToName();
       // model.addAttribute("conversationId", messageList.get(0).getConversationId());
        model.addAttribute("otherName", otherName);
        model.addAttribute("conversations", conversations);
        System.out.println("otherName: "+otherName);
        return "letterDetail";
    }


    @RequestMapping("/addMessage/{otherName}")
    public String addMessgae(@PathVariable("otherName") String otherName, String messageContent, HttpServletRequest request, Model m) {
        User user = (User) request.getSession().getAttribute("fullUser");

        String firstName = "";
        String lastName = "";
        if(user.getUserName().compareTo(otherName) > 0){
            firstName = user.getUserName();
            lastName = otherName;
        }else {
            lastName = user.getUserName();
            firstName = otherName;
        }
        String conversationId =firstName+"-"+lastName;
        Message message = new Message();
        message.setContent(messageContent);
        message.setFromName(user.getUserName());
        message.setToName(otherName);

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //Date time=new Date(System.currentTimeMillis());
        //System.out.println(sdf.format(time));

        message.setCreatedDate(new Date());
        message.setConversationId(conversationId);
        //msg.setConversationId(fromId < toId ? String.format("%d_%d", fromId, toId) : String.format("%d_%d", toId, fromId));
        messageService.addMessage(message);
        System.out.println("conversationId: "+conversationId);
        return "redirect:/message/detail?conversationId="+conversationId;
    }
    public static  void main(String[] arg){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date time=new Date(System.currentTimeMillis());
        //System.out.println(time);

    }
}

