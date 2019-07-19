package springboot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springboot.util.JedisAdapter;
import springboot.util.RedisKeyUtil;

@Service
public class LikeService {
    @Autowired
    JedisAdapter jedisAdapter;

    /**
     * 返回此用户是否like了 like 1 dislike -1 nochoice 0
     * @param userId
     * @param entityType 可以规定视频类型为1 个人用户类型为2
     * @param entityId 某类型下的一实体标识符
     * @return
     */
    public int getLikeStatus(String userName, int entityType, int entityId) {
        //根据类型和id得到规定好的键的格式
        String likeKey = RedisKeyUtil.getLikeKey(entityId, entityType);
        //根据键和用户id在redis上查询，这个key（点like用户组成的set）的value是否包括此用户。
        if(jedisAdapter.sismember(likeKey, userName)) {
            return 1;
        }
        else {
            return 0;
        }
//        String disLikeKey = RedisKeyUtil.getDisLikeKey(entityId, entityType);
//        return jedisAdapter.sismember(disLikeKey, userName) ? -1 : 0;
    }

    /**
     * 点like，like set之间此用户
     * @param userId
     * @param entityType
     * @param entityId
     * @return
     */
    public long like(String userName, int entityType, int entityId) {
        // 在喜欢集合里增加userName
        // 创建like键
        String likeKey = RedisKeyUtil.getLikeKey(entityId, entityType);
        jedisAdapter.sadd(likeKey, userName);
        // 从反对里删除
        String disLikeKey = RedisKeyUtil.getDisLikeKey(entityId, entityType);
        jedisAdapter.srem(disLikeKey, userName);
        return jedisAdapter.scard(likeKey);
    }

    /**
     * 点dislike
     * @param userId
     * @param entityType
     * @param entityId
     * @return
     */
    public long disLike(String userName, int entityType, int entityId) {
        // 在反对集合里增加
        String disLikeKey = RedisKeyUtil.getDisLikeKey(entityId, entityType);
        jedisAdapter.sadd(disLikeKey, userName);
        // 从喜欢里删除
        String likeKey = RedisKeyUtil.getLikeKey(entityId, entityType);
        jedisAdapter.srem(likeKey, userName);
        return jedisAdapter.scard(likeKey);
    }
}

