package pikapika.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pikapika.mapper.VideoMapper;
import pikapika.pojo.Video;
import pikapika.service.VideoService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("VideoService")
public class VideoServiceImpl implements VideoService {
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

	@Override
	public List<Video> findAll() {
		return videoMapper.findAll();
	}

	@Override
	public int save(Video video) {
		return videoMapper.save(video);
	}

	@Override
	public void delete(int videoId) {
		videoMapper.delete(videoId);
	}

	@Override
	public List<Video> getByType(String videoType) {
		return videoMapper.getByType(videoType);
	}

	@Override
	public List<Video> getByAuthor(String videoAuthor) {
		return videoMapper.getByAuthor(videoAuthor);
	}

	@Override
	public List<Video> getByName(String videoName) {
		return videoMapper.getByName(videoName);
	}

	@Override
	public List<Video> search(String videoName) {
		return videoMapper.search(videoName);
	}

	@Override
	public List<Video> top() {
		return videoMapper.top();
	}

}
