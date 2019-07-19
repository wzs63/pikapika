package pikapika.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import pikapika.pojo.Focus;

@Mapper
public interface FocusMapper {
	 @Insert(" insert into focus (focusName, focusedName, focusDate, type) values (#{focusName}, #{focusedName}, #{focusDate}), #{type}")
	 public int save(Focus focus); 
	 
	 @Delete(" delete from focus where focusName= #{focusName} and  focusedName=#{focusedName} and type=#{type}")
	 public void delete(String focusName, String focusedName, String type);
	 
	 @Select("select focusedName from focus where focusName= #{focusName} and type='user'    order by focusDate desc")
	 public List<String>  getfocus(String focusName);
	 
	 @Select("select focusName from focus where focusedName= #{focusedName} and type='user'order by focusDate desc")
	 public List<String>  getfans(String focusedName);
	 
	 @Select("select focusedName from focus where focusName= #{focusName} and type='video'  order by focusDate desc")
	 public List<String>  getFocusVideo(String focusName);
	 
}
