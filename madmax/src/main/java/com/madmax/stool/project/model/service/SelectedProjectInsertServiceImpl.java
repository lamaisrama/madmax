package com.madmax.stool.project.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.SelectedProjectInsertDao;
import com.madmax.stool.project.model.vo.ProjectMember;

@Service
public class SelectedProjectInsertServiceImpl implements SelectedProjectInsertService {

	@Autowired
	private SelectedProjectInsertDao dao;

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<ProjectMember> selectProjectMemberList(int pjNo) {
		return dao.selectProjectMemberList(session, pjNo);
	}

}
