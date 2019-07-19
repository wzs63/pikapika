package pikapika.mapper;

import org.apache.ibatis.annotations.*;
import pikapika.pojo.Message;

import java.util.List;


@Mapper
public interface MessageMapper {
    String TABLE_NAME = " message ";
    String INSERT_FIELDS = " fromName, toName, content, hasRead, conversationId, createdDate ";
    String SELECT_FIELDS = " id, " + INSERT_FIELDS;

    @Insert({"insert into ", TABLE_NAME, "(", INSERT_FIELDS,
            ") values (#{fromName},#{toName},#{content},#{hasRead},#{conversationId},#{createdDate})"})
    int addMessage(Message message);
    //获得某一聊天分组的具体聊天记录
    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where conversationId=#{conversationId} order by id desc limit #{offset}, #{limit}"})
    List<Message> getConversationDetail(@Param("conversationId") String conversationId,
                                        @Param("offset") int offset, @Param("limit") int limit);
    //获得某组的未读数
    @Select({"select count(id) from ", TABLE_NAME, " where hasRead=0 and toName=#{userName} and conversationId=#{conversationId}"})
    int getConvesationUnreadCount(@Param("userName") String userName, @Param("conversationId") String conversationId);
    //根据分组获得聊天列表
    @Select({"select ", INSERT_FIELDS, " ,count(id) as id from ( select * from ", TABLE_NAME, " where fromName=#{userName} or toName=#{userName} order by id desc) tt group by conversationId  order by createdDate desc limit #{offset}, #{limit}"})
    List<Message> getConversationList(@Param("userName") String userName,
                                      @Param("offset") int offset, @Param("limit") int limit);
    //更新未读状态为已读
    @Update("update message set hasRead = 1  where conversationId = #{conversationId}" )
    void read(String conversationId);
}
