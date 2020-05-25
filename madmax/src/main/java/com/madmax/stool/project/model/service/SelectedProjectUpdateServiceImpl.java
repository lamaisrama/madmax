package com.madmax.stool.project.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madmax.stool.common.MyException;
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

	@Override
	public int deleteProjectMember(Map<String, Object> pjInfo) {
		return dao.deleteProjectMember(session, pjInfo);
	}

	@Override
	@Transactional
	public int updateProjectManager(Map<String, Object> pjInfo) {
		int result = dao.updateProjectManager(session, pjInfo);
		if(result == 0) {
			throw new MyException("PROJECTTABLE UPDATE에러!");
		}
		
		if(result != 0){
			result = dao.deleteProjectMember(session, pjInfo);	
			if(result==0) {
				throw new MyException("PROJECTMEMBER DELETE에러!");
			}
		}
		return result;
	}

	@Override
	public int updateSelectedProject(Map<String, Object> upMap) {
		return dao.updateSelectedProject(session, upMap);
	}

	@Override
	public int insertBookmark(Map<String, Object> bInfo) {
		return dao.insertBookmark(session, bInfo);
	}

	@Override
	public int deleteBookmark(Map<String, Object> bInfo) {
		return dao.deleteBookmark(session, bInfo);
	}

	@Override
	public int updatePinPost(Map<String, Object> pjInfo) {
		return dao.updatePinPost(session, pjInfo);
	}

	@Override
	@Transactional
	public int insertComment(Map<String, Object> cMap) {
		int result =  dao.insertComment(session, cMap);
		if(result == 0) {
			throw new MyException("COMMENT INSERT에러!");
		}
		
		String receiveId = (String) cMap.get("receiveId");
		String senderId = (String) cMap.get("senderId");
		
		
		if(result != 0 && !(receiveId.equals(senderId)) ){
			result = dao.insertCommentNotification(session, cMap);	
			if(result==0) {
				throw new MyException("NOTIFICATION INSERT에러!");
			}
		}
		return result;
	}
	

}
