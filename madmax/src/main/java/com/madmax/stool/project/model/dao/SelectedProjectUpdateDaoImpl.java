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

	@Override
	public int deleteProjectMember(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.delete("SelectedProjectUpdate.deleteProjectMember", pjInfo);
	}

	@Override
	public int updateProjectManager(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.update("SelectedProjectUpdate.updateProjectManager", pjInfo);
	}

	@Override
	public int updateSelectedProject(SqlSessionTemplate session, Map<String, Object> upMap) {
		return session.update("SelectedProjectUpdate.updateSelectedProject", upMap);
	}

	@Override
	public int insertBookmark(SqlSessionTemplate session, Map<String, Object> bInfo) {
		return session.insert("SelectedProjectUpdate.insertBookmark", bInfo);
	}

	@Override
	public int deleteBookmark(SqlSessionTemplate session, Map<String, Object> bInfo) {
		return session.delete("SelectedProjectUpdate.deleteBookmark", bInfo);
	}

	@Override
	public int updatePinPost(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.update("SelectedProjectUpdate.updatePinPost", pjInfo);
	}

}
