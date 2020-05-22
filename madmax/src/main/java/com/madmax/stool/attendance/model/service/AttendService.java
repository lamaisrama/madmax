package com.madmax.stool.attendance.model.service;

import java.sql.Date;
import java.util.List;

import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.Worktime;

public interface AttendService {

	// 관리자 수정 요청
	int insertRequest(Attendance a);
	
	int insertState(Worktime w);
	
	int updateState(Worktime w);
	
	List<Worktime> selectWorktimeList(String userId);
	
	int insertEmpManage(int no);
	
	// 출근시간 가져오기
	Worktime selectCometime(Worktime w);
	
	// 퇴근시간 가져오기
	Worktime selectGotime(Worktime w);

	Worktime selectWorktime(Worktime w);
	
	int insertLate(int no);
	
	int insertAbsence(int no);
	
	int updateRequestState(Attendance a);
	
}
