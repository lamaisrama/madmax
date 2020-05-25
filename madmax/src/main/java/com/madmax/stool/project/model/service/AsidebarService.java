package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

public interface AsidebarService {

	Map<String, Object> selectProjectMemberNo(int pjNo);

	List<Map<String, Object>> selectProjectMemberList(int pjNo);

	List<Map<String, Object>> selectStoolUser(int pjNo);



}
