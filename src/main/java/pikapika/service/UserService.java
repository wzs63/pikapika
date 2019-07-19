package pikapika.service;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pikapika.pojo.User;

import java.util.List;

public interface UserService {
	List<User> findAll();
	int save(User user);
	void delete(String userName);
	User get(String userName);
	int update(User user);
	int updateTX(User user);
	List<User> search(String userName);

}
