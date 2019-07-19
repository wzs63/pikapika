package pikapika.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pikapika.mapper.MessageMapper;
import pikapika.pojo.Message;
import pikapika.service.MessageService;

import java.util.List;


@Service("MessageService")
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageMapper messageMapper;

    public int addMessage(Message message) {
        return messageMapper.addMessage(message);
    }

    public List<Message> getConversationDetail(String conversationId, int offset, int limit) {
        return messageMapper.getConversationDetail(conversationId, offset, limit);
    }

    public List<Message> getConversationList(String userName, int offset, int limit) {
        return messageMapper.getConversationList(userName, offset, limit);
    }

    public int getConvesationUnreadCount(String userName, String conversationId) {
        return messageMapper.getConvesationUnreadCount(userName, conversationId);
    }

    public void read(String conversationId){
        messageMapper.read(conversationId);
    }

}
