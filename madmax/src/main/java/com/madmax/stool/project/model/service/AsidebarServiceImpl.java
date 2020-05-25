package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.AsidebarDao;


@Service
public class AsidebarServiceImpl implements AsidebarService {

	@Autowired
	private AsidebarDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Map<String, Object> selectProjectMemberNo(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectProjectMemberNo(session,pjNo);
	}

	@Override
	public List<Map<String, Object>> selectProjectMemberList(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectProjectMemberList(session,pjNo);
	}

	@Override
	public List<Map<String, Object>> selectStoolUser(int pjNo) {
		// TODO Auto-generated method stub
		return dao.selectStoolUser(session,pjNo);
	}
	
	
	
	



	
	
}
