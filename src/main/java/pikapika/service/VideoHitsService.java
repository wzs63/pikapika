package pikapika.service;

import java.util.List;

import pikapika.pojo.VideoHits;


public interface VideoHitsService {
	List<VideoHits> findAll();
	int save(VideoHits videoHits);
	List<Integer> get(String hitUserName);

}
