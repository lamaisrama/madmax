package com.madmax.stool.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.calendar.controller.CalendarController;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public List<CalendarController> selectSchedule(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("calendar.selectSchedule",id);
	}

}
