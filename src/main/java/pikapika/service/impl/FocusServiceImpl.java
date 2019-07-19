package pikapika.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pikapika.mapper.FocusMapper;
import pikapika.pojo.Focus;
import pikapika.service.FocusService;

@Service("FocusService")
public class FocusServiceImpl implements FocusService {
	@Autowired
	FocusMapper focusMapper;
	
	@Override
	public int save(Focus focus) {
		return focusMapper.save(focus);
	}

	@Override
	public void delete(String focusName, String focusedName, String type) {
		focusMapper.delete(focusName, focusedName, type);
	}

	@Override
	public List<String> getfocus(String focusName) {
		return focusMapper.getfocus(focusName);
	}

	@Override
	public List<String> getfans(String focusedName) {
		return focusMapper.getfans(focusedName);
	}

	@Override
	public List<Integer> getFocusVideo(String focusName) {
		List<String> list = focusMapper.getFocusVideo(focusName);
		List<Integer> list2 = new ArrayList<>();
		for (String str : list) {
			list2.add(Integer.parseInt(str));
		}
		return list2;
	}

}
