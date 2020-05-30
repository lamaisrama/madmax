package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertTask;
import com.madmax.stool.project.model.vo.InsertTaskManager;
import com.madmax.stool.project.model.vo.InsertWriting;

public interface SelectedProjectUpdateService {

	int deleteFavorite(Map<String, Object> pjInfo);

	int insertFavorite(Map<String, Object> pjInfo);

	int updateProjectColor(Map<String, Object> pjInfo);

	int deleteProjectMember(Map<String, Object> pjInfo);

	int updateProjectManager(Map<String, Object> pjInfo);

	int updateSelectedProject(Map<String, Object> upMap);

	int insertBookmark(Map<String, Object> bInfo);

	int deleteBookmark(Map<String, Object> bInfo);

	int updatePinPost(Map<String, Object> pjInfo);

	int insertComment(Map<String, Object> cMap);

	int updateComment(Map<String, Object> cMap);

	int deleteComment(Map<String, Object> cMap);

	int updateProjectBoardStatus(Map<String, Object> pbMap);

	List<Attachment> selectOrifiles(Map<String, Object> pInfo);

	int updateWriting(InsertWriting writing, InsertProjectBoard pb, List<InsertNotification> deleteNotList,
			List<InsertNotification> newNotList, List<InsertHashTag> deleteTagList, List<InsertHashTag> newTagList,
			List<Attachment> oriFiles, List<Attachment> newFiles, Map<String, Object> pInfo);

	int updateTask(InsertTask task, InsertProjectBoard pb, List<InsertNotification> deleteNotList,
			List<InsertNotification> newNotList, List<InsertHashTag> deleteTagList, List<InsertHashTag> newTagList,
			List<Attachment> oriFiles, List<Attachment> newFiles, Map<String, Object> pInfo,
			List<InsertTaskManager> deleteTMList, List<InsertTaskManager> newTMList);

}
