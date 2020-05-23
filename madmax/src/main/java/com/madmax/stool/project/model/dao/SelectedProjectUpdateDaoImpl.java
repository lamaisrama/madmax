package com.madmax.stool.project.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SelectedProjectUpdateDaoImpl implements SelectedProjectUpdateDao {

	@Override
	public int deleteFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.delete("SelectedProjectUpdate.deleteFavorite", pjInfo);
	}

	@Override
	public int insertFavorite(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.insert("SelectedProjectUpdate.insertFavorite", pjInfo);
	}

	@Override
	public int updateProjectColor(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.update("SelectedProjectUpdate.updateProjectColor", pjInfo);
	}

}
