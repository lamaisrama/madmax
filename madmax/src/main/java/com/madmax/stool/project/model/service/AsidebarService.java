package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import com.madmax.stool.project.model.vo.AllAttachment;
import com.madmax.stool.project.model.vo.InsertProjectMember;

public interface AsidebarService {

	int selectMemberCount(int pjNo);
//	List<AllAttachment> selectAllProjectFiles(int pjNo);

	int insertProjectMember(Map<String, Object> map);


}
