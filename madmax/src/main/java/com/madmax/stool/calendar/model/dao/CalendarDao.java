package com.madmax.stool.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.calendar.controller.CalendarController;
import com.madmax.stool.calendar.model.vo.Calendar;

public interface CalendarDao {

	List<Calendar> selectSchedule(SqlSessionTemplate session, String id);

	List<Calendar> selectProjectSchedule(SqlSessionTemplate session, Map<String, Object> map);

	String selectProjectTitle(SqlSessionTemplate session, int pjNo);

}
