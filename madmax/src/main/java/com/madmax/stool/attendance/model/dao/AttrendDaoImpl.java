package com.madmax.stool.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.WorkTime2;
import com.madmax.stool.attendance.model.vo.Worktime;

@Repository
public class AttrendDaoImpl implements AttendDao {

	@Override
	public int insertRequest(SqlSessionTemplate session, Attendance a) {
		// TODO Auto-generated method stub
		return session.insert("attend.insertRequest",a);
	}

	@Override
	public int insertState(SqlSessionTemplate session, Worktime w) {
		// TODO Auto-generated method stub
		return session.insert("attend.insertState",w);
	}
	
	

	@Override
	public int updateState(SqlSessionTemplate session, Worktime w) {
		// TODO Auto-generated method stub
		return session.update("attend.updateState",w);
	}

	@Override
	public List<Worktime> selectWorktimeList(SqlSessionTemplate session, String userId) {
		return session.selectList("attend.selectWorktimeList", userId);
	}

	@Override
	public Worktime selectCometime(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("attend.selectCometime");
	}

	
}
