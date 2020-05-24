package com.madmax.stool.project.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface SelectedProjectUpdateDao {

	int deleteFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int insertFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int updateProjectColor(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int deleteProjectMember(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int updateProjectManager(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int updateSelectedProject(SqlSessionTemplate session, Map<String, Object> upMap);

}
