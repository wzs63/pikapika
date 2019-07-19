package springboot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import springboot.pojo.Comment;
import springboot.pojo.User;

/**
 * 
 * @author Wzs 5.30 15:31
 *
 */
@Mapper
public interface CommentMapper {
	@Select(" select * from comment ")
    List<Comment> findAll();
     
	@Insert(" insert into comment (commentVideo, commentUser, commentContent, commentUserImg) values (#{commentVideo}, #{commentUser}, #{commentContent}, #{commentUserImg})")
   	public int save(Comment comment); 
     
    @Delete(" delete from comment where commentId= #{commentId} ")
    public void delete(String commentId);
         
    @Select("select * from comment where commentVideo= #{commentVideo} ")
    public List<Comment> get(int commentVideo);
   
}