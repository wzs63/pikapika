package pikapika.service;

import pikapika.pojo.Video;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface VideoService {
    Video get(int videoId );
    void updateLikeCount(int videoId, int likeCount);
    List<Video> findAll();
	int save(Video video); 
    void delete(int videoId);
    List<Video> getByType(String videoType);
    List<Video> getByAuthor(String videoAuthor);
    List<Video> getByName(String videoName);
    List<Video> search(String videoName);
    List<Video> top();
}
