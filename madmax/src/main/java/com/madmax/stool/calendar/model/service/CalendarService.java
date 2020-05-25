package com.madmax.stool.calendar.model.service;

import java.util.List;

import com.madmax.stool.calendar.controller.CalendarController;

public interface CalendarService {

	List<CalendarController> selectSchedule(String id);

}
