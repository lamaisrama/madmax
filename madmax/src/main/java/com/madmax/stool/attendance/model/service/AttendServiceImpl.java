package com.madmax.stool.attendance.model.service;

import java.sql.Date;
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
	public int insertEmpManage(int no) {
		// TODO Auto-generated method stub
		return dao.insertEmpManage(session,no);
	}

	//출근시간 가져오기
	@Override
	public Worktime selectCometime(Worktime w) {
		// TODO Auto-generated method stub
		return dao.selectCometime(session,w);
	}



	// 퇴근시간 가져오기
	@Override
	public Worktime selectGotime(Worktime w) {
		// TODO Auto-generated method stub
		return dao.selectGotime(session,w);
	}

	@Override
	public Worktime selectWorktime(Worktime w) {
		return dao.selectWorktime(session, w);
	}

	@Override
	public int insertLate(int no) {
		// TODO Auto-generated method stub
		return dao.insertLate(session,no);
	}

	@Override
	public int insertAbsence(int no) {
		// TODO Auto-generated method stub
		return dao.insertAbsence(session,no);
	}

	@Override
	public int updateRequestState(Attendance a) {
		// TODO Auto-generated method stub
		return dao.updateRequestState(session, a);
	}

	

}
