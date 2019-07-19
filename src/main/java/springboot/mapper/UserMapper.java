package springboot.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import springboot.pojo.User;
import springboot.pojo.Video;

/**
 * 
 * @author WZS63
 *
 */

@Mapper
public interface UserMapper {
		@Select(" select * from user ")
	    List<User> findAll();
	     
		@Insert(" insert into user (userName, userPassWord, userEmail) values (#{userName}, #{userPassWord}, #{userEmail})")
	   	public int save(User user); 
	     
	    @Delete(" delete from user where userName= #{userName} ")
	    public void delete(String userName);
	         
	    @Select("select * from user where userName= #{userName} ")
	    public User get(String userName);
	       
	    @Update("update user set userPassWord=#{userPassWord} where userName=#{userName} ")
	    public int update(User user); 
	    
	    @Update("update user set userImg=#{userImg} where userName=#{userName} ")
	    public int updateTX(User user);

		@Select("select * from user where userName like CONCAT('%',#{0},'%')  ")
		public List<User> search(String userName);
}
