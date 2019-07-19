package pikapika.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pikapika.mapper.CommentMapper;
import pikapika.pojo.Comment;
import pikapika.service.CommentService;

@Service("CommentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentMapper commentMapper;
	@Override
	public int save(Comment comment) {
		return commentMapper.save(comment);
	}

	@Override
	public void delete(String commentId) {
		commentMapper.delete(commentId);
	}

	@Override
	public List<Comment> get(int commentVideo) {
		return commentMapper.get(commentVideo);
	}

}
