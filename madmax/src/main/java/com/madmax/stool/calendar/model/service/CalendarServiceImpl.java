package com.madmax.stool.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.calendar.model.dao.CalendarDao;
import com.madmax.stool.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Calendar> selectSchedule(String id) {
		// TODO Auto-generated method stub
		return dao.selectSchedule(session,id);
	}

	@Override
	public List<Calendar> selectProjectSchedule(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.selectProjectSchedule(session,map);
	}

	@Override
	public String selectProjectTitle(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectProjectTitle(session,pjNo);
	}
	
	
	
	
	
}
