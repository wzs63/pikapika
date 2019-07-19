package pikapika.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.mail.handlers.image_gif;

import pikapika.mapper.VideoHitsMapper;
import pikapika.pojo.Video;
import pikapika.pojo.VideoHits;
import pikapika.service.VideoHitsService;
import pikapika.service.VideoService;

@Service("VideoHitsServiceImpl")
public class VideoHitsServiceImpl implements VideoHitsService{

	@Autowired
	VideoHitsMapper videoHitsMapper;
	
	@Override
	public List<VideoHits> findAll() {
		return videoHitsMapper.findAll();
	}

	@Override
	public int save(VideoHits videoHits) {
		return videoHitsMapper.save(videoHits);
	}

	@Override
	public List<Integer> get(String hitUserName) {
		return videoHitsMapper.get(hitUserName);
	}
	
}
