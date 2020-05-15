package com.madmax.stool.attendance.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.attendance.model.vo.Attendance;

@Repository
public class AttrendDaoImpl implements AttendDao {

	@Override
	public int insertRequest(SqlSessionTemplate session, Attendance a) {
		// TODO Auto-generated method stub
		return session.insert("attend.insertRequest",a);
	}

	
	
}
