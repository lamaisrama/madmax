package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Favorite;
import com.madmax.stool.project.model.vo.Project;

public interface ProjectDao {

	int insertProject(SqlSessionTemplate session, Project p);

	int insertProjectMember(SqlSessionTemplate session, Project p);

	List<Project> selectProjectList(SqlSessionTemplate session, String id, int cPage, int numPerpage);

	List<String> selectProjectMembers(SqlSessionTemplate session, int pNo);

	int selectProjectCount(SqlSessionTemplate session, String id);

	List<Project> selectComProjectList(SqlSessionTemplate session,  int cPage, int numPerpage);

	int selectComProjectCount(SqlSessionTemplate session);

	List<Favorite> selectFavorite(SqlSessionTemplate session, String id);

	int selectFavoriteCount(SqlSessionTemplate session, String id);
	
	
}
