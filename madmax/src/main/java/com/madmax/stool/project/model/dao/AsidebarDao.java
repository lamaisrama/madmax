package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.AllAttachment;
import com.madmax.stool.project.model.vo.InsertProjectMember;

public interface AsidebarDao {

	int selectMemberCount(SqlSessionTemplate session, int pjNo);

	int insertProjectMember(SqlSessionTemplate session, Map<String, Object> map);

	int checkPjMember(SqlSessionTemplate session, Map<String, Object> map);


}
