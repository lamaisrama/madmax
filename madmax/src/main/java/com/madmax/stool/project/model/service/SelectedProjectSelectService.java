package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

public interface SelectedProjectSelectService {

	List<Map<String, Object>> selectProjectBoard(int pjNo);
	List<Map<String, Object>> selectWritingList(int pjNo);
	List<Map<String, Object>> selectTaskList(int pjNo);
	List<Map<String, Object>> selectScheduleList(int pjNo);



}
