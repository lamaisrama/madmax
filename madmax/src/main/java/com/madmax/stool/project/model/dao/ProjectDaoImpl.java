package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Project;

@Repository
public class ProjectDaoImpl implements ProjectDao {

	@Override
	public int insertProject(SqlSessionTemplate session, Project p) {
		// TODO Auto-generated method stub
		return session.insert("project.insertProject", p);
	}

	@Override
	public int insertProjectMember(SqlSessionTemplate session,Project p) {
		// TODO Auto-generated method stub
		return session.insert("project.insertProjectMember", p);
	}

	
	
	

}
