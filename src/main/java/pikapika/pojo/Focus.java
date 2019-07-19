package pikapika.pojo;
/**
 * 
 * @author wzs63
 *
	CREATE TABLE `focus` ( #关注
	  `focusId` int(11) primary key AUTO_INCREMENT , #私信id
	  `focusName` varchar(255) DEFAULT NULL, #关注者
	  `focusedName` varchar(255) DEFAULT NULL, #被关注者
	  `focusDate` date DEFAULT NULL #关注时间
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
import java.util.Date;
public class Focus {
	private int focusId;
	private String focusName;
	private String focusedName;
	private Date focusDate;
	private String type;
	
	
	public Focus(){
		
	}
	
	public Focus(String focusName, String focusedName, Date focusDate, String type) {
		super();
		this.focusName = focusName;
		this.focusedName = focusedName;
		this.focusDate = focusDate;
		this.type = type;
	}

	public int getFocusId() {
		return focusId;
	}
	public void setFocusId(int focusId) {
		this.focusId = focusId;
	}
	public String getFocusName() {
		return focusName;
	}
	public void setFocusName(String focusName) {
		this.focusName = focusName;
	}
	public String getFocusedName() {
		return focusedName;
	}
	public void setFocusedName(String focusedName) {
		this.focusedName = focusedName;
	}
	public Date getFocusDate() {
		return focusDate;
	}
	public void setFocusDate(Date focusDate) {
		this.focusDate = focusDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}
