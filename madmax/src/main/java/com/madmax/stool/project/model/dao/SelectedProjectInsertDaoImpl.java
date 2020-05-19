package com.madmax.stool.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectFile;
import com.madmax.stool.project.model.vo.ProjectMember;

@Repository
public class SelectedProjectInsertDaoImpl implements SelectedProjectInsertDao {

	@Override
	public List<ProjectMember> selectProjectMemberList(SqlSessionTemplate session, int pjNo) {
		return session.selectList("SelectedProject.selectProjectMemberList", pjNo);
	}

	@Override
	public int insertProjectBoardTB(SqlSessionTemplate session, InsertProjectBoard pb) {
		return session.insert("SelectedProjectInsert.insertProjectBoardTbWriting", pb);
	}

	@Override
	public int insertWritingTB(SqlSessionTemplate session, InsertWriting writing) {
		return session.insert("SelectedProjectInsert.insertWritingTB", writing);
	}

	@Override
	public int insertHashTagTB(SqlSessionTemplate session, InsertHashTag hashTag) {
		return session.insert("SelectedProjectInsert.insertHashTagTB", hashTag);		
	}

	@Override
	public int InsertNotificationTB(SqlSessionTemplate session, InsertNotification notification) {
		return session.insert("SelectedProjectInsert.InsertNotificationTB", notification);	
	}

	@Override
	public int insertWritingAttachmentTB(SqlSessionTemplate session, Attachment a) {
		return session.insert("SelectedProjectInsert.insertWritingAttachmentTB", a);	
	}

	//글&업무 공통 메소드
	@Override
	public int insertProjectFileTB(SqlSessionTemplate session, ProjectFile pf) {
		return session.insert("SelectedProjectInsert.insertProjectFileTB", pf);	
	}

}
