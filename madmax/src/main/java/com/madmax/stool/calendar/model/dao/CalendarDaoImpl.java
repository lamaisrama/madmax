package com.madmax.stool.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.madmax.stool.calendar.model.vo.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public List<Calendar> selectSchedule(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("calendar.selectSchedule",id);
	}

	@Override
	public List<Calendar> selectProjectSchedule(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("calendar.selectProjectSchedule",map);
	}

	@Override
	public String selectProjectTitle(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectOne("calendar.selectProjectTitle",pjNo);
	}

}
