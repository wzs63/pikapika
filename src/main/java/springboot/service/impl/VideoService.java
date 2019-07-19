package springboot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springboot.mapper.VideoMapper;
import springboot.pojo.Video;

import java.util.HashMap;
import java.util.Map;

@Service
public class VideoService {
    @Autowired
    VideoMapper videoMapper;

    public Video get(int videoId ){
        Video video = videoMapper.get(videoId);
        Map<String, Integer> map = new HashMap<>();
        map.put("videoId", videoId);
        map.put("videoHits", video.getVideoHits()+1);
        videoMapper.UpdateVideoHits(map);
        return video;
    }

    public void updateLikeCount(int videoId, int likeCount){
        Video video = videoMapper.get(videoId);
        Map<String, Integer> map = new HashMap<>();
        map.put("videoId", videoId);
        map.put("likeCount", likeCount);
        videoMapper.updateLikeCount(map);
    }

}
