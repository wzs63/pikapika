package pikapika.service;

import org.springframework.beans.factory.annotation.Autowired;
import pikapika.mapper.MessageMapper;
import pikapika.pojo.Message;

import java.util.List;

public interface MessageService {

    int addMessage(Message message);

    List<Message> getConversationDetail(String conversationId, int offset, int limit);

    List<Message> getConversationList(String userName, int offset, int limit);

    int getConvesationUnreadCount(String userName, String conversationId);

    void read(String conversationId);
}
