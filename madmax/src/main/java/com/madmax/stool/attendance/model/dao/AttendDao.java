package com.madmax.stool.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.attendance.model.vo.AttdSearch;
import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.Worktime;

public interface AttendDao {
	
	
	// 관리자 수정요청
	int insertRequest(SqlSessionTemplate session,Attendance a);

	int insertState(SqlSessionTemplate session,Worktime w); 
	
	int updateState(SqlSessionTemplate session,Worktime w);
	
	List<Worktime> selectWorktimeList(SqlSessionTemplate session,String userId,int cPage, int numPerPage);
	
	// 출근시간 가져오기
	Worktime selectCometime(SqlSessionTemplate session,Worktime w);
	
	Worktime selectGotime(SqlSessionTemplate session,Worktime w);

	Worktime selectWorktime(SqlSessionTemplate session, Worktime w);
	
	int insertEmpManage(SqlSessionTemplate session,int no);
	
	int insertLate(SqlSessionTemplate session,int no);
	
	int insertAbsence(SqlSessionTemplate session,int no);
	
	int updateRequestState(SqlSessionTemplate session,Attendance a);

	int insertNoCometime(SqlSessionTemplate session,Worktime w);
	
	List<Worktime> selectSearchAttd(SqlSessionTemplate session,AttdSearch search);
	
	int selectAttdList(SqlSessionTemplate session,String userId);
}
