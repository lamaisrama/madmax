package com.madmax.stool.attendance.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.attendance.model.dao.AttendDao;
import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.Worktime;

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

	@Override
	public int insertState(Worktime w) {
		// TODO Auto-generated method stub
		return dao.insertState(session, w);
	}
	
	

	@Override
	public int updateState(Worktime w) {
		// TODO Auto-generated method stub
		return dao.updateState(session,w);
	}

	@Override
	public List<Worktime> selectWorktimeList(String userId) {
		// TODO Auto-generated method stub
		return dao.selectWorktimeList(session, userId);
	}

	
	
	@Override
	public int insertEmpManage() {
		// TODO Auto-generated method stub
		//return dao.insertEmpManage(session);
		return 0;
	}
	
	

	//출근시간 가져오기
	@Override
	public Worktime selectCometime() {
		// TODO Auto-generated method stub
		return dao.selectCometime(session);
	}
	
	


}
