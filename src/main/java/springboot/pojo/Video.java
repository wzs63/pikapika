package springboot.pojo;



import org.eclipse.jdt.internal.compiler.util.Sorting;

import java.util.Date;

/**
 * 
 * @author Wzs63
 *
 */
/**
 create table video #视频
( video_id int(11) primary key AUTO_INCREMENT, #用户号 主码
  video_name varchar(20),#视频名称
  video_author varchar(20),#视频作者名称
  video_img varchar(255),#视频图像
  video_hits int(11),#视频点击量
  video_data datetime, #视频时间
  videoType varchar(10)
  )DEFAULT CHARSET=utf8;    
 */
public class Video {
	
	int videoId;
	String videoName;
	String videoAuthor;
	String videoImg;
	int videoHits;
	Date videoDate;
	String videoType;
	String videoUrl;
	String videoIntro;
	int likeCount;



	public Video() {
	}
	
	public Video(String videoName, String videoAuthor, String videoImg, int videoHits, Date videoDate,
			String videoType, String videoUrl, String videoIntro) {
		super();
		this.videoName = videoName;
		this.videoAuthor = videoAuthor;
		this.videoImg = videoImg;
		this.videoHits = videoHits;
		this.videoDate = videoDate;
		this.videoType = videoType;
		this.videoUrl = videoUrl;
		this.videoIntro = videoIntro;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getVideoIntro() {
		return videoIntro;
	}

	public void setVideoIntro(String videoIntro) {
		this.videoIntro = videoIntro;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	
	public String getVideoType() {
		return videoType;
	}

	public void setVideoType(String videoType) {
		this.videoType = videoType;
	}
	
	public int getVideoId() {
		return videoId;
	}
	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public String getVideoAuthor() {
		return videoAuthor;
	}
	public void setVideoAuthor(String videoAuthor) {
		this.videoAuthor = videoAuthor;
	}
	public String getVideoImg() {
		return videoImg;
	}
	public void setVideoImg(String videoImg) {
		this.videoImg = videoImg;
	}
	public int getVideoHits() {
		return videoHits;
	}
	public void setVideoHits(int videoHits) {
		this.videoHits = videoHits;
	}
	public Date getVideoDate() {
		return videoDate;
	}
	public void setVideoDate(Date videoDate) {
		this.videoDate = videoDate;
	}

	
}
