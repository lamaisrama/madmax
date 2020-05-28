package com.madmax.stool.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.attendance.model.vo.AttdSearch;
import com.madmax.stool.attendance.model.vo.Attendance;
import com.madmax.stool.attendance.model.vo.Worktime;

@Repository
public class AttrendDaoImpl implements AttendDao {

	// 관리자 수정요청
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
	public Worktime selectCometime(SqlSessionTemplate session, Worktime w) {
		// TODO Auto-generated method stub
		return session.selectOne("attend.selectCometime",w);
	}

	@Override
	public Worktime selectGotime(SqlSessionTemplate session, Worktime w) {
		// TODO Auto-generated method stub
		return session.selectOne("attend.selectGotime",w);
	}

	@Override
	public Worktime selectWorktime(SqlSessionTemplate session, Worktime w) {
		return session.selectOne("attend.selectWorktime", w);
		
	}

	@Override
	public int insertEmpManage(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.insert("attend.insertEmpManage",no);
	}

	@Override
	public int insertLate(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.insert("attend.insertLate",no);
	}

	@Override
	public int insertAbsence(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.insert("attend.insertAbsence",no);
	}

	@Override
	public int updateRequestState(SqlSessionTemplate session, Attendance a) {
		// TODO Auto-generated method stub
		return session.update("attend.updateRequestState", a);
	}

	@Override
	public int insertNoCometime(SqlSessionTemplate session, Worktime w) {
		// TODO Auto-generated method stub
		return session.insert("attend.insertNoCometime",w);
	}

	@Override
	public List<Worktime> selectSearchAttd(SqlSessionTemplate session, AttdSearch search) {
		// TODO Auto-generated method stub
		return session.selectList("attend.selectSearchAttd");
	}
	
	

}
