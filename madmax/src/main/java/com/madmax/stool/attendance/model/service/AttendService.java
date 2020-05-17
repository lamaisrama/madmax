package com.madmax.stool.attendance.model.service;

import java.util.List;

import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.WorkTime2;
import com.madmax.stool.attendance.model.vo.Worktime;

public interface AttendService {

	int insertRequest(Attendance a);
	
	int insertState(Worktime w);
	
	int updateState(Worktime w);
	
	List<Worktime> selectWorktimeList(String userId);
	
	int insertEmpManage();
	
	Worktime selectCometime();
}
