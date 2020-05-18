package com.madmax.stool.project.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Project;

public interface ProjectDao {

	int insertProject(SqlSessionTemplate session, Project p);

	int insertProjectMember(SqlSessionTemplate session, Project p);

}
