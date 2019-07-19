package pikapika.service;

import java.util.List;

import pikapika.pojo.Comment;

public interface CommentService {  
	int save(Comment comment);
     
    void delete(String commentId);
         
    List<Comment> get(int commentVideo);
}
