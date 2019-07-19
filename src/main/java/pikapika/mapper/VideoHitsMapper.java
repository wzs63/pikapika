package pikapika.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import pikapika.pojo.VideoHits;

@Mapper
public interface VideoHitsMapper {

	@Select(" select * from videohits ")
	List<VideoHits> findAll();

	@Insert(" insert into videohits (hitUserName, hitVideoId, hitDate) values (#{hitUserName}, #{hitVideoId}, #{hitDate})")
	public int save(VideoHits videoHits);
	
	
	@Select("select hitVideoId from videohits where hitUserName= #{hitUserName} order by hitDate ")
	public List<Integer> get(String hitUserName);

//
//	@Delete(" delete from user where userName= #{userName} ")
//	public void delete(String userName);

//	@Update("update user set userPassWord=#{userPassWord} where userName=#{userName} ")
//	public int update(User user);
//
//	@Update("update user set userImg=#{userImg} where userName=#{userName} ")
//	public int updateTX(User user);
//
//	@Select("select * from user where userName like CONCAT('%',#{0},'%')  ")
//	public List<User> search(String userName);

}
