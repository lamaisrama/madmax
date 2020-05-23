package com.madmax.stool.project.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.SelectedProjectUpdateDao;


@Service
public class SelectedProjectUpdateServiceImpl implements SelectedProjectUpdateService {

	@Autowired
	private SelectedProjectUpdateDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int deleteFavorite(Map<String, Object> pjInfo) {
		return dao.deleteFavorite(session, pjInfo);
	}

	@Override
	public int insertFavorite(Map<String, Object> pjInfo) {
		return dao.insertFavorite(session, pjInfo);
	}

	@Override
	public int updateProjectColor(Map<String, Object> pjInfo) {
		return dao.updateProjectColor(session, pjInfo);
	}

}
