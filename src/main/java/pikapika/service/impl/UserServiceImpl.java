package pikapika.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pikapika.mapper.UserMapper;
import pikapika.pojo.User;
import pikapika.service.UserService;

import java.util.List;

@Service("UserService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

	@Override
	public List<User> findAll() {
		return userMapper.findAll();
	}

	@Override
	public int save(User user) {
		return userMapper.save(user);
	}

	@Override
	public void delete(String userName) {
		userMapper.delete(userName);
	}

	@Override
	public User get(String userName) {
		return userMapper.get(userName);
	}

	@Override
	public int update(User user) {
		return userMapper.update(user);
	}

	@Override
	public int updateTX(User user) {
		return userMapper.updateTX(user);
	}

	@Override
	public List<User> search(String userName) {
		return userMapper.search(userName);
	}

}
