package pikapika.service;

import java.util.List;

import pikapika.pojo.Focus;

public interface FocusService {
	 int save(Focus focus); 
	 
	 void delete(String focusName, String focusedName, String type);
	 
	 List<String>  getfocus(String focusName);
	 
	 List<String>  getfans(String focusedName);
	 
	 //因为videoId为int
	 List<Integer>  getFocusVideo(String focusName);
}
