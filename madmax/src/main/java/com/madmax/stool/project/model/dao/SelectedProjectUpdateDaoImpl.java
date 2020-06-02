package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertSchedule;
import com.madmax.stool.project.model.vo.InsertTask;
import com.madmax.stool.project.model.vo.InsertTaskManager;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectFile;

@Repository
public class SelectedProjectUpdateDaoImpl implements SelectedProjectUpdateDao {

	@Override
	public int deleteFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.delete("SelectedProjectUpdate.deleteFavorite", pjInfo);
	}

	@Override
	public int insertFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.insert("SelectedProjectUpdate.insertFavorite", pjInfo);
	}

	@Override
	public int updateProjectColor(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.update("SelectedProjectUpdate.updateProjectColor", pjInfo);
	}

	@Override
	public int deleteProjectMember(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.delete("SelectedProjectUpdate.deleteProjectMember", pjInfo);
	}

	@Override
	public int updateProjectManager(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.update("SelectedProjectUpdate.updateProjectManager", pjInfo);
	}

	@Override
	public int updateSelectedProject(SqlSessionTemplate session, Map<String, Object> upMap) {
		return session.update("SelectedProjectUpdate.updateSelectedProject", upMap);
	}

	@Override
	public int insertBookmark(SqlSessionTemplate session, Map<String, Object> bInfo) {
		return session.insert("SelectedProjectUpdate.insertBookmark", bInfo);
	}

	@Override
	public int deleteBookmark(SqlSessionTemplate session, Map<String, Object> bInfo) {
		return session.delete("SelectedProjectUpdate.deleteBookmark", bInfo);
	}

	@Override
	public int updatePinPost(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.update("SelectedProjectUpdate.updatePinPost", pjInfo);
	}

	@Override
	public int insertComment(SqlSessionTemplate session, Map<String, Object> cMap) {
		return session.insert("SelectedProjectUpdate.insertComment", cMap);
	}

	@Override
	public int insertCommentNotification(SqlSessionTemplate session, Map<String, Object> cMap) {
		return session.insert("SelectedProjectUpdate.insertCommentNotification", cMap);
	}

	@Override
	public int updateComment(SqlSessionTemplate session, Map<String, Object> cMap) {
		String type = (String) cMap.get("postType");
		int result = 0;
		
		if(type.equals("W")) result = session.update("SelectedProjectUpdate.updateComment-W", cMap);
		if(type.equals("T")) result = session.update("SelectedProjectUpdate.updateComment-T", cMap);
		if(type.equals("S")) result = session.update("SelectedProjectUpdate.updateComment-S", cMap);
		
		return result;
	}

	@Override
	public int deleteComment(SqlSessionTemplate session, Map<String, Object> cMap) {
		String type = (String) cMap.get("type");
		int result = 0;
		
		if(type.equals("W")) result = session.update("SelectedProjectUpdate.deleteComment-W", cMap);
		if(type.equals("T")) result = session.update("SelectedProjectUpdate.deleteComment-T", cMap);
		if(type.equals("S")) result = session.update("SelectedProjectUpdate.deleteComment-S", cMap);
		
		return result;
	}

	@Override
	public int updateProjectBoardStatus(SqlSessionTemplate session, Map<String, Object> pbMap) {
		return session.update("SelectedProjectUpdate.updateProjectBoardStatus", pbMap);
	}

	@Override
	public List<Attachment> selectOrifiles(SqlSessionTemplate session, Map<String, Object> pInfo) {
		return session.selectList("SelectedProjectUpdate.selectOrifiles", pInfo);
	}

	@Override
	public int updateWriting(SqlSessionTemplate session, InsertWriting writing) {
		return session.update("SelectedProjectUpdate.updateWriting", writing);
	}

	@Override
	public int deleteHashTag(SqlSessionTemplate session, InsertHashTag t) {
		return session.delete("SelectedProjectUpdate.deleteHashTag", t);
	}

	@Override
	public int insertHashTag(SqlSessionTemplate session, InsertHashTag t) {
		return session.insert("SelectedProjectInsert.insertHashTagTB", t);
	}

	@Override
	public int deleteNotificationTB(SqlSessionTemplate session, InsertNotification n) {
		return session.delete("SelectedProjectUpdate.deleteNotificationTB", n);
	}

	@Override
	public int insertNotificationTB(SqlSessionTemplate session, InsertNotification n) {
		return session.insert("SelectedProjectInsert.InsertNotificationTB", n);
	}

	@Override
	public int insertWritingAttachmentTB(SqlSessionTemplate session, Attachment a) {
		return session.insert("SelectedProjectInsert.insertWritingAttachmentTB", a);
	}

	@Override
	public int deleteWritingAttachmentTB(SqlSessionTemplate session, Attachment a) {
		return session.delete("SelectedProjectUpdate.deleteWritingAttachmentTB", a);
	}

	@Override
	public int deleteProjectFile(SqlSessionTemplate session, Map<String, Object> pjFileMap) {
		return session.delete("SelectedProjectUpdate.deleteProjectFile", pjFileMap);
	}

	@Override
	public int insertProjectFileTB(SqlSessionTemplate session, ProjectFile pf) {
		return session.insert("SelectedProjectInsert.insertProjectFileTB", pf);
	}

	@Override
	public int updateTask(SqlSessionTemplate session, InsertTask task) {
		return session.update("SelectedProjectUpdate.updateTask",task);
	}

	@Override
	public int deleteTaskManager(SqlSessionTemplate session, InsertTaskManager tm) {
		return session.delete("SelectedProjectUpdate.deleteTaskManager", tm);
	}

	@Override
	public int insertTaskManager(SqlSessionTemplate session, InsertTaskManager tm) {
		return session.insert("SelectedProjectInsert.insertTaskManagerTB", tm);
	}

	@Override
	public int insertTaskAttachmentTB(SqlSessionTemplate session, Attachment a) {
		return session.insert("SelectedProjectInsert.insertTaskAttachmentTB", a);
	}

	@Override
	public int deleteTaskAttachmentTB(SqlSessionTemplate session, Attachment a) {
		return session.delete("SelectedProjectUpdate.deleteTaskAttachmentTB", a);
	}

	@Override
	public int updateSchedule(SqlSessionTemplate session, InsertSchedule schedule) {
		return session.update("SelectedProjectUpdate.updateSchedule", schedule);
	}

	@Override
	public int updateTaskProgressState(SqlSessionTemplate session, Map<String, Object> tMap) {
		return session.update("SelectedProjectUpdate.updateTaskProgressState", tMap);
	}

	@Override
	public int insertTaskCommentProgressState(SqlSessionTemplate session, Map<String, Object> tMap) {
		return session.insert("SelectedProjectUpdate.insertTaskCommentProgressState", tMap);
	}

	@Override
	public int insertCommentNotificationProgressState(SqlSessionTemplate session, Map<String, Object> tMap) {
		return session.insert("SelectedProjectUpdate.insertCommentNotificationProgressState", tMap);
	}




}
