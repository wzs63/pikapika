package pikapika.pojo;

/**
 * 
 * @author wzs63
 *
 */

import java.util.Date;

/**
 create table comment #视频评论
 ( 
  comment_id int(11) primary key AUTO_INCREMENT, #评论id 主码
  comment_video int(11) ,#评论所在视频
  comment_user varchar(30), #评论的用户
  comment_content varchar(233),#评论内容
  comment_like int(11),#点赞量
  comment_date date #评论时间
  )DEFAULT CHARSET=utf8;   
 */
public class Comment {
	//@Autowired 这里不管用 因为Comment没有注册
	//UserMapper userMapper;

	int commentId;
	int commentVideo;
	String commentUser;
	String commentContent;
	int commentLike;
	Date commentDate;
	String commentUserImg;
	
	public Comment() {
	}

	
	public Comment(int commentId, int commentVideo, String commentUser, String commentContent, int commentLike,
			Date commentDate, String commentUserImg) {
		super();
		this.commentId = commentId;
		this.commentVideo = commentVideo;
		this.commentUser = commentUser;
		this.commentContent = commentContent;
		this.commentLike = commentLike;
		this.commentDate = commentDate;
		this.commentUserImg = commentUserImg;
	}


	
	public String getCommentUserImg() {
		return commentUserImg;
	}


	public void setCommentUserImg(String commentUserImg) {
		this.commentUserImg = commentUserImg;
	}


	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getCommentVideo() {
		return commentVideo;
	}

	public void setCommentVideo(int commentVideo) {
		this.commentVideo = commentVideo;
	}

	public String getCommentUser() {
		return commentUser;
	}

	public void setCommentUser(String commentUser) {
		this.commentUser = commentUser;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getCommentLike() {
		return commentLike;
	}

	public void setCommentLike(int commentLike) {
		this.commentLike = commentLike;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
	
	
	}
