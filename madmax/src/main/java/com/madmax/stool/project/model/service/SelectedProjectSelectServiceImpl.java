package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.SelectedProjectSelectDao;

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
	
	
}
