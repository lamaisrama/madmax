package com.madmax.stool.project.model.service;

import java.util.Map;

public interface SelectedProjectUpdateService {

	int deleteFavorite(Map<String, Object> pjInfo);

	int insertFavorite(Map<String, Object> pjInfo);

	int updateProjectColor(Map<String, Object> pjInfo);

	int deleteProjectMember(Map<String, Object> pjInfo);

	int updateProjectManager(Map<String, Object> pjInfo);

	int updateSelectedProject(Map<String, Object> upMap);

	int insertBookmark(Map<String, Object> bInfo);

	int deleteBookmark(Map<String, Object> bInfo);

	int updatePinPost(Map<String, Object> pjInfo);

	int insertComment(Map<String, Object> cMap);

	int updateComment(Map<String, Object> cMap);

}
