package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import com.madmax.stool.project.model.vo.AllAttachment;
import com.madmax.stool.project.model.vo.ProjectMember;

public interface SelectedProjectSelectService {

	List<Map<String, Object>> selectProjectBoard(int pjNo);
	List<Map<String, Object>> selectWritingList(int pjNo);
	List<Map<String, Object>> selectTaskList(int pjNo);
	List<Map<String, Object>> selectScheduleList(int pjNo);
	Map<String, Object> selectPinPostCount();
	List<Map<String, Object>> selectHashTag();
	List<Map<String, Object>> selectNotification();
	List<Map<String, Object>> selectTaskManager();
//	List<Map<String, Object>> selectProjectMember();
	List<Map<String, Object>> selectWritingAttachment();
	List<Map<String, Object>> selectTaskAttachment();
	List<Map<String, Object>> selectWritingComment();
	List<Map<String, Object>> selectTaskComment();
	List<Map<String, Object>> selectScheduleComment();
//	Map<String, Object> selectProjectMemberNo();
	//List<Map<String, Object>> selectAllFileList(int pjNo);
	List<AllAttachment> selectAllProjectFiles(int pjNo);
	List<Map<String, Object>> selectUser();
	Map<String, Object> selectProjectTB(int pjNo);
	int selectFavorit(Map<String, Object> pjInfo);
	List<ProjectMember> selectProjectMemberList(int pjNo);
	List<Map<String, Object>> selectBookmarkList(Map<String, Object> pjInfo);



}
