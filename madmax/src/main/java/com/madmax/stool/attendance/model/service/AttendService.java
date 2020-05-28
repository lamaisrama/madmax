package com.madmax.stool.attendance.model.service;

import java.util.List;

import com.madmax.stool.attendance.model.vo.AttdSearch;
import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.Worktime;

public interface AttendService {

	// 관리자 수정 요청
	int insertRequest(Attendance a);
	
	int insertState(Worktime w);
	
	int updateState(Worktime w);
	
	List<Worktime> selectWorktimeList(String userId,int cPage, int numPerPage);
	
	int insertEmpManage(int no);
	
	// 출근시간 가져오기
	Worktime selectCometime(Worktime w);
	
	// 퇴근시간 가져오기
	Worktime selectGotime(Worktime w);

	Worktime selectWorktime(Worktime w);
	
	int insertLate(int no);
	
	int insertAbsence(int no);
	
	int updateRequestState(Attendance a);
	
	int insertNoCometime(Worktime w);
	
	List<Worktime> selectSearchAttd(AttdSearch search);
	
	int selectAttdList(String userId);
	
}
