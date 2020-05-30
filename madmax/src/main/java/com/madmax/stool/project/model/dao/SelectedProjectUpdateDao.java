package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectFile;

public interface SelectedProjectUpdateDao {

	int deleteFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int insertFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int updateProjectColor(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int deleteProjectMember(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int updateProjectManager(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int updateSelectedProject(SqlSessionTemplate session, Map<String, Object> upMap);

	int insertBookmark(SqlSessionTemplate session, Map<String, Object> bInfo);

	int deleteBookmark(SqlSessionTemplate session, Map<String, Object> bInfo);

	int updatePinPost(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int insertComment(SqlSessionTemplate session, Map<String, Object> cMap);

	int insertCommentNotification(SqlSessionTemplate session, Map<String, Object> cMap);

	int updateComment(SqlSessionTemplate session, Map<String, Object> cMap);

	int deleteComment(SqlSessionTemplate session, Map<String, Object> cMap);

	int updateProjectBoardStatus(SqlSessionTemplate session, Map<String, Object> pbMap);

	List<Attachment> selectOrifiles(SqlSessionTemplate session, Map<String, Object> pInfo);

	int updateWriting(SqlSessionTemplate session, InsertWriting writing);

	int deleteHashTag(SqlSessionTemplate session, InsertHashTag t);

	int insertHashTag(SqlSessionTemplate session, InsertHashTag t);

	int deleteNotificationTB(SqlSessionTemplate session, InsertNotification n);

	int insertNotificationTB(SqlSessionTemplate session, InsertNotification n);

	int insertWritingAttachmentTB(SqlSessionTemplate session, Attachment a);

	int deleteWritingAttachmentTB(SqlSessionTemplate session, Attachment a);

	int deleteProjectFile(SqlSessionTemplate session, Map<String, Object> pjFileMap);

	int insertProjectFileTB(SqlSessionTemplate session, ProjectFile pj);


}
