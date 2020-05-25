package com.madmax.stool.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.calendar.controller.CalendarController;

public interface CalendarDao {

	List<CalendarController> selectSchedule(SqlSessionTemplate session, String id);

}
