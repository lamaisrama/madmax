package com.madmax.stool.project.model.service;

import java.util.Map;

public interface SelectedProjectUpdateService {

	int deleteFavorite(Map<String, Object> pjInfo);

	int insertFavorite(Map<String, Object> pjInfo);

	int updateProjectColor(Map<String, Object> pjInfo);

}
