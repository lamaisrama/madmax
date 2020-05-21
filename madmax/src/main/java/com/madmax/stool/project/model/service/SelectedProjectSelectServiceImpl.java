package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.SelectedProjectSelectDao;
import com.madmax.stool.project.model.vo.ProjectMember;

@Service
public class SelectedProjectSelectServiceImpl implements SelectedProjectSelectService {
	
	@Autowired
	private SelectedProjectSelectDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Map<String, Object>> selectProjectBoard(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectProjectBoard(session, pjNo);
	}

	@Override
	public List<Map<String, Object>> selectWritingList(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectWritingList(session, pjNo);
	}

	@Override
	public List<Map<String, Object>> selectTaskList(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectTaskList(session, pjNo);
	}

	@Override
	public List<Map<String, Object>> selectScheduleList(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectScheduleList(session, pjNo);
	}

	@Override
	public Map<String, Object> selectProjectTB(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectProjectTB(session, pjNo);
	}

	@Override
	public int selectFavorit(Map<String,Object> pjInfo) {
		// TODO Auto-generated method stub
		return dao.selectFavorit(session, pjInfo);
	}

	public Map<String, Object> selectPinPostCount() {
		// TODO Auto-generated method stub
		return dao.selectPinPostCount(session);
	}

	@Override
	public List<Map<String, Object>> selectHashTag() {
		// TODO Auto-generated method stub
		return dao.selectHashTag(session);
	}

	@Override
	public List<Map<String, Object>> selectNotification() {
		// TODO Auto-generated method stub
		return dao.selectNotification(session);
	}

	@Override
	public List<Map<String, Object>> selectTaskManager() {
		// TODO Auto-generated method stub
		return dao.selectTaskManager(session);
	}

	@Override
	public List<Map<String, Object>> selectProjectMember() {
		// TODO Auto-generated method stub
		return dao.selectprojectMember(session);
	}

	@Override
	public List<Map<String, Object>> selectWritingAttachment() {
		// TODO Auto-generated method stub
		return dao.selectWritingAttachment(session);
	}

	@Override
	public List<Map<String, Object>> selectTaskAttachment() {
		// TODO Auto-generated method stub
		return dao.selectTaskAttachment(session);
	}

	@Override
	public List<Map<String, Object>> selectWritingComment() {
		// TODO Auto-generated method stub
		return dao.selectWritingComment(session);
	}

	@Override
	public List<Map<String, Object>> selectTaskComment() {
		// TODO Auto-generated method stub
		return dao.selectTaskComment(session);
	}

	@Override
	public List<Map<String, Object>> selectScheduleComment() {
		// TODO Auto-generated method stub
		return dao.selectScheduleComment(session);
	}

	@Override
	public List<ProjectMember> selectProjectMemberList(int pjNo) {
		return dao.selectProjectMemberList(session, pjNo);
	}
	
	
	
	

	
	
	
	
	
	
	
	

	
	
}
