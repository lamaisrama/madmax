package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.AsidebarDao;
import com.madmax.stool.project.model.vo.AllAttachment;


@Service
public class AsidebarServiceImpl implements AsidebarService {

	@Autowired
	private AsidebarDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int selectMemberCount(int pjNo) {
		return dao.selectMemberCount(session,pjNo);
	}

//	@Override
//	public List<AllAttachment> selectAllProjectFiles(int pjNo) {
//	
//		List<AllAttachment> allAttach=dao.selectAllAttach(pjNo);
//		
//		return allAttach;
//	}
	
	
	
	
	
	



	
	
}
