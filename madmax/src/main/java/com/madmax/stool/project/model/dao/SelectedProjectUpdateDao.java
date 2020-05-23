package com.madmax.stool.project.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface SelectedProjectUpdateDao {

	int deleteFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int insertFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo);

	int updateProjectColor(SqlSessionTemplate session, Map<String, Object> pjInfo);

}
