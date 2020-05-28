package com.madmax.stool.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.calendar.controller.CalendarController;
import com.madmax.stool.calendar.model.vo.Calendar;

public interface CalendarDao {

	List<Calendar> selectSchedule(SqlSessionTemplate session, String id);

}
