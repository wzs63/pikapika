package pikapika.pojo;
/**
 * @author wzs63 
 */
/**
  create table user #用户
( user_name varchar(20) primary key, #用户号 主码
  user_password  varchar(20) not null, #用户密码
  user_img varchar(255),#头像
  user_signature  varchar(255),#个性签名
  user_email varchar(255)
  )DEFAULT CHARSET=utf8;               
                    
 */
public class User {
	String userName;
	String userPassWord;
	String userImg;
	String userSignature;
	String userEmail;
	
	public User() {
	}
	
	public User(String userName, String userPassWord, String userImg, String userSignature, String userEmail) {
		super();
		this.userName = userName;
		this.userPassWord = userPassWord;
		this.userImg = userImg;
		this.userSignature = userSignature;
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassWord() {
		return userPassWord;
	}

	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserSignature() {
		return userSignature;
	}

	public void setUserSignature(String userSignature) {
		this.userSignature = userSignature;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	
	
}
