package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface SelectedProjectSelectDao {

	List<Map<String, Object>> selectProjectBoard(SqlSessionTemplate session, int pjNo);
	List<Map<String, Object>> selectWritingList(SqlSessionTemplate session, int pjNo);
	List<Map<String, Object>> selectTaskList(SqlSessionTemplate session, int pjNo);
	List<Map<String, Object>> selectScheduleList(SqlSessionTemplate session, int pjNo);
<<<<<<< HEAD
	Map<String, Object> selectProjectTB(SqlSessionTemplate session, int pjNo);
	int selectFavorit(SqlSessionTemplate session, Map<String,Object> pjInfo);
=======
	Map<String, Object> selectPinPostCount(SqlSessionTemplate session);
	List<Map<String, Object>> selectHashTag(SqlSessionTemplate session);
	List<Map<String, Object>> selectNotification(SqlSessionTemplate session);
	List<Map<String, Object>> selectTaskManager(SqlSessionTemplate session);
	List<Map<String, Object>> selectprojectMember(SqlSessionTemplate session);
	List<Map<String, Object>> selectWritingAttachment(SqlSessionTemplate session);
	List<Map<String, Object>> selectTaskAttachment(SqlSessionTemplate session);
	List<Map<String, Object>> selectWritingComment(SqlSessionTemplate session);
	List<Map<String, Object>> selectTaskComment(SqlSessionTemplate session);
	List<Map<String, Object>> selectScheduleComment(SqlSessionTemplate session);
	
>>>>>>> refs/heads/dev

	

}
