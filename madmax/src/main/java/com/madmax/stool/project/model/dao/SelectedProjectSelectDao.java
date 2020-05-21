package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface SelectedProjectSelectDao {

	List<Map<String, Object>> selectProjectBoard(SqlSessionTemplate session, int pjNo);
	List<Map<String, Object>> selectWritingList(SqlSessionTemplate session, int pjNo);
	List<Map<String, Object>> selectTaskList(SqlSessionTemplate session, int pjNo);
	List<Map<String, Object>> selectScheduleList(SqlSessionTemplate session, int pjNo);
	Map<String, Object> selectProjectTB(SqlSessionTemplate session, int pjNo);
	int selectFavorit(SqlSessionTemplate session, Map<String,Object> pjInfo);

	

}
