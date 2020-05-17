package com.madmax.stool.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.Worktime;

public interface AttendDao {
	
	int insertRequest(SqlSessionTemplate session,Attendance a);

	int insertState(SqlSessionTemplate session,Worktime w); 
	
	int updateState(SqlSessionTemplate session,Worktime w);
	
	List<Worktime> selectWorktimeList(SqlSessionTemplate session,String userId);
	
	Worktime selectCometime(SqlSessionTemplate session);
	
}
