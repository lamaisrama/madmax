package com.madmax.stool.attendance.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.attendance.model.vo.Attendance;

public interface AttendDao {
	
	int insertRequest(SqlSessionTemplate session,Attendance a);

}
