package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SelectedProjectSelectDaoImpl implements SelectedProjectSelectDao {

	@Override
	public List<Map<String, Object>> selectProjectBoard(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectProjectBoard",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectWritingList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectWritingList",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectTaskList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskList",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectScheduleList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectScheduleList",pjNo);
	}

	@Override
	public Map<String, Object> selectPinPostCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("selectedProjectSelect.selectPinPostCount");
	}

	@Override
	public List<Map<String, Object>> selectHashTag(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectHashTag");
	}

	@Override
	public List<Map<String, Object>> selectNotification(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectNotification");
	}

	@Override
	public List<Map<String, Object>> selectTaskManager(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskManager");
	}

	@Override
	public List<Map<String, Object>> selectProjectMember(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectProjectMember");
	}

	@Override
	public List<Map<String, Object>> selectWritingAttachment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectWritingAttachment");
	}

	@Override
	public List<Map<String, Object>> selectTaskAttachment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskAttachment");
	}

	@Override
	public List<Map<String, Object>> selectWritingComment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectWritingComment");
	}

	@Override
	public List<Map<String, Object>> selectTaskComment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskComment");
	}

	@Override
	public List<Map<String, Object>> selectScheduleComment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectScheduleComment");
	}

	@Override
	public Map<String, Object> selectProjectMemberNo(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("selectedProjectSelect.selectProjectMemberNo");
	}

	@Override
	public List<Map<String, Object>> selectAllFileList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectAllFileList");
	}

	@Override
	public List<Map<String, Object>> selectUser(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectUser");
	}
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	

	
}
