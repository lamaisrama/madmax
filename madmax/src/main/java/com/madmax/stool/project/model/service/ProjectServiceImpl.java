package com.madmax.stool.project.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.common.MyException;
import com.madmax.stool.project.model.dao.ProjectDao;
import com.madmax.stool.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private Logger logger;
	@Autowired
	private ProjectDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int insertProject(Project p) throws MyException {
		// TODO Auto-generated method stub
		logger.debug("프로젝트 생성전no:"+p.getProjectNo());
		int result=dao.insertProject(session, p);
		if(result==0) {
			throw new MyException("프로젝트 삽입에러");
		}
		logger.debug("프로젝트 생성후no:"+p.getProjectNo());
		
		p.setProjectNo(p.getProjectNo());
		result=dao.insertProjectMember(session,p);
		
		if(result==0){
			throw new MyException("프로젝트멤버 삽입에러");
		}
		
		return result;
	}


	@Override
	public List<Project> selectProjectList(String id,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectProjectList(session,id,cPage,numPerpage);
	}


	@Override
	public List<String> selectProjectMembers(int pNo) {
		// TODO Auto-generated method stub
		List<String> names= dao.selectProjectMembers(session,pNo);
		/*
		 * //2개의 list가져온단말이지 String pmNames="";
		 * 
		 * pmNames=String.join(",",names);
		 * 
		 * //가져온 리스트를 logger.debug("합친 이름:"+pmNames);
		 */
			
		return names;
		}


	@Override
	public int selectProjectCount(String id) {
		// TODO Auto-generated method stub
		return dao.selectProjectCount(session,id);
	}


	@Override
	public List<Project> selectComProjectList(String id, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectComProjectList(session,id,cPage,numPerpage);
	}


	@Override
	public int selectComProjectCount(String id) {
		// TODO Auto-generated method stub
		return dao.selectComProjectCount(session,id);
	}
		
		
	

}
