package pikapika.pojo;

import java.util.Date;

/**
 * 
 * @author wzs63
 *
	CREATE TABLE `videoHits` ( #记录每一次点击
	  `videoHitsId` int(11) primary key AUTO_INCREMENT , 
	  `hitUserName` varchar(255) DEFAULT NULL,
	  `hitVideoId` int DEFAULT NULL,
	  `hitDate` date DEFAULT NULL 
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class VideoHits {
	private int videoHitsId;
	private String hitUserName;
	private int hitVideoId;
	private Date hitDate;
	public VideoHits(){
		
	}
	public VideoHits(String hitUserName, int hitVideoId, Date hitDate) {
		super();
		this.hitUserName = hitUserName;
		this.hitVideoId = hitVideoId;
		this.hitDate = hitDate;
	}
	public int getVideoHitsId() {
		return videoHitsId;
	}
	public void setVideoHitsId(int videoHitsId) {
		this.videoHitsId = videoHitsId;
	}
	public String getHitUserName() {
		return hitUserName;
	}
	public void setHitUserName(String hitUserName) {
		this.hitUserName = hitUserName;
	}
	public int getHitVideoId() {
		return hitVideoId;
	}
	public void setHitVideoId(int hitVideoId) {
		this.hitVideoId = hitVideoId;
	}
	public Date getHitDate() {
		return hitDate;
	}
	public void setHitDate(Date hitDate) {
		this.hitDate = hitDate;
	}
	
}
