package com.madmax.stool.calendar.model.service;

import java.util.List;

import com.madmax.stool.calendar.controller.CalendarController;
import com.madmax.stool.calendar.model.vo.Calendar;

public interface CalendarService {

	List<Calendar> selectSchedule(String id);

}
