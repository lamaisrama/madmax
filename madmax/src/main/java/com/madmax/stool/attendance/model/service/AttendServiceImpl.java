package com.madmax.stool.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.attendance.model.dao.AttendDao;
import com.madmax.stool.attendance.model.vo.Attendance;

@Service
public class AttendServiceImpl implements AttendService {
	
	@Autowired
	private AttendDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertRequest(Attendance a) {
		// TODO Auto-generated method stub
		return dao.insertRequest(session,a);
	}
	
	

}
