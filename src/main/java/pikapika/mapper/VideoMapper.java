package pikapika.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import pikapika.pojo.Video;

/**
 * 
 * @author Wzs63
 *
 */

@Mapper
public interface VideoMapper {
	@Select(" select * from video ")
    List<Video> findAll();
     
	@Insert(" insert into video (videoName, videoAuthor, videoImg, videoHits, videoDate, videoType, videoUrl, videoIntro) values (#{videoName}, #{videoAuthor}, #{videoImg}, #{videoHits},#{videoDate}, #{videoType}, #{videoUrl}, #{videoIntro} )")
   	public int save(Video video); 
     
    @Delete(" delete from video where videoId= #{videoId} ")
    public void delete(int videoId);

    @Update("update video set videoHits = #{videoHits}  where videoId = #{videoId}")
    public void UpdateVideoHits(Map<String, Integer> map);
    @Update("update video set likeCount = #{likeCount}  where videoId = #{videoId}")
    public void updateLikeCount(Map<String, Integer> map);

    @Select("select * from video where videoId= #{videoId} ")
    public Video get(int videoId);
    @Select("select * from video where videoType= #{videoType} ")
    public List<Video> getByType(String videoType);
    @Select("select * from video where videoAuthor= #{videoAuthor} ")
    public List<Video> getByAuthor(String videoAuthor);
    @Select("select * from video where videoName= #{videoName} ")
    public List<Video> getByName(String videoName);
    @Select("select * from video where videoName like CONCAT('%',#{0},'%') ")
    public List<Video> search(String videoName);
    @Select("select * from video order by videoHits desc  limit 0,10")
    public  List<Video> top();
}
